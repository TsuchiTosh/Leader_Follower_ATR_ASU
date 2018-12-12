%% make summary data (mean, max, etc.)
% please save output 'finalSummary' manually
clear
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


%% main
%filter specification
fc = 10; %cut-off
fs = 2000; %sampling frequency
[b,a] = butter(6,fc/(fs/2)); %filter position, velocity, etc. using butterworth

h=1/fs; %step size time
d=0.1; %horizontal distance

finalSummary=struct;
for p=1:length(pair) %subject pair number

    num_block=length(data_name.(pair{p})); %total number of blocks
    for n=1:num_block

        %load data from block
        data = load_tvins_data41(data_dir, data_name.(pair{p}){n});
        num_trial=length(data.trial(1).dynamics); %total number of trials

        % gain
        KT=data.para.robot{1}.KT(data.trial(1).dynamics(1));
        if data.para.robot{1}.beam_unstable(data.trial(1).dynamics(1))==1
            condition=['U' num2str(KT)];
        else
            condition=['S' num2str(KT)];
        end


        %initialize outputs
        good_trial=nan(num_trial,1);
        duration=nan(num_trial,2);
        tilt=nan(num_trial,1);
        MT=nan(num_trial,2);
        RT=nan(num_trial,2);
        fse_mean=nan(num_trial,2);
        fr_mean=nan(num_trial,2);
        ve_mean=nan(num_trial,2);
        posDiff_mean=nan(num_trial,1);
        ang_mean=nan(num_trial,1);
        angr_mean=nan(num_trial,1);
        absfb_mean=nan(num_trial,2);
        time_angleOUT=nan(num_trial,1);
        fseRatio_mean=nan(num_trial,1);
        frRatio_mean=nan(num_trial,1);
        veRatio_mean=nan(num_trial,1);
        fse_Max=nan(num_trial,2);
        fr_Max=nan(num_trial,2);
        ve_Max=nan(num_trial,2);
        ang_Max=nan(num_trial,1);
        angr_Max=nan(num_trial,1);
        fb_Max=nan(num_trial,2);
        fse_atMaxFse=nan(num_trial,2);
        fr_atMaxFse=nan(num_trial,2);
        ve_atMaxFse=nan(num_trial,2);
        poDiff_atMaxFse=nan(num_trial,2);
        fse_atMaxFr=nan(num_trial,2);
        fr_atMaxFr=nan(num_trial,2);
        ve_atMaxFr=nan(num_trial,2);
        poDiff_atMaxFr=nan(num_trial,2);
        fse_atMaxVe=nan(num_trial,2);
        fr_atMaxVe=nan(num_trial,2);
        ve_atMaxVe=nan(num_trial,2);
        poDiff_atMaxVe=nan(num_trial,2);
        fse_atMaxAng=nan(num_trial,2);
        fr_atMaxAng=nan(num_trial,2);
        ve_atMaxAng=nan(num_trial,2);
        poDiff_atMaxAng=nan(num_trial,1);
        fse_atMaxAngr=nan(num_trial,2);
        fr_atMaxAngr=nan(num_trial,2);
        ve_atMaxAngr=nan(num_trial,2);
        poDiff_atMaxAngr=nan(num_trial,1);
        fse_Min=nan(num_trial,2);
        fr_Min=nan(num_trial,2);
        ve_Min=nan(num_trial,2);
        ang_Min=nan(num_trial,1);
        angr_Min=nan(num_trial,1);
        fb_Min=nan(num_trial,2);
        fse_atMinFse=nan(num_trial,2);
        fr_atMinFse=nan(num_trial,2);
        ve_atMinFse=nan(num_trial,2);
        poDiff_atMinFse=nan(num_trial,2);
        fse_atMinFr=nan(num_trial,2);
        fr_atMinFr=nan(num_trial,2);
        ve_atMinFr=nan(num_trial,2);
        poDiff_atMinFr=nan(num_trial,2);
        fse_atMinVe=nan(num_trial,2);
        fr_atMinVe=nan(num_trial,2);
        ve_atMinVe=nan(num_trial,2);
        poDiff_atMinVe=nan(num_trial,2);
        fse_atMinAng=nan(num_trial,2);
        fr_atMinAng=nan(num_trial,2);
        ve_atMinAng=nan(num_trial,2);
        poDiff_atMinAng=nan(num_trial,1);
        fse_atMinAngr=nan(num_trial,2);
        fr_atMinAngr=nan(num_trial,2);
        ve_atMinAngr=nan(num_trial,2);
        poDiff_atMinAngr=nan(num_trial,1);
        fse_lag=nan(num_trial,1);
        fr_lag=nan(num_trial,1);
        ve_lag=nan(num_trial,1);
        fse_corr=nan(num_trial,1);
        fr_corr=nan(num_trial,1);
        ve_corr=nan(num_trial,1);
        fr_ve_corr=nan(num_trial,2);
        fr_angr_corr=nan(num_trial,2);
        ve_angr_corr=nan(num_trial,2);



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
            task_rbt1_fr(:,1) = [0; (task_rbt1_se(2:end,1)-task_rbt1_se(1:end-1,1))/h];
            task_rbt1_fr(:,2) = [0; (task_rbt1_se(2:end,2)-task_rbt1_se(1:end-1,2))/h];
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
            task_rbt2_fr(:,1) = [0; (task_rbt2_se(2:end,1)-task_rbt2_se(1:end-1,1))/h];
            task_rbt2_fr(:,2) = [0; (task_rbt2_se(2:end,2)-task_rbt2_se(1:end-1,2))/h];
            % sub2 feedback force
            task_rbt2_fb=data.trial(2).TfiY(:,i);
            task_rbt2_fb(not_nan,1)=filtfilt(b,a,task_rbt2_fb(not_nan,1));

            world_rbt2_Beam_po = [data.trial(2).wBeam_poX(:,i), data.trial(2).wBeam_poY(:,i)];
            task_rbt2_Beam_po = world2task(world_rbt2_Beam_po, data.define, data.para.robot{2}, 'pos');
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

            %%%%%%%%%%%% Compute and aggregate key data %%%%%%%%%%%%%%%%%%%%
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

            % marker for bad trial=0, good trial=1
            good_trial(i,1)=data.trial(1).check_trial.movement_time(i)>0;

            %marker for performance, movement time
            if data.trial(1).check_trial.duration(i)==1 %sub1
                duration(i,1)=1;
            else
                duration(i,1)=0;
            end

            if data.trial(2).check_trial.duration(i)==1 %sub2
                duration(i,2)=1;
            else
                duration(i,2)=0;
            end

            % marker for performance, tilt
            if data.trial(1).check_trial.traj_err(i)==1
                tilt(i,1)=1;
            else
                tilt(i,1)=0;
            end

            %%%%%% Time %%%%%%
            % movement time
            MT(i,1)=data.trial(1).check_trial.movement_time(i); %sub1
            MT(i,2)=data.trial(2).check_trial.movement_time(i); %sub2

            % response time
            RT(i,1)=index1_begin*h; %sub1
            RT(i,2)=index2_begin*h; %sub2
            %%%%%%%%%%%%%%%%%%

            %%%%%% Mean %%%%%%
            % mean force
            fse_mean(i,1)=mean(task_rbt1_se(not_nan,2)); %sub1
            fse_mean(i,2)=mean(task_rbt2_se(not_nan,2)); %sub2

            % mean force rate
            fr_mean(i,1)=mean(task_rbt1_fr(not_nan,2)); %sub1
            fr_mean(i,2)=mean(task_rbt2_fr(not_nan,2)); %sub2

            % mean velocity
            ve_mean(i,1)=mean(task_rbt1_ve(not_nan,2)); %sub1
            ve_mean(i,2)=mean(task_rbt2_ve(not_nan,2)); %sub2

            %mean hand distance
            hand_dist=task_rbt1_po(:,2)-task_rbt2_po(:,2);
            posDiff_mean(i,1)=mean(hand_dist(not_nan)); %both

            %mean absolute angle
            angle=data.trial(1).beam_theta(:,i)*(180/pi);
            ang_mean(i,1)=mean(abs(angle(not_nan))); %both

            %mean absolute angle rate
            angr=[0; (angle(2:end)-angle(1:end-1))/h];
            angr_mean(i,1)=mean(abs(angr(not_nan)));

            %
            ind_OUT=find(abs(angle)>atand(0.02),1);
            if ~isempty(ind_OUT)

                time_angleOUT(i,1)=ind_OUT*1/2000;
            else
                time_angleOUT(i,1)=NaN;
            end

            % abs feedback mean
            absfb_mean(i,1)=mean(abs(task_rbt1_fb(not_nan,1))); %sub1
            absfb_mean(i,2)=mean(abs(task_rbt2_fb(not_nan,1))); %sub2

            %mean force ratio
            fseRatio_mean(i,1)=mean(task_rbt1_se(not_nan,2)./task_rbt2_se(not_nan,2)); %both

            %mean force rate ratio
            frRatio_mean(i,1)=mean(task_rbt1_fr(not_nan,2)./task_rbt2_fr(not_nan,2)); %both

            %mean velocity ratio
            veRatio_mean(i,1)=mean(task_rbt1_ve(not_nan,2)./task_rbt2_ve(not_nan,2)); %both


            %%%%%% Max %%%%%%
            %max force
            [fse_Max(i,1),I1_fseMax]=max(task_rbt1_se(not_nan,2)); %sub1
            [fse_Max(i,2),I2_fseMax]=max(task_rbt2_se(not_nan,2)); %sub2

            %max force rate
            [fr_Max(i,1),I1_frMax]=max(task_rbt1_fr(not_nan,2)); %sub1
            [fr_Max(i,2),I2_frMax]=max(task_rbt2_fr(not_nan,2)); %sub2

            %max velocity
            [ve_Max(i,1),I1_veMax]=max(task_rbt1_ve(not_nan,2)); %sub1
            [ve_Max(i,2),I2_veMax]=max(task_rbt2_ve(not_nan,2)); %sub2

            %max absolute angle
            [ang_Max(i,1),I_angMax]=max(abs(angle(not_nan)));

            %max absolute angle rate
            [angr_Max(i,1), I_angrMax]=max(angr(not_nan));

            %max feedback force
            [fb_Max(i,1),I1_fbMax]=max(task_rbt1_fb(not_nan,1)); %sub1
            [fb_Max(i,2),I2_fbMax]=max(task_rbt2_fb(not_nan,1)); %sub2


            %%%%%% at Max %%%%%%
            % Force at time subject generated max force
            fse_atMaxFse(i,1)=task_rbt1_se(index_begin+I2_fseMax-1,2); %sub1's force at sub2's max
            fse_atMaxFse(i,2)=task_rbt2_se(index_begin+I1_fseMax-1,2); %sub2's force at sub1's max

            % Force rate  at time subject generated max force
            fr_atMaxFse(i,1)=task_rbt1_fr(index_begin+I2_fseMax-1,2); %sub1's force rate at sub2's max
            fr_atMaxFse(i,2)=task_rbt2_fr(index_begin+I1_fseMax-1,2); %sub2's force rate at sub1's max

            % Velocity at time subject generated max force
            ve_atMaxFse(i,1)=task_rbt1_ve(index_begin+I2_fseMax-1,2); %sub1's velocity at sub2's max
            ve_atMaxFse(i,2)=task_rbt2_ve(index_begin+I1_fseMax-1,2); %sub2's velocity at sub1's max

            % position difference  at time subject generated max force
            poDiff_atMaxFse(i,1)=task_rbt1_po(index_begin+I2_fseMax-1,2)-task_rbt2_po(index_begin+I2_fseMax-1,2); %diffrence at sub2's max
            poDiff_atMaxFse(i,2)=task_rbt1_po(index_begin+I1_fseMax-1,2)-task_rbt2_po(index_begin+I1_fseMax-1,2); %difference at sub1's max

            % Force at time subject generated max velocity
            fse_atMaxFr(i,1)=task_rbt1_se(index_begin+I2_frMax-1,2); %sub1's force at sub2's max
            fse_atMaxFr(i,2)=task_rbt2_se(index_begin+I1_frMax-1,2); %sub2's force at sub1's max

            % Force rate at time subject generated max velocity
            fr_atMaxFr(i,1)=task_rbt1_fr(index_begin+I2_frMax-1,2); %sub1's force rate at sub2's max
            fr_atMaxFr(i,2)=task_rbt2_fr(index_begin+I1_frMax-1,2); %sub2's force rate at sub1's max

            % Velocity at time subject generated max velocity
            ve_atMaxFr(i,1)=task_rbt1_ve(index_begin+I2_frMax-1,2); %sub1's velocity at sub2's max
            ve_atMaxFr(i,2)=task_rbt2_ve(index_begin+I1_frMax-1,2); %sub2's velocity at sub1's max

            % position difference  at time subject generated max velocity
            poDiff_atMaxFr(i,1)=task_rbt1_po(index_begin+I2_frMax-1,2)-task_rbt2_po(index_begin+I2_frMax-1,2); %difference at sub2's max
            poDiff_atMaxFr(i,2)=task_rbt1_po(index_begin+I1_frMax-1,2)-task_rbt2_po(index_begin+I1_frMax-1,2); %difference at sub1's max

            % Force difference at time subject generated max velocity
            fse_atMaxVe(i,1)=task_rbt1_se(index_begin+I2_veMax-1,2); %sub1's force at sub2's max
            fse_atMaxVe(i,2)=task_rbt2_se(index_begin+I1_veMax-1,2); %sub2's force at sub1's max

            % Force rate at time subject generated max velocity
            fr_atMaxVe(i,1)=task_rbt1_fr(index_begin+I2_veMax-1,2); %sub1's force rate at sub2's max
            fr_atMaxVe(i,2)=task_rbt2_fr(index_begin+I1_veMax-1,2); %sub1's force rate at sub1's max

            % Velocity at time subject generated max velocity
            ve_atMaxVe(i,1)=task_rbt1_ve(index_begin+I2_veMax-1,2); %sub1's velocity at sub2's max
            ve_atMaxVe(i,2)=task_rbt2_ve(index_begin+I1_veMax-1,2); %sub2's velocity at sub1's max

            % position difference  at time subject generated max velocity
            poDiff_atMaxVe(i,1)=task_rbt1_po(index_begin+I2_veMax-1,2)-task_rbt2_po(index_begin+I2_veMax-1,2); %difference at sub1's max
            poDiff_atMaxVe(i,2)=task_rbt1_po(index_begin+I1_veMax-1,2)-task_rbt2_po(index_begin+I1_veMax-1,2); %difference at sub2's max


            % Force at max absolute angle
            fse_atMaxAng(i,1)=task_rbt1_se(index_begin+I_angMax-1,2); %sub1's force
            fse_atMaxAng(i,2)=task_rbt2_se(index_begin+I_angMax-1,2); %sub2's force

            % Force rate at max absolute angle
            fr_atMaxAng(i,1)=task_rbt1_fr(index_begin+I_angMax-1,2); %sub1's force rate
            fr_atMaxAng(i,2)=task_rbt2_fr(index_begin+I_angMax-1,2); %sub2's force rate

            % Velocity at max absolute angle
            ve_atMaxAng(i,1)=task_rbt1_ve(index_begin+I_angMax-1,2); %sub1's velocity
            ve_atMaxAng(i,2)=task_rbt2_ve(index_begin+I_angMax-1,2); %sub2's velocity

            % position difference at max absolute angle
            poDiff_atMaxAng(i,1)=task_rbt1_po(index_begin+I_angMax-1,2)-task_rbt2_po(index_begin+I_angMax-1,2); %difference


            % Force at max absolute angle rate
            fse_atMaxAngr(i,1)=task_rbt1_se(index_begin+I_angrMax-1,2); %sub1's force
            fse_atMaxAngr(i,2)=task_rbt2_se(index_begin+I_angrMax-1,2); %sub2's force

            % Force rate at max absolute angle rate
            fr_atMaxAngr(i,1)=task_rbt1_fr(index_begin+I_angrMax-1,2); %sub1's force rate
            fr_atMaxAngr(i,2)=task_rbt2_fr(index_begin+I_angrMax-1,2); %sub2's force rate

            % Velocity at max absolute angle rate
            ve_atMaxAngr(i,1)=task_rbt1_ve(index_begin+I_angrMax-1,2); %sub1's velocity
            ve_atMaxAngr(i,2)=task_rbt2_ve(index_begin+I_angrMax-1,2); %sub2's velocity

            % position difference at max absolute angle rate
            poDiff_atMaxAngr(i,1)=task_rbt1_po(index_begin+I_angrMax-1,2)-task_rbt2_po(index_begin+I_angrMax-1,2); %difference


            %%%%%% Minimum %%%%%%
            %minimum force
            [fse_Min(i,1),I1_fseMin]=min(task_rbt1_se(not_nan,2)); %sub1
            [fse_Min(i,2),I2_fseMin]=min(task_rbt2_se(not_nan,2)); %sub2

            %minimum force rate
            [fr_Min(i,1),I1_frMin]=min(task_rbt1_fr(not_nan,2)); %sub1
            [fr_Min(i,2),I2_frMin]=min(task_rbt2_fr(not_nan,2)); %sub2

            %minimum velocity
            [ve_Min(i,1),I1_veMin]=min(task_rbt1_ve(not_nan,2)); %sub1
            [ve_Min(i,2),I2_veMin]=min(task_rbt2_ve(not_nan,2)); %sub2

            %minimum absolute angle
            [ang_Min(i,1),I_angleMin]=min(abs(angle(not_nan)));

            %min absolute angle rate
            [angr_Min(i,1), I_angrMin]=max(angr(not_nan));

            %min feedback force
            [fb_Min(i,1),I1_fbMin]=min(task_rbt1_fb(not_nan,1)); %sub1
            [fb_Min(i,2),I2_fbMin]=min(task_rbt2_fb(not_nan,1)); %sub2

            %%%%%%%% at Minimum %%%%%%%
            % Force at time subject generated min force
            fse_atMinFse(i,1)=task_rbt1_se(index_begin+I2_fseMin-1,2); %sub1's force at sub2's min
            fse_atMinFse(i,2)=task_rbt2_se(index_begin+I1_fseMin-1,2); %sub2's force at sub1's min

            % Force rate  at time subject generated min force
            fr_atMinFse(i,1)=task_rbt1_fr(index_begin+I2_fseMin-1,2); %sub1's force rate at sub2's min
            fr_atMinFse(i,2)=task_rbt2_fr(index_begin+I1_fseMin-1,2); %sub2's force rate at sub1's min

            % Velocity at time subject generated min force
            ve_atMinFse(i,1)=task_rbt1_ve(index_begin+I2_fseMin-1,2); %sub1's velocity at sub2's min
            ve_atMinFse(i,2)=task_rbt2_ve(index_begin+I1_fseMin-1,2); %sub2's velocity at sub1's min

            % position difference  at time subject generated min force
            poDiff_atMinFse(i,1)=task_rbt1_po(index_begin+I2_fseMin-1,2)-task_rbt2_po(index_begin+I2_fseMin-1,2); %diffrence at sub2's min
            poDiff_atMinFse(i,2)=task_rbt1_po(index_begin+I1_fseMin-1,2)-task_rbt2_po(index_begin+I1_fseMin-1,2); %difference at sub1's min

            % Force at time subject generated max velocity
            fse_atMinFr(i,1)=task_rbt1_se(index_begin+I2_frMin-1,2); %sub1's force at sub2's min
            fse_atMinFr(i,2)=task_rbt2_se(index_begin+I1_frMin-1,2); %sub2's force at sub1's min

            % Force rate at time subject generated max velocity
            fr_atMinFr(i,1)=task_rbt1_fr(index_begin+I2_frMin-1,2); %sub1's force rate at sub2's min
            fr_atMinFr(i,2)=task_rbt2_fr(index_begin+I1_frMin-1,2); %sub2's force rate at sub1's min

            % Velocity at time subject generated max velocity
            ve_atMinFr(i,1)=task_rbt1_ve(index_begin+I2_frMin-1,2); %sub1's velocity at sub2's min
            ve_atMinFr(i,2)=task_rbt2_ve(index_begin+I1_frMin-1,2); %sub2's velocity at sub1's min

            % position difference  at time subject generated max velocity
            poDiff_atMinFr(i,1)=task_rbt1_po(index_begin+I2_frMin-1,2)-task_rbt2_po(index_begin+I2_frMin-1,2); %difference at sub2's min
            poDiff_atMinFr(i,2)=task_rbt1_po(index_begin+I1_frMin-1,2)-task_rbt2_po(index_begin+I1_frMin-1,2); %difference at sub1's min

            % Force difference at time subject generated max velocity
            fse_atMinVe(i,1)=task_rbt1_se(index_begin+I2_veMin-1,2); %sub1's force at sub2's min
            fse_atMinVe(i,2)=task_rbt2_se(index_begin+I1_veMin-1,2); %sub2's force at sub1's min

            % Force rate at time subject generated max velocity
            fr_atMinVe(i,1)=task_rbt1_fr(index_begin+I2_veMin-1,2); %sub1's force rate at sub2's min
            fr_atMinVe(i,2)=task_rbt2_fr(index_begin+I1_veMin-1,2); %sub1's force rate at sub1's min

            % Velocity at time subject generated max velocity
            ve_atMinVe(i,1)=task_rbt1_ve(index_begin+I2_veMin-1,2); %sub1's velocity at sub2's min
            ve_atMinVe(i,2)=task_rbt2_ve(index_begin+I1_veMin-1,2); %sub2's velocity at sub1's min

            % position difference  at time subject generated max velocity
            poDiff_atMinVe(i,1)=task_rbt1_po(index_begin+I2_veMin-1,2)-task_rbt2_po(index_begin+I2_veMin-1,2); %difference at sub1's min
            poDiff_atMinVe(i,2)=task_rbt1_po(index_begin+I1_veMin-1,2)-task_rbt2_po(index_begin+I1_veMin-1,2); %difference at sub2's min

            % Force at max absolute angle
            fse_atMinAng(i,1)=task_rbt1_se(index_begin+I_angleMin-1,2); %sub1's force
            fse_atMinAng(i,2)=task_rbt2_se(index_begin+I_angleMin-1,2); %sub2's force

            % Force rate at max absolute angle
            fr_atMinAng(i,1)=task_rbt1_fr(index_begin+I_angleMin-1,2); %sub1's force rate
            fr_atMinAng(i,2)=task_rbt2_fr(index_begin+I_angleMin-1,2); %sub2's force rate

            % Velocity at max absolute angle
            ve_atMinAng(i,1)=task_rbt1_ve(index_begin+I_angleMin-1,2); %sub1's velocity
            ve_atMinAng(i,2)=task_rbt2_ve(index_begin+I_angleMin-1,2); %sub2's velocity

            % position difference at max absolute angle
            poDiff_atMinAng(i,1)=task_rbt1_po(index_begin+I_angleMin-1,2)-task_rbt2_po(index_begin+I_angleMin-1,2); %difference

            % Force at min absolute angle rate
            fse_atMaxAngr(i,1)=task_rbt1_se(index_begin+I_angrMin-1,2); %sub1's force
            fse_atMaxAngr(i,2)=task_rbt2_se(index_begin+I_angrMin-1,2); %sub2's force

            % Force rate at min absolute angle rate
            fr_atMinAngr(i,1)=task_rbt1_fr(index_begin+I_angrMin-1,2); %sub1's force rate
            fr_atMinAngr(i,2)=task_rbt2_fr(index_begin+I_angrMax-1,2); %sub2's force rate

            % Velocity at min absolute angle rate
            ve_atMinAngr(i,1)=task_rbt1_ve(index_begin+I_angrMin-1,2); %sub1's velocity
            ve_atMinAngr(i,2)=task_rbt2_ve(index_begin+I_angrMin-1,2); %sub2's velocity

            % position difference at min absolute angle rate
            poDiff_atMinAngr(i,1)=task_rbt1_po(index_begin+I_angrMin-1,2)-task_rbt2_po(index_begin+I_angrMin-1,2); %difference


            %%%%%% lag %%%%%%
            % force lag
            [r,lags]=xcorr(task_rbt1_se(not_nan,2),task_rbt2_se(not_nan,2),'coeff');
            [~,I]=max(r);
            fse_lag(i,1)=lags(I)*h;

            % force rate lag
            [r,lags]=xcorr(task_rbt1_fr(not_nan,2),task_rbt2_fr(not_nan,2),'coeff');
            [~,I]=max(r);
            fr_lag(i,1)=lags(I)*h;

            % velocity lag
            [r,lags]=xcorr(task_rbt1_ve(not_nan,2),task_rbt2_ve(not_nan,2),'coeff');
            [~,I]=max(r);
            ve_lag(i,1)=lags(I)*h;


            %%%%%% correlation %%%%%%
            % force correlation
            fse_corr(i,1)=corr(task_rbt1_se(not_nan,2), task_rbt2_se(not_nan,2)); %sub1 and sub2

            % force rate correlation
            fr_corr(i,1)=corr(task_rbt1_fr(not_nan,2), task_rbt2_fr(not_nan,2)); %sub1 and sub2

            % velocity correlation
            ve_corr(i,1)=corr(task_rbt1_ve(not_nan,2), task_rbt2_ve(not_nan,2)); %sub1 and sub2

            % force rate and velocity correlation
            fr_ve_corr(i,1)=corr(task_rbt1_fr(not_nan,2), task_rbt2_ve(not_nan,2)); %sub1-fr and sub2-ve
            fr_ve_corr(i,2)=corr(task_rbt2_fr(not_nan,2), task_rbt1_ve(not_nan,2)); %sub2-fr and sub2-ve

            % force rate and angle rate correlation
            fr_angr_corr(i,1)=corr(task_rbt1_fr(not_nan,2), angr(not_nan)); %sub1-fr and angle rate
            fr_angr_corr(i,2)=corr(task_rbt2_fr(not_nan,2), angr(not_nan)); %sub2-fr and angle rate

            % velocity and angle rate correlation
            ve_angr_corr(i,1)=corr(task_rbt1_ve(not_nan,2), angr(not_nan)); %sub1-ve and angle rate
            ve_angr_corr(i,2)=corr(task_rbt2_ve(not_nan,2), angr(not_nan)); %sub2-ve and angle rate

        end
        finalSummary.(pair{p})(n).num_block=num2str(data_name.(pair{p}){n}(end));
        finalSummary.(pair{p})(n).num_trial=num_trial;
        finalSummary.(pair{p})(n).KT=KT;
        finalSummary.(pair{p})(n).condition=condition;
        finalSummary.(pair{p})(n).good_trial=good_trial;
        finalSummary.(pair{p})(n).duration=duration;
        finalSummary.(pair{p})(n).tilt=tilt;
        finalSummary.(pair{p})(n).MT=MT;
        finalSummary.(pair{p})(n).RT=RT;
        finalSummary.(pair{p})(n).Fse_mean=fse_mean;
        finalSummary.(pair{p})(n).Fr_mean=fr_mean;
        finalSummary.(pair{p})(n).Ve_mean=ve_mean;
        finalSummary.(pair{p})(n).posDiff_mean=posDiff_mean;
        finalSummary.(pair{p})(n).ang_mean=ang_mean;
        finalSummary.(pair{p})(n).angr_mean=angr_mean;
        finalSummary.(pair{p})(n).absfb_mean=absfb_mean;
        finalSummary.(pair{p})(n).fseRatio_mean=fseRatio_mean;
        finalSummary.(pair{p})(n).frRatio_mean=frRatio_mean;
        finalSummary.(pair{p})(n).veRatio_mean=veRatio_mean;
        finalSummary.(pair{p})(n).fse_Max=fse_Max;
        finalSummary.(pair{p})(n).fr_Max=fr_Max;
        finalSummary.(pair{p})(n).ve_Max=ve_Max;
        finalSummary.(pair{p})(n).ang_Max=ang_Max;
        finalSummary.(pair{p})(n).angr_Max=angr_Max;
        finalSummary.(pair{p})(n).fb_Max=fb_Max;
        finalSummary.(pair{p})(n).fse_atMaxFse=fse_atMaxFse;
        finalSummary.(pair{p})(n).fr_atMaxFse=fr_atMaxFse;
        finalSummary.(pair{p})(n).ve_atMaxFse=ve_atMaxFse;
        finalSummary.(pair{p})(n).poDiff_atMaxFse=poDiff_atMaxFse;
        finalSummary.(pair{p})(n).fse_atMaxFr=fse_atMaxFr;
        finalSummary.(pair{p})(n).fr_atMaxFr=fr_atMaxFr;
        finalSummary.(pair{p})(n).ve_atMaxFr=ve_atMaxFr;
        finalSummary.(pair{p})(n).poDiff_atMaxFr=poDiff_atMaxFr;
        finalSummary.(pair{p})(n).fse_atMaxVe=fse_atMaxVe;
        finalSummary.(pair{p})(n).fr_atMaxVe=fr_atMaxVe;
        finalSummary.(pair{p})(n).ve_atMaxVe=ve_atMaxVe;
        finalSummary.(pair{p})(n).poDiff_atMaxVe=poDiff_atMaxVe;
        finalSummary.(pair{p})(n).fse_atMaxAng=fse_atMaxAng;
        finalSummary.(pair{p})(n).fr_atMaxAng=fr_atMaxAng;
        finalSummary.(pair{p})(n).ve_atMaxAng=ve_atMaxAng;
        finalSummary.(pair{p})(n).poDiff_atMaxAng=poDiff_atMaxAng;
        finalSummary.(pair{p})(n).fse_atMaxAngr=fse_atMaxAngr;
        finalSummary.(pair{p})(n).fr_atMaxAngr=fr_atMaxAngr;
        finalSummary.(pair{p})(n).ve_atMaxAngr=ve_atMaxAngr;
        finalSummary.(pair{p})(n).poDiff_atMaxAngr=poDiff_atMaxAngr;
        finalSummary.(pair{p})(n).fse_Min=fse_Min;
        finalSummary.(pair{p})(n).fr_Min=fr_Min;
        finalSummary.(pair{p})(n).ve_Min=ve_Min;
        finalSummary.(pair{p})(n).ang_Min=ang_Min;
        finalSummary.(pair{p})(n).angr_Min=angr_Min;
        finalSummary.(pair{p})(n).fb_Min=fb_Min;

        finalSummary.(pair{p})(n).fse_atMinFse=fse_atMinFse;
        finalSummary.(pair{p})(n).fr_atMinFse=fr_atMinFse;
        finalSummary.(pair{p})(n).ve_atMinFse=ve_atMinFse;
        finalSummary.(pair{p})(n).poDiff_atMinFse=poDiff_atMinFse;
        finalSummary.(pair{p})(n).fse_atMinFr=fse_atMinFr;
        finalSummary.(pair{p})(n).fr_atMinFr=fr_atMinFr;
        finalSummary.(pair{p})(n).ve_atMinFr=ve_atMinFr;
        finalSummary.(pair{p})(n).poDiff_atMinFr=poDiff_atMinFr;
        finalSummary.(pair{p})(n).fse_atMinVe=fse_atMinVe;
        finalSummary.(pair{p})(n).fr_atMinVe=fr_atMinVe;
        finalSummary.(pair{p})(n).ve_atMinVe=ve_atMinVe;
        finalSummary.(pair{p})(n).poDiff_atMinVe=poDiff_atMinVe;
        finalSummary.(pair{p})(n).fse_atMinAng=fse_atMinAng;
        finalSummary.(pair{p})(n).fr_atMinAng=fr_atMinAng;
        finalSummary.(pair{p})(n).ve_atMinAng=ve_atMinAng;
        finalSummary.(pair{p})(n).poDiff_atMinAng=poDiff_atMinAng;
        finalSummary.(pair{p})(n).fse_atMinAngr=fse_atMinAngr;
        finalSummary.(pair{p})(n).fr_atMinAngr=fr_atMinAngr;
        finalSummary.(pair{p})(n).ve_atMinAngr=ve_atMinAngr;
        finalSummary.(pair{p})(n).poDiff_atMinAngr=poDiff_atMinAngr;
        finalSummary.(pair{p})(n).fse_lag=fse_lag;
        finalSummary.(pair{p})(n).fr_lag=fr_lag;
        finalSummary.(pair{p})(n).ve_lag=ve_lag;
        finalSummary.(pair{p})(n).fse_corr=fse_corr;
        finalSummary.(pair{p})(n).fr_corr=fr_corr;
        finalSummary.(pair{p})(n).ve_corr=ve_corr;
        finalSummary.(pair{p})(n).fr_ve_corr=fr_ve_corr;
        finalSummary.(pair{p})(n).fr_angr_corr=fr_angr_corr;
        finalSummary.(pair{p})(n).ve_angr_corr=ve_angr_corr;

        finalSummary.(pair{p})(n).time_angleOUT=time_angleOUT;

    end
end


%save('summaryData.mat','finalSummary')
