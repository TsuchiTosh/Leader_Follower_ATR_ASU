%% analysis 1
% temporal patterns

%% load
load('temporalData.mat');

%% plot
% %subjects from 10/18, 10/22
% TITLE={'U800','U400', 'S200', 'S100', 'U0', 'S0', 'S300'};
% pair={'K_S', 'K_A', 'Y_T'};

% subjects from 10/24
TITLE={'U800', 'U800','U400', 'S200', 'S100'};
pair={'S_J', 'M_S', 'Y_Y'};
% 
% % subjects from 10/25
% TITLE={'U800','U400', 'S200', 'S100', 'S100'};
% pair={'M_T','C_T', 'A_J'};

time(:,1)=(1:20000)*1/2000-1/2000;

    %% plot feedback
    figure
    b=zeros(1,length(TITLE));
    for p=1:length(pair)
        ii=1;
        for i=1:length(TITLE)
            for n=1:length(finalTemporal.(pair{p}))
                b(n)=strcmp(finalTemporal.(pair{p})(n).condition, TITLE{i});
            end
            b=find(b);
            if length(b)>1
                b=b(ii);
                ii=ii+1;
            end
            
            if ~isempty(b)
                subplot(length(pair),length(TITLE),i+length(TITLE)*(p-1))
                plot([-100 -100],[100 100],'-b')
                hold on
                plot([-100 -100],[100 100],'-r')
                plot(repmat(time, 1,  finalTemporal.(pair{p})(b).num_trial), finalTemporal.(pair{p})(b).sub1.fb,'-b')
                plot(repmat(time, 1,  finalTemporal.(pair{p})(b).num_trial), finalTemporal.(pair{p})(b).sub2.fb,'-r')
                title([TITLE{i} ' Feedback ' pair{p}(1) pair{p}(3)])
                ylim([-15 15])
                xlim([0 2])
                xlabel('time (s)')
                ylabel('force (N)')
                if i==1
                    legend('sub1','sub2',[-15 230 100 100])
                end
            end
        end
    end

    %% plot force sensor
    figure
    b=zeros(1,length(TITLE));
    for p=1:length(pair)
        ii=1;
        for i=1:length(TITLE)
            for n=1:length(finalTemporal.(pair{p}))
                b(n)=strcmp(finalTemporal.(pair{p})(n).condition, TITLE{i});
            end
            b=find(b);
            if length(b)>1
                b=b(ii);
                ii=ii+1;
            end
            
            index_goodgood=(finalTemporal.(pair{p})(b).duration(:,2) & finalTemporal.(pair{p})(b).duration(:,1) & finalTemporal.(pair{p})(b).tilt);

            if ~isempty(b)
                subplot(length(pair),length(TITLE),i+length(TITLE)*(p-1))
                plot([-100 -100],[100 100],'-b')
                hold on
                plot([-100 -100],[100 100],'-r')
                
               plot(repmat(time, 1,  sum(index_goodgood)), finalTemporal.(pair{p})(b).sub1.fse(:,index_goodgood),'-b')
               plot(repmat(time, 1,  sum(index_goodgood)), finalTemporal.(pair{p})(b).sub2.fse(:,index_goodgood),'-r')

                
                %plot(repmat(time, 1,  finalTemporal.(pair{p})(b).num_trial), finalTemporal.(pair{p})(b).sub1.fse(:,index_goodgood),'-b')
                %plot(repmat(time, 1,  finalTemporal.(pair{p})(b).num_trial), finalTemporal.(pair{p})(b).sub2.fse(:,index_goodgood),'-r')
                title([TITLE{i} ' SensorForce ' pair{p}(1) pair{p}(3)])
                ylim([-15 15])
                xlim([0 2])
                xlabel('time (s)')
                ylabel('force (N)')
                if i==1
                    legend('sub1','sub2',[-15 230 100 100])
                end
            end
        end
    end
    


%% cross correlation
if 0
figure
b=zeros(1,length(TITLE));
for p=1:length(pair)
    ii=1;
    for i=1:length(TITLE)
        GoodBad=1;
        for n=1:length(finalTemporal.(pair{p}))
            b(n)=strcmp(finalTemporal.(pair{p})(n).condition, TITLE{i});
        end
        b=find(b);
        if length(b)>1
            b=b(ii);
            ii=ii+1;
        end
        
        if ~isempty(b)
            subplot(length(pair),length(TITLE),i+length(TITLE)*(p-1))
            index_goodgood=(finalTemporal.(pair{p})(b).duration(:,2) & finalTemporal.(pair{p})(b).duration(:,1) & finalTemporal.(pair{p})(b).tilt);
            index_badbad=(~finalTemporal.(pair{p})(b).duration(:,2) | ~finalTemporal.(pair{p})(b).duration(:,1) & ~finalTemporal.(pair{p})(b).tilt);

            SEM1=nanstd(finalTemporal.(pair{p})(b).fse_lag(4990:end-4999,index_goodgood,2),0,2); %/sqrt(finalTemporal.(pair{p})(b).num_trial);
                        SEM2=nanstd(finalTemporal.(pair{p})(b).fse_lag(4990:end-4999,index_badbad,2),0,2); %/sqrt(finalTemporal.(pair{p})(b).num_trial);

            plot(finalTemporal.(pair{p})(b).fse_lag(4990:end-4999,1,1)*1/2000, nanmean(finalTemporal.(pair{p})(b).fse_lag(4990:end-4999,index_goodgood,2),2),'LineWidth',1.5)
            hold on
            plot(finalTemporal.(pair{p})(b).fse_lag(4990:end-4999,1,1)*1/2000, nanmean(finalTemporal.(pair{p})(b).fse_lag(4990:end-4999,index_badbad,2),2),'r','LineWidth',1.5)
            plot(finalTemporal.(pair{p})(b).fse_lag(4990:end-4999,1,1)*1/2000, nanmean(finalTemporal.(pair{p})(b).fse_lag(4990:end-4999,:,2),2),'k--','LineWidth',1.5)
            
            %fill([finalTemporal.(pair{p})(b).fse_lag(4990:end-4999,1,1)*1/2000;flipud(finalTemporal.(pair{p})(b).fse_lag(4990:end-4999,1,1)*1/2000)],[nanmean(finalTemporal.(pair{p})(b).fse_lag(4990:end-4999,index_goodgood,2),2)-SEM;flipud(nanmean(finalTemporal.(pair{p})(b).fse_lag(4990:end-4999,index_goodgood,2),2)+SEM)],[0.53 0.81 0.98],'linestyle','none','FaceAlpha',0.5);
            %h2=fill([finalTemporal.(pair{p})(b).fse_lag(4990:end-4999,1,1)*1/2000;flipud(finalTemporal.(pair{p})(b).fse_lag(4990:end-4999,1,1)*1/2000)],[nanmean(finalTemporal.(pair{p})(b).fse_lag(4990:end-4999,index_badbad,2),2)-SEM;flipud(nanmean(finalTemporal.(pair{p})(b).fse_lag(4990:end-4999,index_badbad,2),2)+SEM)],[1 0.6 0.6],'linestyle','none');

            
            title([TITLE{i} ' SensorForce ' pair{p}(1) pair{p}(3)], 'FontSize',18)
            ylim([-1 1])
            xlim([-2.5 2.5])
            xlabel('time (s)', 'FontSize',14)
            ylabel('cross correlation', 'FontSize',14)
            if i==1
                legend('meanGoodGood', 'meanBadBad','All',[-20 230 100 100])
            end
            plot([0 0],[-1 1], 'k--')
        end
    end
end
end
