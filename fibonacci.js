
var fibonacciResult=0;
var inicio=5;
var fin=20;

var fibonacci = (ini1, ini2, limit) => {
    var a = ini1;
    var b = ini2;
    var suma = a + "," + b;

    inicio = ini1;
    fin = limit;

    while (true) {
        var siguiente = a + b;
        if (siguiente > limit){
            break;
        }
        suma += "," + siguiente;
        a = b;
        b = siguiente;
    }
    fibonacciResult = suma;
    console.log(suma);
};


console.log(fibonacci(5, 6, 300));



//map
var fibonacciMap;
var inicio;
var fin;

var fibonacci = (ini1, ini2, limit) => {
    var a = ini1;
    var b = ini2;
    var index = 0;
    var fibMap = new Map();

    inicio = ini1;
    fin = limit;

    fibMap.set(index++, a);
    fibMap.set(index++, b);

    while (true) {
        var siguiente = a + b;
        if (siguiente > limit){
            break;
        }
        fibMap.set(index++, siguiente);
        a = b;
        b = siguiente;
    }
    fibonacciMap = fibMap;
    return fibMap;
};

console.log(fibonacci(5, 6, 300));

//set
var fibonacciSet;
var inicio;
var fin;

var fibonacci = (ini1, ini2, limit) => {
    var a = ini1;
    var b = ini2;
    var fib = new Set();

    inicio = ini1;
    fin = limit;

    fib.add(a);
    fib.add(b);

    while (true) {
        var siguiente = a + b;
        if (siguiente > limit){
            break;
        }
        fib.add(siguiente);
        a = b;
        b = siguiente;
    }
    fibonacciSet = fib;
    console.log(fib);
};

console.log(fibonacci(5, 6, 300));



//array
var fibonacciArray;
var inicio;
var fin;

var fibonacci = (ini1, ini2, limit) => {
    var a = ini1;
    var b = ini2;
    var fib = [a, b];

    inicio = ini1;
    fin = limit;

    while (true) {
        var siguiente = a + b;
        if (siguiente > limit){
            break;
        }
        fib.push(siguiente);
        a = b;
        b = siguiente;
    }
    fibonacciArray = fib;
    console.log(fib);
};

console.log(fibonacci(5, 6, 300));
