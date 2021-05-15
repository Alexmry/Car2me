import Typed from 'typed.js';

const initTyped = () => {
    let options = {
        strings: ['The car right for you', 'Is right here'],
        typeSpeed: 40
    };
    let typed = new Typed('#typed-strings', options);
}

export { initTyped };
    
