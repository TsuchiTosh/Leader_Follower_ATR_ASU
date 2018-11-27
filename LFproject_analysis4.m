%% comment out as needed

% % subjects from 10/29
% load('C:\Users\t.tsuchiya\Desktop\新しいフォルダー\KawatoModel\Data\Summary\summaryData10292018.mat');
% TITLE={'U800','U800','U800','U800','U800','U800','U800','U800','U800','U800'};
% pair={'MR_NI', 'MN_ES','AI_TK'};
% tw=0.2;

%%%%%%%%%%%%%%%%%%
% subjects from 10/30
load('C:\Users\t.tsuchiya\Desktop\新しいフォルダー\KawatoModel\Data\Summary\summaryData10302018.mat');
TITLE={'U800','U800','U800','U800','U400','U400','S200','S200','S100','S100'};
pair={'TS_AI','YY_MG', 'YM_IS'};
tw=0.5;

%%%%%%%%%%%%%%%%%%%
% % subjects from 10/30
% load('C:\Users\t.tsuchiya\Desktop\新しいフォルダー\KawatoModel\Data\Summary\summaryData10302018.mat');
% TITLE={'U800','U800','U800','U800','U400','U400','S200','S200','S100','S100','U800'};
% pair={'YY_MG'};
% tw=0.5;

%% movement time and angle for each pair

for p=1:length(pair)
    figure
    for i=1:length(TITLE)
        
        b=i; %block number
        
        every10MT=[];
        every10ang_Max=[];
        every10ang_mean=[];
        if ~isempty(b)
            
            subplot(3,1,1)
            
            every10MT(1,:)=nanmean(reshape(finalSummary.(pair{p})(b).MT(:,1), 10,length(finalSummary.(pair{p})(b).MT(:,1))/10));
            every10MT(2,:)=nanmean(reshape(finalSummary.(pair{p})(b).MT(:,2), 10,length(finalSummary.(pair{p})(b).MT(:,2))/10));
            
            if  i==1
                plot([-100 -100],[100 100],'*b')
                hold on
                plot([-100 -100],[100 100],'*r')
                plot([-100 -100],[100 100],'ok', 'MarkerFaceColor','g','MarkerEdgeColor','k')
                plot([-100 -100],[100 100],'ok', 'MarkerFaceColor','y','MarkerEdgeColor','k')
            end
            plot((1:finalSummary.(pair{p})(b).num_trial)+finalSummary.(pair{p})(b).num_trial*(i-1), finalSummary.(pair{p})(b).MT(:,1),'*b')
            plot((1:finalSummary.(pair{p})(b).num_trial)+finalSummary.(pair{p})(b).num_trial*(i-1), finalSummary.(pair{p})(b).MT(:,2),'*r')
            plot((10:10:length(finalSummary.(pair{p})(b).MT(:,1)))+length(finalSummary.(pair{p})(b).MT(:,1))*(i-1), every10MT(1,:),'ok', 'MarkerFaceColor','g','MarkerEdgeColor','k')
            plot((10:10:length(finalSummary.(pair{p})(b).MT(:,2)))+length(finalSummary.(pair{p})(b).MT(:,1))*(i-1), every10MT(2,:),'ok', 'MarkerFaceColor','y','MarkerEdgeColor','k')
            plot([0 finalSummary.(pair{p})(b).num_trial]+finalSummary.(pair{p})(b).num_trial*(i-1), [1.5+tw, 1.5+tw], '--k')
            plot([0 finalSummary.(pair{p})(b).num_trial]+finalSummary.(pair{p})(b).num_trial*(i-1), [1.5-tw, 1.5-tw], '--k')
            plot([length(finalSummary.(pair{p})(b).MT(:,1)) length(finalSummary.(pair{p})(b).MT(:,1))]+length(finalSummary.(pair{p})(b).MT(:,1))*(i-1), [-100 100],'-k')
            
            MEAN(1)=nanmean(finalSummary.(pair{p})(b).MT(:,1));
            MEAN(2)=nanmean(finalSummary.(pair{p})(b).MT(:,2));
            text(finalSummary.(pair{p})(b).num_trial/4+finalSummary.(pair{p})(b).num_trial*(i-1), 3.5, ['Sub1 MEAN= ' sprintf('%.2f', MEAN(1))])
            text(finalSummary.(pair{p})(b).num_trial/4+finalSummary.(pair{p})(b).num_trial*(i-1), 3.3, ['Sub2 MEAN= ' sprintf('%.2f', MEAN(2))])
            text(finalSummary.(pair{p})(b).num_trial/4+finalSummary.(pair{p})(b).num_trial*(i-1), 4.5, TITLE{i}, 'FontSize', 16,'FontWeight', 'Bold')
            
            if i==1
                title(['Movement time ' pair{p}], 'Interpreter', 'none')
                ylim([0 4])
                xlim([0 finalSummary.(pair{p})(b).num_trial*length(TITLE)])
                xlabel('trial')
                ylabel('Time (N)')
            end
            
            if i==1
                legend('sub1', 'sub2', 'sub1, 10trials','sub2, 10trials',[-20 230 100 100])
            end
            
            subplot(3,1,2)
            
            every10ang_Max(1,:)=nanmean(reshape(finalSummary.(pair{p})(b).ang_Max, 10,length(finalSummary.(pair{p})(b).ang_Max(:,1))/10));
            if i==1
                plot([-100 -100],[100 100],'*m')
                hold on
            end
            plot([-100 -100],[100 100],'ok', 'MarkerFaceColor','c','MarkerEdgeColor','k')
            plot((1:finalSummary.(pair{p})(b).num_trial)+finalSummary.(pair{p})(b).num_trial*(i-1), finalSummary.(pair{p})(b).ang_Max(:,1),'*m')
            plot((10:10:length(finalSummary.(pair{p})(b).ang_Max(:,1)))+length(finalSummary.(pair{p})(b).ang_Max(:,1))*(i-1), every10ang_Max(1,:),'-ok', 'MarkerFaceColor','c','MarkerEdgeColor','k')
            plot([0 finalSummary.(pair{p})(b).num_trial]+length(finalSummary.(pair{p})(b).ang_Max(:,1))*(i-1), [atand(0.02), atand(0.02)], '--k')
            plot([length(finalSummary.(pair{p})(b).MT(:,1)) length(finalSummary.(pair{p})(b).MT(:,1))]+length(finalSummary.(pair{p})(b).MT(:,1))*(i-1), [-100 100],'-k')
            
            MEAN(1)=nanmean(finalSummary.(pair{p})(b).ang_Max(:,1));
            tilt=sum(finalSummary.(pair{p})(b).tilt);
            goodgood=sum((finalSummary.(pair{p})(b).tilt+finalSummary.(pair{p})(b).duration(:,1)++finalSummary.(pair{p})(b).duration(:,2))==3);
            
            text(finalSummary.(pair{p})(b).num_trial/4+finalSummary.(pair{p})(b).num_trial*(i-1), 4.5, ['MEAN= ' sprintf('%.2f', MEAN(1))])
            text(finalSummary.(pair{p})(b).num_trial/4+finalSummary.(pair{p})(b).num_trial*(i-1), 4, ['TiltGood= ' sprintf('%d', tilt)])
            text(finalSummary.(pair{p})(b).num_trial/4+finalSummary.(pair{p})(b).num_trial*(i-1), 3.5, ['GoodGood= ' sprintf('%d', goodgood)])
            text(finalSummary.(pair{p})(b).num_trial/4+finalSummary.(pair{p})(b).num_trial*(i-1), 5.6, TITLE{i}, 'FontSize', 16,'FontWeight', 'Bold')
            
            
            if i==1
                title(['Max absolute angle ' pair{p}], 'Interpreter', 'none')
                ylim([0 5])
                xlim([0 finalSummary.(pair{p})(b).num_trial*length(TITLE)])
                xlabel('trial')
                ylabel('angle (deg)')
            end
            
            if i==1
                legend('max angle','max angle, 10 trials',[-20 140 100 100])
            end
            
            subplot(3,1,3)
            
            every10ang_mean(1,:)=nanmean(reshape(finalSummary.(pair{p})(b).ang_mean, 10,length(finalSummary.(pair{p})(b).ang_mean(:,1))/10));
            
            plot([-100 -100],[100 100],'*m')
            hold on
            plot([-100 -100],[100 100],'ok', 'MarkerFaceColor','c','MarkerEdgeColor','k')
            plot((1:finalSummary.(pair{p})(b).num_trial)+finalSummary.(pair{p})(b).num_trial*(i-1), finalSummary.(pair{p})(b).ang_mean(:,1),'*m')
            plot((10:10:length(finalSummary.(pair{p})(b).ang_mean(:,1)))+length(finalSummary.(pair{p})(b).ang_mean(:,1))*(i-1), every10ang_mean(1,:),'-ok', 'MarkerFaceColor','c','MarkerEdgeColor','k')
            
            MEAN(1)=nanmean(finalSummary.(pair{p})(b).ang_mean(:,1));
            plot([0 finalSummary.(pair{p})(b).num_trial]+length(finalSummary.(pair{p})(b).ang_mean(:,1))*(i-1), [atand(0.02), atand(0.02)], '--k')
            plot([length(finalSummary.(pair{p})(b).MT(:,1)) length(finalSummary.(pair{p})(b).MT(:,1))]+length(finalSummary.(pair{p})(b).ang_mean(:,1))*(i-1), [-100 100],'-k')
            text(finalSummary.(pair{p})(b).num_trial/4+length(finalSummary.(pair{p})(b).ang_mean(:,1))*(i-1), 4.5, ['MEAN= ' sprintf('%.2f', MEAN(1))])
            text(finalSummary.(pair{p})(b).num_trial/4+finalSummary.(pair{p})(b).num_trial*(i-1), 5.6, TITLE{i}, 'FontSize', 16,'FontWeight', 'Bold')
            
            if i==1
                title(['Mean absolute angle ' pair{p}], 'Interpreter', 'none')
                ylim([0 5])
                xlim([0 finalSummary.(pair{p})(b).num_trial*length(TITLE)])
                xlabel('trial')
                ylabel('angle (deg)')
            end
            
            if i==1
                legend('mean angle','mean angle, 10 trials',[-20 50 100 100])
            end
        end
    end
end

%% movemen time and angle for all

% subjects from 10/29 and 10/30
TITLE={'U800','U800','U800','U800'};
pair={'MR_NI', 'MN_ES','AI_TK';
    'TS_AI','YY_MG', 'YM_IS'};
load('C:\Users\t.tsuchiya\Desktop\新しいフォルダー\KawatoModel\Data\Summary\summaryData10292018.mat');
temp=load('C:\Users\t.tsuchiya\Desktop\新しいフォルダー\KawatoModel\Data\Summary\summaryData10302018.mat');

for i=1:3
    finalSummary.(pair{2,i})=temp.finalSummary.(pair{2,i});
end

c={'m','c','g';
    'r','b','y'};

tw(1)=0.2;
tw(2)=0.5;

figure
for n=1:2
    for p=1:length(pair)
        for i=1:length(TITLE)
            
            b=i; %block number
            
            every10MT=[];
            every10ang_Max=[];
            every10ang_mean=[];
            if ~isempty(b)
                
                subplot(3,2,n)
                
                every10MT(1,:)=nanmean(abs(reshape(finalSummary.(pair{n,p})(b).MT(:,1), 10,length(finalSummary.(pair{n,p})(b).MT(:,1))/10)));
                every10MT(2,:)=nanmean(abs(reshape(finalSummary.(pair{n,p})(b).MT(:,2), 10,length(finalSummary.(pair{n,p})(b).MT(:,2))/10)));
                every10MT(3,:)=(every10MT(1,:)+every10MT(2,:))/2;
                
                if i==1
                    plot([-100 -100],[100 100],'ok', 'MarkerFaceColor',c{n,1},'MarkerEdgeColor','k')
                    hold on
                    plot([-100 -100],[100 100],'ok', 'MarkerFaceColor',c{n,2},'MarkerEdgeColor','k')
                    plot([-100 -100],[100 100],'ok', 'MarkerFaceColor',c{n,3},'MarkerEdgeColor','k')
                end
                
                plot((10:10:length(finalSummary.(pair{n,p})(b).MT(:,1)))+length(finalSummary.(pair{n,p})(b).MT(:,1))*(i-1), every10MT(3,:),'-ok', 'MarkerFaceColor',c{n,p},'MarkerEdgeColor','k')
                plot([0 finalSummary.(pair{n,p})(b).num_trial]+finalSummary.(pair{n,p})(b).num_trial*(i-1), [1.5+tw(n), 1.5+tw(n)], '--k')
                plot([0 finalSummary.(pair{n,p})(b).num_trial]+finalSummary.(pair{n,p})(b).num_trial*(i-1), [1.5-tw(n), 1.5-tw(n)], '--k')
                plot([length(finalSummary.(pair{n,p})(b).MT(:,1)) length(finalSummary.(pair{n,p})(b).MT(:,1))]+length(finalSummary.(pair{n,p})(b).MT(:,1))*(i-1), [-100 100],'-k')
                
                MEAN(1)=nanmean(finalSummary.(pair{n,p})(b).MT(:,1));
                MEAN(2)=nanmean(finalSummary.(pair{n,p})(b).MT(:,2));
                text(finalSummary.(pair{n,p})(b).num_trial/4+finalSummary.(pair{n,p})(b).num_trial*(i-1), 4.5, TITLE{i}, 'FontSize', 16,'FontWeight', 'Bold')
                
                if i==1
                    title('Movement time', 'Interpreter', 'none')
                    ylim([0 4])
                    xlim([0 240])
                    xlabel('trial')
                    ylabel('Time (N)')
                end
                
                if i==1
                    
                    if n==1
                        leg=legend(pair{n,1},pair{n,2},pair{n,3},[-20 230 100 100]);
                        set(leg, 'Interpreter', 'none');
                    else
                        leg=legend(pair{n,1},pair{n,2},pair{n,3},[170 230 100 100]);
                        set(leg, 'Interpreter', 'none');
                    end
                end
                
                subplot(3,2,n+2)
                
                every10ang_Max(1,:)=nanmean(reshape(finalSummary.(pair{n,p})(b).ang_Max, 10,length(finalSummary.(pair{n,p})(1,b).ang_Max(:,1))/10));
                if i==1
                    plot([-100 -100],[100 100],'ok', 'MarkerFaceColor',c{n,1},'MarkerEdgeColor','k')
                    hold on
                    plot([-100 -100],[100 100],'ok', 'MarkerFaceColor',c{n,2},'MarkerEdgeColor','k')
                    plot([-100 -100],[100 100],'ok', 'MarkerFaceColor',c{n,3},'MarkerEdgeColor','k')
                end
                plot([-100 -100],[100 100],'ok', 'MarkerFaceColor','c','MarkerEdgeColor','k')
                plot((10:10:length(finalSummary.(pair{n,p})(b).ang_Max(:,1)))+length(finalSummary.(pair{n,p})(b).ang_Max(:,1))*(i-1), every10ang_Max(1,:),'-ok', 'MarkerFaceColor',c{n,p},'MarkerEdgeColor','k')
                plot([0 finalSummary.(pair{n,p})(b).num_trial]+length(finalSummary.(pair{n,p})(b).ang_Max(:,1))*(i-1), [atand(0.02), atand(0.02)], '--k')
                plot([length(finalSummary.(pair{n,p})(b).MT(:,1)) length(finalSummary.(pair{n,p})(b).MT(:,1))]+length(finalSummary.(pair{n,p})(b).MT(:,1))*(i-1), [-100 100],'-k')
                
                
                goodgood=sum((finalSummary.(pair{n,p})(b).tilt+finalSummary.(pair{n,p})(b).duration(:,1)++finalSummary.(pair{n,p})(b).duration(:,2))==3);
                text(finalSummary.(pair{n,p})(b).num_trial/4+finalSummary.(pair{n,p})(b).num_trial*(i-1), 3.4, TITLE{i}, 'FontSize', 16,'FontWeight', 'Bold')
                
                
                if i==1
                    title('Max absolute angle', 'Interpreter', 'none')
                    ylim([0 3])
                    xlim([0 finalSummary.(pair{n,p})(b).num_trial*length(TITLE)])
                    xlabel('trial')
                    ylabel('angle (deg)')
                end
                
                if i==1
                    
                    if n==1
                        leg=legend(pair{n,1},pair{n,2},pair{n,3},[-20 140 100 100]);
                        set(leg, 'Interpreter', 'none');
                    else
                        leg=legend(pair{n,1},pair{n,2},pair{n,3},[170 140 100 100]);
                        set(leg, 'Interpreter', 'none');
                    end
                end
                
                subplot(3,2,n+4)
                
                every10ang_mean(1,:)=nanmean(reshape(finalSummary.(pair{n,p})(b).ang_mean, 10,length(finalSummary.(pair{n,p})(b).ang_mean(:,1))/10));
                
                if i==1
                    plot([-100 -100],[100 100],'ok', 'MarkerFaceColor',c{n,1},'MarkerEdgeColor','k')
                    hold on
                    plot([-100 -100],[100 100],'ok', 'MarkerFaceColor',c{n,2},'MarkerEdgeColor','k')
                    plot([-100 -100],[100 100],'ok', 'MarkerFaceColor',c{n,3},'MarkerEdgeColor','k')
                end
                plot((10:10:length(finalSummary.(pair{n,p})(b).ang_mean(:,1)))+length(finalSummary.(pair{n,p})(b).ang_mean(:,1))*(i-1), every10ang_mean(1,:),'-ok', 'MarkerFaceColor',c{n,p},'MarkerEdgeColor','k')
                
                plot([0 finalSummary.(pair{n,p})(b).num_trial]+length(finalSummary.(pair{n,p})(b).ang_mean(:,1))*(i-1), [atand(0.02), atand(0.02)], '--k')
                plot([length(finalSummary.(pair{n,p})(b).MT(:,1)) length(finalSummary.(pair{n,p})(b).MT(:,1))]+length(finalSummary.(pair{n,p})(b).ang_mean(:,1))*(i-1), [-100 100],'-k')
                text(finalSummary.(pair{n,p})(b).num_trial/4+finalSummary.(pair{n,p})(b).num_trial*(i-1), 3.4, TITLE{i}, 'FontSize', 16,'FontWeight', 'Bold')
                
                if i==1
                    title('Mean absolute angle', 'Interpreter', 'none')
                    ylim([0 3])
                    xlim([0 finalSummary.(pair{n,p})(b).num_trial*length(TITLE)])
                    xlabel('trial')
                    ylabel('angle (deg)')
                end
                
                if i==1
                    if n==1
                        leg=legend(pair{n,1},pair{n,2},pair{n,3},[-20 50 100 100]);
                        set(leg, 'Interpreter', 'none');
                    else
                        leg=legend(pair{n,1},pair{n,2},pair{n,3},[170 50 100 100]);
                        set(leg, 'Interpreter', 'none');
                    end
                end
            end
        end
    end
end