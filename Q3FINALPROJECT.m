syms o n s 
o= exp(-n);
D = (1/pi).* int(o.* exp(-2.*s.*n.*1i),n ,0 , pi);
s= -10:10;
DV= double(subs(D,s));
subplot(2, 1, 1);
stem(s,abs(DV));
title("Magnitude Spectrum");
subplot(2, 1, 2);
stem(s,angle(DV));
title("Phase Spectrum");