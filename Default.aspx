<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA_W89UL6Jchih02wN14VSuF71U_1szCGc&callback=initMap"></script>


    <div id="harita" style="margin-top: 100px">
        <div id="map" style="width: 100%; height: 600px;"></div>
    </div>

    <script>

        let item = {
            lat: "41.038315",
            lng: "29.069394",
            title: "Başlık 1"
        }

        let itemList = [];

        let item2 = {
            lat: "40.987799",
            lng: "29.141835",
            title: "Başlık 2"
        }

        itemList.push(item);
        itemList.push(item2);

        setHarita(itemList);

        function setHarita(item) {
            var locations = [];
            for (var i = 0; i < item.length; i++) {

                var row = [];

                var tablo = "<h4>" + item[i].title + "</h4>";

                var lat = item[i].lat;
                var lng = item[i].lng;

                row.push(lat);
                row.push(lng);
                row.push(tablo);
                locations.push(row);
            }

            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 12,
                disableDefaultUI: true,
                fullscreenControl: true,
                zoomControl: true,
                mapTypeId: google.maps.MapTypeId.ROADMAP,
                center: new google.maps.LatLng(41.057188, 29.0072),

                styles: [{ "featureType": "all", "elementType": "labels.text.fill", "stylers": [{ "color": "#7c93a3" }, { "lightness": "-10" }] }, { "featureType": "administrative.country", "elementType": "geometry", "stylers": [{ "visibility": "on" }] }, { "featureType": "administrative.country", "elementType": "geometry.stroke", "stylers": [{ "color": "#a0a4a5" }] }, { "featureType": "administrative.province", "elementType": "geometry.stroke", "stylers": [{ "color": "#62838e" }] }, { "featureType": "landscape", "elementType": "geometry.fill", "stylers": [{ "color": "#dde3e3" }] }, { "featureType": "landscape.man_made", "elementType": "geometry.stroke", "stylers": [{ "color": "#3f4a51" }, { "weight": "0.30" }] }, { "featureType": "poi", "elementType": "all", "stylers": [{ "visibility": "simplified" }] }, { "featureType": "poi.attraction", "elementType": "all", "stylers": [{ "visibility": "on" }] }, { "featureType": "poi.business", "elementType": "all", "stylers": [{ "visibility": "off" }] }, { "featureType": "poi.government", "elementType": "all", "stylers": [{ "visibility": "off" }] }, { "featureType": "poi.park", "elementType": "all", "stylers": [{ "visibility": "on" }] }, { "featureType": "poi.place_of_worship", "elementType": "all", "stylers": [{ "visibility": "off" }] }, { "featureType": "poi.school", "elementType": "all", "stylers": [{ "visibility": "off" }] }, { "featureType": "poi.sports_complex", "elementType": "all", "stylers": [{ "visibility": "off" }] }, { "featureType": "road", "elementType": "all", "stylers": [{ "saturation": "-100" }, { "visibility": "on" }] }, { "featureType": "road", "elementType": "geometry.stroke", "stylers": [{ "visibility": "on" }] }, { "featureType": "road.highway", "elementType": "geometry.fill", "stylers": [{ "color": "#bbcacf" }] }, { "featureType": "road.highway", "elementType": "geometry.stroke", "stylers": [{ "lightness": "0" }, { "color": "#bbcacf" }, { "weight": "0.50" }] }, { "featureType": "road.highway", "elementType": "labels", "stylers": [{ "visibility": "on" }] }, { "featureType": "road.highway", "elementType": "labels.text", "stylers": [{ "visibility": "on" }] }, { "featureType": "road.highway.controlled_access", "elementType": "geometry.fill", "stylers": [{ "color": "#ffffff" }] }, { "featureType": "road.highway.controlled_access", "elementType": "geometry.stroke", "stylers": [{ "color": "#a9b4b8" }] }, { "featureType": "road.arterial", "elementType": "labels.icon", "stylers": [{ "invert_lightness": true }, { "saturation": "-7" }, { "lightness": "3" }, { "gamma": "1.80" }, { "weight": "0.01" }] }, { "featureType": "transit", "elementType": "all", "stylers": [{ "visibility": "off" }] }, { "featureType": "water", "elementType": "geometry.fill", "stylers": [{ "color": "#a3c7df" }] }]
            });
            var infowindow = new google.maps.InfoWindow();


            if (locations != null) {
                for (i = 0; i < locations.length; i++) {
                    marker = new google.maps.Marker({
                        position: new google.maps.LatLng(locations[i][0], locations[i][1]),
                        map: map, 
                    });

                    google.maps.event.addListener(marker, 'mouseover', (function (marker, i) {
                        return function () {
                            infowindow.setContent(locations[i][2]);
                            infowindow.open(map, marker);
                        }
                    })(marker, i));

                    google.maps.event.addListener(marker, 'mouseout', (function (marker, i) {
                        return function () {
                            infowindow.setContent(locations[i][2]);
                            infowindow.close(map, marker);
                        }
                    })(marker, i));

                }
            }



        }

    </script>

</asp:Content>
