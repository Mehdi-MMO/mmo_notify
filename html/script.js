const notificationList = document.querySelector('.ios-notifications')

$(document).ready(function () {
  window.addEventListener('message', function (event) {
    if (event.data.action == 'open') {

      const Data = {
        title: event.data.title,
        text: event.data.message,
        time: event.data.time,
        appname: event.data.appname,
        icon: event.data.icon,
        sound: event.data.sound,
      }
      ShowNotification(Data)
    }
  })
})

function ShowNotification(item) {
  var sound = new Audio('sound/' + item.sound + '.mp3');
  sound.volume = 0.2;
  if (item.sound === "false") {
    sound.volume = 0.0;
  }

  const li = document.createElement('li')
  li.classList.add('ios-notifications__item')

  li.innerHTML = `
       
        <div class="mb-1 flex justify-between text-xs">
          <div>
          <i class="${item.icon}"></i>
            <span>${item.appname}</span>
          </div>
          <div>now</div>
        </div>
        <div class="text-sm font-bold">${item.title}</div>
        <div class="text-sm">${item.text}</div> 
      `
  sound.play();
  notificationList.prepend(li)

  setTimeout(() => {
    li.classList.add('notif-hide')

    $(".notification:first-child").remove();

  }, item.time);
}

