# P1_Probstat_F_5025201039
   
## Nama-NRP
| Nama             | NRP        |
|------------------|------------|
| Abd. Wahid  | 5025201039 |

## Soal 1
>Seorang penyurvei secara acak memilih orang-orang di jalan sampai dia bertemu dengan seseorang yang menghadiri acara vaksinasi sebelumnya.
- Berapa peluang penyurvei bertemu x = 3 orang yang tidak menghadiri acara vaksinasi sebelum keberhasilan pertama ketika p = 0.20 dari populasi menghadiri acara vaksinasi? (distribusi Geometrik)
``` R
#1a
n = 3
p = 0.20
dgeom(x = n, prob = p)
```

- Mean distribusi Geometrik dengan 10000 data random, prob = 0,20 dimana distribusi geometrik acak tersebut X = 3 (distribusi Geometrik acak () == 3)
``` R
#1b
mean(rgeom(n = 10000, prob = p) == 3)
```

- Bandingkan hasil poin a dan b, apa kesimpulan yang bisa didapatkan?

Hasil dari perhitungan a dan b tidak terlalu jauh, bedanya kalau a itu nilainya tetap sedangkan kalau b itu hasilnya random, besar kecil nilainya ditentukan oleh X

- Histogram distribusi Geometrik, dengan peluang X = 3 gagal sebelum sukses pertama
``` R
data.frame(x = 0:10, prob = dgeom(x = 0:10, prob = p)) %>%
  mutate(Failures = ifelse(x == n, n, "other")) %>%
  ggplot(aes(x = factor(x), y = prob, fill = Failures)) +
  geom_col() +
  geom_text(
    aes(label = round(prob,2), y = prob + 0.01),
    position = position_dodge(0.9),
    size = 3,
    vjust = 0
  ) +
  labs(title = "Histogram Distribusi Geometrik,Peluang X = 3 gagal Sebelum Sukses Pertama",
       subtitle = "Geometric(.2)",
       x = "Kegagalan sebelum sukses yang pertama (x)",
       y = "Peluang") 
```
![1d](https://github.com/wahidabd/P1_Probstat_F_5025201039/blob/Main/capture/1.png)
- Nilai rataan (μ) dan varian (σ²) dari distribusi Geometrik
``` R
#1e
#Rataan
miu = 1/p
paste("Rataan adalah ", miu)
#varian
varian = (1-p)/ p^2
paste("varian adalah ", varian)
```
</br>

## Soal 2
> Terdapat 20 pasien menderita Covid19 dengan peluang sembuh sebesar 0.2. Tentukan :
- Peluang terdapat 4 pasien yang sembuh
``` R
Sampel = 20
Peluang_Sembuh = 0.2
Peluang_Tidak_Sembuh = 1 - Peluang_Sembuh
#2a
Pasien_Sembuh = 4
dbinom(Pasien_Sembuh, Sampel, Peluang_Sembuh)
```

- Gambarkan grafik histogram berdasarkan kasus tersebut
``` R
#2b
peluang <- dbinom(1:20, 20, 0.2)
data = data.frame(y=c(peluang), x=c(1:20))
barplot(data$y, names.arg=data$x, ylab="Peluang", xlab="Jumlah Pasien")
```
![2b](https://github.com/wahidabd/P1_Probstat_F_5025201039/blob/Main/capture/2.png)

- Nilai rataan (μ) dan varian (σ²) dari distribusi Binomial
``` R
#Nomor 2c
p = Peluang_Sembuh
q = Peluang_Tidak_Sembuh
n = Pasien_Sembuh
rataan = n*p
cat ("rataan = ", rataan, "\n")
varian = n*p*q
cat ("varian = ", varian, "\n")
```
</br>

## Soal 3
> Diketahui data dari sebuah tempat bersalin di rumah sakit tertentu menunjukkan rata-rata historis 4,5 bayi lahir di rumah sakit ini setiap hari. (gunakan Distribusi Poisson)
- Berapa peluang bahwa 6 bayi akan lahir di rumah sakit ini besok?
``` R
mean_bayi_lahir = 4.5
#3a
banyak_bayi_lahir = 6
dpois(banyak_bayi_lahir, mean_bayi_lahir)
```
- simulasikan dan buatlah histogram kelahiran 6 bayi akan lahir di rumah sakit ini selama setahun (n = 365)
``` R
#3b
peluang = dpois(banyak_bayi_lahir,mean_bayi_lahir)
data = data.frame(y=c(peluang), x=c(1:365))
barplot(data$y, names.arg=data$x, ylab="peluang", xlab="hari ke-", ylim=0:1)
```
![3b](https://github.com/wahidabd/P1_Probstat_F_5025201039/blob/Main/capture/3.png)

- bandingkan hasil poin a dan b , Apa kesimpulan yang bisa didapatkan

Dari Perhitungan yang diperoleh, didapatkan bahwa nilai distribusi poisson tidak berubah dari hari pertama hingga hari terakhir.

- Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Poisson.
``` R
#3d
lambda = mean_bayi_lahir
rataan = varian = lambda
rataan
varian
```
</br>

## Soal 4
> Diketahui nilai x = 2 dan v = 10. Tentukan:
- Fungsi Probabilitas dari Distribusi Chi-Square.
``` R
x = 2
v = 10
#4a
dchisq(x, v)
```
- Histogram dari Distribusi Chi-Square dengan 100 data random.
``` R
#4b
random_data = 100
output = rchisq(random_data, v)
hist(output)
```
![4b](https://github.com/wahidabd/P1_Probstat_F_5025201039/blob/Main/capture/4.png)

- Nilai Rataan (μ) dan Varian (σ²) dari DistribusiChi-Square.
``` R
#4c
rataan = v
rataan
varian = 2*v
varian
```
</br>

## Soal 5
> Diketahui bilangan acak (random variable) berdistribusi exponential (λ = 3). Tentukan:
- Fungsi Probabilitas dari distribusi Exponensial
``` R
lambda = 3
#5a
dexp(lambda)
```
-  Histogram dari Distribusi Exponensial untuk 10, 100, 1000 dan 10000 bilangan random
``` R
#5b
par(mfrow = c(2,2))
set.seed(1)
hist(rexp(10))
set.seed(1)
hist(rexp(100))
set.seed(1)
hist(rexp(1000))
set.seed(1)
hist(rexp(10000))
```
![5b](https://github.com/wahidabd/P1_Probstat_F_5025201039/blob/Main/capture/5.png)

- Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Exponensial untuk n = 100 dan λ = 3
``` R
#5c
rataan = lambda
rataan
varian = lambda*lambda
varian
```
</br>

## Soal 6
> Diketahui generate random nilai sebanyak 100 data, mean = 50, sd = 8. Tentukan:
- Fungsi Probabilitas dari distribusi Normal P(X1 ≤ x ≤ X2), hitung Z-Score-nya dan plot data generate randomnya dalam bentuk grafik
``` R
#6a
x1 = 0
x2 = 0
n = 100
m = 50
sd = 8
par(mfrow = c(2,1))
data = rnorm(n=n, mean=m, sd=sd)
z_array = c()
for (d in data)
  {
    z = (d - m)/sd
    z_array = append(z_array, z)
    
    if (d < m)
    {
      x1 = x1 + 1
    }
    else
    {
      x2 = x2 + 1
    }
  }
result = plot(z_array, type='l')
paste("Rata-rata adalah", m)
paste("x1 adalah", x1)
paste("x2 adalah", x2)
```

- Generate Histogram dari Distribusi Normal dengan breaks 50 dan format penamaan: ```NRP_Nama_Probstat_{Nama Kelas}_DNhistogram```
``` R
#6b
h = hist(rnorm(100, 50, 8), breaks = 50, main="5025201223_Muhammad Ismail_B_DNhistogram")
```
![6b](https://github.com/wahidabd/P1_Probstat_F_5025201039/blob/Main/capture/6.png)

-  Nilai Varian (σ²) dari hasil generate random nilai Distribusi Normal.
``` R
#6c
varian = sd*sd
paste("varian adalah", varian)
```
