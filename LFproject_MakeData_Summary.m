%% make summary data (mean, max, etc.)
% Leader-follower project
% Last modified: 12/14/2018 by Toshiki Tsuchiya
%
% This code generates .csv file of summary data from experimental data in long-format
%
% How to use:
% 1. Update section "Setting up" as needed
% 2. Make sure all the necessary functions are in the path
% 3. Make sure the data and datasheet is in the path
% 4. Run



%% Setting up
% please update this section first

% directory names
datasheet_dir=''; %fill in the path to the data sheet directory
data_dir =''; %fill in the path to the data directory
yoshiokafunction_dir=''; %fill in the path to the functions by Yoshioka-san
toshikifunction_dir=''; %fill in the path to the function by Toshiki

% file names
datasheet_name='LF_datasheet_november.xlsx'; %fill in the data sheet name

% reading data sheet
addpath(datasheet_dir); %set path to the data sheet
[~,~,datasheet]=xlsread(datasheet_name); %read data sheet as cell array
datasheet_header=datasheet(1,:); %save data sheet header
datasheet(1,:)=[]; %remove data sheet header
data_name=datasheet(:,1); %

% reading yoshioka-san's function
addpath(yoshiokafunction_dir); %set path to the loading function
% include:
%   load_tvins_data41()
%   world2task()

% reading other functions
addpath(toshikifunction_dir)
% include:
%   GetIndexBegin()
%   GetKineDataY()

% output filename
output_name='LF_summary_november.csv'; %fill in the
output_header={datasheet_header{1,:}, 'trial_num',...
 'MT_left', 'RT_left','MTgood_left','meanF_left', 'meanFr_left', 'meanVe_left', 'meanFb_left',...
 'maxF_left', 'maxFr_left', 'maxVe_left', 'maxFb_left',...
 'minF_left', 'minFr_left', 'minVe_left', 'minFb_left',...
 'MT_right', 'RT_right','MTgood_right','meanF_right', 'meanFr_right', 'meanVe_right', 'meanFb_right',...
 'maxF_right', 'maxFr_right', 'maxVe_right', 'maxFb_right',...
 'minF_right', 'minFr_right', 'minVe_right', 'minFb_right',...
 'error_trial', 'MTgood_both', 'tilt_good', 'meanPo', 'meanAng', 'meanAngr',...
 'maxAng', 'maxAngr', 'minAng', 'minAngr', 'corF', 'corFr', 'corVe', 'corFb'};


%% Main
addpath(data_dir); %set path to data directory

%filter specification
fc = 10; %cut-off
fs = 2000; %sampling frequency
[b,a] = butter(6,fc/(fs/2)); %filter position, velocity, etc. using butterworth
h=1/fs; %step size time

all_summary={};
for b=1:length(datasheet) %for every block

  data=load_tvins_data41(data_dir,datasheet{b,1}); %load data by block
  num_trial=length(data.trial(1).dynamics); %total number of trial in the block

  block_summary=cell(num_trial,6);
  for n=1:num_trial %for every trial in block

    index_begin=GetIndexBegin(data, @world2task, n, a, b); %get starting index for the trial
    [sub(1).y, sub(2).y]=GetKineDataY(data, @world2task, n, a, b, index_begin(3),h); %load kinetic/kinematic data for trial
    % sub.y=[position, velocity, force, force rate, feedback force]

    % info from datasheet
    % {pair,	block_number,	stability,	stiffness,	stiffness_gain,	order}
    block_summary{n,1:6}=datasheet{b,2:7};
    col=7;

    % trial number
    block_summary{n,col}=n;
    col=col+1;
    %%%%%%%%%%%%%% Individual subject %%%%%%%%%%%%%%%%%%%%%
    for p=1:2 %Left then Right
      % movement time
      block_summary{n,col}=data.trial(p).check_trial.movement_time(n);
      col=col+1;
      % response time
      block_summary{n,col}=index_begin(p)*h;
      col=col+1;
      %marker for performance, individual movement time
      block_summary{n,col}=(data.trial(p).check_trial.duration(n)==1);
      col=col+1;

      % mean force
      block_summary{n,col}=nanmean(sub(p).y(:,2));
      col=col+1;
      % mean force rate
      block_summary{n,col}=nanmean(sub(p).y(:,3));
      col=col+1;
      % mean velocity
      block_summary{n,col}=nanmean(sub(p).y(:,4));
      col=col+1;
      % abs feedback mean
      block_summary{n,col}=nanmean(abs(sub(p).y(:,5)));
      col=col+1;

      %max force
      [block_summary{n,col},~]=nanmax(sub(p).y(:,2));
      col=col+1;
      %max force rate
      [block_summary{n,col},~]=nanmax(sub(p).y(:,3));
      col=col+1;
      %max velocity
      [block_summary{n,col},~]=nanmax(sub(p).y(:,4));
      col=col+1;
      %max feedback force
      [block_summary{n,col},~]=nanmax(sub(p).y(:,4));
      col=col+1;

      %min force
      [block_summary{n,col},~]=nanmin(sub(p).y(:,2));
      col=col+1;
      %min force rate
      [block_summary{n,col},~]=nanmin(sub(p).y(:,3));
      col=col+1;
      %min velocity
      [block_summary{n,col},~]=nanmin(sub(p).y(:,4));
      col=col+1;
      %min feedback force
      [block_summary{n,col},~]=nanmin(sub(p).y(:,5));
      col=col+1;

    end

    %%%%%%%%%%%%%% Both subjects %%%%%%%%%%%%%%%%%%%%%
    % marker for error trial=0, good trial=1
    block_summary{n,col}=(data.trial(1).check_trial.movement_time(i)>0);
    col=col+1;

    %marker for performance, both movement time
    block_summary{n,col}=(data.trial(1).check_trial.duration(n)==1 & data.trial(2).check_trial.duration(n)==1);
    col=col+1;

    % marker for performance, tilt
    block_summary{n,col}=(data.trial(1).check_trial.traj_err(n)==1);
    col=col+1;

    % mean hand distance
    hand_dist=sub(1).y(:,1)-sub(2).y(:,1);
    block_summary{n,col}=nanmean(hand_dist);
    col=col+1;

    % mean absolute angle
    angle=data.trial(1).beam_theta(index_begin(3):end,n)*(180/pi);
    block_summary{n,col}=nanmean(abs(angle));
    col=col+1;

    % mean absolute angle rate
    angr=[0; (angle(2:end)-angle(1:end-1))/h];
    block_summary{n,col}=nanmean(abs(angr));
    col=col+1;

    % max absolute angle
    [block_summary{n,col},~]=nanax(abs(angle));
    col=col+1;
    % max absolute angle rate
    [block_summary{n,col}, ~]=nanmax(abs(angr));
    col=col+1;

    % minimum absolute angle
    [block_summary{n,col},~]=nanmin(abs(angle));
    col=col+1;
    % minimum absolute angle rate
    [block_summary{n,col}, ~]=nanmax(abs(angr));
    col=col+1;

    % force correlation
    block_summary{n,col}=corr(sub(1).y(:,2),sub(2).y(:,2));
    col=col+1;
    % force rate correlation
    block_summary{n,col}=corrcorr(sub(1).y(:,3),sub(2).y(:,3));
    col=col+1;
    % velocity correlation
    block_summary{n,col}=corrcorr(sub(1).y(:,4),sub(2).y(:,4));
    col=col+1;
    % feedback force correlation
    block_summary{n,col}=corrcorr(sub(1).y(:,5),sub(2).y(:,5));
    col=col+1;
  end

  all_summary=vertcat(all_summary, block_summary)
end

% convert cell to table
all_summary=cell2table(all_summary, 'VariableNames',output_header);
% write table as .csv file
writetable(all_summary,output_name)
