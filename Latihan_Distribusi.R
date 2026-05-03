# ======================================
# DISTRIBUSI NORMAL (NORMALVERTEILUNG)
# ======================================

# Load package mosaic
library(mosaic)

# Membuat data sederhana (contoh nilai ujian)
nilai <- c(60, 65, 70, 75, 80, 85, 90, 75, 70, 80)

# =========================
# 1. xpnorm() → Probabilitas (CDF)
# =========================
xpnorm(75, mean(nilai), sd(nilai))
# Menghitung peluang nilai ≤ 75 dalam distribusi normal

# =========================
# 2. xqnorm() → Kuantil
# =========================
xqnorm(0.5, mean(nilai), sd(nilai))
# Menghitung nilai tengah (median) berdasarkan distribusi normal

xqnorm(0.95, mean(nilai), sd(nilai))
# Menghitung nilai batas atas (95%)

# =========================
# 3. gf_qq() → QQ Plot
# =========================
gf_qq(~ nilai)
# Membuat grafik QQ untuk mengecek apakah data berdistribusi normal
