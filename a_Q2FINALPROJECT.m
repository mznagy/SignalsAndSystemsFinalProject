fs=2;
Ts=1/fs;
t=linspace(-100000,100000,200000*fs);
x=(10^(-3)).*t;
m=(sin(x)./x).^2;
M=Ts.*fftshift(fft(m));
n=length(m);
f=(-n/2:n/2-1)*(fs/n);
w=2*pi*f;
subplot(3, 1, 3);
plot(w,angle(M));
title("phase of M(s)");
w=2*pi*f;
subplot(3, 1, 2);
plot(w,abs(M));
title("magnitude of M(s)");
xlim([-0.004,0.004]);
subplot(3, 1, 1);
plot(t,m);
title("m(t)");