%����������ģ��
clear;
clc;
%       theta    d        a        alpha     offset
L1=Link([0       0        2   0      0     ]); %�������˵�D-H����
L2=Link([0       0        1.8     0         0     ]);
L3=Link([0       0         0.8    0     0     ]);
%  L4=Link([0       0        1    0     0     ]);
%  L5=Link([0       0        2    0     0     ]);
%  L6=Link([0       0        2    0     0     ]);
robot=SerialLink([L1 L2 L3  ],'name','manman'); %�������ˣ�������ȡ��manman
A=unifrnd(-pi,pi/2,[1,30000]);%��һ�ؽڱ�����λ
B=unifrnd(-pi/2,pi/2,[1,30000]);%�ڶ��ؽڱ�����λ
C=unifrnd(-pi,pi,[1,30000]);%�����ؽڱ�����λ
G= cell(30000, 3);%����Ԫ������
for n = 1:30000
    G{n} =[A(n) B(n) C(n)];
end                                         %����3000�������
H1=cell2mat(G);                       %��Ԫ������ת��Ϊ����
T=double(robot.fkine(H1));       %��е������
figure(1)
scatter3(squeeze(T(1,4,:)),squeeze(T(2,4,:)),squeeze(T(3,4,:)))%�����ͼ
robot.plot([pi/2 pi/4 0],'workspace',[-5 5 -5 5 -5 5 ],'tilesize',2)%��е��ͼ
