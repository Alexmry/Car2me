const initBookingResponsivity = () => {
    const divImg = document.querySelector('.img-booking-edit');
    if (divImg) {
        window.addEventListener('resize', () => {
            if (window.innerWidth < 1000) {
                divImg.innerHTML = "";
            } else {
                if (divImg.innerHTML == "") {
                    divImg.insertAdjacentHTML('beforeend', '<img src="https://images.unsplash.com/photo-1568602471122-7832951cc4c5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80" alt="" width="400" height="300">');
                }
            }
        })
    }
}

export { initBookingResponsivity };