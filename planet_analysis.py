import pandas as pd
import matplotlib.pyplot as plt

data = pd.read_csv("exoplanets.csv")

print("Mean orbital period:", data["orbital_period"].mean())
print("Median orbital period:", data["orbital_period"].median())
print("Mean planet mass:", data["planet_mass"].mean())

data["orbital_period"].hist()
plt.title("Orbital Period Distribution")
plt.xlabel("Days")
plt.ylabel("Number of planets")
plt.savefig("orbit_hist.png")