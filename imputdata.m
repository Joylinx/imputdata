% location of data, use DOUBLE quotes
folder1=["C:\Users\Lingxiao Zhou\Desktop\Done2"];
% order to plot
order=[2 1];
% x, y, z data is read from xAxis, yAxis, zAxis col
xAxis=1;
yAxis=2;
zAxis=3;
% x, y, z data is scaled by xRate, yRate, zRate
xRate=1;
yRate=1;
zRate=1;
% set x y range
xRange=[-30 30];
yRange=[-1e6 1e6];
% save gcf or not
isSave=0;
% use CM colorbar
CM=1;
redirc=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fileNum=length(folder1);
% XD=cell(1,fileNum);
% YD=cell(1,fileNum);
ZD=cell(1,fileNum);
Minx=zeros(1,fileNum);
Maxx=zeros(1,fileNum);
Miny=zeros(1,fileNum);
Maxy=zeros(1,fileNum);
Stpx=zeros(1,fileNum);
Stpy=zeros(1,fileNum);
% minx=inf;maxx=-inf;msx=inf;
% miny=inf;maxy=-inf;msy=inf;
minz=inf;
if length(order)~=fileNum
   order=1:fileNum; 
end
for fld=1:fileNum
% pp: new data or not
pp=0;
if exist('folder','var')
    if strcmpi(folder,folder1)
        pp=1;
    end
end
folder=folder1{order(fld)};
% N: how many '.dat' file
% M: how many rows in a file
Dir=dir(folder);
len=length(Dir);
N=0;
for ii=1:len
   fname=Dir(ii).name;
   if length(fname)>6
      if strcmpi(fname(end-3:end),'.dat')
          N=N+1;
      end
   end
end
% size of data
fid=fopen([folder '\1-1.dat'],'r');
zin=fscanf(fid,'%f',[4,inf])';
fclose(fid);
ydata=zin(:,yAxis);
M=length(ydata);
zData=zeros(M,N);
xdata=zeros(1,N);
% input
for ii=1:N
    fid=fopen([folder '\' num2str(ii) '-1.dat'],'r');
    zin=fscanf(fid,'%f',[4,inf])';
    xdata(ii)=zin(xAxis,1);
    zData(:,ii)=zin(:,zAxis);
    fclose(fid);
end
[xData,yData]=meshgrid(xdata,ydata);
xData=xData/xRate;
yData=yData/yRate;
zData=zData/zRate;
end
