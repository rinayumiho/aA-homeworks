function isSubstring(searchString, subString){
    if (searchString.indexOf(subString) == -1) {
        return false;
    } 
    return true;
}

console.log(isSubstring("time to program", "time"))
cpnsole.log(isSubstring("Jump for joy", "joys"))