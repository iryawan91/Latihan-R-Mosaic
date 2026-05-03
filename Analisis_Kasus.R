# Persiapan (Vorbereitung):
library(mosaic)    # Memuat paket mosaic
data(KidsFeet)     # Memuat tabel data internal
str(KidsFeet)      # Melihat struktur tabel data
?KidsFeet          # Bantuan, informasi mengenai tabel data


# Satu Variabel Kategorik
gf_bar( ~ domhand, data = KidsFeet) # Membuat diagram batang untuk variabel tangan dominan (domhand).
tally( ~ domhand, data = KidsFeet) # Membuat tabel frekuensi/jumlah siswa berdasarkan tangan dominan.
prop( ~ domhand, success = "L", data = KidsFeet) # Menghitung proporsi siswa yang menggunakan tangan kiri (success = "L").


# Satu Variabel Metrik/Numerik
gf_histogram( ~ length, data = KidsFeet) # Membuat histogram untuk melihat distribusi panjang kaki (length).
favstats( ~ length, data = KidsFeet) # Menampilkan ringkasan statistik lengkap (Mean, Median, SD, Kuartil, dll.) untuk variabel panjang kaki.

# Dua Variabel Kategorik
mosaicplot(domhand ~ biggerfoot, data = KidsFeet) # Membuat plot mosaik untuk melihat hubungan antara tangan dominan dan kaki yang lebih besar.
tally(biggerfoot ~ domhand, data = KidsFeet) # Membuat tabel kontingensi (tabulasi silang) antar dua variabel.
xchisq.test(biggerfoot ~ domhand, data = KidsFeet) # Melakukan uji Chi-Square untuk melihat apakah ada hubungan yang signifikan antar variabel.

# Dua Variabel Metrik/Numerik
gf_point(width ~ length, data = KidsFeet) # Membuat diagram pencar (scatter plot) antara lebar (width) dan panjang kaki (length).
cor(width ~ length, data = KidsFeet) # Menghitung koefisien korelasi.
cor.test(width ~ length, data = KidsFeet) # Melakukan uji signifikansi korelasi.

# Regresi Linear
erglm <- lm(width ~ length + sex, data = KidsFeet) # Membuat model regresi linear untuk memprediksi lebar kaki (width) berdasarkan panjang kaki (length) dan jenis kelamin (sex).
plotModel(erglm) # Menampilkan grafik dari model tersebut. Seperti yang terlihat pada gambar, ini menghasilkan dua garis regresi yang berbeda (paralel) untuk masing-masing kelompok jenis kelamin (B untuk Boys dan G untuk Girls).
summary(erglm) # Menampilkan detail statistik dari model, termasuk nilai koefisien, nilai p (p-value), dan seberapa baik model tersebut menjelaskan data

# Regresi Logistik
ergglm <- glm(sex ~ length, family = binomial, data = KidsFeet) # Membuat model Generalized Linear Model (GLM) untuk regresi logistik. Di sini kita mencoba memprediksi probabilitas jenis kelamin (sex) berdasarkan panjang kaki (length). Penggunaan family = binomial wajib ada untuk memberi tahu R bahwa ini adalah regresi logistik
plotModel(ergglm) # Menampilkan kurva sigmoid (S-curve) yang menunjukkan perubahan probabilitas. Titik-titik di bagian atas (G) dan bawah (B) mewakili data asli.
summary(ergglm) # Memberikan ringkasan statistik model, termasuk nilai koefisien logit, signifikansi variabel, dan nilai AIC (untuk membandingkan kualitas model).
# Odds Ratio
exp(coef(ergglm)) # Karena hasil standar regresi logistik adalah dalam skala log-odds, kita menggunakan fungsi eksponensial exp() untuk mendapatkan Odds Ratio. Ini memudahkan kita untuk menginterpretasikan seberapa besar peluang variabel target berubah seiring bertambahnya nilai prediktor.

# Penanganan Data
# Memilih variabel (Variablen selektieren)
KidsFeet.length <- KidsFeet %>%
  select(length)

# Memilih observasi (Beobachtungen auswählen)
KidsFeet.boys <- KidsFeet %>%
  filter(sex == "B")

# Membuat variabel baru (Variablen erzeugen)
KidsFeet.in <- KidsFeet %>%
  mutate(length.in = 0.394 * length)

# Kondisi (Bedingungen)
KidsFeet.grouped <- KidsFeet %>%
  mutate(length.grouped = case_when(
    length > 25 ~ "large",
    length <= 25 ~ "not large"
  ))


set.seed(1896) # Mengunci angka acak agar hasil simulasi tetap sama setiap kali koding dijalankan.

# Simulasi bootstrap (10000 kali)
Bootvtlg <- do(10000) * mean(~ length, data = resample(KidsFeet))
# Mengambil sampel ulang (dengan pengembalian) lalu hitung rata-rata

# Distribusi bootstrap (histogram)
gf_histogram(~ mean, data = Bootvtlg)
# Visualisasi distribusi dari hasil bootstrap

# Standard Error (kesalahan standar)
sd(~ mean, data = Bootvtlg)
# Menghitung simpangan baku dari distribusi bootstrap

# Menghitung Interval Kepercayaan (CI)
qdata( ~ mean, p = c(0.025, 0.975),
       data = Bootvtlg)

#Uji Permutsai
set.seed(1896)

# Perbedaan yang diamati (Beobachtete Differenz)
est.diff <- diffmean(length ~ sex, data = KidsFeet)

# Simulasi pengacakan kelompok (Simuliere zufällige Zuordnung)
Nullvtlg <- do(10000) * 
  diffmean(length ~ shuffle(sex), data = KidsFeet)

# Distribusi di bawah H0 (Verteilung unter H_0)
gf_histogram( ~ diffmean, data = Nullvtlg) %>%
  gf_vline(xintercept = ~ est.diff)

# Menghitung p-value
prop( ~ abs(diffmean) >= abs(est.diff), 
      data = Nullvtlg) 
