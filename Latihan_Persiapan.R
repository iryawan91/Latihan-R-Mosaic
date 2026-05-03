# Instalasi satu kali
install.packages("mosaic", type = "binary")

# Muat paket, lakukan satu kali di setiap sesi
library(mosaic)


getwd("C:/Users/Dede Iryawan/Documents") # Direktori kerja saat ini

# Membaca tabel data csv
Daten <- read.csv2("Immo-Datensatz.csv")

# Membaca tabel data xlsx
library(readxl) # Paket untuk impor xlsx
Daten <- read_excel("Jalur/File")

# ==============================
# PENANGANAN DATA (DATASET IMMO)
# ==============================

# Load package
library(dplyr)

# 1. Membaca dataset (pakai ; sebagai pemisah)
data <- read.csv2("C:/Users/Dede Iryawan/Documents/Immo-Datensatz.csv")

# 2. Melihat struktur data
str(data)

# 3. Pipeline pengolahan data
hasil <- data %>%
  
  # Mengganti nama kolom agar lebih rapi
  rename(
    totalrent = totalrent,
    livingspace = livingspace,
    balcony = balcony,
    year = yearconstructed,
    kitchen = haskitchen,
    floor = floor,
    kualitas = interiorqual
  ) %>%
  
  # Filter: ambil rumah yang punya balkon
  filter(balcony == 1) %>%
  
  # Menambah kolom baru: harga per meter
  mutate(harga_per_m2 = totalrent / livingspace) %>%
  
  # Kategorisasi luas rumah
  mutate(kategori_luas = case_when(
    livingspace > 100 ~ "Besar",
    livingspace > 50 ~ "Sedang",
    TRUE ~ "Kecil"
  )) %>%
  
  # Status dapur
  mutate(status_dapur = ifelse(kitchen == 1, "Ada", "Tidak Ada")) %>%
  
  # Urutkan berdasarkan harga tertinggi
  arrange(desc(totalrent)) %>%
  
  # Kelompokkan berdasarkan kategori luas
  group_by(kategori_luas) %>%
  
  # Ringkasan
  summarise(
    rata_harga = mean(totalrent),
    rata_luas = mean(livingspace),
    rata_harga_m2 = mean(harga_per_m2),
    jumlah = n()
  )

# 4. Tampilkan hasil
print(hasil)

