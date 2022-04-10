mean_bayi_lahir = 4.5
#3a
banyak_bayi_lahir = 6
dpois(banyak_bayi_lahir, mean_bayi_lahir)

#3b
peluang = dpois(banyak_bayi_lahir,mean_bayi_lahir)
data = data.frame(y=c(peluang), x=c(1:365))
barplot(data$y, names.arg=data$x, ylab="peluang", xlab="hari ke-", ylim=0:1)

#3c
# Dari Perhitungan yang diperoleh, didapatkan bahwa nilai distribusi poisson tidak berubah dari hari pertama hingga hari terakhir.

#3d
lambda = mean_bayi_lahir
rataan = varian = lambda
rataan
varian