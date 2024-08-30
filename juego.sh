#!/bin/bash

# Función para generar un número aleatorio
generar_numero() {
    echo $(( RANDOM % 10 + 1 ))
}

# Función para generar una operación aleatoria
generar_operacion() {
    operaciones=("+", "-", "*")
    echo ${operaciones[$(( RANDOM % 3 ))]}
}

# Función para realizar la operación y verificar la respuesta
jugar() {
    num1=$(generar_numero)
    num2=$(generar_numero)
    operacion=$(generar_operacion)
    resultado=0

    case $operacion in
        +) resultado=$((num1 + num2)) ;;
        -) resultado=$((num1 - num2)) ;;
        '*') resultado=$((num1 * num2)) ;;
    esac

    while true; do
        echo -n "¿Cuánto es $num1 $operacion $num2? "
        read respuesta
        if [[ $respuesta -eq $resultado ]]; then
            echo "¡Correcto!"
            break
        else
            echo "Incorrecto, intenta nuevamente."
        fi
    done
}

# Juego principal
while true; do
    jugar
    echo -n "¿Quieres jugar otra vez? (s/n): "
    read jugar_otra_vez
    if [[ $jugar_otra_vez != 's' ]]; then
        echo "Gracias por jugar. ¡Hasta luego!"
        break
    fi
done
