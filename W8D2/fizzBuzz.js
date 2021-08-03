function fizzBuzz(arr){
    res = [];
    for(let i = 0; i < arr.length; i ++){
        let val = arr[i];
        if(val % 3 == 0 && val % 5 != 0 || val % 3 != 0 && val % 5 == 0){
            res.push(val);
        }
    }
    return res;
}

console.log(fizzBuzz([3,4,5,6,7,15]))