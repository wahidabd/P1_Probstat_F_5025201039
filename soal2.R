# Soal 2a
# Diketahui size = 20 pasien, prob = 0.2, x = pasien
dbinom(x = 4, size = 20, prob = 0.2)

# Soal 2b
x <- 3
p <- 0.2
prob <- dbinom(x = 0:10, size = 20, prob = 0.2)

data.frame(heads = 0:10, prob) %>%
  mutate(Heads = ifelse(heads == 4, "4", "lainnya")) %>%
  ggplot(aes(x = factor(heads), y = prob, fill = Heads)) +
  geom_col(colour = "black") +
  scale_fill_manual(values = c("#669933", "#FFCC66")) +
  geom_text(aes(label = round(prob, 2), y = prob + 0.01)) +
  labs(title = "Peluang jika X = 4 pasien sembuh.", x = "Sukses (x)", y = "Peluang") 

# Soal 2c
n <- 20
p <- 0.2

# Mencari nilai rata-rata
rataan <- n * p
rataan

# Mencari nilai varian
varian <- n * p * (1 - p)
varian