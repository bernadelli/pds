%%
%Bernadelli 2020; clariton.bernadelli@uftm.edu.br; claritonbernadelli@gmail.com

%Sherman-Morrison-Woodbury
%(A+BCD)^-1 = A^-1-A^-1B(C^-1+DA^-1B)DA^-1
%%
A = [2,0,-1;-1,1,1;-1,0,1];
A_inv = [1,0,1;-0,1,-1;1,0,2];
a = 2*[0;0;1];
b = [0;1;0];

ANS = inv(A) - (inv(A)*a*b'*inv(A))/(1+b'*inv(A)*a)