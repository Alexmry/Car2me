import jump from 'jump.js'

const initJump = () => {
    const btnUp = document.querySelector('#btn-goUp');
    if (btnUp) {
        btnUp.addEventListener('click', () => {
            const topPage = document.querySelector('.info-banner');
            if (topPage) {
                jump(".info-banner", {
                    duration: 1000
                  });
            }
        })
    }
}

export { initJump };