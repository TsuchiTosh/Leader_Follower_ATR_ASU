%% Analysis 1
% Generating temporal data

clear%% Load
addpath('\\wolf\wolf\tvins\project\proj41\matlab')
addpath('\\wolf\wolf\tvins\project\matlab')
data_dir = '\\wolf\wolf\tvins\project\proj41\DATA';

%% comment out as needed to generate finalSummary

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % 10/18/2018
% pair={'SK_SS', 'KS_AN', 'YI_TS'};
% data_name.SK_SS={'SK_SS_20181018_002','SK_SS_20181018_003',...
%     'SK_SS_20181018_004','SK_SS_20181018_005','SK_SS_20181018_006',...
%     'SK_SS_20181018_007','SK_SS_20181018_008'}; %U800,U400,S200,S100,U0,S0,S300
%
% % 10/22/2018
% data_name.KS_AN={'KS_AN_20181022_002','KS_AN_20181022_003',...
%     'KS_AN_20181022_004','KS_AN_20181022_005','KS_AN_20181022_006',...
%     'KS_AN_20181022_007','KS_AN_20181022_008'}; %U800,U400,S200,S100,U0,S0,S300
%
% data_name.YI_TS={'YI_TS_20181022_002','YI_TS_20181022_003',...
%     'YI_TS_20181022_004','YI_TS_20181022_005','YI_TS_20181022_006',...
%     'YI_TS_20181022_007','YI_TS_20181022_008'}; %S300,S0,U0,S100,S200,U400,U800



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % 10/24/2018
% pair={'SN_JK', 'MN_SF','YK_YH'};
% data_name.SN_JK={'SN_JK_20181024_002','SN_JK_20181024_003',...
%     'SN_JK_20181024_004','SN_JK_20181024_005','SN_JK_20181024_006'}; %U800,U400,S200,S100,U800
%
% data_name.MN_SF={'MN_SF_20181024_002','MN_SF_20181024_003',...
%     'MN_SF_20181024_004','MN_SF_20181024_005','MN_SF_20181024_006'}; %U800,U400,S200,S100,U800
%
% data_name.YK_YH={'YK_YH_20181024_002','YK_YH_20181024_003',...
%     'YK_YH_20181024_004','YK_YH_20181024_005','YK_YH_20181024_006'}; %U800,U400,S200,S100,U800
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % 10/25/2018
% pair={'MH_TH', 'CT_HH','AN_JT'};
% data_name.MH_TH={'MH_TH_20181025_002','MH_TH_20181025_003',...
%     'MH_TH_20181025_004','MH_TH_20181025_005','MH_TH_20181025_006'}; %S100,S200,U400,U800,S100
%
% data_name.CT_HH={'CT_HH_20181025_002','CT_HH_20181025_003',...
%     'CT_HH_20181025_004','CT_HH_20181025_005','CT_HH_20181025_006'}; %S100,S200,U400,U800,S100
%
% data_name.AN_JT={'AN_JT_20181025_002','AN_JT_20181025_003',...
%     'AN_JT_20181025_004','AN_JT_20181025_005','AN_JT_20181025_006'}; %S100,S200,U400,U800,S100

%
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % 10/29/2018
% pair={'MR_NI', 'MN_ES','AI_TK'};
% data_name.MR_NI={'MR_NI_20181029_002','MR_NI_20181029_003','MR_NI_20181029_004',...
%     'MR_NI_20181029_005','MR_NI_20181029_006','MR_NI_20181029_007',...
%     'MR_NI_20181029_008','MR_NI_20181029_009','MR_NI_20181029_010','MR_NI_20181029_011'}; %U800x7 unkown, U800x3 known
%
% data_name.MN_ES={'MN_ES_20181029_002','MN_ES_20181029_003','MN_ES_20181029_004',...
%     'MN_ES_20181029_005','MN_ES_20181029_006','MN_ES_20181029_007',...
%     'MN_ES_20181029_008','MN_ES_20181029_009','MN_ES_20181029_010','MN_ES_20181029_011'}; %U800x7 unkown, U800x3 known
%
% data_name.AI_TK={'AI_TK_20181029_002','AI_TK_20181029_003','AI_TK_20181029_004',...
%     'AI_TK_20181029_005','AI_TK_20181029_006','AI_TK_20181029_007',...
%     'AI_TK_20181029_008','AI_TK_20181029_009','AI_TK_20181029_010','AI_TK_20181029_011'}; %U800x7 unkown, U800x3 known

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 10/30/2018
pair={'TS_AI','YY_MG', 'YM_IS'};
data_name.TS_AI={'TS_AI_20181030_002','TS_AI_20181030_003','TS_AI_20181030_004',...
    'TS_AI_20181030_005','TS_AI_20181030_006','TS_AI_20181030_007',...
    'TS_AI_20181030_008','TS_AI_20181030_009','TS_AI_20181030_010','TS_AI_20181030_011'}; %U800x4, U400x2, S200x2, S100x2

data_name.YY_MG={'YY_MG_20181030_002','YY_MG_20181030_003','YY_MG_20181030_004',...
    'YY_MG_20181030_005','YY_MG_20181030_006','YY_MG_20181030_007',...
    'YY_MG_20181030_008','YY_MG_20181030_009','YY_MG_20181030_010','YY_MG_20181030_011','YY_MG_20181030_012'}; %U800x4, U400x2, S200x2, S100x2, U400x1 known

data_name.YM_IS={'YM_IS_20181030_002','YM_IS_20181030_003','YM_IS_20181030_004',...
    'YM_IS_20181030_005','YM_IS_20181030_006','YM_IS_20181030_007',...
    'YM_IS_20181030_008','YM_IS_20181030_009','YM_IS_20181030_010','YM_IS_20181030_011'}; %U800x4, U400x2, S200x2, S100x2

%% Get data
%filter specification
fc = 10; %cut-off
fs = 2000; %sampling frequency
[b,a] = butter(6,fc/(fs/2));

h=1/fs; %step size time
d=0.1; %horizontal distance

finalTemporal=struct;
for p=1:length(pair) %subject pair number

    num_block=length(data_name.(pair{p})); %total number of blocks

    for n=1:num_block



        %load data from block
        data = load_tvins_data41(data_dir, data_name.(pair{p}){n});
        num_trial=length(data.trial(1).dynamics); %total number of trials

        fse_lag=repmat([-19999:19999]',1,num_trial);
        fse_lag(:,:,2)=zeros(39999,num_trial);

        % gain
        KT=data.para.robot{1}.KT(data.trial(1).dynamics(1));
        if data.para.robot{1}.beam_unstable(data.trial(1).dynamics(1))==1
            condition=['U' num2str(KT)];
        else
            condition=['S' num2str(KT)];
        end

        % marker for bad trial=0, good trial=1
        good_trial=data.trial(1).check_trial.movement_time>0;

        %marker for performance, movement time
        duration=nan(num_trial,2);
        duration(:,1)=data.trial(1).check_trial.duration==1; %sub1
        duration(:,2)=data.trial(2).check_trial.duration==1; %sub2

        % marker for performance, tilt
        tilt=nan(num_trial,1);
        tilt(:,1)=data.trial(1).check_trial.traj_err==1;

        for i=1:num_trial % trial number

            % index with numbers, not NaN
            if ~isnan(data.trial(1).WpoX(:,i))<=~isnan(data.trial(2).WpoX(:,i))
                not_nan=~isnan(data.trial(1).WpoX(:,i));
            else
                not_nan=~isnan(data.trial(2).WpoX(:,i));
            end

            %%%%%%%%%%%% Get kinetic/kinematic data %%%%%%%%%%%%%%%%%%%%%%%%
            % subject on LEFT-robot
            % sub1 position
            world_rbt1_po = [data.trial(1).WpoX(:,i), data.trial(1).WpoY(:,i)];
            task_rbt1_po = world2task(world_rbt1_po, data.define, data.para.robot{1}, 'pos');
            task_rbt1_po(not_nan,1) = filtfilt(b,a,task_rbt1_po(not_nan,1)); % x-pos
            task_rbt1_po(not_nan,2) = filtfilt(b,a,task_rbt1_po(not_nan,2)); % y-pos
            % sub1 force
            world_rbt1_se = [data.trial(1).WfeX(:,i), data.trial(1).WfeY(:,i)];
            task_rbt1_se = world2task(world_rbt1_se, data.define, data.para.robot{1}, 'force');
            task_rbt1_se(not_nan,1) = filtfilt(b,a,task_rbt1_se(not_nan,1)); %x-force
            task_rbt1_se(not_nan,2) = filtfilt(b,a,task_rbt1_se(not_nan,2)); %y-force
            % sub1 vel
            world_rbt1_ve = [data.trial(1).WveX(:,i), data.trial(1).WveY(:,i)];
            task_rbt1_ve = world2task(world_rbt1_ve, data.define, data.para.robot{1}, 'vel');
            task_rbt1_ve(not_nan,1) = filtfilt(b,a,task_rbt1_ve(not_nan,1)); %x-velocity
            task_rbt1_ve(not_nan,2) = filtfilt(b,a,task_rbt1_ve(not_nan,2)); %y-velocity
            % sub1 force rate
            task_rbt1_fr = nan(20000-1,2);
            task_rbt1_fr(:,1) = (task_rbt1_se(2:end,1)-task_rbt1_se(1:end-1,1))/h;
            task_rbt1_fr(:,2) = (task_rbt1_se(2:end,2)-task_rbt1_se(1:end-1,2))/h;
            % sub1 feedback force
            task_rbt1_fb=data.trial(1).TfiY(:,i);
            task_rbt1_fb(not_nan,1)=filtfilt(b,a,task_rbt1_fb(not_nan,1));

            % subject on RIGHT-robot
            % sub2 position
            world_rbt2_po = [data.trial(2).WpoX(:,i), data.trial(2).WpoY(:,i)];
            task_rbt2_po = world2task(world_rbt2_po, data.define, data.para.robot{2}, 'pos');
            task_rbt2_po(not_nan,1) = filtfilt(b,a,task_rbt2_po(not_nan,1)); % x-pos
            task_rbt2_po(not_nan,2) = filtfilt(b,a,task_rbt2_po(not_nan,2)); % y-pos
            % sub2 force
            world_rbt2_se = [data.trial(2).WfeX(:,i), data.trial(2).WfeY(:,i)];
            task_rbt2_se = world2task(world_rbt2_se, data.define, data.para.robot{2}, 'force');
            task_rbt2_se(not_nan,1) = filtfilt(b,a,task_rbt2_se(not_nan,1)); %x-force
            task_rbt2_se(not_nan,2) = filtfilt(b,a,task_rbt2_se(not_nan,2)); %y-force
            % sub2 vel
            world_rbt2_ve = [data.trial(2).WveX(:,i), data.trial(2).WveY(:,i)];
            task_rbt2_ve = world2task(world_rbt2_ve, data.define, data.para.robot{2}, 'vel');
            task_rbt2_ve(not_nan,1) = filtfilt(b,a,task_rbt2_ve(not_nan,1)); %x-velocity
            task_rbt2_ve(not_nan,2) = filtfilt(b,a,task_rbt2_ve(not_nan,2)); %y-velocity
            % sub2 force rate
            task_rbt2_fr = nan(20000-1,2);
            task_rbt2_fr(:,1) = (task_rbt2_se(2:end,1)-task_rbt2_se(1:end-1,1))/h;
            task_rbt2_fr(:,2) = (task_rbt2_se(2:end,2)-task_rbt2_se(1:end-1,2))/h;
            % sub2 feedback force
            task_rbt2_fb=data.trial(2).TfiY(:,i);
            task_rbt2_fb(not_nan,1)=filtfilt(b,a,task_rbt2_fb(not_nan,1));
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

            finalTemporal.(pair{p})(n).sub1.po(:,i)=task_rbt1_po(:,2);
            finalTemporal.(pair{p})(n).sub1.fse(:,i)=task_rbt1_se(:,2);
            finalTemporal.(pair{p})(n).sub1.ve(:,i)=task_rbt1_ve(:,2);
            finalTemporal.(pair{p})(n).sub1.fr(:,i)=task_rbt1_fr(:,2);
            finalTemporal.(pair{p})(n).sub1.fb(:,i)=task_rbt1_fb(:,1);

            finalTemporal.(pair{p})(n).sub2.po(:,i)=task_rbt2_po(:,2);
            finalTemporal.(pair{p})(n).sub2.fse(:,i)=task_rbt2_se(:,2);
            finalTemporal.(pair{p})(n).sub2.ve(:,i)=task_rbt2_ve(:,2);
            finalTemporal.(pair{p})(n).sub2.fr(:,i)=task_rbt2_fr(:,2);
            finalTemporal.(pair{p})(n).sub2.fb(:,i)=task_rbt2_fb(:,1);



            % index when subjects left initial circle
            if isempty(find(task_rbt1_po(:,2)>-0.07,1,'first'))
                index1_begin=nan;
            else
                index1_begin=find(task_rbt1_po(:,2)>-0.07,1,'first'); %sub1
            end

            if isempty(find(task_rbt2_po(:,2)>-0.07,1,'first'))
                index2_begin=nan;
            else
                index2_begin=find(task_rbt2_po(:,2)>-0.07,1,'first'); %sub1
            end

            %matching starting index
            if isnan(index1_begin) && ~isnan(index2_begin)
                index1_begin=index2_begin;
            elseif ~isnan(index1_begin) && isnan(index2_begin)
                index2_begin=index1_begin;
            elseif isnan(index1_begin) && isnan(index2_begin)
                index1_begin=1;
                index2_begin=1;
            end

            if index1_begin<=index2_begin
                index_begin=index1_begin; %if sub1 left earlier than sub2
            else
                index_begin=index2_begin; %if sub2 left earlier than sub1
            end

            if index_begin>1
                not_nan(1:index_begin-1)=0;
            end

            % load force again (no filter)
            task_rbt1_se = world2task(world_rbt1_se, data.define, data.para.robot{1}, 'force');
            task_rbt2_se = world2task(world_rbt2_se, data.define, data.para.robot{2}, 'force');

            [r,lag]=xcorr(task_rbt1_se(not_nan,2),task_rbt2_se(not_nan,2), 'coeff');
            ind_zerolag=find(lag==0);
            %fse_lag(20001-ind_zerolag:20001-ind_zerolag+length(lag)-1,i,1)=lag;
            fse_lag(20001-ind_zerolag:20001-ind_zerolag+length(lag)-1,i,2)=r;


        end

        finalTemporal.(pair{p})(n).fse_lag=fse_lag;
        finalTemporal.(pair{p})(n).num_block=num2str(data_name.(pair{p}){n}(end));
        finalTemporal.(pair{p})(n).num_trial=num_trial;
        finalTemporal.(pair{p})(n).KT=KT;
        finalTemporal.(pair{p})(n).condition=condition;
        finalTemporal.(pair{p})(n).good_trial=good_trial;
        finalTemporal.(pair{p})(n).duration=duration;
        finalTemporal.(pair{p})(n).tilt=tilt;

    end
end

save('temporalData.mat','finalTemporal','-v7.3')
