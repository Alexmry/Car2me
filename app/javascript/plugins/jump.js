import jump from 'jump.js'

const initJump = () => {
    const btnUpHome = document.querySelector('#btn-goUp-home');
    if (btnUpHome) {
        btnUpHome.addEventListener('click', () => {
            const topPage = document.querySelector('.info-banner');
            if (topPage) {
                jump(".info-banner", {
                    duration: 1000
                  });
            }
        })
    }
    const btnUpBookings = document.querySelector('#btn-goUp-bookings');
    if (btnUpBookings) {
        btnUpBookings.addEventListener('click', () => {
            const topPage = document.querySelector('#title-bookings-show');
            if (topPage) {
                jump('#title-bookings-show', {
                    duration: 1000
                  });
            }
        })
    }
}

export { initJump };