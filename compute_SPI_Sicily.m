% load the precipitation data
load TP_monthly_sicily_1950+2023.mat
DATA=monthly_precipitation;
Z1 = nan(size(DATA));
Z3 = nan(size(DATA));
Z6 = nan(size(DATA));
Z12 = nan(size(DATA));
Z24 = nan(size(DATA));
for i = 1:size(DATA,1)
    for j = 1:size(DATA,2)
        xx = squeeze((DATA(i,j,:))); 
        Z1(i,j,:)= SPImod(xx,1,12,0);
        Z3(i,j,:)= SPImod(xx,3,12,0);
        Z6(i,j,:)= SPImod(xx,6,12,0);
        Z12(i,j,:)= SPImod(xx,12,12,0);
        Z24(i,j,:)= SPImod(xx,24,12,0);
    end
end

% time
% startDate = datetime(1950, 1, 1);  % January 1, 1950
% endDate = datetime(2023, 12, 31);  % December 31, 2023

% Generate a sequence of months between startDate and endDate
% months = startDate:calmonths(1):endDate;
% figure;

% % Plot precipitation on the left y-axis
% yyaxis left;
% plot(months, squeeze(Z24(28,10,:)), '-b', 'LineWidth', 1.5);
% ylabel('SPI 24');
% xlabel('Time');
% title('SPI 24');
% 
% % Plot evaporation on the right y-axis
% yyaxis right;
% plot(months, squeeze(DATA(28,10,:)), '-r', 'LineWidth', 1.5);
% ylabel('Precipitation (mm)');
% % autocorrealtion chacking
SPI1mean=mean(Z1, 3);
SPI3mean=mean(Z3, 3);
SPI6mean=mean(Z6, 3);
SPI12mean=mean(Z12, 3);
SPI24mean=mean(Z24, 3);

daymap = 883
minlat = 36.2
maxlat = 41
minlon = 12
maxlon = 17.6
format long g;
lon_map = ncread("EV_SIC_2023_12.nc", 'longitude');
lat_map = ncread("EV_SIC_2023_12.nc", 'latitude');

mycmapTAS = flipud ([ 255,255,204; 255,237,160; 254,217,118; 254,178,76; ...
    253,141,60; 252,78,42; 227,26,28; 189,0,38; 128,0,38]./255); 

s1 = shaperead("Italia_Regioni_GEO.shp");
[LATMAP, LONMAP] =meshgrid(double(lat_map), double(lon_map) );
figure()
hold on
axesm('MapProjection','mercator','MapLatLimit',[minlat maxlat], 'MapLonLimit', [minlon maxlon])
    gridm on
    h1 = surfm(LATMAP, LONMAP, Z3(:,:,daymap));
    plotm(s1(19).Y, s1(19).X, 'k', 'linewidth', 2)
title('SPI 3 on July 2023 in Sicily')
cmap = colormap('jet');
colormap(flipud(mycmapTAS));


% caxis([5 20]);
colorbar
