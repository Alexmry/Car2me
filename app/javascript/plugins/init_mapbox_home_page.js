import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const initMapboxHomePage = () => {
  const mapElement = document.getElementById('map-2');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map-2',
      style: 'mapbox://styles/mapbox/streets-v10'
    });
      const markers = JSON.parse(mapElement.dataset.markers);
      markers.forEach((marker) => {
        new mapboxgl.Marker()
          .setLngLat([ marker.lng, marker.lat ])
          .addTo(map);
      });
    }
  };

export { initMapboxHomePage };
