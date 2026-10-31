% L0325035_ValdaAnabela
% Nomor 1: Perhitungan Nilai y(2) & Tabel Iterasi
% Persamaan: dy/dx = (4*x^3 - 2*x + 1) / (2 + y), y(0) = 1, N = 15

% 1. Definisi Fungsi dy/dx dan Solusi Analitik
f = @(x, y) (4*x^3 - 2*x + 1) / (2 + y);
solusi_eksak = @(x) sqrt(2*x^4 - 2*x^2 + 2*x + 9) - 2;

% 2. Parameter Iterasi
x_awal = 0.0;
y_awal = 1.0;
x_target = 2.0;
N = 15;
h = (x_target - x_awal) / N;

y_exact = solusi_eksak(x_target);

% A. METODE EULER
x = x_awal; y = y_awal;
tabel_euler = zeros(N, 5);

for i = 0:N-1
    fi = f(x, y);
    y_next = y + h * fi;
    tabel_euler(i+1, :) = [i, x, y, fi, y_next];
    x = x + h;
    y = y_next;
end
y_euler = y;

% B. METODE HEUN
x = x_awal; y = y_awal;
tabel_heun = zeros(N, 6);

for i = 0:N-1
    k1 = f(x, y);
    k2 = f(x + h, y + k1 * h);
    y_next = y + (h / 2) * (k1 + k2);
    tabel_heun(i+1, :) = [i, x, y, k1, k2, y_next];
    x = x + h;
    y = y_next;
end
y_heun = y;

% C. METODE RUNGE-KUTTA ORDE-4
x = x_awal; y = y_awal;
tabel_rk4 = zeros(N, 8);

for i = 0:N-1
    k1 = f(x, y);
    k2 = f(x + h/2, y + k1 * h / 2);
    k3 = f(x + h/2, y + k2 * h / 2);
    k4 = f(x + h, y + k3 * h);
    y_next = y + (h / 6) * (k1 + 2*k2 + 2*k3 + k4);
    tabel_rk4(i+1, :) = [i, x, y, k1, k2, k3, k4, y_next];
    x = x + h;
    y = y_next;
end
y_rk4 = y;

% PENCETAKAN TABEL ITERASI DAN HASIL NOMOR 1

% 1. Tabel Iterasi Metode Euler
fprintf('====================================================================\n');
fprintf('                    TABEL ITERASI METODE EULER\n');
fprintf('====================================================================\n');
fprintf('  i         xi          yi           f(xi,yi)        yi+1\n');
fprintf('--------------------------------------------------------------------\n');
for r = 1:N
    fprintf('%3d  %10.4f  %11.4f  %13.4f  %11.4f\n', tabel_euler(r, :));
end

% 2. Tabel Iterasi Metode Heun
fprintf('\n====================================================================\n');
fprintf('                 TABEL ITERASI METODE HEUN (RK-2)\n');
fprintf('====================================================================\n');
fprintf('  i         xi          yi          k1          k2          yi+1\n');
fprintf('--------------------------------------------------------------------\n');
for r = 1:N
    fprintf('%3d  %10.4f  %10.4f  %10.4f  %10.4f  %10.4f\n', tabel_heun(r, :));
end

% 3. Tabel Iterasi Metode
fprintf('\n===========================================================================================\n');
fprintf('                            TABEL ITERASI METODE RUNGE-KUTTA ORDE-4\n');
fprintf('===========================================================================================\n');
fprintf('  i         xi          yi          k1          k2          k3          k4          yi+1\n');
fprintf('-------------------------------------------------------------------------------------------\n');
for r = 1:N
    fprintf('%3d  %10.4f  %10.4f  %10.4f  %10.4f  %10.4f  %10.4f  %10.4f\n', tabel_rk4(r, :));
end

% 4. Hasil Akhir Nilai y(2)
fprintf('\n====================================================================\n');
fprintf('               HASIL SOAL 1: PERHITUNGAN NILAI y(2)\n');
fprintf('====================================================================\n');
fprintf('Nilai Eksak (Analitik) y(2) = %.10f  (sqrt(37) - 2)\n', y_exact);
fprintf('Nilai Metode Euler y(2)     = %.10f\n', y_euler);
fprintf('Nilai Metode Heun y(2)      = %.10f\n', y_heun);
fprintf('Nilai Metode RK-4 y(2)      = %.10f\n', y_rk4);
