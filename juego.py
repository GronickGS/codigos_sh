import random

def generar_numero():
    return random.randint(1, 100)

def generar_operacion():
    operaciones = ['+', '-', '*']
    return random.choice(operaciones)

def calcular_resultado(num1, num2, operacion):
    if operacion == '+':
        return num1 + num2
    elif operacion == '-':
        return num1 - num2
    elif operacion == '*':
        return num1 * num2

def jugar():
    num1 = generar_numero()
    num2 = generar_numero()
    operacion = generar_operacion()
    resultado_correcto = calcular_resultado(num1, num2, operacion)

    while True:
        try:
            respuesta = int(input(f"¿Cuánto es {num1} {operacion} {num2}? "))
            if respuesta == resultado_correcto:
                print("¡Correcto!")
                break
            else:
                print("Incorrecto, intenta nuevamente.")
        except ValueError:
            print("Por favor, ingresa un número válido.")

def main():
    while True:
        jugar()
        jugar_otra_vez = input("¿Quieres jugar otra vez? (s/n): ").strip().lower()
        if jugar_otra_vez != 's':
            print("Gracias por jugar. ¡Hasta luego!")
            break

if __name__ == "__main__":
    main()
