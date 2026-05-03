# ======================================
# INFERENSI (UJI STATISTIK)
# ======================================

# Load package mosaic (untuk xchisq.test)
library(mosaic)

# --------------------------------------
# 1. DATA SEDERHANA
# --------------------------------------

# Contoh data: hasil ujian 2 kelas
kelas_A <- c(70, 75, 80, 85, 90)
kelas_B <- c(65, 70, 75, 70, 60)

# Contoh data kategori
lulus <- c(1,1,1,0,1,1,0,1,1,0)   # 1 = lulus, 0 = tidak

# --------------------------------------
# 2. prop.test() → UJI PROPORSI
# --------------------------------------

prop.test(sum(lulus), length(lulus))
# Menguji apakah proporsi lulus signifikan

# --------------------------------------
# 3. xchisq.test() → UJI CHI-SQUARE
# --------------------------------------

# Membuat tabel kategori (contoh: gender vs lulus)
gender <- c("L","L","P","P","L","P","L","P","L","P")

data_kategori <- data.frame(gender, lulus)

xchisq.test(lulus ~ gender, data = data_kategori)
# Menguji apakah ada hubungan antara gender dan kelulusan

# --------------------------------------
# 4. t.test() → UJI RATA-RATA
# --------------------------------------

t.test(kelas_A, kelas_B)
# Menguji apakah rata-rata kelas A dan B berbeda signifikan

# --------------------------------------
# 5. aov() → ANOVA
# --------------------------------------

# Menggabungkan data ke dalam satu data frame
nilai <- c(kelas_A, kelas_B)
kelas <- factor(c(rep("A",5), rep("B",5)))

data_anova <- data.frame(nilai, kelas)

model_aov <- aov(nilai ~ kelas, data = data_anova)
# Membuat model ANOVA

summary(model_aov)
# Melihat hasil ANOVA

