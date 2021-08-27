export const fetchSearchGiphys = searchTerm => (
    $.ajax({
      method: 'GET',
      url: `http://api.giphy.com/v1/gifs/search?q=${search+term}&api_key=cDvYpAspLXBbYl6bQOmjxWLE34uBAryF&limit=2`
    })
);