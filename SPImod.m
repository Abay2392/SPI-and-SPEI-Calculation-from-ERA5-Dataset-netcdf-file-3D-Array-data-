%%
% Programmed by Taesam Lee,  Dec.03,2009
% INRS-ETE, Quebec, Canada
function [Z, parm]=SPImod(Data, scale, nseas, maxspikext, parm)
%Standardized Precipitation Index
% Input Data
% Data : Monthly Data vector not matrix (monthly or seasonal precipitation)
% scale : 1,3,12,48
% nseas : number of season (monthly=12)
% Example
% Z=SPI(gamrnd(1,1,1000,1),3,12); 3-monthly scale,
% Notice that  the rest of the months of the fist year are removed.
% eg. if scale =3, fist year data 3-12 SPI values are not estimated.

%if row vector then make coloumn vector
%if (sz==1) Data(:,1)=Data;end
erase_yr=ceil(scale/12)-1;

% Data setting to scaled dataset
    if nargin<5
        parm=nan(12,2);
    end
A1=[];
for is=1:scale, A1=[A1,Data(is:length(Data)-scale+is)];end
XS=sum(A1,2);


if(scale>0), XS(1:nseas*erase_yr-scale+1)=NaN;   end % modificato con scale>0 anziché scale>1



for is=1:nseas
    tind=is:nseas:length(XS);
    Xn=XS(tind);
    [zeroa]=find(Xn==0);
    Xn_nozero=Xn;Xn_nozero(zeroa)=[];
    q=length(zeroa)/length(Xn); 
%    pause
    if nargin<5
        parm(is, :)=gamfit(Xn_nozero);
    end
    Gam_xs=q+(1-q)*gamcdf(Xn,parm(is,1),parm(is,2)); %Gamma parameter estimation and tranform
    Z(tind)=norminv(Gam_xs);
end

% Z = [nan(numel(1:nseas*erase_yr+scale-1),1) ; Z'];

% Z = [nan(numel(1:nseas*erase_yr+scale-1),1) ; Z'];

Z = [nan(numel(Data)-numel(Z),1); Z']; 
Z(1:maxspikext) = [];
