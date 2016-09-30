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
        'AIzaSyA1Tf3N330ixM6o1GI37nD48xtdmaCUH5I' +
        '&callback=_initMap" async defer></script');
    bindMapForm();
  }
});
