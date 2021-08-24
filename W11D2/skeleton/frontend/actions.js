const selectLocation = function(city, job){
    return {
        type: "SWITCH_LOCATION",
        city,
        jobs
    }
}
export default selectLocation;