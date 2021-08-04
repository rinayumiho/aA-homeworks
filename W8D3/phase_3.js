function dinerBreakfast(){
    order = ["cheesy scrambled eggs"];
    console.log(`I'd like ${order[0]} please.`)

    return function(newfood) {
        order.push(newfood);
        foods = order.join(" and ");
        console.log(`I'd like ${foods} please.`)
    };
}

// let bfastOrder = dinerBreakfast();
// bfastOrder("chocolate chip pancakes");
// bfastOrder("grits");