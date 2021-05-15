import Typed from 'typed.js';

const initTyped = () => {
    const info = document.getElementById('typed-strings');
    if (info) {
        let options = {
            strings: ['The car right for you', 'Is right here'],
            typeSpeed: 40,
            loop: true
        };
        new Typed(info, options);
    }
}

export { initTyped };
    
