(function () {
window.onload = function() {
    var url = 'http://127.0.0.1:8002/todays_weather.json';
    callOtherDomain(url);
}


function callOtherDomain(url) {
    var xhr = new XMLHttpRequest();
    if ("withCredentials" in xhr) {
        xhr.open('GET', url, true);
    } else if (typeof XDomainRequest != "undefined") {
        xhr = new XDomainRequest();
        xhr.open('GET', url);
        }
    xhr.onload = function() {
    var weather = JSON.parse(xhr.responseText);
    insertWeatherData(weather);
    }
    xhr.send();
}

function insertWeatherData(weather) {
    $("#main").text(weather.main);
    $("#description").text(weather.description);
    $("#temp").text((weather.maxTemp + weather.minTemp) / 2);
    $("#humidity").text(weather.humidity);
    $("#pressure").text(weather.pressure);
    $("#clouds").text(weather.clouds);
}
})();