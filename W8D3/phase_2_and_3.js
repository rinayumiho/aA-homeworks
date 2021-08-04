function Elephant(name, height, tricks){
    this.name = name;
    this.height = height;
    if(tricks === undefined){
        this.tricks = [];
    }else{
        this.tricks = tricks;
    }
    
}

Elephant.paradeHelper = function(e){
    console.log(`${e.name} is trotting by!`)
}

Elephant.prototype.trumpet = function(){
    console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`)
}

Elephant.prototype.grow = function(){
    this.height += 12;
}

Elephant.prototype.addTrick = function(trick) {
    this.tricks.push(trick);
}

Elephant.prototype.play = function(){
    let trick = this.tricks[Math.floor(Math.random() * this.tricks.length)];
    console.log(`${this.name} is ${trick}`);
}


let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

herd.forEach(e => Elephant.paradeHelper(e));

// e = new Elephant("Bob", 10);
// e.trumpet();
// e.grow();
// console.log(e.height);
// e.addTrick("playing games");
// e.addTrick("Watching TV");
// e.addTrick("Reading books");
// e.play();
// e.play();