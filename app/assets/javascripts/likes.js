$( document ).on( 'click', '.likes-link', function(event){
  event.preventDefault();

  var likeCount = $(this).siblings('.likes_count');
  var likeWord = $(this).siblings('.likes_word');

  $.post(this.href, function(response){
    likeCount.text(response.new_like_count);
    if(response && (response.new_like_count === 0 || response.new_like_count > 1)) {
      likeWord.html("Likes")
    }
    else if (response.new_like_count)
    {
      likeWord.html("Like")
    }

   });
});