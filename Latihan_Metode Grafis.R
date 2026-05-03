# ======================================
# ANALISIS DATA - METODE GRAFIS (CSV SENDIRI)
# ======================================

# Load package
library(mosaic)

# 1. Membaca dataset dari komputer
data <- read.csv2("C:/Users/Dede Iryawan/Documents/Immo-Datensatz.csv")

# Melihat struktur data (penting!)
str(data)

# =========================
# 2. Diagram Batang (Kategori)
# =========================
# Contoh: ada balkon atau tidak
gf_bar(~ balcony, data = data)

# =========================
# 3. Histogram (Numerik)
# =========================
# Contoh: distribusi harga sewa
gf_histogram(~ totalrent, data = data)

# =========================
# 4. Boxplot
# =========================
# Contoh: harga berdasarkan ada/tidak balkon
gf_boxplot(totalrent ~ balcony, data = data)

# =========================
# 5. Scatter Plot
# =========================
# Contoh: hubungan luas vs harga
gf_point(totalrent ~ livingspace, data = data)

# =========================
# 6. Mosaic Plot
# =========================
# Contoh: balkon vs dapur
mosaicplot(balcony ~ haskitchen, data = data)
