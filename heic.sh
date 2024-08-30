#!/bin/bash

# Pedir la ruta de la carpeta de entrada
read -p "Introduce la ruta de la carpeta con archivos HEIC: " input_dir

# Verificar si la carpeta de entrada existe
if [ ! -d "$input_dir" ]; then
    echo "La carpeta especificada no existe."
    exit 1
fi

# Crear la carpeta de salida dentro de la carpeta de entrada
output_dir="$input_dir/convertidos"
mkdir -p "$output_dir"

# Verificar si hay archivos HEIC en la carpeta y convertirlos
found_files=false

for heic_file in "$input_dir"/*.heic "$input_dir"/*.HEIC; do
    if [ -e "$heic_file" ]; then
        found_files=true
        # Obtener el nombre del archivo sin la extensión
        base_name=$(basename "$heic_file" .heic)
        base_name=$(basename "$base_name" .HEIC)
        # Convertir HEIC a JPG
        heif-convert "$heic_file" "$output_dir/$base_name.jpg"
    fi
done

if [ "$found_files" = false ]; then
    echo "No se encontraron archivos HEIC en la carpeta especificada."
    exit 1
fi

echo "Conversión completada. Los archivos JPG se encuentran en '$output_dir'."
