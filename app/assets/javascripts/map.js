window.$(function () {
  var $ = window.$;
  var $map = $('#map');
  var _ = window._;
  var map = null;

  var initMap = function () {
    map = new window.google.maps.Map($map[0], {
      center: { lat: 32.3547, lng: -89.3985 },
      mapTypeId: window.google.maps.MapTypeId.ROADMAP,
      zoom: 6,
    });
  };

  var dropMarkers = function (chained) {
    var bounds = new window.google.maps.LatLngBounds();
    var infoWindow = new window.google.maps.InfoWindow();
    var infoTemplate = _.template($('.template-marker-info').html());

    chained.
      each(function (provider) {
        var marker = new window.google.maps.Marker({
          position: new window.google.maps.LatLng(
            provider.lat,
            provider.long
          ),
          map: map,
          title: provider.name,
        });

        bounds.extend(marker.getPosition());

        marker.addListener('click', function () {
          infoWindow.close();
          infoWindow.setContent(infoTemplate(provider));
          infoWindow.open(map, marker);
        });
      });

    map.fitBounds(bounds);

    if (map.zoom >= 10) {
      map.setZoom(10);
    }
  };

  var bindMapForm = function () {
    $('.map-finder').on('submit', function (e) {
      e.preventDefault();
      $.get('/api/providers.json?' + $(e.target).serialize())
        .done(function (results) {
          $(".usa-alert-error").remove();
          if (results.error) {
            var alertTemplate = _.template($('.template-alert').html());
            var errorData = {alert_type: "error", message: results.error};
            $(".map-finder").before(alertTemplate(errorData));
            return;
          }

          var providerTemplate = _.template($('.template-provider-row').html());
          var $providersContainer = $('.providers-container');
          $providersContainer.html('');

          var chained = _.chain(results)
            .each(function (provider) {
              $providersContainer.append($(providerTemplate(provider)));
            })
            .uniq(function (provider) {
              return provider.zipcode;
            });

          if (map) {
            dropMarkers(chained);
          }
        });
    });
  };

  if ($map[0]) {
    window._initMap = initMap;
    $('body').append('<script src="https://maps.googleapis.com/maps/api/js?key=' +
        'AIzaSyCqwfCPDXkZhbaIcFgGbKkfrhqLJPhozzY' +
        '&callback=_initMap" async defer></script');
    bindMapForm();
  }
});
