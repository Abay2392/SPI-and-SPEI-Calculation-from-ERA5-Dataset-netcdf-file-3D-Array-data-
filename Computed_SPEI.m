load TP_monthly_sicily_1950+2023.mat
load monthly_PET_Sicily_50_23.mat
prec=monthly_precipitation;
pevap=monthly_PET;
% Define start and end years
start_year = 1950;
end_year = 2023;

% Initialize arrays to store serial date numbers and date strings
serial_dates = [];
date_strings = {};

% Loop through each year and month
for year = start_year:end_year
    for month = 1:12  % Iterate over each month (1 = January, ..., 12 = December)
        % Create date vector for the 1st day of each month
        date_vector = [year, month, 1];
        
        % Convert date vector to serial date number
        serial_date = datenum(date_vector);
        
        % Store serial date number and date string
        serial_dates = [serial_dates, serial_date];
        date_strings{end+1} = datestr(serial_date);  % Store date string
    end
end
t=serial_dates;
Z1 = nan(size(prec));
Z3 = nan(size(prec));
Z6 = nan(size(prec));
Z12 = nan(size(prec));
Z24 = nan(size(prec));
for i = 1:size(prec,1)
    for j = 1:size(prec,2)
        prec1 = squeeze((prec(i,j,:))); 
        pevap1 = squeeze((pevap(i,j,:))); 
        Z1(i,j,:)= spei(t,prec1,pevap1,1);
        Z3(i,j,:)= spei(t,prec1,pevap1,3);
        Z6(i,j,:)= spei(t,prec1,pevap1,6);
        Z12(i,j,:)= spei(t,prec1,pevap1,12);
        Z24(i,j,:)= spei(t,prec1,pevap1,24);
    end
end
