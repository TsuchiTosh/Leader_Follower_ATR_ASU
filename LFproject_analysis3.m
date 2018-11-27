%% analysis 3
% summary plots
clear
%% load
load('summaryData10222018.mat');
temp1=load('summaryData10242018.mat');
temp2=load('summaryData10252018.mat');

pair={'SN_JK', 'MN_SF','YK_YH'};
for i=1:3
    finalSummary.(pair{i})=temp1.finalSummary.(pair{i});
end
pair={'MH_TH', 'CT_HH','AN_JT'};
for i=1:3
    finalSummary.(pair{i})=temp2.finalSummary.(pair{i});
end

%% plot
TITLE={'U800','U400', 'S200', 'S100'};
pair={'SK_SS', 'KS_AN', 'SN_JK', 'MN_SF','YK_YH', 'YI_TS','MH_TH', 'CT_HH','AN_JT'};
US={'SK_SS', 'KS_AN', 'SN_JK', 'MN_SF', 'YK_YH'};
SU={'YI_TS', 'MH_TH','CT_HH', 'AN_JT' };
time(:,1)=(1:20000)*1/2000-1/2000;
%% all subjects
%c=rand(length(pair),3);
c=[0.0477872923850662,0.0692789725680013,0.733742133263281;
    0.0539776591702386,0.136007388620090,0.650530624454913;
    0.0206180341199909,0.788891319657009,0.516270565774129;
    0.681478514196212,0.0923984579238296,0.326388135088882;
    0.598628526633235,0.237868792007306,0.661776196778501;
    0.114030034515656,0.243647912616785,0.117565484621756;
    0.796245350725845,0.104822212658895,0.147817414181606;
    0.617850587139279,0.858352760228758,0.0197646637288170;
    0.0702135239869584,0.698199766179566,0.964291730299559];
b=zeros(1,length(TITLE));
figure
for i=1:length(TITLE)
    for p=1:length(pair)
        for n=1:length(finalSummary.(pair{p}))
            b(n)=strcmp(finalSummary.(pair{p})(n).condition, TITLE{i});
        end
        b=find(b);
        b=b(1);
        
        every10MT=[];
        every10ang_Max=[];
        every10ang_mean=[];
        if ~isempty(b)
            
            every10MT(1,:)=nanmean(abs(reshape(finalSummary.(pair{p})(b).MT(:,1), 10,length(finalSummary.(pair{p})(b).MT(:,1))/10)));
            every10MT(2,:)=nanmean(abs(reshape(finalSummary.(pair{p})(b).MT(:,2), 10,length(finalSummary.(pair{p})(b).MT(:,2))/10)));
            every10MT(3,:)=(every10MT(1,:)+every10MT(2,:))/2;
            if p<6
                subplot(2,length(TITLE),i)
                
                plot(10:10:length(finalSummary.(pair{p})(b).MT(:,1)), every10MT(3,:),'-o', 'Color',c(p,:), 'LineWidth',1.2,'MarkerFaceColor',c(p,:),'MarkerEdgeColor','k')
                hold on
                title({[TITLE{i} ' Movement time'], 'Unstable->Stable'}, 'FontSize',18)
                ylim([0 4])
                xlim([0 200])
                xlabel('trial', 'FontSize',18)
                ylabel('time (sec)', 'FontSize',18)
                
                if p==5
                    plot([0 200], [1.3 1.3], '--k')
                    plot([0 200], [1.7 1.7], '--k')
                end
                
                if i==1 && p==5
                    legend(US,[-20 230 100 100], 'FontSize',14,'Interpreter','none')
                end
                
            else
                subplot(2,length(TITLE),i+length(TITLE))
                
                plot(10:10:length(finalSummary.(pair{p})(b).MT(:,1)), every10MT(3,:),'-^', 'Color',c(p,:), 'LineWidth',1.2,'MarkerFaceColor',c(p,:),'MarkerEdgeColor','k')
                hold on
                title({[TITLE{i} ' Movement time'], 'Stable->Unstable'}, 'FontSize',18)
                ylim([0 4])
                xlim([0 200])
                xlabel('trial', 'FontSize',18)
                ylabel('time (sec)', 'FontSize',18)
                
                if p==length(pair)
                    plot([0 200], [1.3 1.3], '--k')
                    plot([0 200], [1.7 1.7], '--k')
                end
                
                if i==1 && p==length(pair)
                    legend(SU,[-20 90 100 100], 'FontSize',14,'Interpreter','none')
                end
            end
        end
    end
end
b=zeros(1,length(TITLE));
figure
for i=1:length(TITLE)
    for p=1:length(pair)
        for n=1:length(finalSummary.(pair{p}))
            b(n)=strcmp(finalSummary.(pair{p})(n).condition, TITLE{i});
        end
        b=find(b);
        b=b(1);
        
        every10MT=[];
        every10ang_Max=[];
        every10ang_mean=[];
        if ~isempty(b)
            
            
            every10ang_Max(1,:)=nanmean(reshape(finalSummary.(pair{p})(b).ang_Max, 10,length(finalSummary.(pair{p})(b).ang_Max(:,1))/10));
            if p<6
                
                subplot(2,length(TITLE),i)
                plot(10:10:length(finalSummary.(pair{p})(b).ang_Max(:,1)), every10ang_Max(1,:),'-o', 'Color',c(p,:), 'LineWidth',1.2,'MarkerFaceColor',c(p,:),'MarkerEdgeColor','k')
                hold on
                
                title({[TITLE{i} ' Max absolute angle'], 'Unstable->Stable'}, 'FontSize',18)
                ylim([0 5])
                xlim([0 200])
                xlabel('trial', 'FontSize',18)
                ylabel('angle (deg)', 'FontSize',18)
                
                if p==5
                    plot([0 200], [atand(0.02) atand(0.02)], '--k')
                end
                
                if i==1 && p==5
                    legend(US,[-20 230 100 100], 'FontSize',14,'Interpreter','none')
                end
            else
                subplot(2,length(TITLE),i+length(TITLE))
                plot(10:10:length(finalSummary.(pair{p})(b).ang_Max(:,1)), every10ang_Max(1,:),'-^', 'Color',c(p,:), 'LineWidth',1.2,'MarkerFaceColor',c(p,:),'MarkerEdgeColor','k')
                hold on
                
                title({[TITLE{i} ' Max absolute angle'], 'Stable->Unstable'}, 'FontSize',18)
                ylim([0 5])
                xlim([0 200])
                xlabel('trial', 'FontSize',18)
                ylabel('angle (deg)', 'FontSize',18)
                
                if p==length(pair)
                    plot([0 200], [atand(0.02) atand(0.02)], '--k')
                end
                
                if i==1 && p==length(pair)
                    legend(SU,[-20 90 100 100], 'FontSize',14,'Interpreter','none')
                end
            end
        end
    end
end

b=zeros(1,length(TITLE));
figure
for i=1:length(TITLE)
    for p=1:length(pair)
        for n=1:length(finalSummary.(pair{p}))
            b(n)=strcmp(finalSummary.(pair{p})(n).condition, TITLE{i});
        end
        b=find(b);
        b=b(1);
        
        every10MT=[];
        every10ang_Max=[];
        every10ang_mean=[];
        if ~isempty(b)
            
            every10ang_mean(1,:)=nanmean(reshape(finalSummary.(pair{p})(b).ang_mean, 10,length(finalSummary.(pair{p})(b).ang_mean(:,1))/10));
            if p<6
                
                subplot(2,length(TITLE),i)
                
                plot(10:10:length(finalSummary.(pair{p})(b).ang_mean(:,1)), every10ang_mean(1,:),'-o', 'Color',c(p,:), 'LineWidth',1.2, 'MarkerFaceColor',c(p,:),'MarkerEdgeColor','k')
                hold on
                
                title({[TITLE{i} ' Mean absolute angle'], 'Unstable->Stable'}, 'FontSize',18)
                ylim([0 2])
                xlim([0 200])
                xlabel('trial', 'FontSize',18)
                ylabel('angle (deg)', 'FontSize',18)
                if p==5
                    plot([0 200], [atand(0.02) atand(0.02)], '--k')
                end
                
                if i==1 && p==5
                    legend(US,[-20 230 100 100], 'FontSize',14,'Interpreter','none')
                end
            else
                subplot(2,length(TITLE),i+length(TITLE))
                
                plot(10:10:length(finalSummary.(pair{p})(b).ang_mean(:,1)), every10ang_mean(1,:),'-^', 'Color',c(p,:), 'LineWidth',1.2, 'MarkerFaceColor',c(p,:),'MarkerEdgeColor','k')
                hold on
                
                title({[TITLE{i} ' Mean absolute angle'],'Stable->Unstable'}, 'FontSize',18)
                ylim([0 2])
                xlim([0 200])
                xlabel('trial', 'FontSize',18)
                ylabel('angle (deg)', 'FontSize',18)
                
                if p==length(pair)
                    plot([0 200], [atand(0.02) atand(0.02)], '--k')
                end
                
                if i==1 && p==length(pair)
                    legend(SU,[-20 90 100 100], 'FontSize',14,'Interpreter','none')
                end
            end
            
        end
    end
end

%% U800 twice, S100 twice
pair={'SN_JK', 'MN_SF','YK_YH', 'MH_TH', 'CT_HH','AN_JT'};
TITLE={'U800', 'U800', 'U800', 'S100', 'S100', 'S100'};
ord={'Unstable->Stable','Unstable->Stable','Unstable->Stable','Stable->Unstable','Stable->Unstable','Stable->Unstable'};
name={'SN_JK', 'MN_SF','YK_YH', 'MH_TH', 'CT_HH','AN_JT'};


c=[1 0 0;
    0 0 1];
b=zeros(1,length(TITLE));
figure
for p=1:length(pair)
    ii=1;
    for n=1:length(finalSummary.(pair{p}))
        b(n)=strcmp(finalSummary.(pair{p})(n).condition, TITLE{p});
    end
    b=find(b);
    
    subplot(2,3,p)
    while ii<3
        every10MT=[];
        every10ang_Max=[];
        every10ang_mean=[];
        every10MT(1,:)=nanmean(abs(reshape(finalSummary.(pair{p})(b(ii)).MT(:,1), 10,length(finalSummary.(pair{p})(b(ii)).MT(:,1))/10)));
        every10MT(2,:)=nanmean(abs(reshape(finalSummary.(pair{p})(b(ii)).MT(:,2), 10,length(finalSummary.(pair{p})(b(ii)).MT(:,2))/10)));
        every10MT(3,:)=(every10MT(1,:)+every10MT(2,:))/2;
        
        
        plot(10:10:length(finalSummary.(pair{p})(b(ii)).MT(:,1)), every10MT(3,:),'-o', 'Color',c(ii,:), 'LineWidth',1.2,'MarkerFaceColor',c(ii,:),'MarkerEdgeColor','k')
        hold on
        
        ii=ii+1;
    end
    title({[TITLE{p} ' Movement time '  name{p}], ord{p}}, 'FontSize',18,'Interpreter','none')
    ylim([0 4])
    xlim([0 150])
    xlabel('trial', 'FontSize',18)
    ylabel('time (sec)', 'FontSize',18)
    
    if p==1
        legend('First block', 'Last block', [-20 230 100 100], 'FontSize',14,'Interpreter','none')
    end
    plot([0 200], [1.3 1.3], '--k')
    plot([0 200], [1.7 1.7], '--k')
end

b=zeros(1,length(TITLE));
figure
for p=1:length(pair)
    ii=1;
    for n=1:length(finalSummary.(pair{p}))
        b(n)=strcmp(finalSummary.(pair{p})(n).condition, TITLE{p});
    end
    b=find(b);
    
    subplot(2,3,p)
    while ii<3
        every10MT=[];
        every10ang_Max=[];
        every10ang_mean=[];
        every10ang_Max(1,:)=nanmean(reshape(finalSummary.(pair{p})(b(ii)).ang_Max, 10,length(finalSummary.(pair{p})(b(ii)).ang_Max(:,1))/10));
        
        plot(10:10:length(finalSummary.(pair{p})(b(ii)).ang_Max(:,1)), every10ang_Max(1,:),'-o', 'Color',c(ii,:), 'LineWidth',1.2,'MarkerFaceColor',c(ii,:),'MarkerEdgeColor','k')
        hold on
        
        ii=ii+1;
    end
    title({[TITLE{p} ' Max absolute angle ' name{p}], ord{p} }, 'FontSize',18,'Interpreter','none')
    ylim([0 5])
    xlim([0 150])
    xlabel('trial', 'FontSize',18)
    ylabel('angle (deg)', 'FontSize',18)
    
    
    if p==1
        legend('First block', 'Last block', [-20 230 100 100], 'FontSize',14,'Interpreter','none')
    end
    plot([0 200], [atand(0.02) atand(0.02)], '--k')
    
end

b=zeros(1,length(TITLE));
figure
for p=1:length(pair)
    ii=1;
    for n=1:length(finalSummary.(pair{p}))
        b(n)=strcmp(finalSummary.(pair{p})(n).condition, TITLE{p});
    end
    b=find(b);
    
    subplot(2,3,p)
    while ii<3
        every10MT=[];
        every10ang_Max=[];
        every10ang_mean=[];
        every10ang_mean(1,:)=nanmean(reshape(finalSummary.(pair{p})(b(ii)).ang_mean, 10,length(finalSummary.(pair{p})(b(ii)).ang_mean(:,1))/10));
        
        plot(10:10:length(finalSummary.(pair{p})(b(ii)).ang_mean(:,1)), every10ang_mean(1,:),'-o', 'Color',c(ii,:), 'LineWidth',1.2, 'MarkerFaceColor',c(ii,:),'MarkerEdgeColor','k')
        hold on
        ii=ii+1;
    end
    
    title({[TITLE{p} ' Mean absolute angle ' name{p}], ord{p}}, 'FontSize',18,'Interpreter','none')
    ylim([0 2])
    xlim([0 150])
    xlabel('trial', 'FontSize',18)
    ylabel('angle (deg)', 'FontSize',18)
    
    
    if p==1
        legend('First block', 'Last block', [-20 230 100 100], 'FontSize',14,'Interpreter','none')
    end
    plot([0 200], [atand(0.02) atand(0.02)], '--k')
    
end

%%
TITLE={'U800','U400', 'S200', 'S100'};
b=zeros(1,length(TITLE));
corr_mean=zeros(4,length(TITLE));
SEM=zeros(4,length(TITLE));
subp_title={'Tilt=Good, MT=Good', 'Tilt=Good, MT=Short/Long','Tilt=Out, MT=Good','Tilt=Out, MT=Short/Long'};
figure
for p=1:length(pair)
    for i=1:length(TITLE)
        for n=1:length(finalSummary.(pair{p}))
            b(n)=strcmp(finalSummary.(pair{p})(n).condition, TITLE{i});
        end
        b=find(b);
        b=b(1);
        
        index_goodgood=(finalSummary.(pair{p})(b).duration(:,2) & finalSummary.(pair{p})(b).duration(:,1) & finalSummary.(pair{p})(b).tilt);
        index_tiltgood=(finalSummary.(pair{p})(b).duration(:,2) | ~finalSummary.(pair{p})(b).duration(:,1) & ~finalSummary.(pair{p})(b).tilt);
        index_MTgood=(~finalSummary.(pair{p})(b).duration(:,2) & finalSummary.(pair{p})(b).duration(:,1) & finalSummary.(pair{p})(b).tilt);
        index_badbad=(~finalSummary.(pair{p})(b).duration(:,2) | ~finalSummary.(pair{p})(b).duration(:,1) & ~finalSummary.(pair{p})(b).tilt);
        
        corr_mean(1,i,p)=nanmean(finalSummary.(pair{p})(b).fse_corr(index_goodgood));
        corr_mean(2,i,p)=nanmean(finalSummary.(pair{p})(b).fse_corr(index_tiltgood));
        corr_mean(3,i,p)=nanmean(finalSummary.(pair{p})(b).fse_corr(index_MTgood));
        corr_mean(4,i,p)=nanmean(finalSummary.(pair{p})(b).fse_corr(index_badbad));

    end
end
    

corr_mean_mean=nanmean(corr_mean,3);
SEM=nanstd(corr_mean,0,3)/sqrt(length(pair));
for j=1:4
    subplot(2,2,j)
    bar(corr_mean_mean(j,:), 'FaceColor',[rand rand rand]);
    hold all
    errorbar(1:length(TITLE),corr_mean_mean(j,:),SEM(j,:),'.k', 'LineWidth',2);
    set(gca,'XTickLabel',TITLE, 'FontSize',18)
    ylabel('Correlation', 'FontSize',18)
    xlabel('Condition', 'FontSize',18)
    title([subp_title{j}], 'FontSize',18)
    ylim([-0.5 1])
end

        

