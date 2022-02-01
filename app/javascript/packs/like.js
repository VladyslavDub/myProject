import Rails from "@rails/ujs"

document.addEventListener("turbolinks:load",()=>{
  let likeButtons = document.querySelectorAll(".like")
  likeButtons.forEach((likeButton) => {
    likeButton.addEventListener("click",like)
  });

})

function like() {
  event.preventDefault();
  const button = event.target.closest(".like")
  const objectType = "pin"
  const objectId = button.dataset.objectId
  Rails.ajax({
    type: "POST",
    url: `/${objectType}/${objectId}/like`,
    success: (repsonse)=>{
      button.parentElement.querySelector(".like-counter").innerText = repsonse.likes_count
    },
    error: (repsonse)=>{

    }
  })
}