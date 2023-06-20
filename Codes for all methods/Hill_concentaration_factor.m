clear all
close all
% Karan kumar tiwari
% 22101028
Vf=0.6;
Vm=1-Vf;


f_E1=74;
f_E2=74;
f_G12=30.8;
f_mu12=0.2;
f_G23=30.8;
f_E3=f_E2;
f_G13=f_G12;
f_mu13=f_mu12;
f_mu23=-1+0.5*f_E2/f_G23;
f_mu21=f_mu12*f_E2/f_E1;
f_mu31=f_mu13*f_E3/f_E1;
f_mu32=f_mu23;
f_alp1=-0.5*10^-6;
f_alp2=15*10^-6;
f_alp3=f_alp2;
F_S=zeros(6,6);
F_S(1,:)=[1/f_E1,-f_mu21/f_E2,-f_mu31/f_E3,0,0,0];
F_S(2,:)=[-f_mu12/f_E1,1/f_E2,-f_mu32/f_E3,0,0,0];
F_S(3,:)=[-f_mu13/f_E1,-f_mu23/f_E2,1/f_E3,0,0,0];
F_S(4,:)=[0,0,0,1/f_G23,0,0];
F_S(5,:)=[0,0,0,0,1/f_G13,0];
F_S(6,:)=[0,0,0,0,0,1/f_G12];
F_C=inv(F_S);
%% Matrix
% Modulus, Em (GPa) 
% Poisson’s ratio, vm 
% Thermal coefficient, am (10^?6/°C)
% For isotropic Material 
% E1=E2=E3=Em, v12=v21=v13=v31=v23=v32=vm, G23=G13=G12=0.5*E/(1+vm)
%a1=a2=a3=am
m_E=3.35;
m_mu=0.35;
m_G=0.5*m_E/(1+m_mu);
m_alp=58*10^-6;
m_E1=m_E;
m_E2=m_E;
m_E3=m_E;
m_mu12=m_mu;
m_mu13=m_mu;
m_mu23=m_mu;
m_mu21=m_mu;
m_mu31=m_mu;
m_mu32=m_mu;
m_G23=0.5*m_E/(1+m_mu);
m_G13=0.5*m_E/(1+m_mu);
m_G12=0.5*m_E/(1+m_mu);
m_alp1=m_alp;
m_alp2=m_alp;
m_alp3=m_alp;
M_S=zeros(6,6);
M_S(1,:)=[1/m_E1,-m_mu21/m_E2,-m_mu31/m_E3,0,0,0];
M_S(2,:)=[-m_mu12/m_E1,1/m_E2,-m_mu32/m_E3,0,0,0];
M_S(3,:)=[-m_mu13/m_E1,-m_mu23/m_E2,1/m_E3,0,0,0];
M_S(4,:)=[0,0,0,1/m_G23,0,0];
M_S(5,:)=[0,0,0,0,1/m_G13,0];
M_S(6,:)=[0,0,0,0,0,1/m_G12];
M_C=inv(M_S);

%% Loading fiber Data
% ele no,vol,Sx,Sy,Sz,Sxy,Syz,Sxz
DataFFxx=load('Sigma_XX_fiber.rpt');
DataFFyy=load('Sigma_YY_fiber.rpt');
DataFFzz=load('Sigma_ZZ_fiber.rpt');
DataFTxy=load('Tau_XY_fiber.rpt');
DataFTyz=load('Tau_YZ_fiber.rpt');
DataFTxz=load('Tau_XZ_fiber.rpt');
FV=load('elv_fiber.rpt');
fibrevolume=sum(FV(:,2));% mm^3
fibreEle=length(DataFFxx(:,1));

%% Loading Matrix Data
% ele no,vol,Sx,Sy,Sz,Sxy,Syz,Sxz
DataMFxx=load('Sigma_XX_matrix.rpt');
DataMFyy=load('Sigma_YY_matrix.rpt');
DataMFzz=load('Sigma_ZZ_matrix.rpt');
DataMTxy=load('Tau_XY_matrix.rpt');
DataMTyz=load('Tau_YZ_matrix.rpt');
DataMTxz=load('Tau_XZ_matrix.rpt');
MV=load('elv_matrix.rpt');% mm^3
matrixvolume=sum(MV(:,2));
matrixEle=length(DataMFxx(:,1));
%%
RVEvolume=matrixvolume+fibrevolume;
TotEle=fibreEle+matrixEle;
Sxxbar=(DataFFxx(:,3)'*FV(:,2)+DataMFxx(:,3)'*MV(:,2))/RVEvolume;
Syybar=(DataFFyy(:,4)'*FV(:,2)+DataMFyy(:,4)'*MV(:,2))/RVEvolume;
Szzbar=(DataFFzz(:,5)'*FV(:,2)+DataMFzz(:,5)'*MV(:,2))/RVEvolume;
Sxybar=(DataFTxy(:,6)'*FV(:,2)+DataMTxy(:,6)'*MV(:,2))/RVEvolume;
Sxzbar=(DataFTxz(:,7)'*FV(:,2)+DataMTxz(:,7)'*MV(:,2))/RVEvolume;
Syzbar=(DataFTyz(:,8)'*FV(:,2)+DataMTyz(:,8)'*MV(:,2))/RVEvolume;
 
%% Element stress concentration matrix
BFele=zeros(6,6,fibreEle);% of each element of fibre
BMele=zeros(6,6,matrixEle);% of each element of matrix
%Fibre
% 1st coloumn
for i=1:fibreEle
      BFele(1,1,i)=DataFFxx(i,3)/Sxxbar;
      BFele(2,1,i)=DataFFxx(i,4)/Sxxbar;
      BFele(3,1,i)=DataFFxx(i,5)/Sxxbar;
      BFele(4,1,i)=DataFFxx(i,8)/Sxxbar;
      BFele(5,1,i)=DataFFxx(i,7)/Sxxbar;
      BFele(6,1,i)=DataFFxx(i,6)/Sxxbar;

end
% 2nd coloumn
for i=1:fibreEle
      BFele(1,2,i)=DataFFyy(i,3)/Syybar;
      BFele(2,2,i)=DataFFyy(i,4)/Syybar;
      BFele(3,2,i)=DataFFyy(i,5)/Syybar;
      BFele(4,2,i)=DataFFyy(i,8)/Syybar;
      BFele(5,2,i)=DataFFyy(i,7)/Syybar;
      BFele(6,2,i)=DataFFyy(i,6)/Syybar;
end
% 3rd coloumn
for i=1:fibreEle
      BFele(1,3,i)=DataFFzz(i,3)/Szzbar;
      BFele(2,3,i)=DataFFzz(i,4)/Szzbar;
      BFele(3,3,i)=DataFFzz(i,5)/Szzbar;
      BFele(4,3,i)=DataFFzz(i,8)/Szzbar;
      BFele(5,3,i)=DataFFzz(i,7)/Szzbar;
      BFele(6,3,i)=DataFFzz(i,6)/Szzbar;
end
% 4th coloumn
for i=1:fibreEle
      BFele(1,4,i)=DataFTyz(i,3)/Syzbar;
      BFele(2,4,i)=DataFTyz(i,4)/Syzbar;
      BFele(3,4,i)=DataFTyz(i,5)/Syzbar;
      BFele(4,4,i)=DataFTyz(i,8)/Syzbar;
      BFele(5,4,i)=DataFTyz(i,7)/Syzbar;
      BFele(6,4,i)=DataFTyz(i,6)/Syzbar;
end
% 5th coloumn
for i=1:fibreEle
      BFele(1,5,i)=DataFTxz(i,3)/Sxzbar;
      BFele(2,5,i)=DataFTxz(i,4)/Sxzbar;
      BFele(3,5,i)=DataFTxz(i,5)/Sxzbar;
      BFele(4,5,i)=DataFTxz(i,8)/Sxzbar;
      BFele(5,5,i)=DataFTxz(i,7)/Sxzbar;
      BFele(6,5,i)=DataFTxz(i,6)/Sxzbar;
end
% 6th coloumn
for i=1:fibreEle
      BFele(1,6,i)=DataFTxy(i,3)/Sxybar;
      BFele(2,6,i)=DataFTxy(i,4)/Sxybar;
      BFele(3,6,i)=DataFTxy(i,5)/Sxybar;
      BFele(4,6,i)=DataFTxy(i,8)/Sxybar;
      BFele(5,6,i)=DataFTxy(i,7)/Sxybar;
      BFele(6,6,i)=DataFTxy(i,6)/Sxybar;
end
%Matrix
% 1st coloumn
for i=1:matrixEle
      BMele(1,1,i)=DataMFxx(i,3)/Sxxbar;
      BMele(2,1,i)=DataMFxx(i,4)/Sxxbar;
      BMele(3,1,i)=DataMFxx(i,5)/Sxxbar;
      BMele(4,1,i)=DataMFxx(i,8)/Sxxbar;
      BMele(5,1,i)=DataMFxx(i,7)/Sxxbar;
      BMele(6,1,i)=DataMFxx(i,6)/Sxxbar;
end
% 2nd coloumn
for i=1:matrixEle
      BMele(1,2,i)=DataMFyy(i,3)/Syybar;
      BMele(2,2,i)=DataMFyy(i,4)/Syybar;
      BMele(3,2,i)=DataMFyy(i,5)/Syybar;
      BMele(4,2,i)=DataMFyy(i,8)/Syybar;
      BMele(5,2,i)=DataMFyy(i,7)/Syybar;
      BMele(6,2,i)=DataMFyy(i,6)/Syybar;
end
% 3rd coloumn
for i=1:matrixEle
      BMele(1,3,i)=DataMFzz(i,3)/Szzbar;
      BMele(2,3,i)=DataMFzz(i,4)/Szzbar;
      BMele(3,3,i)=DataMFzz(i,5)/Szzbar;
      BMele(4,3,i)=DataMFzz(i,8)/Szzbar;
      BMele(5,3,i)=DataMFzz(i,7)/Szzbar;
      BMele(6,3,i)=DataMFzz(i,6)/Szzbar;
end
% 4th coloumn
for i=1:matrixEle
      BMele(1,4,i)=DataMTyz(i,3)/Syzbar;
      BMele(2,4,i)=DataMTyz(i,4)/Syzbar;
      BMele(3,4,i)=DataMTyz(i,5)/Syzbar;
      BMele(4,4,i)=DataMTyz(i,8)/Syzbar;
      BMele(5,4,i)=DataMTyz(i,7)/Syzbar;
      BMele(6,4,i)=DataMTyz(i,6)/Syzbar;
end
% 5th coloumn
for i=1:matrixEle
      BMele(1,5,i)=DataMTxz(i,3)/Sxzbar;
      BMele(2,5,i)=DataMTxz(i,4)/Sxzbar;
      BMele(3,5,i)=DataMTxz(i,5)/Sxzbar;
      BMele(4,5,i)=DataMTxz(i,8)/Sxzbar;
      BMele(5,5,i)=DataMTxz(i,7)/Sxzbar;
      BMele(6,5,i)=DataMTxz(i,6)/Sxzbar;
end
% 6th coloumn
for i=1:matrixEle
      BMele(1,6,i)=DataMTxy(i,3)/Sxybar;
      BMele(2,6,i)=DataMTxy(i,4)/Sxybar;
      BMele(3,6,i)=DataMTxy(i,5)/Sxybar;
      BMele(4,6,i)=DataMTxy(i,8)/Sxybar;
      BMele(5,6,i)=DataMTxy(i,7)/Sxybar;
      BMele(6,6,i)=DataMTxy(i,6)/Sxybar;
end
%% finding Volume average
Bf=zeros(6,6);
Bm=zeros(6,6);
%fibre
for i=1:fibreEle
    Bf=Bf+BFele(:,:,i)*FV(i,2);
end
BF=Bf/fibrevolume;
%matrix
for i=1:matrixEle
    Bm=Bm+BMele(:,:,i)*MV(i,2);
end
BM=Bm/matrixvolume;
for i=1:6
    for j=1:6
        if abs(BF(i,j))<0.001
            BF(i,j)=0;
        end
        if abs(BM(i,j))<0.001
            BM(i,j)=0;
        end
    end
end
%%% Final matrix
FinalCheck=Vf*BF+Vm*BM;
for i=1:6
    for j=1:6
        if abs(FinalCheck(i,j))<0.001
            FinalCheck(i,j)=0;
        end
    end
end
C_S=Vf*F_S*BF+Vm*M_S*BM;
C_C=inv(C_S);
c_E1=1/C_S(1,1)
c_E2=1/C_S(2,2)
c_G12=1/C_S(6,6)
c_G23=1/C_S(4,4)
c_mu12=-C_S(2,1)*c_E1
