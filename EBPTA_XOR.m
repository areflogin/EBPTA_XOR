%   Author:  Aref YELGHI                                     
%   year:    2013                                                  
%   E-mail:  ar.yelqi (at) gmail (dot) com  

clc; close all; clear all;

% create training set.
cat=2;
num=2;

title('Two-dimensional 2-class pattern space (Non-Linear Classification)');
xlabel('x');
ylabel('y');

pat_1=[0 1; 1 0];
plot(pat_1(1,:),pat_1(2,:),'*r','MarkerSize',12); 
 axis([-1 2 -1 2])
hold on
% augmented input vectors
pat_1(3,:)=-1; % adding third column 1 to main data
y1=pat_1;
d1=ones(1,num);

pat_2=[0 1; 0 1];
plot(pat_2(1,:),pat_2(2,:),'*b','MarkerSize',12); 
pat_2(3,:)=-1; 
y2=pat_2;
d2=-1*ones(1,num);

z=[y1 y2];
d=[d1 d2];

% RDPTA Implementation
%  
 I=3; 
 J=3; 
 K=1; 
 y=zeros(J,1);
 y(J,1)= -1;
 
  n=0.1;
  L=1;
  W= (-1+2*rand(J,K));
  V=(-1+2*rand(I,J-1));
  Emax=0.1; 
  E=0;
  p=1;
  q=1;

  W
  V
  
while q<1000
   b=0;
   while p <= (cat*num)
       % compute y
       for j=1:J-1
           nety=V(:,j)'*z(:,p);
           y(j)=(2/(1+exp(-L*nety)))-1;
           
           m0(j)=y(j);
       end
       if p<=2
           m1(:,p)=[m0];
       end 
       
        if (p>2) 
           b=b+1;
           m2(:,b)=[m0];
       end     
           
       % compute o
       for k=1:K
           neto=W(:,k)'*y;
           o(k)=(2/(1+exp(-L*neto)))-1;   
           E=0.5*((d(k,p)-o(k)).^2)+E;
           
           So(k)= 0.5*(d(k,p)-o(k))*(1-o(k).^2); % output layer error signal
       end
           % hidden layer error signal 
       for j=1:J-1
           SS=0;
           for k=1:K
               SS=SS+ So(k)*W(j,k);
           end
           Sy(j)= 0.5*(1-y(j).^2)* SS; % hidden layer error signal
       end       
          % W and V Weights update      
           for k=1:K
               for j=1:J
                  W(j,k)=W(j,k)+ n * So(k) * y(j);  % output layer weight adjusted
               end
           end
               for j=1:J-1
                  for i=1:I
                       V(i,j)=V(i,j)+ n * Sy(j) * z(i,p);  % hidden layer weight adjusted
                  end
               end
      
       p=p+1;
   end
   
   Eu(q)=E;
%     % plot line
% if k==1
%      % ax + by + c = 0 ==> y=(-c-ax)/b;
%      x1 = [0,1];   %x = [xmin,xmax]; 
%      if W(1,2)==0
%          W(1,2)=W(1,2)+0.0001;
%      end
%      y1 = (-W(1,3)/W(1,2))-((W(1,1)*x1)/W(1,2));
%      plot(x1,y1,'Color','r')
%      hold on

%      
%      if W(2,2)==0
%          W(2,2)=W(2,2)+0.0001;
%      end
%      y2 = (-W(2,3)/W(2,2))-((W(2,1)*x1)/W(2,2));
%      plot(x1,y2,'Color','b')
%      hold on
%      
%      if W(3,2)==0
%          W(3,2)=W(3,2)+0.0001;
%      end
%      y3 = (-W(3,3)/W(3,2))-((W(3,1)*x1)/W(3,2));
%      plot(x1,y3,'Color','g')
%      hold on
%      
%      if W(4,2)==0
%          W(4,2)=W(4,2)+0.0001;
%      end
%      y4 = (-W(4,3)/W(4,2))-((W(4,1)*x1)/W(4,2));
%      plot(x1,y4,'Color','k')
%      hold on
%     
%     if W(4,2)==0
%          W(4,2)=W(4,2)+0.0001;
%      end
%      y5 = (-W(5,3)/W(5,2))-((W(5,1)*x1)/W(5,2));
%      plot(x1,y5,'Color','y')
%      hold on
%   drawnow; pause(0.1)
% end 
   
   if E<Emax
     break
   else
       E=0;
       p=1;
   end
 q=q+1;
end
%
 q
 W
 V
 
%  
%  % plot line
%      % ax + by + c = 0 ==> y=(-c-ax)/b;
    

title('Two-dimensional 2-class pattern space (Non-Linear Classification)');
xlabel('x');
ylabel('y');

     V=V'; 
     x1 = [-2,2];   %x = [xmin,xmax]; 
     if V(1,2)==0
         V(1,2)=V(1,2)+0.0001;
     end
     y1 = (V(1,3)/V(1,2))-((V(1,1)*x1)/V(1,2));
     plot(x1,y1,'Color','r')
     hold on
     
     if V(2,2)==0
         V(2,2)=V(2,2)+0.0001;
     end
     y2 = (V(2,3)/V(2,2))-((V(2,1)*x1)/V(2,2));
     plot(x1,y2,'Color','b')
     hold on
     
%      if V(3,2)==0
%          V(3,2)=V(3,2)+0.0001;
%      end
%      y3 = (V(3,3)/V(3,2))-((V(3,1)*x1)/V(3,2));
%      plot(x1,y3,'Color','g')
%      hold on
%      
%      if W(4,2)==0
%          W(4,2)=W(4,2)+0.0001;
%      end
%      y4 = (-W(4,3)/W(4,2))-((W(4,1)*x1)/W(4,2));
%      plot(x1,y4,'Color','k')
%      hold on
%     
%     if W(5,2)==0
%          W(5,2)=W(5,2)+0.0001;
%      end
%      y5 = (-W(5,3)/W(5,2))-((W(5,1)*x1)/W(5,2));
%      plot(x1,y5,'Color','y')
%      hold on
%      
 

figure (2)

plot(m1(1,:),m1(2,:),'*r','MarkerSize',12); 
axis([-2 2 -2 2])
hold on

plot(m2(1,:),m2(2,:),'*b','MarkerSize',12); 
hold on

  if W(2,1)==0
         W(2,1)=W(2,1)+0.0001;
  end
     y2 = (W(3,1)/W(2,1))-((W(1,1)*x1)/W(2,1));
     plot(x1,y2,'Color','b')
 title('Space Transformation');
xlabel('y1');
ylabel('y2');    
     
t=1:length(Eu);
 figure (3)
 plot(t,Eu,'Color','r')
 title('Error Convergence');
 xlabel('iteration number (k)');
 ylabel('Error');
 
 
