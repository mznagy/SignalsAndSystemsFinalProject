fs = input("Enter sampling frequency: ");
fprintf("fs = %d\n", fs);
t1 = input("Enter start of time scale: ");
fprintf("t1 = %d\n", t1);
t2 = input("Enter end of time scale: ");
fprintf("t2 = %d\n", t2);
n = input("Enter number of break points: ");
t = linspace(t1, t2, (t2-t1)*fs);
z = zeros(1, n+1);
z(1) = t1;
for i=1:1:n
    z(i+1) = input("Position of break point: ");
end
x = [];
z = [z t2];
for i=1:1:n+1
    fprintf("1. DC Signal\n2. Ramp Signal\n3. General Order Polynomial\n4. Exponential Signal\n5. Sinusoidal Signal\n");
    j = input("Enter number corresponding to your choice: ");
    switch j
        case 1
            h = input("Amplitude: ");
            y = h.*ones(1, (z(i+1)-z(i))*fs);
            x =[x y];
        case 2
            s = input("Slope: ");
            c = input("Intercept: ");
            ty = linspace(z(i), z(i+1), (z(i+1)-z(i))*fs);
            y = s*ty + c;
            x = [x y];
        case 3
            a = input("Amplitude: ");
            p = input("Power: ");
            c = input("Intercept: ");
            ty = linspace(z(i), z(i+1), (z(i+1)-z(i))*fs);
            y = a*(ty.^p) + c;
            x = [x y];
        case 4
            a = input("Amplitude: ");
            e = input("Exponent: ");
            ty = linspace(z(i), z(i+1), (z(i+1)-z(i))*fs);
            y = a*(exp(e*ty));
            x = [x y];
        case 5
            a = input("Amplitude: ");
            f = input("Frequency: ");
            p = input("Phase: ");
            ty = linspace(z(i), z(i+1), (z(i+1)-z(i))*fs);
            y = a*sin(f*pi*ty + p*pi/180);
            x = [x y];
    end
end
subplot(2, 1, 1);
plot(t, x);
title("Main Signal");
fprintf("1. Amplitude Scaling\n2. Time Reversal\n3. Time Shift\n4. Expanding The Signal\n5. Compressing The Signal\n6. None\n");
j = input("Enter number corresponding to your choice: ");
switch j
   case 1
      a = input("Scale value: ");
      x = a*x;
   case 2
      t = linspace(-t1, -t2, abs(t2-t1)*fs);
   case 3
      ts = input("Shift value: ");
      t = linspace(t1, t2, abs(t2-t1)*fs);
   case 4
      ex = input("Expanding value: ");
      t = linspace(ex.*t1, ex.*t2, (t2-t1)*fs);
   case 5
      co = input("Compressing value: ");
      t = linspace(t1/co, t2/co, (t2-t1)*fs);
   case 6
end
subplot(2, 1, 2);
plot(t, x);
title("Edited Signal");

