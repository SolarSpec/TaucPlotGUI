Python 2.7 and the dependency packages are installed using conda version 4.0.5 build from anaconda continuum win 32 packages; and can be downloaded from
https://www.continuum.io/downloads

usage: fitd,fomd=runuvvis(datad,inputparamsd)
where datad is a dictionary with required keys 'hv', 'DA', 'IA' where datad['hv'] is an array of illumination energy values
datad['DA'] is an array of TP(DA) values, datad['IA'] is an array of TP(IA) values.

fitd is a dictionary with information regarding optimized linear fit paramters
fomd is a dictionary with figure-of-merit values.

example inputparamsd: dict([('lower_wl',390),('upper_wl',940), 
                               #data params
                              ('num_knots',8),('min_knotdist',0.05),('tol',1e-06),('maxtol',1e-03),
                               #fitting params
                              ('merge_linsegslopediff_percent',10.),('max_merge_differentialTP',10000.),
                              #params for merging linsegs
                              ('min_allowedslope',-2),('min_finseglength',0.1),
                              #parameters before entering bg identification
                              ('min_bgTP_diff',0.1),('min_bkgrdslope',-0.05),('min_bgbkgrdslopediff',0.2),('min_bgTP_finseg_diff',0.2),('min_bgfinalseglength',0.2),
                              #params for bg and bkgrd
                              ('analysis_types','DA,IA'),('maxbgspersmp',4),('chkoutput_types','DA,IA'),
                              ('abs_minallowedslope',-numpy.inf),('max_absolute_2ndderiv',numpy.inf),('use_absderivs_forpeaks',False)
                              #Params for using derivates of absorption spectrum to identify peaks
                              ])