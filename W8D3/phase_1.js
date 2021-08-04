function titleize(arr, callback){
    arr2 = arr.map(ele => {
        return `Mx. ${ele} Jingleheimer Schmidt`
    });
    arr2.forEach(ele => {
        callback(ele);
    });
}

function callback(str){
    console.log(str);
    
}

titleize(["Mary", "Brian", "Leo"], callback);