import java.util.Scanner
fun main() {
    val scanner = Scanner(System.`in`)

    while (true) {
        println("Seleccione una operación:")
        println("1. Suma")
        println("2. Resta")
        println("3. Multiplicación")
        println("4. División")
        println("5. Salir")

        when (val choice = scanner.nextInt()) {
            1 -> sum()
            2 -> subtract()
            3 -> multiply()
            4 -> divide()
            5 -> {
                println("Saliendo...")
                return
            }
            else -> println("Opción no válida. Por favor, seleccione una opción del 1 al 5.")
        }
    }
}

fun sum() {
    val scanner = Scanner(System.`in`)
    println("Introduce el primer número:")
    val num1 = scanner.nextDouble()
    println("Introduce el segundo número:")
    val num2 = scanner.nextDouble()
    val result = num1 + num2
    println("La suma de $num1 y $num2 es: $result")
}

fun subtract() {
    val scanner = Scanner(System.`in`)
    println("Introduce el primer número:")
    val num1 = scanner.nextDouble()
    println("Introduce el segundo número:")
    val num2 = scanner.nextDouble()
    val result = num1 - num2
    println("La resta de $num1 y $num2 es: $result")
}

fun multiply() {
    val scanner = Scanner(System.`in`)
    println("Introduce el primer número:")
    val num1 = scanner.nextDouble()
    println("Introduce el segundo número:")
    val num2 = scanner.nextDouble()
    val result = num1 * num2
    println("La multiplicación de $num1 y $num2 es: $result")
}

fun divide() {
    val scanner = Scanner(System.`in`)
    println("Introduce el dividendo:")
    val dividend = scanner.nextDouble()
    println("Introduce el divisor:")
    val divisor = scanner.nextDouble()
    if (divisor == 0.0) {
        println("No se puede dividir por cero")
        return
    }
    val result = dividend / divisor
    println("La división de $dividend entre $divisor es: $result")
}
