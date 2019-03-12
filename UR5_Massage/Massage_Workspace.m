close all;
clear;
%%
%%%%%%%%%%Put picture on XYZ%%%%%%%%%%%%%%%
% Img = imread('massage_picture.jpg');
% level=graythresh(Img);
% q1=length(Img(:,1,1));
% q2=length(Img(1,:,1));
% x=q1:-1:1;
% y=1:q2;
% [X,Y]=meshgrid(x,y);
% figure(1);
% plot3(X,Y,Img(:,:,1),'k');hold on;
p=imread('massage_picture.jpg');
% p=imrotate(p,-90);
g=rgb2gray(p); % תΪ�ҽ�ͼ
gg=double(g); % תΪ��ֵ����
gg=1-gg/255; % ����ɫֵתΪ 0-1 �Ľ���ֵ
[x,y]=size(gg); % ȡԭͼ��С
[X,Y]=meshgrid(1:y,1:x); % ��ԭͼ��С��������
n=0.01;
x_tran=-1.5;%-:���� +:����
y_tran=0;%+:���� -:����
z_tran=6;%UR5ĩ��XY����ͱ��������غ�
% z_tran=5;%Massage_robotĩ��XY����ͱ��������غ�
% mesh(-n*X+x_tran,-n*Y+y_tran,-gg-z_tran); % �����ϻ���ͼ��
axis([-20,20,-20,20,-15,15]);
% colormap gray; % ��Ϊ�ҽ�ͼ��
% hold on;
% figure(2);%image perform in figure
% MassageImg = imresize(im2bw(Img,0.95),0.3);
% MassageImg = ~MassageImg;
% MassageImg = flipud(MassageImg);
% [col, row] = size(MassageImg);
% imshow(MassageImg);hold on;
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%UR5_initial
startup_rvc;%launch robotics toolbox
global robot 
UR5mdl;
% parameter in robotics toolbox
th1=0;th2=0;th3=0;th4=0;th5=0;th6=0;
move_one_step(th1,th2,th3,th4,th5,th6,0);%initial
% pause;
% Z_label=-6;
% pL=[1 0 0 -5;0 -1 0 1.5;0 0 -1 Z_label;0 0 0 1];
% q1=robot.ikine(pL);
% th1=q1(1);th2=q1(2);th3=q1(3);th4=q1(4);th5=q1(5);th6=q1(6);
% move_one_step(th1,th2,th3,th4,th5,th6,0);
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Massage_robot_initial
% startup_rvc;%launch robotics toolbox
% global robot 
% Massage_robot4DOF;
% % parameter in robotics toolbox
% th1=pi/2;th2=0;th3=0;th4=0;th5=0;th6=0;
% move_one_step(th1,th2,th3,th4,th5,th6,0);%initial
% % pause;
%%
[row,col]=size(gg);z_label=-6;ii=1;
row=-n*row+y_tran;col=-n*col+x_tran;index_minx=-5.7;index_maxx=-3.7;
for y_label=y_tran+2:-0.2:row+2
    for x_label=-2.7:-0.2:-6.7
        if index_minx<x_label&&x_label<index_maxx
              for zz_label=z_label:-0.2:-6.5
                  pL=[1 0 0 x_label;0 -1 0 y_label;0 0 -1 zz_label;0 0 0 1];
                  q=robot.ikine(pL);  
                  q1(ii,:)=q;
                  th1=q(1);th2=q(2);th3=q(3);th4=q(4);th5=q(5);th6=q(6);
                  move_one_step(th1,th2,th3,th4,th5,th6,0);
                  robotxyz=robot.fkine([th1,th2,th3,th4,th5,th6]);
                  plot3(robotxyz.t(1),robotxyz.t(2),robotxyz.t(3),'ro');hold on;
                  ii=ii+1;
              end                         
        else
            pL=[1 0 0 x_label;0 -1 0 y_label;0 0 -1 z_label;0 0 0 1];
            q=robot.ikine(pL);  
            q1(ii,:)=q;
            th1=q(1);th2=q(2);th3=q(3);th4=q(4);th5=q(5);th6=q(6);
            move_one_step(th1,th2,th3,th4,th5,th6,0);
            robotxyz=robot.fkine([th1,th2,th3,th4,th5,th6]);
            plot3(robotxyz.t(1),robotxyz.t(2),robotxyz.t(3),'ro');hold on;
            ii=ii+1;
        end
    end
end
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%UR5
%ɨ��ͼƬ�õ�������Ϣ�����˶�ѧ�������˹���λ��
% Z_label=-7;
% pL=[1 0 0 -0.5;0 -1 0 -3.74;0 0 -1 Z_label;0 0 0 1];
% q1=robot.ikine(pL);
% th1=q1(1);th2=q1(2);th3=q1(3);th4=q1(4);th5=q1(5);th6=q1(6);
% move_one_step(th1,th2,th3,th4,th5,th6,0);
% % pause;
% pR=[1 0 0 -6.54;0 -1 0 -3.78;0 0 -1 Z_label;0 0 0 1];
% q2=robot.ikine(pR);
% th1=q2(1);th2=q2(2);th3=q2(3);th4=q2(4);th5=q2(5);th6=q2(6);
% move_one_step(th1,th2,th3,th4,th5,th6,0);
% % pause;
% 
% pU1=[1 0 0 -2.13;0 -1 0 -1.08;0 0 -1 Z_label;0 0 0 1];
% q3=robot.ikine(pU1);
% th1=q3(1);th2=q3(2);th3=q3(3);th4=q3(4);th5=q3(5);th6=q3(6);
% move_one_step(th1,th2,th3,th4,th5,th6,0);
% % pause;
% % 
% pU2=[1 0 0 -5.53;0 -1 0 -0.66;0 0 -1 Z_label;0 0 0 1];
% q4=robot.ikine(pU2);
% th1=q4(1);th2=q4(2);th3=q4(3);th4=q4(4);th5=q4(5);th6=q4(6);
% move_one_step(th1,th2,th3,th4,th5,th6,0);
% % pause;
% % 
% pD1=[1 0 0 -2.19;0 -1 0 -5.87;0 0 -1 Z_label;0 0 0 1];
% q6=robot.ikine(pD1);
% th1=q6(1);th2=q6(2);th3=q6(3);th4=q6(4);th5=q6(5);th6=q6(6);
% move_one_step(th1,th2,th3,th4,th5,th6,0);
% % % pause;
% pD2=[1 0 0 -5.0;0 -1 0 -5.63;0 0 -1 Z_label;0 0 0 1];
% q5=robot.ikine(pD2);
% th1=q5(1);th2=q5(2);th3=q5(3);th4=q5(4);th5=q5(5);th6=q5(6);
% move_one_step(th1,th2,th3,th4,th5,th6,0);
% % % pause;
%%
% %ͼ���������%���ݸ��˶���
% [row,col]=size(gg);z_label=-5;ii=1;
% row=-n*row+y_tran;col=-n*col+x_tran;index_minx=-5.7;index_maxx=-3.7;
% for y_label=y_tran:-0.1:row
%     for x_label=-2.7:-0.1:-6.7
%         if index_minx<x_label&&x_label<index_maxx
%               for zz_label=z_label:-0.1:-5.5
%                   pL=[1 0 0 x_label;0 -1 0 y_label;0 0 -1 zz_label;0 0 0 1];
%                   q=robot.ikine(pL);  
%                   q1(ii,:)=q;
%                   th1=q(1);th2=q(2);th3=q(3);th4=q(4);th5=q(5);th6=q(6);
%                   move_one_step(th1,th2,th3,th4,th5,th6,0);
%                   robotxyz=robot.fkine([th1,th2,th3,th4,th5,th6]);
%                   plot3(robotxyz.t(1),robotxyz.t(2),robotxyz.t(3),'r.');hold on;
%                   ii=ii+1;
%               end                         
%         else
%             pL=[1 0 0 x_label;0 -1 0 y_label;0 0 -1 z_label;0 0 0 1];
%             q=robot.ikine(pL);  
%             q1(ii,:)=q;
%             th1=q(1);th2=q(2);th3=q(3);th4=q(4);th5=q(5);th6=q(6);
%             move_one_step(th1,th2,th3,th4,th5,th6,0);
%             robotxyz=robot.fkine([th1,th2,th3,th4,th5,th6]);
%             plot3(robotxyz.t(1),robotxyz.t(2),robotxyz.t(3),'r.');hold on;
%             ii=ii+1;
%         end
%     end
% end


% [Max_Q,Max_index]=max(q1,[],1);%the maximum value of q
% [Min_Q,Min_index]=min(q1,[],1);%the minimum value of q
% %ͨ������ÿ���ؽ������С�Ƕȹ涨UR5�����ռ�
% theta1=unifrnd(Min_Q(1),Max_Q(1),[1,30000]);%��һ�ؽڱ�����λ
% theta2=unifrnd(Min_Q(2),Max_Q(2),[1,30000]);%�ڶ��ؽڱ�����λ
% theta3=unifrnd(Min_Q(3),Max_Q(3),[1,30000]);%�����ؽڱ�����λ
% theta4=unifrnd(Min_Q(4),Max_Q(4),[1,30000]);%���Ĺؽڱ�����λ
% theta5=unifrnd(Min_Q(5),Max_Q(5),[1,30000]);%����ؽڱ�����λ
% theta6=unifrnd(Min_Q(6),Max_Q(6),[1,30000]);%�����ؽڱ�����λ
% G = cell(30000, 6);%����Ԫ������
% for n = 1:30000
%     G{n} =[theta1(n) theta2(n) theta3(n) theta4(n) theta5(n) theta6(n)];
% end%����30000�������
% H1=cell2mat(G);%��Ԫ������ת��Ϊ����
% T=double(robot.fkine(H1));%��е������
% scatter3(squeeze(T(1,4,:)),squeeze(T(2,4,:)),squeeze(T(3,4,:)))%�����ͼ
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%UR5
% %�ܼ��͹����ռ�ɢ��ͼ��ͨ��ɨ��õ���������λ�����˶�ѧ���˽Ƕȣ�ȡ6�����ֵ���칤���ռ�
% Q=[q1;q2;q3;q4;q5];
% [Max_Q,Max_index]=max(Q,[],1);%the maximum value of q
% [Min_Q,Min_index]=min(Q,[],1);%the minimum value of q
% %ͨ������ÿ���ؽ������С�Ƕȹ涨UR5�����ռ�
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%UR5
% theta1/theta2 overlap
% UR5 just reflect workspace of massage
% Build the area needed for massage through pictures
%%%%%%%%%%%%Use "for" cycle make up workspace%%%%%%%%%%%%%
% for th2=Min_Q(2):0.1:Max_Q(2)
%     for th3=Min_Q(3):0.4:Max_Q(3)
%         for th4=Min_Q(4):0.4:Max_Q(4)
%             for th5=Min_Q(5):0.4:Max_Q(5)
%                  move_one_step(th1,th2,th3,th4,th5,th6,0);
%                  robotxyz=robot.fkine([th1,th2,th3,th4,th5,th6]);
%                  plot3(robotxyz.t(1),robotxyz.t(2),robotxyz.t(3),'r.');hold on;
%             end
%         end
%     end
% end
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%UR5andMassage_robot
%����ÿ���ؽڣ�ȡ�����
% theta1=unifrnd(Min_Q(1),Max_Q(1),[1,30000]);%��һ�ؽڱ�����λ
% theta2=unifrnd(Min_Q(2),Max_Q(2),[1,30000]);%�ڶ��ؽڱ�����λ
% theta3=unifrnd(Min_Q(3),Max_Q(3),[1,30000]);%�����ؽڱ�����λ
% theta4=unifrnd(Min_Q(4),Max_Q(4),[1,30000]);%���Ĺؽڱ�����λ
% theta5=unifrnd(Min_Q(5),Max_Q(5),[1,30000]);%����ؽڱ�����λ
% theta6=unifrnd(Min_Q(6),Max_Q(6),[1,30000]);%�����ؽڱ�����λ
% G = cell(30000, 6);%����Ԫ������
% for n = 1:30000
%     G{n} =[theta1(n) theta2(n) theta3(n) theta4(n) theta5(n) theta6(n)];
% end%����30000�������
% H1=cell2mat(G);%��Ԫ������ת��Ϊ����
% T=double(robot.fkine(H1));%��е������
% scatter3(squeeze(T(1,4,:)),squeeze(T(2,4,:)),squeeze(T(3,4,:)))%�����ͼ
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Test
% %����ÿ���ؽڣ�ȡ�����
% theta1=unifrnd(-pi,pi,[1,30000]);%��һ�ؽڱ�����λ
% theta2=unifrnd(-pi,pi,[1,30000]);%�ڶ��ؽڱ�����λ
% theta3=unifrnd(-pi,pi,[1,30000]);%�����ؽڱ�����λ
% theta4=unifrnd(5,5,[1,30000]);%���Ĺؽڱ�����λ
% theta5=unifrnd(-pi,pi,[1,30000]);%����ؽڱ�����λ
% theta6=unifrnd(-pi,pi,[1,30000]);%�����ؽڱ�����λ
% G = cell(30000, 6);%����Ԫ������
% for n = 1:30000
%     G{n} =[theta1(n) theta2(n) theta3(n) theta4(n) theta5(n) theta6(n)];
% end%����30000�������
% H1=cell2mat(G);%��Ԫ������ת��Ϊ����
% T=double(robot.fkine(H1));%��е������
% scatter3(squeeze(T(1,4,:)),squeeze(T(2,4,:)),squeeze(T(3,4,:)))%�����ͼ





