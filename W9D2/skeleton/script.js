document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  // --- your code here!

  const addFavoriteInput = (e)=>{
    e.preventDefault();
    const favoriteInput = document.querySelector(".favorite-input");
    const content = favoriteInput.value;
    favoriteInput.value = "";
    const lis = document.createElement("li");
    lis.textContent = content;
    const sfPlaces = document.getElementById("sf-places");
    sfPlaces.appendChild(lis);
  };

  const submit = document.querySelector(".favorite-submit");
  submit.addEventListener("click", addFavoriteInput);



  // adding new photos

  // --- your code here!

  const togglePhotoShow = (e)=>{
    const photo = document.querySelector(".photo-form-container");
    if (photo.className === "photo-form-container") {
        photo.className = "photo-form-container hidden";
    } else {
        photo.className = "photo-form-container";
    }
}
;
  const photoShow = document.querySelector(".photo-show-button");
  photoShow.addEventListener("click", togglePhotoShow);

  const addPhoto = (e)=>{
    e.preventDefault();
    const photoUrlInput = document.querySelector(".photo-url-input");
    const photoUrl = photoUrlInput.value;
    photoUrlInput.value = "";
    const img = document.createElement("img");
    img.src = photoUrl;
    const li = document.createElement("li");
    li.appendChild(img);
    const list = document.querySelector(".dog-photos");
    list.appendChild(li);
  };

  const photoSubmit = document.querySelector(".photo-url-submit");
  photoSubmit.addEventListener("click", addPhoto);



});
