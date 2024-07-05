import numpy as np
import pandas as pd
from scipy.stats import wilcoxon

# Archivos
file_path_1 = '/Users/romananselmomoragutierrez/Documents/bootstrap/bootstrap_estimates_1.txt'
file_path = '/Users/romananselmomoragutierrez/Documents/bootstrap/bootstrap_estimates.txt'

# Cargar datos con pandas y limpiar las comas
datos = pd.read_csv(file_path, delimiter=',', header=None)
datos_1 = pd.read_csv(file_path_1, delimiter=',', header=None)

# Convertir los datos a numpy arrays
datos = datos.applymap(lambda x: float(str(x).replace(',', ''))).to_numpy()
datos_1 = datos_1.applymap(lambda x: float(str(x).replace(',', ''))).to_numpy()

# Inicializar listas para estadísticos y p-valores
stat = []
p_valor = []

# Realizar la prueba de Wilcoxon para cada columna
for i in range(datos.shape[1]):
    muestra1 = datos[:, i]
    muestra2 = datos_1[:, i]
    stat_i, p_valor_i = wilcoxon(muestra1, muestra2)
    stat.append(stat_i)
    p_valor.append(p_valor_i)

# Mostrar resultados
print(f"Estadístico de prueba: {stat}")
print(f"P-valor: {p_valor}")

# Interpretación del resultado
alpha = 0.05
for i in range(len(p_valor)):
    if p_valor[i] < alpha:
        print(f"Para la columna {i}, se rechaza la hipótesis nula: hay diferencia significativa entre las muestras.")
    else:
        print(f"Para la columna {i}, no se rechaza la hipótesis nula: no hay suficiente evidencia para afirmar que hay diferencia significativa.")
