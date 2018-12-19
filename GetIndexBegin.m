function index_begin=GetIndexBegin(data,MyFunc,trial_number,a,b)
  % Find index for when the subjects begin their movement.
  % "Beginning of the movement" is defined as the time point when subject left
  % the initial circle in y-direction (toward target).
  % y = -0.07 in task coordinate is the threshold.
  % Center of the initial circle is at y=-0.05 in task coordinate. Radius is 0.02.


  % input:
  %   data = data obtained from load_tvins_data41()
  %   MyFunc = world2task()
  %   trial_number = trial
  %   a,b = Buttherwoth filter coefficient used for filtfilt
  %
  % output:
  %   index_begin = [index1_begin, index2_begin, index3_begin]
  %     index1_begin=index when sub1 left the initial circle
  %     index2_begin=index when sub2 left the initial circle
  %     index3_begin=index of subject that left earlier thant the other

    i=trial_number;

    % index with numbers, not NaN
    if ~isnan(data.trial(1).WpoX(:,i))<=~isnan(data.trial(2).WpoX(:,i))
        not_nan=~isnan(data.trial(1).WpoX(:,i));
    else
        not_nan=~isnan(data.trial(2).WpoX(:,i));
    end

    %%%%%%%%%%%% Get position data %%%%%%%%%%%%%%%%%%%%%%%%
    % subject on LEFT-robot
    % sub1 position
    world_rbt1_po = [data.trial(1).WpoX(:,i), data.trial(1).WpoY(:,i)];
    task_rbt1_po = MyFunc(world_rbt1_po, data.define, data.para.robot{1}, 'pos');
    task_rbt1_po(not_nan,1) = filtfilt(b,a,task_rbt1_po(not_nan,1)); % x-pos
    task_rbt1_po(not_nan,2) = filtfilt(b,a,task_rbt1_po(not_nan,2)); % y-pos

    % subject on RIGHT-robot
    % sub2 position
    world_rbt2_po = [data.trial(2).WpoX(:,i), data.trial(2).WpoY(:,i)];
    task_rbt2_po = MyFunc(world_rbt2_po, data.define, data.para.robot{2}, 'pos');
    task_rbt2_po(not_nan,1) = filtfilt(b,a,task_rbt2_po(not_nan,1)); % x-pos
    task_rbt2_po(not_nan,2) = filtfilt(b,a,task_rbt2_po(not_nan,2)); % y-pos

    %%%%%%%%%%%% Compute and aggregate key data %%%%%%%%%%%%%%%%%%%%
    % index when sub1 left initial circle
    if isempty(find(task_rbt1_po(:,2)>-0.07,1,'first'))
        index1_begin=nan; %never left initial circle
    else
        index1_begin=find(task_rbt1_po(:,2)>-0.07,1,'first'); %sub1
    end

    % index when sub2 left initial circle
    if isempty(find(task_rbt2_po(:,2)>-0.07,1,'first'))
        index2_begin=nan; %never left initial circle
    else
        index2_begin=find(task_rbt2_po(:,2)>-0.07,1,'first'); %sub2
    end

    % make sure both index is a number, not nan
    if isnan(index1_begin) && ~isnan(index2_begin) %if sub1=Nan and sub2=some number
        index1_begin=index2_begin;
    elseif ~isnan(index1_begin) && isnan(index2_begin) %if sub2=Nan and sub1=some number
        index2_begin=index1_begin;
    elseif isnan(index1_begin) && isnan(index2_begin) %if sub1=Nan and sub2=Nan
        index1_begin=1;
        index2_begin=1;
    end

    % Align start index to the subject that left earlier than the other
    % 先に動いた方のインデックスに合わせる
    if index1_begin<=index2_begin
        index3_begin=index1_begin; %if sub1 left earlier than sub2
    else
        index3_begin=index2_begin; %if sub2 left earlier than sub1
    end

    %output
    index_begin=[index1_begin, index2_begin, index3_begin];

  end
