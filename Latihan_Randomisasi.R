# ======================================
# RANDOMISASI & SIMULASI
# ======================================

# Load package mosaic
library(mosaic)

# =========================
# 1. set.seed() → agar hasil random tetap sama
# =========================
set.seed(123)  
# Mengatur angka awal random supaya hasil bisa diulang (reproducible)

# =========================
# 2. rflip() → simulasi lempar koin
# =========================
rflip(10)  
# Simulasi 10 kali lempar koin (hasil: H = Head, T = Tail)

# =========================
# 3. do() → pengulangan simulasi
# =========================
hasil_koin <- do(5) * rflip(10)
# Mengulang simulasi lempar 10 koin sebanyak 5 kali

print(hasil_koin)  # menampilkan hasil

# =========================
# 4. sample() → tanpa pengembalian
# =========================
sample(1:10, 5)
# Mengambil 5 angka dari 1–10 tanpa pengulangan

# =========================
# 5. resample() → dengan pengembalian
# =========================
data <- c(10, 20, 30, 40, 50)

resample(data, 5)
# Mengambil 5 sampel dari data, bisa ada angka yang terulang

# =========================
# 6. shuffle() → mengacak data
# =========================
shuffle(data)
# Mengacak urutan data
