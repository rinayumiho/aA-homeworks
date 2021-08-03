// import {isPrime} from './isPrime.js';

function isPrime(num){
    if(num < 2){
        return false;
    }
    for(let i = 2; i < num; i ++){
        if(num % i == 0) return false;
    }
    return true;
}

function sumOfNPrimes(n){
    let sum = 0;
    let num = 1;
    while(n > 0){
        if(isPrime(num)){
            sum += num;
            n --;
        }
        num ++;
    }
    return sum;
}

console.log(sumOfNPrimes(0))
console.log(sumOfNPrimes(1))
console.log(sumOfNPrimes(4))