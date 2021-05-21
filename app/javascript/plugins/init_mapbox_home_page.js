import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';


const buildMap = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map-2',
    style: 'mapbox://styles/fhabert/ckoy8nc562ahn18nrh0dpedlb'
  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .addTo(map);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 10 });
};

const initMapboxHomePage = () => {
  const mapElement = document.getElementById('map-2');
  if (mapElement) {
    const map = buildMap(mapElement);
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
  }
};

export { initMapboxHomePage };





// const initMapboxHomePage = () => {
//   const mapElement = document.getElementById('map-2');

// const fitMapToMarkers = (map, marker) => {
//     const bounds = new mapboxgl.LngLatBounds();
//     markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
//     map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 5000 });
//   };

//   if (mapElement) { // only build a map if there's a div#map to inject into
//     mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
//     const map = new mapboxgl.Map({
//       container: 'map-2',
//       style: 'mapbox://styles/mapbox/streets-v10'
//     });
//       const markers = JSON.parse(mapElement.dataset.markers);
//       markers.forEach((marker) => {
//         new mapboxgl.Marker()
//           .setLngLat([ marker.lng, marker.lat ])
//           .addTo(map);
//       });

//     }
//   };

// export { initMapboxHomePage };





























//   const fitMapToMarkers = (map, marker) => {
//   const bounds = new mapboxgl.LngLatBounds();
//   bounds.extend([ marker.lng, marker.lat ]);
//   map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 5000 });

// };

// if (markers.length === 0) {
//   map.setZoom(1);
// } else if (markers.length === 1) {
//   map.setZoom(14);
//   map.setCenter([markers[0].lng, markers[0].lat]);
// } else {
//     const bounds = new mapboxgl.LngLatBounds();
//     markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
//     map.fitBounds(bounds, { padding: 10, maxZoom: 10, duration: 10000 });
// };












