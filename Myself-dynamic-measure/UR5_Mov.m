close all;
clear;

figure; 
ToDeg = 180/pi;%Trance the value of angle
ToRad = pi/180;
th1=0;%+180�㡭�� -180��
th2=-90;%+160�㡭�� -160��
th3=-150;%+160�㡭�� -160��
th4=-30;%+180�㡭�� -180��
th5=90;%+180�㡭�� -180��
th6=0;%+180�㡭�� -180��
stp=10;%initial ��е��������̬
% dtime=0.02;
theta=[th1 th2 th3 th4 th5 th6];
Mov_One_Step(th1,th2,th3,th4,th5,th6,1); 
hold on;
% pause;
% hold off;
% Forward_Value=My_fkine(theta);
Forward_Value=[0 -1 0 1400;
    -1 0 0 -109;
    0 0 -1 0;
    0 0 0 1];
Inverse_Value=My_ikine(Forward_Value);%��⣨�����⣩ Forward_Value��Ŀ��4�����任����
theta=Inverse_Value(2,:);
Mov_One_Step(theta(1),theta(2),theta(3),theta(4),theta(5),theta(6),0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%��������㣬���ƹؽڽǶ�%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% N=100000;
% joint1=unifrnd(-180*ToRad,180*ToRad,[1,N]);%��һ�ؽڱ�����λ
% joint2=unifrnd(-160*ToRad,160*ToRad,[1,N]);%�ڶ��ؽڱ�����λ
% joint3=unifrnd(-160*ToRad,160*ToRad,[1,N]);%�����ؽڱ�����λ
% joint4=unifrnd(-180*ToRad,180*ToRad,[1,N]);%���Ĺؽڱ�����λ
% joint5=unifrnd(-180*ToRad,180*ToRad,[1,N]);%����ؽڱ�����λ
% joint6=unifrnd(-180*ToRad,180*ToRad,[1,N]);%�����ؽڱ�����λ
% G=cell(N,6);
% for n = 1:N
%     G{n}=[joint1(n) joint2(n) joint3(n) joint4(n) joint5(n) joint6(n)];
% end
% H1=cell2mat(G);
% for n = 1:N
%     T(:,:,n)=double(My_fkine(H1(n,:)));
% end
% scatter3(squeeze(T(1,4,:)),squeeze(T(2,4,:)),squeeze(T(3,4,:)))%�����ͼ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Joint1
% for th=0:stp:165
%    Mov_One_Step(th,th2,th3,th4,th5,th6,1); 
% end
% for th=165:-stp:-165
%    Mov_One_Step(th,th2,th3,th4,th5,th6,1); 
% end
% 
% for th=-165:stp:0
%     if th~=0
%        Mov_One_Step(th,th2,th3,th4,th5,th6,1); 
%     else
%        Mov_One_Step(th,th2,th3,th4,th5,th6,0);   
%     end
% end
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Joint2
% for th=0:stp:110
%    Mov_One_Step(th1,th,th3,th4,th5,th6,1); 
% end
% for th=110:-stp:-110
%    Mov_One_Step(th1,th,th3,th4,th5,th6,1); 
% end
% 
% for th=-110:stp:0
%     if th~=0
%        Mov_One_Step(th1,th,th3,th4,th5,th6,1); 
%     else
%        Mov_One_Step(th1,th,th3,th4,th5,th6,0);   
%     end
% end
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Joint3
% for th=0:stp:70
%    Mov_One_Step(th1,th2,th,th4,th5,th6,1); 
% end
% for th=70:-stp:-90
%    Mov_One_Step(th1,th2,th,th4,th5,th6,1); 
% end
% 
% for th=-90:stp:0
%     if th~=0
%        Mov_One_Step(th1,th2,th,th4,th5,th6,1); 
%     else
%        Mov_One_Step(th1,th2,th,th4,th5,th6,0);   
%     end
% end
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Joint4
% for th=0:stp:160
%    Mov_One_Step(th1,th2,th3,th,th5,th6,1); 
% end
% for th=160:-stp:-160
%    Mov_One_Step(th1,th2,th3,th,th5,th6,1); 
% end
% 
% for th=-160:stp:0
%     if th~=0
%        Mov_One_Step(th1,th2,th3,th,th5,th6,1); 
%     else
%        Mov_One_Step(th1,th2,th3,th,th5,th6,0);   
%     end
% end
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Joint5
% for th=0:stp:120
%    Mov_One_Step(th1,th2,th3,th4,th,th6,1); 
% end
% for th=120:-stp:-120
%    Mov_One_Step(th1,th2,th3,th4,th,th6,1); 
% end
% 
% for th=-120:stp:0
%     if th~=0
%        Mov_One_Step(th1,th2,th3,th4,th,th6,1); 
%     else
%        Mov_One_Step(th1,th2,th3,th4,th,th6,0);   
%     end
% end
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Joint6
% for th=0:stp:400
%    Mov_One_Step(th1,th2,th3,th4,th5,th,1); 
% end
% for th=400:-stp:-400
%    Mov_One_Step(th1,th2,th3,th4,th5,th,1); 
% end
% 
% for th=-400:stp:400
%     if th~=0
%        Mov_One_Step(th1,th2,th3,th4,th5,th,1); 
%     else
%        Mov_One_Step(th1,th2,th3,th4,th5,th,0);   
%     end
% end
% 
