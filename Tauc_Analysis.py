import sys
import pandas as pd
import numpy as np
from scipy import signal
# sys.path.append('../lib')
#Note: When working in Windows environments, use:
sys.path.append('..\lib')
# from library import Library
from sample import Sample
from bandgaps import mars_method,santosh_newhouse_gregoire_method,segmentation_method
import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
import seaborn as sns
color = sns.color_palette()

#matplotlib inline

#Absorption coefficient - grabs API DB data and then stores in pandas dataframe. Calculates energy and absorption coefficient.
def band_gap_run(sample,bg_type='direct',show_graph=True,method='MARS'):
    try:
        optical_spectra = Sample(sample).spectra('optical') #Error with this in the absence of optical data.
        uvit = sorted(zip(list(optical_spectra.uvit_wave),list(optical_spectra.uvit_response)))
        uvir = sorted(zip(list(optical_spectra.uvir_wave),list(optical_spectra.uvir_response)))
        nirt = sorted(zip(list(optical_spectra.nirt_wave.dropna()),list(optical_spectra.nirt_response.dropna())))
        nirr = sorted(zip(list(optical_spectra.nirr_wave.dropna()),list(optical_spectra.nirr_response.dropna())))
    except TypeError:
        print("Sorry, the requested optical data is unavailable. :(")
        return
    thickness = float(Sample(209139).properties().thickness)
    transmittance = sorted(uvit+nirt)
    reflectance = sorted(uvir+nirr)
    absorption_coefficient = []

    for i in range(0,len(transmittance)): #Equation for absorption coefficient
        absorption_coefficient.append(-1*np.log(abs(transmittance[i][1]/(1-reflectance[i][1])))/float(thickness*10**-4))
    energy = [1240.0/i[0] for i in transmittance]
    calculate_band_gap(energy,absorption_coefficient,bg_type=bg_type,show_graph=show_graph,method=method)

# Calculates band gap using the Mars method.
def calculate_band_gap(energy,absorption_coefficient,bg_type='direct',show_graph=True,method='MARS'):
    absorption_coeff_savgol_filt = np.ndarray.tolist(signal.savgol_filter(absorption_coefficient,25,4))
    absorption_y = []
    if bg_type == 'direct':
        for k in range(0,len(absorption_coeff_savgol_filt)):
            absorption_y.append((abs(absorption_coeff_savgol_filt[k])**2.0)*energy[k]**2.0)
    elif bg_type == 'indirect':
        for k in range(0,len(absorption_coeff_savgol_filt)):
            absorption_y.append((abs(absorption_coeff_savgol_filt[k])**.5)*energy[k]**.5)
    elif bg_type == 'log10':
        for k in range(0,len(absorption_coeff_savgol_filt)):
            absorption_y.append(np.log10(abs(absorption_coeff_savgol_filt[k]))-3)
    elif bg_type == 'raw_alpha':
        for k in range(0,len(absorption_coeff_savgol_filt)):
            absorption_y.append(abs(absorption_coeff_savgol_filt[k]))
    else:
        return 'Not a valid band gap type.'
    
    if method == 'S-N-G':
        return santosh_newhouse_gregoire_method(energy,absorption_y,bg_type,show_graph)
    elif method == 'Segmentation':
        return segmentation_method(energy,absorption_y,bg_type,show_graph)
    elif method == 'MARS':
        return mars_method(energy,absorption_y,bg_type,show_graph)
    else:
        return 'Not a valid band gap methodology.'
band_gap_run(221101)