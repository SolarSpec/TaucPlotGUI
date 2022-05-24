function sample(which,identity)
% self = identity;
% end
    spectra(which,identity)
    function obj_list = search_by_ids(ids_list)
        obj_list = [];
        for i = ids_list
            obj_list(end+1) = Sample(i);
        end

        
    end

    function df = properties
        url = 'https://htem-api.nrel.gov/api/sample/'+string(identity);
        %         response = urllib.request.urlopen(url);
        %         data = json.loads(response.read());
        data = webread(url);
%         df = pd.DataFrame();
        df = dataframeTest;
        for i = data
            df(i) = data(i);
        end
    end

    function df = spectra(which,identity)
        url = 'https://htem-api.nrel.gov/api/sample/'+string(identity);
        %There is the potential to replace this with mvl_optical or mvl_xrd,
        %but these seem to be broken at the moment...
        %         response = urllib.request.urlopen(url);
        %         data = json.loads(response.read());
        data = webread(url);
    
        %         df = pd.DataFrame();
        df = frames.DataFrame;
        %         df = varfun(@class,[],'OutputFormat',table);
    
        if which == 'xrd'
            df(:,'xrd_angle') = data('xrd_angle');
            df(:,'xrd_background') = data('xrd_background');
            df(:,'xrd_intensity') = data('xrd_intensity');
        elseif which == 'optical'
%             uvit_df = pd.DataFrame();
            temp1 = ones(size(data.opt_uvit_wavelength));
            temp2 = ones(size(data.opt_uvit_response));
            uvit_df = frames.DataFrame([temp1, temp2],[],["uvit_wave", "uvit_response"]);
            try
%                 uvit_df = frames.DataFrame([data('opt_uvit_wavelength'), data('opt_uvit_response')],[],["uvit_wave","uvit_response"]);
%                 uvit_df = frames.DataFrame(data('opt_uvit_response'),[],"uvit_response");
                uvit_df(:,"uvit_wave") = data.opt_uvit_wavelength;
                uvit_df(:,"uvit_response") = data.opt_uvit_response;
            catch KeyError %No uvit available
                disp("KeyError")
                ...
            end
%             uvir_df = pd.DataFrame();
            temp1 = ones(size(data.opt_uvir_wavelength));
            temp2 = ones(size(data.opt_uvir_response));
            uvir_df = frames.DataFrame([temp1, temp2],[],["uvir_wave", "uvir_response"]);
            try
                uvir_df(:,"uvir_wave") = data.opt_uvir_wavelength;
                uvir_df(:,"uvir_response") = data.opt_uvir_response;
            catch KeyError %No uvir available
                ...
            end
%             nirt_df = pd.DataFrame();
            temp1 = ones(size(data.opt_nirt_wavelength));
            temp2 = ones(size(data.opt_nirt_response));
            nirt_df = frames.DataFrame([temp1, temp2],[],["nirt_wave", "nirt_response"]);
            try
                nirt_df(:,"nirt_wave") = data.opt_nirt_wavelength;
                nirt_df(:,"nirt_response") = data.opt_nirt_response;
            catch KeyError %No nirt available
                ...
            end
%             nirr_df = pd.DataFrame();
            temp1 = ones(size(data.opt_nirr_wavelength));
            temp2 = ones(size(data.opt_nirr_response));
            nirr_df = frames.DataFrame([temp1, temp2],[],["nirr_wave", "nirr_response"]);
            try
                nirr_df(:,"nirr_wave") = data.opt_nirr_wavelength;
                nirr_df(:,"nirr_response") = data.opt_nirr_response;
            catch KeyError %No nirr available
                ...
            end
            df = [uvit_df,uvir_df,nirt_df,nirr_df];
        else
%             df = pd.DataFrame();
            df = frames.DataFrame;
        end
    end
end