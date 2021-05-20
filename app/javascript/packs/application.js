// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
// import AOS, { init } from 'aos';
// import mapboxgl from 'mapbox-gl';
// import 'mapbox-gl/dist/mapbox-gl.css';
// AOS.init();

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { initMapbox } from '../plugins/init_mapbox';
import { initMapboxHomePage } from '../plugins/init_mapbox_home_page';
import { initTyped } from '../plugins/typed';
import { initAOS } from '../plugins/aos';
import { initDrift } from '../plugins/drift_zoom';
import { initJump } from '../plugins/jump';
import { initBookingResponsivity } from '../components/bookingResponsivity';
import "flatpickr/dist/flatpickr.css"
import { date } from "../plugins/flatpickr";

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  console.log("hey");
  initMapbox();
  initMapboxHomePage();
  initTyped();
  initAOS();
  initDrift();
  initJump();
  initBookingResponsivity();
  date();
});
