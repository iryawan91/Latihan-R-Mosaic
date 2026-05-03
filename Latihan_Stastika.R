# ======================================
# INDIKATOR STATISTIK (KENNZAHLEN)
# ======================================

# Memanggil package mosaic (untuk fungsi statistik)
library(mosaic)

# Membaca dataset dari folder Documents (gunakan ; sebagai pemisah)
data <- read.csv2("C:/Users/Dede Iryawan/Documents/Immo-Datensatz.csv")

# Mengubah variabel kategori menjadi faktor (agar dikenali sebagai kategori)
data$balcony <- as.factor(data$balcony)        # 0 = tidak ada balkon, 1 = ada balkon
data$haskitchen <- as.factor(data$haskitchen)  # 0 = tidak ada dapur, 1 = ada dapur
data$interiorqual <- as.factor(data$interiorqual)  # kualitas interior (kategori)

# =========================
# 1. tally() → frekuensi
# =========================
tally(~ balcony, data = data)   # menghitung jumlah rumah dengan dan tanpa balkon

# =========================
# 2. prop() → proporsi
# =========================
prop(~ balcony, data = data)    # menghitung persentase rumah dengan dan tanpa balkon

# =========================
# 3. count() → jumlah data
# =========================
count(~ balcony, data = data)   # menghitung jumlah data berdasarkan kategori balkon

# =========================
# 4. diffprop() → selisih proporsi
# =========================
diffprop(balcony ~ haskitchen, data = data)  
# membandingkan proporsi balkon berdasarkan ada/tidaknya dapur

# =========================
# 5. favstats() → ringkasan statistik
# =========================
favstats(~ totalrent, data = data)  
# menampilkan min, max, mean, median, dll dari harga sewa

# =========================
# 6. sum() → total
# =========================
sum(~ totalrent, data = data)  
# menghitung total seluruh harga sewa

# =========================
# 7. diffmean() → selisih rata-rata
# =========================
diffmean(totalrent ~ balcony, data = data)  
# menghitung selisih rata-rata harga antara rumah dengan balkon dan tanpa balkon

# =========================
# 8. cor() → korelasi
# =========================
cor(totalrent ~ livingspace, data = data)  
# menghitung hubungan antara luas rumah dan harga sewa

# =========================
# 9. pdata() → distribusi empiris
# =========================
pdata(~ totalrent, data = data)  
# melihat distribusi kumulatif dari harga sewa

# =========================
# 10. qdata() → kuantil
# =========================
qdata(~ totalrent, p = c(0.25, 0.5, 0.75), data = data)  
# menghitung kuartil (Q1, median, Q3) dari harga sewa

