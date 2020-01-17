%%LECTURA DE LOS AUDIOS
audiox=audioread('C4_P2_G1.wav'); % aqui va el audio que se va comparar
audio1=audioread('C1_P1_G1.wav'); % Comando 1
audio2=audioread('C2_P1_G1.wav'); % Comando 2
audio3=audioread('C3_P1_G1.wav'); % Comando 3
audio4=audioread('C4_P1_G1.wav'); % Comando 4
Fs=44100; %Muestras de cada audio
%% CALCULO DE FFT PARA AUDIO X
Lx=length(audiox); % Longitud de la se�al
NFFTx = 2^nextpow2(Lx); % Siguiente potencia de 2 de la longitud del audio
Yx = fft(audiox,NFFTx)/Lx; % FFT de la se�al
fx = Fs/2*linspace(0,1,NFFTx/2+1); % Rango de frecuencia
YFx = 2*abs(Yx(1:NFFTx/2+1));
%graficar
figure('Name','Se�ales en el dominio de la frecuencia');
%figure('Name','Se�ales en el dominio de la frecuencia','NumberTitle','off');
subplot(5,2,1)
plot(fx,YFx) 
title('FFT Comando x')
xlabel('Frecuencia (Hz)')
ylabel('|Y(f)|')
%% FFT PARA AUDIO 1
L1=length(audio1); % Longitud de la se�al
NFFT1 = 2^nextpow2(L1); % Siguiente potencia de 2 de la longitud del audio
Y1 = fft(audio1,NFFT1)/L1; % FFT de la se�al
f1 = Fs/2*linspace(0,1,NFFT1/2+1); % Rango de frecuencia
YF1 = 2*abs(Y1(1:NFFT1/2+1));
%graficar
subplot(5,2,3)
plot(f1,YF1) 
title('FFT Comando 1')
xlabel('Frecuencia (Hz)')
ylabel('|Y(f)|')
%% FFT PARA AUDIO 2
L2=length(audio2); % Longitud de la se�al
NFFT2 = 2^nextpow2(L2); % Siguiente potencia de 2 de la longitud del audio
Y2 = fft(audio2,NFFT2)/L2; % FFT de la se�al
f2 = Fs/2*linspace(0,1,NFFT2/2+1); % Rango de frecuencia
YF2 = 2*abs(Y2(1:NFFT2/2+1));
%graficar
subplot(5,2,5)
plot(f2,YF2) 
title('FFT Comando 2')
xlabel('Frecuencia (Hz)')
ylabel('|Y(f)|')
%% FFT PARA AUDIO 3
L3=length(audio3); % Longitud de la se�al
NFFT3 = 2^nextpow2(L3); % Siguiente potencia de 2 de la longitud del audio
Y3 = fft(audio3,NFFT3)/L3; % FFT de la se�al
f3 = Fs/2*linspace(0,1,NFFT3/2+1); % Rango de frecuencia
YF3 = 2*abs(Y3(1:NFFT3/2+1));
%graficar
subplot(5,2,7)
plot(f3,YF3) 
title('FFT Comando 3')
xlabel('Frecuencia (Hz)')
ylabel('|Y(f)|')
%%  FFT PARA AUDIO 4
L4=length(audio4); % Longitud de la se�al
NFFT4 = 2^nextpow2(L4); % Siguiente potencia de 2 de la longitud del audio
Y4 = fft(audio4,NFFT4)/L2; % FFT de la se�al
f4 = Fs/2*linspace(0,1,NFFT4/2+1); % Rango de frecuencia
YF4 = 2*abs(Y2(1:NFFT4/2+1));
%graficar
subplot(5,2,9)
plot(f4,YF4) 
title('FFT Comando 4')
xlabel('Frecuencia (Hz)')
ylabel('|Y(f)|')
%% %% CORRELACION Y GR�FICAS EN EL DOMINIO DE LA FRECUENCIA
Cx = YFx(:,1); %se�al x en el dominio del tiempo
C1 = YF1(:,1); %se�al x en el dominio del tiempo
C2 = YF2(:,1); %se�al x en el dominio del tiempo
C3 = YF3(:,1); %se�al x en el dominio del tiempo
C4 = YF4(:,1); %se�al x en el dominio del tiempo
subplot(5,2,2)
xc=xcorr(Cx,Cx);
plot(xc)
title('Correlacion X-comando x')
xlabel('Tiempo (t)')
ylabel('Amplitud')
subplot(5,2,4)
c1=xcorr(Cx,C1);
plot(c1)
title('Correlacion X-comando 1')
xlabel('Tiempo (t)')
ylabel('Amplitud')
subplot(5,2,6)
c2=xcorr(Cx,C2);
plot(c2)
title('Correlacion X-comando 2')
xlabel('Tiempo (t)')
ylabel('Amplitud')
subplot(5,2,8)
c3=xcorr(Cx,C3);
plot(c3)
title('Correlacion X-comando 3')
xlabel('Tiempo (t)')
ylabel('Amplitud')
subplot(5,2,10)
c4=xcorr(Cx,C4);
plot(c4)
title('Correlacion X-comando 4')
xlabel('Tiempo (t)')
ylabel('Amplitud')
%% %% CORRELACI�N Y GR�FICAS EN EL DOMINIO DEL TIEMPO
fs=1/44100;
tmax=2.9954-2*fs;
t=0:fs:tmax;
t1=-tmax:fs:tmax;

T1=xcorr(audiox,audio1);
T2=xcorr(audiox,audio2);
T3=xcorr(audiox,audio3);
T4=xcorr(audiox,audio4);
Tx=xcorr(audiox,audiox);

FMAX=[max(c1),max(c2),max(c3),max(c4)]/max(xc);
TMAX = [max(T1),max(T2),max(T3),max(T4)]/max(Tx);
MX=[TMAX(1) FMAX(1);TMAX(2) FMAX(2);TMAX(3) FMAX(3);TMAX(4) FMAX(4)];

%%GR�FICAS 1%%
figure('Name','Se�ales en el dominio del tiempo');
%figure('Name','Se�ales en el dominio del tiempo','NumberTitle','off');
subplot(5,2,1)
plot(t1,Tx) 
title('TX')
xlabel('Tiempo')
ylabel('Amplitud')
subplot(5,2,3)
plot(t1,T1) 
title('T1')
xlabel('Tiempo')
ylabel('Amplitud')
subplot(5,2,5)
plot(t1,T2) 
title('T2')
xlabel('Tiempo')
ylabel('Amplitud')
subplot(5,2,7)
plot(t1,T3) 
title('T3')
xlabel('Tiempo')
ylabel('Amplitud')
subplot(5,2,9)
plot(t1,T4) 
title('T4')
xlabel('Tiempo')
ylabel('Amplitud')
%%GRAFICAR CORRELACION%%%
subplot(5,2,2)
tcx=xcorr(t,audiox);
plot(tcx)
title('Correlacion X')
xlabel('Tiempo (t)')
ylabel('Amplitud')
subplot(5,2,4)
tc1=xcorr(t,audio1);
plot(tc1)
title('Correlacion(audio 1)')
xlabel('Tiempo (t)')
ylabel('Amplitud')
subplot(5,2,6)
tc2=xcorr(t,audio2);
plot(tc2)
title('Correlacion (audio 2)')
xlabel('Tiempo (t)')
ylabel('Amplitud')
subplot(5,2,8)
tc3=xcorr(t,audio3);
plot(tc3)
title('Correlacion (audio 3)')
xlabel('Tiempo (t)')
ylabel('Amplitud')
subplot(5,2,10)
tc4=xcorr(t,audio4);
plot(tc4)
title('Correlacion (audio 4)')
xlabel('Tiempo (t)')
ylabel('Amplitud')

%TMAX = [max(tc1),max(tc2),max(tc3),max(tc4),max(tcx)];
%% %% GR�FICAS DE BARRAS
figure('Name','Correlcion entre audio X y los comandos');
%figure('Name','Correlcion entre audio X y los comandos','NumberTitle','off');
subplot(1,3,1)
title('Frecuencia')
bar(FMAX)
xlabel('Comando')
ylabel('Correlaci�n en el dominio de frecuencia')
subplot(1,3,2)
title('Tiempo')
bar(TMAX,'y')
xlabel('Comando')
ylabel('Correlaci�n en el dominio del tiempo')
subplot(1,3,3)
bar(MX,'stacked')





