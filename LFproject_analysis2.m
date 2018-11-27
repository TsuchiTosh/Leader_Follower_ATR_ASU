%% analysis 2
% summary plots
clear
%% load
%load('SummaryData.mat');
%load('SummaryData10292018.mat'); %all U800
load('SummaryData10252018.mat'); %

%% plot
% subjects from 10/18, 10/22
% TITLE={'U800','U400', 'S200', 'S100', 'U0', 'S0', 'S300'};
% pair={'K_S', 'K_A', 'Y_T'};

% subjects from 10/24
TITLE={'U800','U400', 'S200', 'S100', 'U800'};
pair={'S_J', 'M_S', 'Y_Y'};

% % subjects from 10/25
% TITLE={'U800','U400', 'S200', 'S100', 'S100'};
% pair={'M_T','C_T', 'A_J'};

% % subjects from 10/29
% TITLE={'U800','U800','U800','U800','U800','U800','U800','U800','U800','U800'};
% pair={'M_N', 'M_E'};

time(:,1)=(1:20000)*1/2000-1/2000;

%% movement time and angle

b=zeros(1,length(TITLE));

for p=1:length(pair)
    figure
    ii=1;
    for i=1:length(TITLE)
        for n=1:length(finalSummary.(pair{p}))
            b(n)=strcmp(finalSummary.(pair{p})(n).condition, TITLE{i});
        end
        b=find(b);
        if length(b)>1
            b=b(ii);
            ii=ii+1;
        end
        every10MT=[];
        every10ang_Max=[];
        every10ang_mean=[];
        if ~isempty(b)
            
            subplot(3,length(TITLE),i)
            
            every10MT(1,:)=nanmean(reshape(finalSummary.(pair{p})(b).MT(:,1), 10,length(finalSummary.(pair{p})(b).MT(:,1))/10));
            every10MT(2,:)=nanmean(reshape(finalSummary.(pair{p})(b).MT(:,2), 10,length(finalSummary.(pair{p})(b).MT(:,2))/10));
            
            plot([-100 -100],[100 100],'*b')
            hold on
            plot([-100 -100],[100 100],'*r')
            plot([-100 -100],[100 100],'ok', 'MarkerFaceColor','g','MarkerEdgeColor','k')
            plot([-100 -100],[100 100],'ok', 'MarkerFaceColor','y','MarkerEdgeColor','k')
            plot(finalSummary.(pair{p})(b).MT(:,1),'*b')
            plot(finalSummary.(pair{p})(b).MT(:,2),'*r')
            plot(10:10:length(finalSummary.(pair{p})(b).MT(:,1)), every10MT(1,:),'ok', 'MarkerFaceColor','g','MarkerEdgeColor','k')
            plot(10:10:length(finalSummary.(pair{p})(b).MT(:,2)), every10MT(2,:),'ok', 'MarkerFaceColor','y','MarkerEdgeColor','k')
            plot([0 finalSummary.(pair{p})(b).num_trial], [1.3, 1.3], '--k')
            plot([0 finalSummary.(pair{p})(b).num_trial], [1.7, 1.7], '--k')
            
            MEAN(1)=nanmean(finalSummary.(pair{p})(b).MT(:,1));
            MEAN(2)=nanmean(finalSummary.(pair{p})(b).MT(:,2));
            text(finalSummary.(pair{p})(b).num_trial/4, 3.5, ['Sub1 MEAN= ' sprintf('%.2f', MEAN(1))])
            text(finalSummary.(pair{p})(b).num_trial/4, 3.3, ['Sub2 MEAN= ' sprintf('%.2f', MEAN(2))])
            
            title([TITLE{i} ' Movement time ' pair{p}(1) pair{p}(3)])
            ylim([0 4])
            xlim([0 finalSummary.(pair{p})(b).num_trial])
            xlabel('trial')
            ylabel('Time (N)')
            
            if i==1
                legend('sub1', 'sub2', 'sub1, 10trials','sub2, 10trials',[-20 230 100 100])
            end
            
            subplot(3,length(TITLE),i+length(TITLE))
            
            every10ang_Max(1,:)=nanmean(reshape(finalSummary.(pair{p})(b).ang_Max, 10,length(finalSummary.(pair{p})(b).ang_Max(:,1))/10));
            
            plot([-100 -100],[100 100],'*m')
            hold on
            plot([-100 -100],[100 100],'ok', 'MarkerFaceColor','c','MarkerEdgeColor','k')
            plot(finalSummary.(pair{p})(b).ang_Max(:,1),'*m')
            plot(10:10:length(finalSummary.(pair{p})(b).ang_Max(:,1)), every10ang_Max(1,:),'ok', 'MarkerFaceColor','c','MarkerEdgeColor','k')
            plot([0 finalSummary.(pair{p})(b).num_trial], [atand(0.02), atand(0.02)], '--k')
            
            MEAN(1)=nanmean(finalSummary.(pair{p})(b).ang_Max(:,1));
            tilt=sum(finalSummary.(pair{p})(b).tilt);
            goodgood=sum((finalSummary.(pair{p})(b).tilt+finalSummary.(pair{p})(b).duration(:,1)++finalSummary.(pair{p})(b).duration(:,2))==3);
            
            text(finalSummary.(pair{p})(b).num_trial/4, 4.5, ['MEAN= ' sprintf('%.2f', MEAN(1))])
            text(finalSummary.(pair{p})(b).num_trial/4, 4, ['GoodTilt= ' sprintf('%d', tilt)])
            text(finalSummary.(pair{p})(b).num_trial/4, 3.5, ['GoodGood= ' sprintf('%d', goodgood)])


            
            title([TITLE{i} ' Max absolute angle ' pair{p}(1) pair{p}(3)])
            ylim([0 5])
            xlim([0 finalSummary.(pair{p})(b).num_trial])
            xlabel('trial')
            ylabel('angle (deg)')
            
            if i==1
                legend('max angle','max angle, 10 trials',[-20 140 100 100])
            end
            
            subplot(3,length(TITLE),i+length(TITLE)*2)
            
            every10ang_mean(1,:)=nanmean(reshape(finalSummary.(pair{p})(b).ang_mean, 10,length(finalSummary.(pair{p})(b).ang_mean(:,1))/10));
            
            plot([-100 -100],[100 100],'*m')
            hold on
            plot([-100 -100],[100 100],'ok', 'MarkerFaceColor','c','MarkerEdgeColor','k')
            plot(finalSummary.(pair{p})(b).ang_mean(:,1),'*m')
            plot(10:10:length(finalSummary.(pair{p})(b).ang_mean(:,1)), every10ang_mean(1,:),'ok', 'MarkerFaceColor','c','MarkerEdgeColor','k')
            
            MEAN(1)=nanmean(finalSummary.(pair{p})(b).ang_mean(:,1));
            text(finalSummary.(pair{p})(b).num_trial/4, 4.5, ['MEAN= ' sprintf('%.2f', MEAN(1))])
            plot([0 finalSummary.(pair{p})(b).num_trial], [atand(0.02), atand(0.02)], '--k')

            
            title([TITLE{i} ' Mean absolute angle ' pair{p}(1) pair{p}(3)])
            ylim([0 5])
            xlim([0 finalSummary.(pair{p})(b).num_trial])
            xlabel('trial')
            ylabel('angle (deg)')
            
            if i==1
                legend('mean angle','mean angle, 10 trials',[-20 50 100 100])
            end
        end
    end
end

%% feedback
b=zeros(1,length(TITLE));
for p=1:length(pair)
    figure
    ii=1;
    for i=1:length(TITLE)
        for n=1:length(finalSummary.(pair{p}))
            b(n)=strcmp(finalSummary.(pair{p})(n).condition, TITLE{i});
        end
        b=find(b);
        if length(b)>1
            b=b(ii);
            ii=ii+1;
        end
        
        every10fb_Max=[];
        every10fb_Min=[];
        every10absfb_mean=[];
        if ~isempty(b)
            
            subplot(3,length(TITLE),i)
            
            every10fb_Max(1,:)=nanmean(reshape(finalSummary.(pair{p})(b).fb_Max(:,1), 10,length(finalSummary.(pair{p})(b).fb_Max(:,1))/10));
            every10fb_Max(2,:)=nanmean(reshape(finalSummary.(pair{p})(b).fb_Max(:,2), 10,length(finalSummary.(pair{p})(b).fb_Max(:,2))/10));
            
            plot([-100 -100],[100 100],'*b')
            hold on
            plot([-100 -100],[100 100],'*r')
            plot([-100 -100],[100 100],'ok', 'MarkerFaceColor','g','MarkerEdgeColor','k')
            plot([-100 -100],[100 100],'ok', 'MarkerFaceColor','y','MarkerEdgeColor','k')
            plot(finalSummary.(pair{p})(b).fb_Max(:,1),'*b')
            plot(finalSummary.(pair{p})(b).fb_Max(:,2),'*r')
            plot(10:10:length(finalSummary.(pair{p})(b).fb_Max(:,1)), every10fb_Max(1,:),'ok', 'MarkerFaceColor','g','MarkerEdgeColor','k')
            plot(10:10:length(finalSummary.(pair{p})(b).fb_Max(:,2)), every10fb_Max(2,:),'ok', 'MarkerFaceColor','y','MarkerEdgeColor','k')
            
            MEAN(1)=nanmean(finalSummary.(pair{p})(b).fb_Max(:,1));
            MEAN(2)=nanmean(finalSummary.(pair{p})(b).fb_Max(:,2));
            text(finalSummary.(pair{p})(b).num_trial/4, -6, ['Sub1 MEAN= ' sprintf('%.2f', MEAN(1))])
            text(finalSummary.(pair{p})(b).num_trial/4, -7, ['Sub2 MEAN= ' sprintf('%.2f', MEAN(2))])
            
            title([TITLE{i} ' Max feedback ' pair{p}(1) pair{p}(3)])
            ylim([-8  8])
            xlim([0 finalSummary.(pair{p})(b).num_trial])
            xlabel('trial')
            ylabel('force (N)')
            
            if i==1
                legend('sub1', 'sub2', 'sub1, 10trials','sub2, 10trials',[-15 230 100 100])
            end
            
            subplot(3,length(TITLE),i+length(TITLE))
            
            every10fb_Min(1,:)=nanmean(reshape(finalSummary.(pair{p})(b).fb_Min(:,1), 10,length(finalSummary.(pair{p})(b).fb_Min(:,1))/10));
            every10fb_Min(2,:)=nanmean(reshape(finalSummary.(pair{p})(b).fb_Min(:,2), 10,length(finalSummary.(pair{p})(b).fb_Min(:,2))/10));
            
            plot([-100 -100],[100 100],'*b')
            hold on
            plot([-100 -100],[100 100],'*r')
            plot([-100 -100],[100 100],'ok', 'MarkerFaceColor','g','MarkerEdgeColor','k')
            plot([-100 -100],[100 100],'ok', 'MarkerFaceColor','y','MarkerEdgeColor','k')
            plot(finalSummary.(pair{p})(b).fb_Min(:,1),'*b')
            plot(finalSummary.(pair{p})(b).fb_Min(:,2),'*r')
            plot(10:10:length(finalSummary.(pair{p})(b).fb_Min(:,1)), every10fb_Min(1,:),'ok', 'MarkerFaceColor','g','MarkerEdgeColor','k')
            plot(10:10:length(finalSummary.(pair{p})(b).fb_Min(:,2)), every10fb_Min(2,:),'ok', 'MarkerFaceColor','y','MarkerEdgeColor','k')
            
            MEAN(1)=nanmean(finalSummary.(pair{p})(b).fb_Min(:,1));
            MEAN(2)=nanmean(finalSummary.(pair{p})(b).fb_Min(:,2));
            text(finalSummary.(pair{p})(b).num_trial/4, -6, ['Sub1 MEAN= ' sprintf('%.2f', MEAN(1))])
            text(finalSummary.(pair{p})(b).num_trial/4, -7, ['Sub2 MEAN= ' sprintf('%.2f', MEAN(2))])
            
            title([TITLE{i} ' Min feedback ' pair{p}(1) pair{p}(3)])
            ylim([-8  8])
            xlim([0 finalSummary.(pair{p})(b).num_trial])
            xlabel('trial')
            ylabel('force (N)')
            
            subplot(3,length(TITLE),i+length(TITLE)*2)
            
            every10absfb_mean(1,:)=nanmean(reshape(finalSummary.(pair{p})(b).absfb_mean(:,1), 10,length(finalSummary.(pair{p})(b).absfb_mean(:,1))/10));
            every10absfb_mean(2,:)=nanmean(reshape(finalSummary.(pair{p})(b).absfb_mean(:,2), 10,length(finalSummary.(pair{p})(b).absfb_mean(:,2))/10));
            
            plot([-100 -100],[100 100],'*b')
            hold on
            plot([-100 -100],[100 100],'*r')
            plot([-100 -100],[100 100],'ok', 'MarkerFaceColor','g','MarkerEdgeColor','k')
            plot([-100 -100],[100 100],'ok', 'MarkerFaceColor','y','MarkerEdgeColor','k')
            plot(finalSummary.(pair{p})(b).absfb_mean(:,1),'*b')
            plot(finalSummary.(pair{p})(b).absfb_mean(:,2),'*r')
            plot(10:10:length(finalSummary.(pair{p})(b).absfb_mean(:,1)), every10absfb_mean(1,:),'ok', 'MarkerFaceColor','g','MarkerEdgeColor','k')
            plot(10:10:length(finalSummary.(pair{p})(b).absfb_mean(:,2)), every10absfb_mean(2,:),'ok', 'MarkerFaceColor','y','MarkerEdgeColor','k')
            
            MEAN(1)=nanmean(finalSummary.(pair{p})(b).absfb_mean(:,1));
            MEAN(2)=nanmean(finalSummary.(pair{p})(b).absfb_mean(:,2));
            text(finalSummary.(pair{p})(b).num_trial/4, -6, ['Sub1 MEAN= ' sprintf('%.2f', MEAN(1))])
            text(finalSummary.(pair{p})(b).num_trial/4, -7, ['Sub2 MEAN= ' sprintf('%.2f', MEAN(2))])
            
            title([TITLE{i} ' Absolute mean ' pair{p}(1) pair{p}(3)])
            ylim([-8  8])
            xlim([0 finalSummary.(pair{p})(b).num_trial])
            xlabel('trial')
            ylabel('force (N)')
            
            
        end
    end
end



%% Correlation

b=zeros(1,length(TITLE));
corr_mean=zeros(4,length(TITLE));
SEM=zeros(4,length(TITLE));
subp_title={'Tilt=Good, MT=Good', 'Tilt=Good, MT=Short/Long','Tilt=Out, MT=Good','Tilt=Out, MT=Short/Long'};
for p=1:length(pair)
    ii=1;
    figure
    for i=1:length(TITLE)
        for n=1:length(finalSummary.(pair{p}))
            b(n)=strcmp(finalSummary.(pair{p})(n).condition, TITLE{i});
        end
        b=find(b);
        if length(b)>1
            b=b(ii);
            ii=ii+1;
        end
        
        index_goodgood=(finalSummary.(pair{p})(b).duration(:,2) & finalSummary.(pair{p})(b).duration(:,1) & finalSummary.(pair{p})(b).tilt);
        index_tiltgood=(finalSummary.(pair{p})(b).duration(:,2) | ~finalSummary.(pair{p})(b).duration(:,1) & ~finalSummary.(pair{p})(b).tilt);
        index_MTgood=(~finalSummary.(pair{p})(b).duration(:,2) & finalSummary.(pair{p})(b).duration(:,1) & finalSummary.(pair{p})(b).tilt);
        index_badbad=(~finalSummary.(pair{p})(b).duration(:,2) | ~finalSummary.(pair{p})(b).duration(:,1) & ~finalSummary.(pair{p})(b).tilt);
        
        corr_mean(1,i)=nanmean(finalSummary.(pair{p})(b).fse_corr(index_goodgood));
        corr_mean(2,i)=nanmean(finalSummary.(pair{p})(b).fse_corr(index_tiltgood));
        corr_mean(3,i)=nanmean(finalSummary.(pair{p})(b).fse_corr(index_MTgood));
        corr_mean(4,i)=nanmean(finalSummary.(pair{p})(b).fse_corr(index_badbad));
        
        SEM(1,i)=nanstd(finalSummary.(pair{p})(b).fse_corr(index_goodgood))/sqrt(sum(~isnan(finalSummary.(pair{p})(b).fse_corr(index_goodgood))));
        SEM(2,i)=nanstd(finalSummary.(pair{p})(b).fse_corr(index_tiltgood))/sqrt(sum(~isnan(finalSummary.(pair{p})(b).fse_corr(index_tiltgood))));
        SEM(3,i)=nanstd(finalSummary.(pair{p})(b).fse_corr(index_MTgood))/sqrt(sum(~isnan(finalSummary.(pair{p})(b).fse_corr(index_MTgood))));
        SEM(4,i)=nanstd(finalSummary.(pair{p})(b).fse_corr(index_badbad))/sqrt(sum(~isnan(finalSummary.(pair{p})(b).fse_corr(index_badbad))));
        
    end
    
    for j=1:4
        subplot(2,2,j)
        bar(corr_mean(j,:));
        hold all
        errorbar(1:length(TITLE),corr_mean(j,:),SEM(j,:),'.k', 'LineWidth',2);
        set(gca,'XTickLabel',TITLE)
        ylabel('Correlation')
        xlabel('Condition')
        title([pair{p}(1), pair{p}(3), ', ' subp_title{j}])
        ylim([-0.5 1])
    end
end



if 0
%% angle time out
b=zeros(1,length(TITLE));
    figure
for p=1:length(pair)

    ii=1;
    for i=1:length(TITLE)
        for n=1:length(finalSummary.(pair{p}))
            b(n)=strcmp(finalSummary.(pair{p})(n).condition, TITLE{i});
        end
        b=find(b);
        b=b(1);
        
        every10MT=[];
        every10time_angleOUT=[];
        if ~isempty(b)
            
           subplot(length(pair),length(TITLE),i+length(TITLE)*(p-1))
            
           every10MT(1,:)=nanmean(abs(reshape(finalSummary.(pair{p})(b).MT(:,1), 10,length(finalSummary.(pair{p})(b).MT(:,1))/10)));
           every10MT(2,:)=nanmean(abs(reshape(finalSummary.(pair{p})(b).MT(:,2), 10,length(finalSummary.(pair{p})(b).MT(:,2))/10)));
           every10MT(3,:)=(every10MT(1,:)+every10MT(2,:))/2;
            
           every10time_angleOUT(1,:)=nanmean(reshape(finalSummary.(pair{p})(b).time_angleOUT, 10,length(finalSummary.(pair{p})(b).time_angleOUT(:,1))/10))./every10MT(3,:);

            
            plot([-100 -100],[100 100],'*m')
            hold on
            plot([-100 -100],[100 100],'ok', 'MarkerFaceColor','c','MarkerEdgeColor','k')
            plot(finalSummary.(pair{p})(b).time_angleOUT(:,1)./((finalSummary.(pair{p})(b).MT(:,1)+finalSummary.(pair{p})(b).MT(:,1))/2),'*m')

            plot(10:10:length(finalSummary.(pair{p})(b).time_angleOUT(:,1)), every10time_angleOUT(1,:),'-ok', 'MarkerFaceColor','c','MarkerEdgeColor','k')
            
            MEAN(1)=nanmean(finalSummary.(pair{p})(b).time_angleOUT(:,1)./((finalSummary.(pair{p})(b).MT(:,1)+finalSummary.(pair{p})(b).MT(:,1))/2));
            text(finalSummary.(pair{p})(b).num_trial/4, 0.9, ['MEAN= ' sprintf('%.2f', MEAN(1))])
            
            title([TITLE{i} ' time angle OUT ' pair{p}(1) pair{p}(3)])
            ylim([0 1])
            xlim([0 finalSummary.(pair{p})(b).num_trial])
            xlabel('trial')
            ylabel('time/MT')
            
            if i==1
                legend('time','time, 10 trials',[-20 140 100 100])
            end

        end
    end
end
end