%% All method
%% Concentric cylinder assemblage model
% fiber: Silenka E-Glass 1200tex Matrix: LY556/HT907/ DY063 epoxy Material

close all;
clear all;
clc

%% Fiber and matrix properties

% fiber properties and compliance matrix
syms V_f

f_E1=74*(10^9);            %Longitudinal modulus, E1 (GPa)
f_E2=74*(10^9);            %Transverse modulus, E2 (GPa)
f_E3=f_E2;                 %Transverse modulus, E3 (GPa)
f_G12=30.8*(10^9);         %In-plane shear modulus, G12 (GPa)
f_G13=f_G12;               %In-plane shear modulus, G13 (Gpa)
f_nu12=0.2;                %Major Poisson s ratio, ν12
f_nu13=f_nu12;
f_G23=30.8*(10^9);         %Transverse shear modulus, G23(GPa)
f_nu23=(f_E2/(2*f_G23))-1; %Deriving the constant from given property 
f_alpha_1=4.9*(10^-6);     %Longitudinal thermal coefficient, α1 (10−6/°C)
f_alpha_2=4.9*(10^-6);     %Transverse thermal coefficient, α2 (10−6/°C) 

% Matrix properties

m_E=3.35*(10^9);   % Modulus,Em (GPa)
m_nu=0.35;         % Poisson’s ratio, νm
m_alpha=58;        % Thermal coefficient, αm (10−6/°C)
m_G=m_E/(2*(1+m_nu));   % Shear modulus

% Some Other Properties
f_nu21=(f_nu12*f_E2)/(f_E1);
f_nu32=(f_nu23*f_E3)/(f_E2);
f_nu31=f_nu12;                %Derived properties 


%% Compliance Matrix of Fiber

S_f=zeros(6,6);
S_f(1,1)=1/f_E1;
S_f(1,2)=(-f_nu21)/f_E2;
S_f(1,3)=(-f_nu31)/f_E3;
S_f(2,1)=(-f_nu12)/f_E1;
S_f(2,2)=1/f_E2;
S_f(2,3)=(-f_nu32)/f_E3;
S_f(3,1)=(-f_nu13)/f_E1;
S_f(3,2)=(-f_nu23)/f_E2;
S_f(3,3)=1/f_E3;
S_f(4,4)=1/f_G23;
S_f(5,5)=1/f_G13;
S_f(6,6)=1/f_G12;

%% Compliance matrix of matrix

S_m=zeros(6,6);
S_m(1,1)=1/m_E;
S_m(1,2)=(-m_nu)/m_E;
S_m(1,3)=(-m_nu)/m_E;
S_m(2,1)=(-m_nu)/m_E;
S_m(2,2)=1/m_E;
S_m(2,3)=(-m_nu)/m_E;
S_m(3,1)=(-m_nu)/m_E;
S_m(3,2)=(-m_nu)/m_E;
S_m(3,3)=1/m_E;
S_m(4,4)=1/m_G;
S_m(5,5)=1/m_G;
S_m(6,6)=1/m_G;

% Stiffness Matrix for fiber and Matrix

C_f=inv(S_f);
C_m=inv(S_m);


%% SOM Approach 
% Effective axial modulus (E1-for composite)

E_1=(f_E1*V_f)+(m_E*(1-V_f));

% Effective axial (major) poisons Ratio nu_12

nu_12=(f_nu12*V_f)+(m_nu*(1-V_f));

% Effective transverse modulus (E2-for composite)

  % first approach (without deformation constraint satisfied)

E_2i=(f_E2*m_E)/((m_E*V_f)+((1-V_f)*f_E2));

% Second approach (with deformation constraint satisfied i.e deformation in direction 1 taken into account)

n_f=(f_E1*V_f+((1-f_nu12*f_nu21)*m_E+(m_nu*f_nu21*f_E1))*(1-V_f))/((f_E2*V_f)+(m_E*(1-V_f)));
n_m=((m_E*(1-V_f))+((1-m_nu^2)*f_E1-(1-m_nu*f_nu12)*m_E)*V_f)/((f_E2*V_f)+(m_E*(1-V_f)));

E_2ii=(f_E2*m_E)/((m_E*V_f*n_f)+((1-V_f)*f_E2*n_m));

% Effective axial shear modulus

G_12=(V_f/f_G12)+((1-V_f)/m_G);
G12=1/G_12;

% ploting the Result for various Vf and Vm
vf=linspace(0,1,100);

% plot for Effective axial modulus (E1-for composite) 
for i=1:length(vf)

    SOMVal1(i)=subs(E_1,V_f,vf(i));
end
plot(vf,SOMVal1,'g','LineWidth',2);
title("Effective axial modulus (E1-for composite)");
xlabel("V_f",Color='r',FontSize=15);
ylabel("E_1",Color='r',FontSize=15);
legend('E1*',Color='y',FontSize=12);
%% Plot For SOM
% ploting Effective axial (major) poisons Ratio nu_12
figure
SOMVal2=subs(nu_12,V_f,vf);
plot(vf,SOMVal2,'y','LineWidth',2)
title("Effective axial (major) poisons Ratio");
xlabel("V_f",Color='r',FontSize=15);
ylabel("\nu12",Color='r',FontSize=15);
legend("nu(12)*",Color='m',FontSize=12);

% ploting Effective transverse modulus (E2-for composite)
figure
SOMVal3=subs(E_2i,V_f,vf);
SOMVal4=subs(E_2ii,V_f,vf);
plot(vf,SOMVal3,'r',vf,SOMVal4,'b',LineWidth=1.4)
title("Effective transverse modulus (E2-for composite)");
xlabel("V_f",Color='r',FontSize=15);
ylabel("E_2",Color='r',FontSize=15);
legend('(E_2*) without deformation','(E_2*) with deformation');

 
% ploting Effective axial shear modulus
figure
SOMVal5=subs(G12,V_f,vf);
plot(vf,SOMVal5,'m','LineWidth',2);
title("Effective axial shear modulus");
xlabel("V_f",Color='r',FontSize=15);
ylabel("G_1_2",Color='r',FontSize=15);
legend('G*',Color='y',Fontsize=12);












%% CCA Method
% Effective axial Modulus

syms P V_f real
b=0.1;
a=b*sqrt(V_f);

% Constant a1,a2,a3,a4
a11=(a^2)*(C_m(1,1)-C_m(1,2))*(C_f(1,2)-C_m(1,2));
a12=(C_m(1,2)*(C_f(1,2)-C_m(1,2)))+(C_m(1,1)*(C_f(1,2)+C_m(1,2)));

a1=P*(a11+(b^2)*a12);

a21=(a^2)*(C_f(1,1)-C_m(1,2))*(C_f(1,2)-C_m(1,2));
a22=(b^2)*(C_m(1,2))*(C_m(1,1)-C_m(1,2)+C_f(2,2)+C_f(2,3));
a2=-P*C_m(1,2)*(a21+a22);

a31=-(a^2)*(b^2)*C_m(1,1)*C_f(1,2);
a32=(a^2)*(b^2)*C_m(1,2)*(-C_f(1,2)+C_f(2,2)+C_f(2,3));
a3=P*C_m(1,2)*(a31+a32);

a41=(C_m(1,1)-C_m(1,2));
a42=(C_m(1,1)+C_m(1,2)-C_f(2,2)-C_f(2,3));
a43=(C_m(1,1)+C_m(1,2));
a44=(C_m(1,1)-C_m(1,2)+C_f(2,2)+C_f(2,3));
a4=P*(((a^2)*a41*a42)-((b^2)*(a43*a44)));
a4_s=a4/P;

% Constant b1,b2,b3

b11=(((C_m(1,1))^2)+(C_m(1,1)*C_m(1,2))-2*(C_m(1,2))^2);
b12=(C_m(1,1)-C_m(1,2)+C_f(2,2)+C_f(2,3));
b1=-(b^4)*(b11*b12);

b21=(C_m(1,1)-C_m(1,2));
b22=-(C_m(1,1))^2;
b23=2*(C_f(1,2)-C_m(1,1))^2;
b24=C_f(1,1)*(C_m(1,1)+C_m(1,2)-C_f(2,2)-C_f(2,3));
b25=C_m(1,1)*(-C_m(1,2)+C_f(2,2)+C_f(2,3));
b2=(a^4)*b21*(b22+b23+b24+b25);

b31=((C_f(1,1))*(C_m(1,1)+C_m(1,2))*(C_m(1,1)-C_m(1,2)+C_f(2,2)+C_f(2,3)));
b32=C_m(1,1)^3;
b331=C_m(1,2);
b332=C_f(1,2)^2;
b333=2*C_f(1,2)*C_m(1,2);
b334=C_m(1,2)*(2*C_m(1,2)-C_f(2,2)-C_f(2,3));
b33=b331*(b332-b333+b334);
b341=C_m(1,1);
b342=(C_f(1,2))^2;
b343=2*C_f(1,2)*C_m(1,2);
b344=C_m(1,2)*(-3*C_m(1,2)+C_f(2,2)+C_f(2,3));
b34=b341*(b342+b343+b344);

b3=(-(a^2)*(b^2))*(b31-2*(b32+b33+b34));

d=pi*(b1+b2+b3);

A_f=a1/d;                % Af,Am,Bm,Epsilon_xx 
A_m=a2/d;
A_ms=A_m/P;

B_m=a3/d;
B_ms=B_m/P;
e_xx=a4/d;
e_xxs=a4_s/d;

P1=(pi*a*a*((C_f(1,1)*e_xx)+2*C_f(1,2)*A_f))+(pi*((b^2)-(a^2))*((C_m(1,1)*e_xx)+(2*C_m(1,2)*A_m)));

% E1_star
E1_Star=1/(pi*b*b*e_xxs);



% Nu12 Star
uppar=2*V_f*C_m(1,1)*C_f(1,2)+(1-V_f)*C_m(1,2)*(C_m(1,1)-C_m(1,2)+C_f(2,2)+C_f(2,3));
lower=-V_f*(C_m(1,1)-C_m(1,2))*(C_m(1,1)+C_m(1,2)-C_f(2,2)-C_f(2,3))+(C_m(1,1)+C_m(1,2))*(C_m(1,1)-C_m(1,2)+C_f(2,2)+C_f(2,3));
Nu12_Star=uppar/lower;


% K23 Star

n1=-V_f*(C_m(1,1)-C_m(1,2))*(C_m(1,1)+C_m(1,2)-C_f(2,2)-C_f(2,3));
n2=(C_m(1,1)+C_m(1,2))*(C_m(1,1)-C_m(1,2)+C_f(2,2)+C_f(2,3));
n3=V_f*(C_m(1,1)+C_m(1,2)-C_f(2,2)-C_f(2,3));
n4=(C_m(1,1)-C_m(1,2)+C_f(2,2)+C_f(2,3));
n5=2*(n3+n4);
K23_Star=(n1+n2)/n5;

% Effective Shear Modulus G12_star

G12_Star=(m_G*((f_G12*(1+V_f))+m_G*(1-V_f)))/((f_G12*(1-V_f))+(m_G*(1+V_f)));


% Effective Shear Modulus G23_star
n_m=3-4*m_nu;             % Neeta_m and Neeta_f 
n_f=3-4*f_nu23;
g=(f_G23/m_G);


A11=3*V_f*(1-(V_f))^2*(g-1)*(g+n_f);
A12=(g*n_m+n_f*n_m-(V_f^3)*(g*n_m-n_f));
A13=(n_m*V_f*(g-1)-(g*n_m+1));
A=A11+(A12*A13);


% for B
B1=-6*V_f*(1-(V_f))^2*(g-1)*(g+n_f);
B2=((g*n_m)+(g-1)*V_f+1);
B3=((n_m-1)*(g+n_f)-2*(V_f^3)*(g*n_m-n_f));
B4=V_f*(g-1)*(n_m+1)*(g+n_f+(V_f^3)*(g*n_m-n_f));
B=B1+B2*B3+B4;
% for D

D1=3*V_f*(1-(V_f))^2*(g-1)*(g+n_f);
D2=((g*n_m)+V_f*(g-1)+1);
D3=(g+n_f+(V_f^3)*(g*n_m-n_f));
D=D1+(D2*D3);


%Solving equation for G23 Star

Aa=A/(m_G^2);
Bb=B/m_G;
p=[Aa Bb D];
G23_star=roots(p);
vf_r=linspace(0,1,100);
vf=vf_r';
G23_Star=vpa(subs(G23_star(1),V_f,vf));
CC_Val(:,6)=G23_Star;
% E2 _star 
E2_Star=(4*G23_star(1)*K23_Star)/(K23_Star+G23_star(1)+((4*(Nu12_Star^2)*G23_star(1)*K23_Star)/E1_Star));

%Nu_23_star
nu23_Star=(K23_Star-G23_star(1)-((4*(Nu12_Star^2)*G23_star(1)*K23_Star)/E1_Star))/(K23_Star+G23_star(1)+((4*(Nu12_Star^2)*G23_star(1)*K23_Star)/E1_Star));

vf=linspace(0,1,100);
 

%% Plot for CCA
% Plot for E1_Star
figure
grid on
CC_Val(:,1)=subs(E1_Star,V_f,vf);
plot(vf,CC_Val(:,1),Color='m',LineWidth=1.4);
xlabel('V_f','FontSize',15,'FontWeight','bold','Color','m');
ylabel('E_1','FontSize',15,'FontWeight','bold','Color','m');
title("CCA E_1*",'FontSize',14,'FontWeight','bold','Color','m');


% plot for E2_star

figure
grid on
CC_Val(:,2)=subs(E2_Star,V_f,vf);
plot(vf,CC_Val(:,2),Color='m',LineWidth=1.4);
xlabel('V_f','FontSize',15,'FontWeight','bold','Color','m');
ylabel('E_2','FontSize',15,'FontWeight','bold','Color','m');
title("CCA E_2*",'FontSize',14,'FontWeight','bold','Color','m');



% plot of N12_star

figure
grid on
CC_Val(:,3)=double(subs(Nu12_Star,V_f,vf));
plot(vf,CC_Val(:,3),Color='m',LineWidth=1.4);
xlabel('V_f','FontSize',15,'FontWeight','bold','Color','m');
ylabel('\nu12*','FontSize',15,'FontWeight','bold','Color','m');
t='CCA Effective poission Ratio \nu_1_2';
title(t,'FontSize',14,'FontWeight','bold','Color','m');


% plot for Nu23 Star

figure
grid on
CC_Val(:,4)=subs(nu23_Star,V_f,vf);
plot(vf,CC_Val(:,4),Color='m',LineWidth=1.4);
xlabel('V_f','FontSize',15,'FontWeight','bold','Color','m');
ylabel('\nu23*','FontSize',15,'FontWeight','bold','Color','m');
t='CCA Effective poission Ratio \nu_2_3';
title(t,'FontSize',14,'FontWeight','bold','Color','m');


% Plot of G12_star
figure
grid on
CC_Val(:,5)=subs(G12_Star,V_f,vf);
plot(vf,CC_Val(:,5),Color='m',LineWidth=1.4);
xlabel('V_f','FontSize',15,'FontWeight','bold','Color','m');
ylabel('G12*','FontSize',15,'FontWeight','bold','Color','m');
t='CCA Effective shear modulus G_1_2';
title(t,'FontSize',14,'FontWeight','bold','Color','m');


% plot of G23 Star
figure
grid on
plot(vf,G23_Star,Color='m',LineWidth=1.4);
xlabel('V_f','FontSize',15,'FontWeight','bold','Color','m');
ylabel('G_2_3','FontSize',15,'FontWeight','bold','Color','m');
t='CCA Effective shear modulus G_2_3';
title(t,'FontSize',14,'FontWeight','bold','Color','m');


% plot of K23_Star
figure
grid on
CC_Val(:,7)=subs(K23_Star,V_f,vf);
plot(vf,CC_Val(:,7),Color='m',LineWidth=1.4);
xlabel('V_f','FontSize',15,'FontWeight','bold','Color','m');
ylabel('K23*','FontSize',15,'FontWeight','bold','Color','m');
t='CCA Effective shear modulus K_2_3';
title(t,'FontSize',14,'FontWeight','bold','Color','m');


%% Mori_Tonaka Method


% Realationship between Hill"s Moduli and engineering moduli for Fiber

kf=-((1/f_G23)-(4/f_E2)+4*((f_nu12^2)/f_E1))^(-1);
lf=2*kf*f_nu12;
nf=f_E1+(4*kf*(f_nu12^2));
mf=f_G23;
pf=f_G12;

% Realationship between Hill"s Moduli and engineering moduli for Matrix

km=-((1/m_G)-(4/m_E)+4*((m_nu^2)/m_E))^(-1);
lm=2*km*m_nu;
nm=m_E+(4*km*(m_nu^2));
mm=m_G;
pm=m_G;

% Hill's Moduli for Composite

k_cu=(V_f*kf)*(km+mm)+(1-V_f)*(km)*(kf+mm);
k_cd=(V_f)*(km+mm)+(1-V_f)*(kf+mm);
kc=(k_cu/k_cd);

l_cu=((V_f)*(lf)*(km+mm)+(1-V_f)*(lm)*(kf+mm));
l_cd=(V_f*(km+mm))+((1-V_f)*(kf+mm));
lc=(l_cu/l_cd);

nc=(1-V_f)*(nm)+(V_f*nf)+(1-(V_f*lf)-((1-V_f)*(lm)))*((lf-lm)/(kf-mm));

m_cu=mf*mm*(km+2*mm)+km*mm*((V_f*mf)+(1-V_f)*mm);
m_cd=(km*mm)+(km+2*mm)*(V_f*mm+(1-V_f)*mf);
mc=m_cu/m_cd;

p_cu=2*V_f*pm*pf+(1-V_f)*((pm*pf)+pm^2);
p_cd=(2*V_f*pm)+(1-V_f)*(pf+pm);
pc=p_cu/p_cd;

% Now calculation of engineering constants using Mori_Tanaka Method

syms a b c d e real
eq(1)=kc+(1/((1/a)-(4/b)+(4*(c^2)/d)))==0;
eq(2)=lc-(2*kc*c)==0;
eq(3)=nc-d-(4*kc*c^2)==0;
eq(4)=mc-a==0;
eq(5)=pc-e==0;
Var=[a,b,c,d,e];
[Var(1),Var(2),Var(3),Var(4),Var(5)]=solve(eq,Var);

mt_G23=Var(1);
mt_E2=Var(2);
mt_nu12=Var(3);
mt_E1=Var(4);
mt_G12=Var(5);

q=1+(4*kc*(mt_nu12^2))/mt_E1;
mt_nu23=(kc-q*mc)/(kc+q*mc);



%% Plot Mori_Tonaka Method
% plot for E1*
figure
mt_Val(:,1)=subs(mt_E1,V_f,vf);
plot(vf,mt_Val(:,1),Color='b',LineWidth=1.6);
xlabel('V_f','FontSize',15,'FontWeight','bold','Color','b');
ylabel('E_1','FontSize',15,'FontWeight','bold','Color','b');
title("Mori Tonaka E_1*",'FontSize',14,'FontWeight','bold','Color','b');

% plot for E2*
figure
mt_Val(:,2)=subs(mt_E2,V_f,vf);
plot(vf,mt_Val(:,2),Color='b',LineWidth=1.6);
xlabel('V_f','FontSize',15,'FontWeight','bold','Color','b');
ylabel('E_2','FontSize',15,'FontWeight','bold','Color','b');
title("Mori Tonaka E_2*",'FontSize',14,'FontWeight','bold','Color','b');

% plot for nu12*
figure
mt_Val(:,3)=subs(mt_nu12,V_f,vf);
plot(vf,mt_Val(:,3),Color='b',LineWidth=1.6);
xlabel('V_f','FontSize',15,'FontWeight','bold','Color','b');
t='Mori Tonaka Effective poission Ratio \nu_1_2';
ylabel('\nu_1_2','FontSize',15,'FontWeight','bold','Color','b');
title(t,'FontSize',14,'FontWeight','bold','Color','b');

% plot for nu23*
figure
mt_Val(:,4)=subs(mt_nu23,V_f,vf);
plot(vf,mt_Val(:,4),Color='b',LineWidth=1.6);
xlabel('V_f','FontSize',15,'FontWeight','bold','Color','b');
t='Mori Tonaka Effective poission Ratio \nu_2_3';
ylabel('\nu_2_3','FontSize',15,'FontWeight','bold','Color','b');
title(t,'FontSize',14,'FontWeight','bold','Color','b');

% plot for G12*
figure
mt_Val(:,5)=subs(mt_G12,V_f,vf);
plot(vf,mt_Val(:,5),Color='b',LineWidth=1.6);
xlabel('V_f','FontSize',15,'FontWeight','bold','Color','b');
t='Mori Tonaka Effective shear modulus G_1_2';
ylabel('G_1_2','FontSize',15,'FontWeight','bold','Color','b');
title(t,'FontSize',14,'FontWeight','bold','Color','b');

% plot for G23*
figure
mt_Val(:,6)=subs(mt_G23,V_f,vf);
plot(vf,mt_Val(:,6),Color='b',LineWidth=1.6);
xlabel('V_f','FontSize',15,'FontWeight','bold','Color','b');
t='Mori Tonaka Effective shear modulus G_2_3';
ylabel('G_2_3','FontSize',15,'FontWeight','bold','Color','b');
title(t,'FontSize',14,'FontWeight','bold','Color','b');

%% Halpin-Tsai Method

ht_E1=f_E1*(V_f)+m_E*(1-V_f);
ht_nu12=f_nu12*V_f+m_nu*(1-V_f);

kf=-((1/f_G23)-(4/f_E2)+4*((f_nu12^2)/f_E1))^(-1);
mf=f_G23;
pf=f_G12;
km=-((1/m_G)-(4/m_E)+4*((m_nu^2)/m_E))^(-1);
mm=m_G;
pm=m_G;
M=mf/mm;
K=kf/km;
P=pf/pm;
netak=(K-1)/(K+2);
netam=(M-1)/(M+2);
netap=(P-1)/(P+1);
kc=km*(1+2*netak*V_f)/(1-netak*V_f);
mc=mm*(1+2*netam*V_f)/(1-netam*V_f);
qc=1+4*kc*ht_nu12^2/ht_E1;
ht_E2=4*kc*mc/(kc+qc*mc);
ht_G23=mc;
pc=pm*(1+1*netap*V_f)/(1-netap*V_f);
ht_G12=pc;
ht_nu23=(kc-qc*mc)/(kc+qc*mc);

%% Plot for Halpin-Tsi Method
% plot for E1*
figure
ht_Val(:,1)=subs(ht_E1,V_f,vf);
plot(vf,ht_Val(:,1),Color='r',LineWidth=1.6);
xlabel('V_f','FontSize',15,'FontWeight','bold','Color','r');
ylabel('E_1','FontSize',15,'FontWeight','bold','Color','r');
title("Halpin-tsi E_1*",'FontSize',14,'FontWeight','bold','Color','r');

% plot for E2*
figure
ht_Val(:,2)=subs(ht_E2,V_f,vf);
plot(vf,ht_Val(:,2),Color='r',LineWidth=1.6);
xlabel('V_f','FontSize',15,'FontWeight','bold','Color','r');
ylabel('E_2','FontSize',15,'FontWeight','bold','Color','r');
title("Halpin-tsi E_2*",'FontSize',14,'FontWeight','bold','Color','r');

% plot for nu12*
figure
ht_Val(:,3)=subs(ht_nu12,V_f,vf);
plot(vf,ht_Val(:,3),Color='r',LineWidth=1.6);
xlabel('V_f','FontSize',15,'FontWeight','bold','Color','r');
t='Halpin-tsi Effective poission Ratio \nu_1_2';
ylabel('\nu_1_2','FontSize',15,'FontWeight','bold','Color','r');
title(t,'FontSize',14,'FontWeight','bold','Color','r');

% plot for nu23*
figure
ht_Val(:,4)=subs(ht_nu23,V_f,vf);
plot(vf,ht_Val(:,4),Color='r',LineWidth=1.6);
xlabel('V_f','FontSize',15,'FontWeight','bold','Color','r');
t='Haplin-tsi Effective poission Ratio \nu_2_3';
ylabel('\nu_2_3','FontSize',15,'FontWeight','bold','Color','r');
title(t,'FontSize',14,'FontWeight','bold','Color','r');

% plot for G12*
figure
ht_Val(:,5)=subs(ht_G12,V_f,vf);
plot(vf,ht_Val(:,5),Color='r',LineWidth=1.6);
xlabel('V_f','FontSize',15,'FontWeight','bold','Color','r');
t='Haplin-tsi Effective shear modulus G_1_2';
ylabel('G_1_2','FontSize',15,'FontWeight','bold','Color','r');
title(t,'FontSize',14,'FontWeight','bold','Color','r');

% plot for G23*
figure
ht_Val(:,6)=subs(ht_G23,V_f,vf);
plot(vf,ht_Val(:,6),Color='r',LineWidth=1.6);
xlabel('V_f','FontSize',15,'FontWeight','bold','Color','r');
t='Haplin-Tsi Effective shear modulus G_2_3';
ylabel('G_2_3','FontSize',15,'FontWeight','bold','Color','r');
title(t,'FontSize',14,'FontWeight','bold','Color','r');


%% Hashin-strikman Method


% Note here code is using some upper modulii and constant
V_m=1-V_f;
f_K=kf;
m_K=km;
gamma=m_G/f_G23;
beta1=f_K/(f_K+2*f_G23);
beta2=(m_K)/(m_K+2*m_G);
alpha=(beta1-(gamma*beta2))/(1+gamma*beta2);
rho=(gamma+beta1)/(gamma-1);
hse1=(m_E*V_m)+(f_E1*V_f);
hse2=4*((f_nu12-m_nu)^2)*V_f*V_m;
hse3=((V_m/f_K)+(V_f/m_K)+(1/m_G));
hs_E1_l=hse1+(hse2/hse3);           % E1- for Hashin-strikman
hse4=((V_m/f_K)+(V_f/m_K)+(1/f_G23));
hs_E1_u=hse1+(hse2/hse4);           % E1+ for Hashin-strikman


hsn1=m_nu*V_m+f_nu12*V_f;
hsn2=4*(m_nu-f_nu12)*(1/(f_K-m_K))*V_f*V_m;
hsn3=hse4;                             
hs_nu12_l=hsn1+(hsn2/hsn3);              % major poission ratio nu12 lower
hsn4=4*(-m_nu+f_nu12)*(1/(-f_K+m_K))*V_f*V_m;
hsn5=hse3;
hs_nu12_u=hsn1+(hsn4/hsn5);  % major poission ratio nu12 uppar

hsg1=m_G*V_m+f_G12*(1+V_f);
hsg2=f_G12*V_m+m_G*(1+V_f);
hs_G12_l=m_G*(hsg1/hsg2);        %Axial Shear Modulus lower G12-
hsg3=f_G12*V_f+m_G*(1+V_m);
hsg4=m_G*V_f+f_G12*(1+V_m);
hs_G12_u=f_G12*(hsg3/hsg4);      % Axial Shear Modulus Upper G12+


hs_g1=((f_G23-m_G)^-1)+(6*(m_K+2*m_G)*V_m)/(5*m_G*(3*m_K+4*m_G));
hs_G23_l=m_G+V_f/hs_g1;          % Trannsverse Shear modulus G23-
% hs_g2=((1+beta1)*V_f)/(rho-(V_f*(1+((3*beta1^2*V_m^2)/(alpha*V_f^3+1)))));
hs_G23_u=f_G23+V_m/(1/(m_G-f_G23)+(6*(kf+2*f_G23)*V_f)/(5*f_G23*(3*kf+4*f_G23)));           % Transverse Shear MOdulus G23+

hsk1=(1/(f_K-m_K))+(V_m/(f_K+m_G));
hs_K_l=m_K+(V_f/hsk1);             % Bulk Modulus K-
hsk2=(1/(-f_K+m_K))+(V_f/(f_K+m_G));
hs_K_u=f_K+(V_m/hsk2);             % Bulk Modulus K-


m_plus=hs_G23_u;
m_minus=hs_G23_l;
q_plus=1+(4*hs_K_u*(hs_nu12_u^2))/hs_E1_u;
q_minus=1+(4*hs_K_u*(hs_nu12_l^2))/hs_E1_l;

% nu23
hs_nu23_u=(hs_K_u-q_plus*m_plus)/(hs_K_u+q_plus*m_plus);
hs_nu23_l=(hs_K_l-q_minus*m_minus)/(hs_K_l+q_minus*m_minus);


% E2
hs_E2_u=(4*hs_K_u*m_plus)/(hs_K_u+q_plus*m_plus);
hs_E2_l=(4*hs_K_l*m_minus)/(hs_K_l+q_minus*m_minus);



%% Plot for Hasin-Strikman Bounds

% For E1
figure
grid on 
hold on
hsVAl(:,1)=subs(hs_E1_l,V_f,vf);
hsVAl(:,2)=subs(hs_E1_u,V_f,vf);
plot(vf,hsVAl(:,1),'r-|','LineWidth',1.3);
plot(vf,hsVAl(:,2),"Color",'b','LineWidth',1.3);
title('Hasin Stikman bound E*_1',Color='k');
xlabel('V_f','FontSize',15,'FontWeight','bold','Color','k');
ylabel('E*_1','FontSize',15,'FontWeight','bold','Color','k');
legend('E*_1 lower','E*_1 upper');
hold off

% for E2
figure
grid on 
hold on
hsVAl(:,3)=subs(hs_E2_l,V_f,vf);
hsVAl(:,4)=subs(hs_E2_u,V_f,vf);
plot(vf,hsVAl(:,3),'r-|','LineWidth',1.3);
plot(vf,hsVAl(:,4),"Color",'b','LineWidth',1.3);
title('Hasin Stikman bound E*_2',Color='k');
xlabel('V_f','FontSize',15,'FontWeight','bold','Color','k');
ylabel('E*_2','FontSize',15,'FontWeight','bold','Color','k');
legend('E*_2 lower','E*_1 upper');
hold off

% For nu12
figure
grid on 
hold on
hsVAl(:,5)=subs(hs_nu12_l,V_f,vf);
hsVAl(:,6)=subs(hs_nu12_u,V_f,vf);
plot(vf,hsVAl(:,5),'c-','LineWidth',1.3);
plot(vf,hsVAl(:,6),'b','LineWidth',1.3);
title('Hasin Stikman bound \nu12*',Color='k');
xlabel('V_f','FontSize',15,'FontWeight','bold','Color','k');
ylabel('\nu*_1_2','FontSize',15,'FontWeight','bold','Color','k');
legend('\nu*_1_2 -','\nu*_1_2 +');
hold off

% for nu23
figure
grid on 
hold on
hsVAl(:,7)=subs(hs_nu23_l,V_f,vf);
hsVAl(:,8)=subs(hs_nu23_u,V_f,vf);
plot(vf,hsVAl(:,7),'c-','LineWidth',1.3);
plot(vf,hsVAl(:,8),'b','LineWidth',1.3);
title('Hasin Stikman bound \nu23*',Color='k');
xlabel('V_f','FontSize',15,'FontWeight','bold','Color','k');
ylabel('\nu*_2_3','FontSize',15,'FontWeight','bold','Color','k');
legend('\nu*_2_3 -','\nu*_1_2 +');
hold off

% for G12
figure
grid on 
hold on
hsVAl(:,9)=subs(hs_G12_l,V_f,vf);
hsVAl(:,10)=subs(hs_G12_u,V_f,vf);
plot(vf,hsVAl(:,9),'c-','LineWidth',1.3);
plot(vf,hsVAl(:,10),'b','LineWidth',1.3);
title('Hasin Stikman bound G*_1_2',Color='k');
xlabel('V_f','FontSize',15,'FontWeight','bold','Color','k');
ylabel('G*_1_2','FontSize',15,'FontWeight','bold','Color','k');
legend('G*_1_2 -','G*_1_2 +');
hold off

% for G23
figure
grid on 
hold on
hsVAl(:,11)=subs(hs_G23_l,V_f,vf);
hsVAl(:,12)=subs(hs_G23_u,V_f,vf);
plot(vf,hsVAl(:,11),'c-','LineWidth',1.3);
plot(vf,hsVAl(:,12),'b','LineWidth',1.3);
title('Hasin Stikman bound G*_2_3',Color='k');
xlabel('V_f','FontSize',15,'FontWeight','bold','Color','k');
ylabel('G*_2_3','FontSize',15,'FontWeight','bold','Color','k');
legend('G*_2_3 -','G_2_3* +');
hold off

% for K23
figure
grid on 
hold on
hsVAl(:,13)=subs(hs_K_l,V_f,vf);
hsVAl(:,14)=subs(hs_K_u,V_f,vf);
plot(vf,hsVAl(:,13),'c-','LineWidth',1.3);
plot(vf,hsVAl(:,14),'b','LineWidth',1.3);
title('Hasin Stikman bound K*',Color='k');
xlabel('V_f','FontSize',15,'FontWeight','bold','Color','k');
ylabel('K*','FontSize',15,'FontWeight','bold','Color','k');
legend('K*-','K*+');
hold off

% %% Self Consistent Method
% 
% % Realationship between Hill"s Moduli and engineering moduli for Fiber
% syms p_sc k_sc m_sc n_sc l_sc
% 
% kf=-((1/f_G23)-(4/f_E2)+4*((f_nu12^2)/f_E1))^(-1);
% lf=2*kf*f_nu12;
% nf=f_E1+(4*kf*(f_nu12^2));
% mf=f_G23;
% pf=f_G12;
% 
% % Realationship between Hill"s Moduli and engineering moduli for Matrix
% 
% km=-((1/m_G)-(4/m_E)+4*((m_nu^2)/m_E))^(-1);
% lm=2*km*m_nu;
% nm=m_E+(4*km*(m_nu^2));
% mm=m_G;
% pm=m_G;
% 
% z(1)=((V_f*kf)/(kf+m_sc))+((V_m*km)/(km+m_sc))-2*(((V_f*mm)/(mm-m_sc))+((V_m*mf)/(mf-m_sc)));
% z(2)=((2*p_sc)^-1)-(V_f/(p_sc-pm))-(V_m/(p_sc-pf));
% z(3)=(1/(k_sc+m_sc))-(V_f/(kf+m_sc))-(V_m/(km+m_sc));
% eqt=[z(1),z(2),z(3)];
% vars=[k_sc,m_sc,p_sc];
% [k_sc,p_sc,m_sc]=solve(eqt,vars);

%% Voigt Approximation
C_f=inv(S_f);
C_m=inv(S_m);

C_Star=(V_f*C_f)+((1-V_f)*C_m);           % Voigt Approximation formula
S_Star=inv(C_Star);

V_E1_star=1/(S_Star(1,1));                % Effective axial modulus E1
V_E2_star=1/(S_Star(2,2));                % Effective axial modulus E2
V_E3_star=1/(S_Star(3,3));                % Effective axial modulus E3
V_nu12_star=-(S_Star(2,1)/S_Star(1,1));   % Effective poisons ratio Nu12
V_nu13_star=-(S_Star(3,1)/S_Star(1,1));   % Effective poisons ratio Nu13
V_nu23_star=-(S_Star(3,2)/S_Star(2,2));   % Effective poisons ratio Nu23
V_G23_star=1/(S_Star(4,4));               % Effective Shear Modulus G23
V_G13_star=1/(S_Star(5,5));               % Effective Shear Modulus G13
V_G12_star=1/(S_Star(6,6));               % Effective Shear Modulus G12

%% Reuss Approximation
Sr_Star=((V_f*S_f)+((1-V_f)*(S_m)));       % Reuss Approximation formula 

R_E1_star=1/(Sr_Star(1,1));                % Effective axial modulus E1
R_E2_star=1/(Sr_Star(2,2));                % Effective axial modulus E2
R_E3_star=1/(Sr_Star(3,3));                % Effective axial modulus E3
R_nu12_star=-(Sr_Star(2,1)/Sr_Star(1,1));  % Effective poisons ratio Nu12
R_nu13_star=-(Sr_Star(3,1)/Sr_Star(1,1));  % Effective poisons ratio Nu13
R_nu23_star=-(Sr_Star(3,2)/Sr_Star(2,2));  % Effective poisons ratio Nu23
R_G23_star=1/(Sr_Star(4,4));               % Effective Shear Modulus G23
R_G13_star=1/(Sr_Star(5,5));               % Effective Shear Modulus G13
R_G12_star=1/(Sr_Star(6,6));               % Effective Shear Modulus G12


%% Plot of Voigt Reuss Approximation
figure
vf=linspace(0,1,100);
% Plot of effective axial modulus E1 using both Approximation
hold on
grid on
Val_1=subs(V_E1_star,V_f,vf);
Valr_1=subs(R_E1_star,V_f,vf);
plot(vf,Val_1,Color='r',LineWidth=2)
plot(vf,Valr_1,Color='b',LineWidth=2)
t='Effective axial modulus $E_1$';
title(t,'interpreter','latex','FontSize',14,'FontWeight','bold','Color','k','BackgroundColor','g');
ylabel("E_1","FontSize",15,"FontWeight",'bold','Color','r');
xlabel("V_f","FontSize",15,"FontWeight",'bold','Color','r');
legend('Voigt','Reuss');
hold off

% Plot of effective axial modulus E2 using both Approximation
figure
hold on
grid on
Val_2=subs(V_E2_star,V_f,vf);
Valr_2=subs(R_E2_star,V_f,vf);
plot(vf,Val_2,Color='r',LineWidth=2)
plot(vf,Valr_2,Color='b',LineWidth=2)
t='Effective axial modulus';
s= ' $E_2$';
r=append(t,s);
title(r,'interpreter','latex','FontSize',14,'FontWeight','bold','Color','k','BackgroundColor','g')
ylabel("E_2","FontSize",15,"FontWeight",'bold','Color','r');
xlabel("V_f","FontSize",15,"FontWeight",'bold','Color','r');
legend('Voigt','Reuss');
hold off

% Plot of effective shear modulus G12 using both Approximation
figure 
hold on 
grid on
Val_3=subs(V_G12_star,V_f,vf);
Valr_3=subs(R_G12_star,V_f,vf);
plot(vf,Val_3,Color='r',LineWidth=2)
plot(vf,Valr_3,Color='b',LineWidth=2)
t='Effective Shear modulus';
s=' G_1_2';
r=append(t,s);
title(r,'FontSize',14,'FontWeight','bold','Color','k','BackgroundColor','g');
ylabel("G_1_2","FontSize",15,"FontWeight",'bold','Color','r');
xlabel("V_f","FontSize",15,"FontWeight",'bold','Color','r');
legend('Voigt','Reuss');
hold off

% Plot of effective shear modulus G23 using both Approximation
figure 
hold on 
grid on
Val_4=subs(V_G23_star,V_f,vf);
Valr_4=subs(R_G23_star,V_f,vf);
plot(vf,Val_4,Color='r',LineWidth=2)
plot(vf,Valr_4,Color='b',LineWidth=2)
t='Effective shear modulus';
s=' G_2_3';
r=append(t,s);
title(r,'FontSize',14,'FontWeight','bold','Color','k','BackgroundColor','g');
ylabel("G_2_3","FontSize",15,"FontWeight",'bold','Color','r');
xlabel("V_f","FontSize",15,"FontWeight",'bold','Color','r');
legend('Voigt','Reuss');
hold off

% Plot of effective Poisson's Ratio Nu12 using both Approximation
figure
hold on 
grid on
Val_5=subs(V_nu12_star,V_f,vf);
Valr_5=subs(R_nu12_star,V_f,vf);
plot(vf,Val_5,Color='r',LineWidth=2)
plot(vf,Valr_5,Color='b',LineWidth=2)
t='Effective shear modulus \nu_1_2';
title(t,'FontSize',14,'FontWeight','bold','Color','k','BackgroundColor','g');
ylabel("\nu_1_2","FontSize",15,"FontWeight",'bold','Color','r');
xlabel("V_f","FontSize",15,"FontWeight",'bold','Color','r');
legend('Voigt','Reuss');
hold off

% Plot of effective Poisson's Ratio Nu23 using both Approximation
figure
hold on 
grid on
Val_6=subs(V_nu23_star,V_f,vf);
Valr_6=subs(R_nu23_star,V_f,vf);
plot(vf,Val_6,Color='r',LineWidth=2)
plot(vf,Valr_6,Color='b',LineWidth=2)
t='Effective shear modulus \nu_2_3';
title(t,'FontSize',14,'FontWeight','bold','Color','k','BackgroundColor','g');
ylabel('\nu_2_3',"FontSize",15, "FontWeight",'bold','Color','r');
xlabel('V_f',"FontSize",15,"FontWeight",'bold','Color','r');
legend('Voigt','Reuss');
hold off



%% All method E1 plot
figure
grid on 
hold on
plot(vf,SOMVal1,vf,Val_1,'-y',vf,Valr_1,'-g',vf,CC_Val(:,1),'-r',vf,mt_Val(:,1),'c-',vf,ht_Val(:,1),'m-|',vf,hsVAl(:,1),'b-|',vf,hsVAl(:,2),'k-','LineWidth',1.1);
plot(0.6,16.7287*10^9,'*');
title('All E*_1',Color='k');
xlabel('V_f','FontSize',15,'FontWeight','bold','Color','k');
ylabel('E*_1','FontSize',15,'FontWeight','bold','Color','k');
legend({'SOM','Voigt','Reuss','CCA','Mori-t','hal-Ts','hasin-s-','hasin-s+','hills'},'Location','northwest');
hold off


%% All method E2 Plot

figure
grid on 
hold on
plot(vf,SOMVal3,vf,SOMVal4,vf,Val_2,'-y',vf,Valr_2,'-g',vf,CC_Val(:,1),'-r',vf,mt_Val(:,2),'c-',vf,ht_Val(:,2),'m-',vf,hsVAl(:,3),'b-',vf,hsVAl(:,4),'k-','LineWidth',1.1);
plot(0.6,9.2488*10^9,'*');
title('All E*_2',Color='k');
xlabel('V_f','FontSize',15,'FontWeight','bold','Color','k');
ylabel('E*_2','FontSize',15,'FontWeight','bold','Color','k');
legend({'SOM-1approch','SOM-1approch','Voigt','Reuss','CCA','Mori-t','hal-Ts','hasin-s-','hasin-s+','hills'},'Location','northwest');
hold off


%% All method Nu12 Plot

figure
grid on 
hold on
plot(vf,SOMVal2,vf,Val_5,'-y',vf,Valr_5,'-g',vf,CC_Val(:,3),'-r',vf,mt_Val(:,3),'c-',vf,ht_Val(:,3),'m-',vf,hsVAl(:,5),'b-',vf,hsVAl(:,6),'k-','LineWidth',1.1);
plot(0.6,0.29,'*');
title('All \nu*_1_2',Color='k');
xlabel('V_f','FontSize',15,'FontWeight','bold','Color','k');
ylabel('\nu*_1_2','FontSize',15,'FontWeight','bold','Color','k');
legend({'SOM','Voigt','Reuss','CCA','Mori-t','hal-Ts','hasin-s-','hasin-s+','hills'},'Location','northeast');
hold off


%% All method nu23 Plot

figure
grid on 
hold on
plot(vf,Val_6,'-y',vf,Valr_6,'-g',vf,CC_Val(:,4),'-r',vf,mt_Val(:,4),'c-',vf,ht_Val(:,4),'m-',vf,hsVAl(:,7),'b-',vf,hsVAl(:,8),'k-','LineWidth',1.1);

title('All \nu*_2_3',Color='k');
xlabel('V_f','FontSize',15,'FontWeight','bold','Color','k');
ylabel('\nu*_2_3','FontSize',15,'FontWeight','bold','Color','k');
legend({'Voigt','Reuss','CCA','Mori-t','hal-Ts','hasin-s-','hasin-s+'},'Location','southeast');
hold off


%% All Method G12 Plot

figure
grid on 
hold on
plot(vf,SOMVal5,vf,Val_3,'-y',vf,Valr_3,'-g',vf,CC_Val(:,5),'-r',vf,mt_Val(:,5),'k-|',vf,ht_Val(:,5),'m-+',vf,hsVAl(:,9),'b-',vf,hsVAl(:,10),'c-','LineWidth',1.1);
plot(0.6,3.82*10^9,'*');
title('All G*_1_2',Color='k');
xlabel('V_f','FontSize',15,'FontWeight','bold','Color','k');
ylabel('G*_1_2','FontSize',15,'FontWeight','bold','Color','k');
legend({'SOM','Voigt','Reuss','CCA','Mori-t','hal-Ts','hasin-s-','hasin-s+','hills'},'Location','northwest');
hold off





%% All Method G23 Plot

figure
grid on 
hold on
plot(vf,Val_4,'-y',vf,Valr_4,'-g',vf,CC_Val(:,6),'-r',vf,mt_Val(:,6),'k-',vf,ht_Val(:,6),'m',vf,hsVAl(:,11),'b-',vf,hsVAl(:,12),'c-','LineWidth',1.1);
title('All G*_2_3',Color='k');
xlabel('V_f','FontSize',15,'FontWeight','bold','Color','k');
ylabel('G*_2_3','FontSize',15,'FontWeight','bold','Color','k');
legend({'Voigt','Reuss','CCA','Mori-t','hal-Ts','hasin-s-','hasin-s+'},'Location','northwest');
hold off





