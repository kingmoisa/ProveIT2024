syms w z_inv q TS
%w=2*pi*50;
s=(1-z_inv)/1e-5;
BP_numarator=w/q*s;
BP_num=s^2+w/q*s+w^2;
BP = BP_numarator / BP_num;
[n, d] = numden(BP);
[y,y1]=coeffs(n, 'z_inv');
[x1 x2]=coeffs(d, 'z_inv');
A = y(1);
B = y(2);
C = x1(1);
D = x1(2);
E = x1(3);
a = -D / E
b = -C / E
c = B / E
d = A / E