function [kinedata1_y, kinedata2_y]=GetKineDataY(data,MyFunc,trial_number,a,b, index_start, h)
  % Generates kinetic and kinematic data for each subject at specific trials.
  % Only Y-direction data is outputted.
  % Output data begins from index_start. Set index_start=1 to output all recorded data.
  % Butterworth filter is applied as default. Make a=1,b=1 if filtering is not needed.


  % input:
  %   data = data obtained from load_tvins_data41()
  %   MyFunc = world2task()
  %   trial_number = trial
  %   a,b = Buttherwoth filter coefficient used for filtfilt
  %   index_start = starting index
  %   h = step size
  %
  % output:
  %   kinedata1, kinedata2 = [position, velocity, force, force rate, feedback force] in task coordinate

      i=trial_number;

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
      task_rbt1_po = MyFunc(world_rbt1_po, data.define, data.para.robot{1}, 'pos');
      task_rbt1_po(not_nan,1) = filtfilt(b,a,task_rbt1_po(not_nan,1)); % x-pos
      task_rbt1_po(not_nan,2) = filtfilt(b,a,task_rbt1_po(not_nan,2)); % y-pos
      % sub1 force
      world_rbt1_se = [data.trial(1).WfeX(:,i), data.trial(1).WfeY(:,i)];
      task_rbt1_se = MyFunc(world_rbt1_se, data.define, data.para.robot{1}, 'force');
      task_rbt1_se(not_nan,1) = filtfilt(b,a,task_rbt1_se(not_nan,1)); %x-force
      task_rbt1_se(not_nan,2) = filtfilt(b,a,task_rbt1_se(not_nan,2)); %y-force
      % sub1 vel
      world_rbt1_ve = [data.trial(1).WveX(:,i), data.trial(1).WveY(:,i)];
      task_rbt1_ve = MyFunc(world_rbt1_ve, data.define, data.para.robot{1}, 'vel');
      task_rbt1_ve(not_nan,1) = filtfilt(b,a,task_rbt1_ve(not_nan,1)); %x-velocity
      task_rbt1_ve(not_nan,2) = filtfilt(b,a,task_rbt1_ve(not_nan,2)); %y-velocity
      % sub1 force rate
      task_rbt1_fr(:,1) = [0; (task_rbt1_se(2:end,1)-task_rbt1_se(1:end-1,1))/h]; %x-force rate　
      task_rbt1_fr(:,2) = [0; (task_rbt1_se(2:end,2)-task_rbt1_se(1:end-1,2))/h]; %y-force rate
      % sub1 feedback force
      task_rbt1_fb=data.trial(1).TfiY(:,i);
      task_rbt1_fb(not_nan,1)=filtfilt(b,a,task_rbt1_fb(not_nan,1));

      % subject on RIGHT-robot
      % sub2 position
      world_rbt2_po = [data.trial(2).WpoX(:,i), data.trial(2).WpoY(:,i)];
      task_rbt2_po = MyFunc(world_rbt2_po, data.define, data.para.robot{2}, 'pos');
      task_rbt2_po(not_nan,1) = filtfilt(b,a,task_rbt2_po(not_nan,1)); % x-pos
      task_rbt2_po(not_nan,2) = filtfilt(b,a,task_rbt2_po(not_nan,2)); % y-pos
      % sub2 force
      world_rbt2_se = [data.trial(2).WfeX(:,i), data.trial(2).WfeY(:,i)];
      task_rbt2_se = MyFunc(world_rbt2_se, data.define, data.para.robot{2}, 'force');
      task_rbt2_se(not_nan,1) = filtfilt(b,a,task_rbt2_se(not_nan,1)); %x-force
      task_rbt2_se(not_nan,2) = filtfilt(b,a,task_rbt2_se(not_nan,2)); %y-force
      % sub2 vel
      world_rbt2_ve = [data.trial(2).WveX(:,i), data.trial(2).WveY(:,i)];
      task_rbt2_ve = MyFunc(world_rbt2_ve, data.define, data.para.robot{2}, 'vel');
      task_rbt2_ve(not_nan,1) = filtfilt(b,a,task_rbt2_ve(not_nan,1)); %x-velocity
      task_rbt2_ve(not_nan,2) = filtfilt(b,a,task_rbt2_ve(not_nan,2)); %y-velocity
      % sub2 force rate
      task_rbt2_fr(:,1) = [0; (task_rbt2_se(2:end,1)-task_rbt2_se(1:end-1,1))/h]; %x-force rate
      task_rbt2_fr(:,2) = [0; (task_rbt2_se(2:end,2)-task_rbt2_se(1:end-1,2))/h]; %y-force rate
      % sub2 feedback force
      task_rbt2_fb=data.trial(2).TfiY(:,i);
      task_rbt2_fb(not_nan,1)=filtfilt(b,a,task_rbt2_fb(not_nan,1));
      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

      % output
      kinedata1_y=[task_rbt1_po(index_start:end,2) task_rbt1_ve(index_start:end,2) task_rbt1_se(index_start:end,2) task_rbt1_fr(index_start:end,2) task_rbt1_fb(index_start:end,1)];
      kinedata2_y=[task_rbt2_po(index_start:end,2) task_rbt2_ve(index_start:end,2) task_rbt2_se(index_start:end,2) task_rbt2_fr(index_start:end,2) task_rbt2_fb(index_start:end,1)];


end
