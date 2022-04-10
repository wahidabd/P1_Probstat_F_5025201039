# Soal 4a
# Fungsi Probabilitas dari Distribusi Chi-Square
x <- 2
v <- 10
dchisq(x, v)

# Soal 4b
# Histogram dari Distribusi Chi-Square dengan 100 data random
# Melakukan random data
hist(rchisq(100, v))

# Soal 4c
# Inisialiasi
df <- 10
# Mencari nilai rata-rata
rataan <- df
rataan
# Mencari nilai varian
varian <- 2 * df
varian