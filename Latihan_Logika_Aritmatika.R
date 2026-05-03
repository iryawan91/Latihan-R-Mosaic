# ======================================
# LOGIKA DASAR DI R
# ======================================

# Variabel contoh
a <- 10
b <- 5

# =========================
# 1. Kesamaan (==)
# =========================
a == b       # apakah a sama dengan b? (FALSE)
a == 10      # apakah a sama dengan 10? (TRUE)

# =========================
# 2. Ketidaksamaan (!=)
# =========================
a != b       # apakah a tidak sama dengan b? (TRUE)

# =========================
# 3. Lebih besar / kecil
# =========================
a > b        # apakah a lebih besar dari b? (TRUE)
a < b        # apakah a lebih kecil dari b? (FALSE)
a >= 10      # apakah a >= 10? (TRUE)
b <= 5       # apakah b <= 5? (TRUE)

# =========================
# 4. Operator DAN (&)
# =========================
(a > 5) & (b < 10)    # TRUE karena dua-duanya benar
(a > 5) & (b > 10)    # FALSE karena salah satu salah

# =========================
# 5. Operator ATAU (|)
# =========================
(a > 5) | (b > 10)    # TRUE karena salah satu benar
(a < 5) | (b > 10)    # FALSE karena dua-duanya salah

# =========================
# 6. Kombinasi Logika
# =========================
(a > 5 & b < 10) | (a == b)

# =========================
# 7. Logika dalam IF
# =========================
if (a > b) {
  print("a lebih besar dari b")
}

if (a == b) {
  print("a sama dengan b")
} else {
  print("a tidak sama dengan b")
}

# ======================================
# ARITMETIKA DI R
# ======================================

# Variabel contoh
a <- 10
b <- 5

# =========================
# 1. Operasi dasar
# =========================
a + b     # penjumlahan → 15
a - b     # pengurangan → 5
a * b     # perkalian → 50
a / b     # pembagian → 2

# =========================
# 2. Pangkat (^)
# =========================
a^2       # 10 pangkat 2 → 100
b^3       # 5 pangkat 3 → 125

# =========================
# 3. Akar kuadrat (sqrt)
# =========================
sqrt(a)   # akar dari 10
sqrt(25)  # hasilnya 5

# =========================
# 4. Eksponensial (e^x)
# =========================
exp(1)    # e^1 → sekitar 2.718
exp(2)    # e^2

# =========================
# 5. Logaritma natural (ln)
# =========================
log(a)    # ln(10)
log(1)    # ln(1) = 0

# =========================
# 6. Nilai mutlak (abs)
# =========================
abs(-10)      # hasilnya 10
abs(a - 20)   # nilai mutlak dari (10 - 20) = 10

# =========================
# 7. Kombinasi operasi
# =========================
hasil <- (a + b) * 2 - sqrt(25) + log(a)

print(hasil)