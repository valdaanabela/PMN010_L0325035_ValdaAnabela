% L0325035_ValdaAnabela
% Nomor 2: Perhitungan Galat Abstrak (Mutlak) & Galat Relatif
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

% A. HITUNG METODE EULER
x = x_awal; y = y_awal;
for i = 0:N-1
    y = y + h * f(x, y);
    x = x + h;
end
y_euler = y;

% B. HITUNG METODE HEUN
x = x_awal; y = y_awal;
for i = 0:N-1
    k1 = f(x, y);
    k2 = f(x + h, y + k1 * h);
    y = y + (h / 2) * (k1 + k2);
    x = x + h;
end
y_heun = y;

% C. HITUNG METODE RK-4
x = x_awal; y = y_awal;
for i = 0:N-1
    k1 = f(x, y);
    k2 = f(x + h/2, y + k1 * h / 2);
    k3 = f(x + h/2, y + k2 * h / 2);
    k4 = f(x + h, y + k3 * h);
    y = y + (h / 6) * (k1 + 2*k2 + 2*k3 + k4);
    x = x + h;
end
y_rk4 = y;

% D. PERHITUNGAN GALAT ABSTRAK & RELATIF

% 1. Galat Euler
galat_abs_euler = abs(y_exact - y_euler);
galat_rel_euler = (galat_abs_euler / abs(y_exact)) * 100;

% 2. Galat Heun
galat_abs_heun = abs(y_exact - y_heun);
galat_rel_heun = (galat_abs_heun / abs(y_exact)) * 100;

% 3. Galat
galat_abs_rk4 = abs(y_exact - y_rk4);
galat_rel_rk4 = (galat_abs_rk4 / abs(y_exact)) * 100;

% --- PENCETAKAN HASIL GALAT ---
fprintf('====================================================================\n');
fprintf('          HASIL SOAL 2: ANALISIS GALAT ABSTRAK & RELATIF\n');
fprintf('====================================================================\n');
fprintf('Solusi Eksak y(2) = %.10f\n\n', y_exact);

fprintf('[METODE EULER]\n');
fprintf('  Nilai Pendekatan y(2) : %.10f\n', y_euler);
fprintf('  Galat Abstrak (Mutlak): %.10f\n', galat_abs_euler);
fprintf('  Galat Relatif         : %.6f%%\n\n', galat_rel_euler);

fprintf('[METODE HEUN (RK-2)]\n');
fprintf('  Nilai Pendekatan y(2) : %.10f\n', y_heun);
fprintf('  Galat Abstrak (Mutlak): %.10f\n', galat_abs_heun);
fprintf('  Galat Relatif         : %.6f%%\n\n', galat_rel_heun);

fprintf('[METODE RUNGE-KUTTA ORDE-4]\n');
fprintf('  Nilai Pendekatan y(2) : %.10f\n', y_rk4);
fprintf('  Galat Abstrak (Mutlak): %.10f\n', galat_abs_rk4);
fprintf('  Galat Relatif         : %.6f%%\n\n', galat_rel_rk4);

fprintf('====================================================================\n');
fprintf('                    TABEL RINGKASAN GALAT\n');
fprintf('====================================================================\n');
fprintf('Metode           Galat Abstrak (Mutlak)       Galat Relatif (%%)\n');
fprintf('--------------------------------------------------------------------\n');
fprintf('Euler            %22.10f      %15.6f%%\n', galat_abs_euler, galat_rel_euler);
fprintf('Heun (RK-2)      %22.10f      %15.6f%%\n', galat_abs_heun, galat_rel_heun);
fprintf('RK-4             %22.10f      %15.6f%%\n', galat_abs_rk4, galat_rel_rk4);
