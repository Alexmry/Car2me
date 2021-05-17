import Drift from 'drift-zoom';

const initDrift = () => {
    let options = {
        containInline: false,
        zoomFactor: 2,
    }
    const img = document.getElementById('default-img-booking-show');
    if (img) {
        let drift = new Drift(img, options);
        const btnEnable = document.querySelector(".enable-zoom-button");
        if (btnEnable) {
            btnEnable.addEventListener('click', () => {
                drift.enable();
            })
        }
        const btnDisable = document.querySelector(".disable-zoom-button");
        if (btnDisable) {
            btnDisable.addEventListener('click', () => {
                drift.disable();
            })
        }
    }
}

export { initDrift };

// https://github.com/imgix/drift