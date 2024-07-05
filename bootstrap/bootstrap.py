import numpy as np
import os
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

def bootstrap_bias(datos, num_samples):
    filas, columnas = datos.shape
    bootstrap_estimates = np.zeros((num_samples, columnas))
    
    for i in range(num_samples):
        N_muestra = np.zeros((filas, columnas))
        
        for j in range(filas):
            seleccion = np.random.randint(0, filas)
            N_muestra[j, :] = datos[seleccion, :]
        
        Valor_1 = np.mean(N_muestra, axis=0)
        Valor_1 = Valor_1 / np.sum(Valor_1)
        bootstrap_estimates[i, :] = Valor_1
    
    return bootstrap_estimates

def grafica_violin(Datos):
    plt.figure(figsize=(12, 8))
    filas, columnas = Datos.shape
    
    num_filas = (columnas // 2) + (columnas % 2)
    
    for i in range(columnas):
        plt.subplot(num_filas, 2, i+1)
        sns.violinplot(x=Datos[:, i])
        
        if i == 0:
            plt.title(f'MB')
        elif i == 1:
            plt.title(f'B')
        elif i == 2:
            plt.title(f's')
        elif i == 3:
            plt.title(f'NA')
        else:
            plt.title(f'-')
        
        plt.xlabel('')
        plt.ylabel('Valor')
    
    plt.tight_layout()
    plt.show()



# Ruta al archivo de datos
file_path = '++++ poner ruta+++++'

# Cargar datos desde el archivo
datos = np.loadtxt(file_path)

# Número de muestras bootstrap
num_samples = 1000

# Ruta para guardar el archivo de salida
output_dir = '++++ poner ruta+++++'
file_path_output = os.path.join(output_dir, 'bootstrap_estimates_1.txt')

# Crear el directorio de salida si no existe
if not os.path.exists(output_dir):
    os.makedirs(output_dir)

# Obtener las estimaciones bootstrap
bootstrap_estimates = bootstrap_bias(datos, num_samples)

# Guardar los datos en un archivo de texto
np.savetxt(file_path_output, bootstrap_estimates, fmt='%.6f', delimiter=', ')

print(f"Archivo guardado correctamente en {file_path_output}")

# Generar y mostrar diagramas de violín para las estimaciones bootstrap
grafica_violin(bootstrap_estimates)
