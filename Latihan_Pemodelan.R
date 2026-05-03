# ======================================
# PEMODELAN (MODELLIERUNG)
# ======================================

# --------------------------------------
# 1. MEMBUAT DATA SEDERHANA
# --------------------------------------

# Data contoh: luas rumah dan harga
data <- data.frame(
  luas = c(50, 60, 70, 80, 90, 100),          # variabel X (input)
  harga = c(500, 600, 650, 800, 900, 1000)    # variabel Y (target)
)

# --------------------------------------
# 2. REGRESI LINEAR (lm)
# --------------------------------------

model_lm <- lm(harga ~ luas, data = data)
# Membuat model: harga dipengaruhi oleh luas

summary(model_lm)
# Melihat hasil model (koefisien, R², dll)

# --------------------------------------
# 3. RESIDUALS (SELISIH ERROR)
# --------------------------------------

residuals(model_lm)
# Selisih antara nilai asli dan prediksi

# --------------------------------------
# 4. FITTED VALUES (HASIL PREDIKSI DATA LATIH)
# --------------------------------------

fitted(model_lm)
# Nilai hasil prediksi dari model untuk data yang sama

# --------------------------------------
# 5. PREDICT (DATA BARU)
# --------------------------------------

data_baru <- data.frame(luas = c(75, 120))
# Data baru yang ingin diprediksi

predict(model_lm, newdata = data_baru)
# Prediksi harga berdasarkan luas baru

