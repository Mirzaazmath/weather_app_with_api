// for Weather Report String
String weatherReport(int value) {
  switch (value) {
    case 0:
      {
        return "Clear sky";
      }
    case 1:
      {
        return "Mainly clear, partly cloudy, and overcast";
      }
    case 2:
      {
        return "Mainly clear, partly cloudy, and overcast";
      }
    case 3:
      {
        return "Mainly clear, partly cloudy, and overcast";
      }
    case 45:
      {
        return "Fog and depositing rime fog";
      }
    case 48:
      {
        return "Fog and depositing rime fog";
      }
    case 51:
      {
        return "Light, moderate, and dense intensity";
      }
    case 53:
      {
        return "Light, moderate, and dense intensity";
      }
    case 55:
      {
        return "Light, moderate, and dense intensity";
      }
    case 56:
      {
        return "Freezing Drizzle: Light and dense intensity";
      }
    case 57:
      {
        return "Freezing Drizzle: Light and dense intensity";
      }
    case 61:
      {
        return "Rain: Slight, moderate and heavy intensity";
      }
    case 63:
      {
        return "Rain: Slight, moderate and heavy intensity";
      }
    case 66:
      {
        return "Rain: Slight, moderate and heavy intensity";
      }
    case 67:
      {
        return "Freezing Rain: Light and heavy intensity";
      }
    case 71:
      {
        return "Snow fall: Slight, moderate, and heavy intensity";
      }
    case 73:
      {
        return "Snow fall: Slight, moderate, and heavy intensity";
      }
    case 75:
      {
        return "Snow fall: Slight, moderate, and heavy intensity";
      }
    case 77:
      {
        return "Snow grains";
      }
    case 80:
      {
        return "Rain showers: Slight, moderate, and violent";
      }
    case 81:
      {
        return "Rain showers: Slight, moderate, and violent";
      }
    case 82:
      {
        return "Rain showers: Slight, moderate, and violent";
      }
    case 85:
      {
        return "Snow showers slight and heavy";
      }
    case 86:
      {
        return "Snow showers slight and heavy";
      }
    case 95:
      {
        return "Thunderstorm: Slight or moderate";
      }
    case 96:
      {
        return "Thunderstorm with slight and heavy hail";
      }
    case 97:
      {
        return "Thunderstorm with slight and heavy hail";
      }

    default:
      {
        return "Fetching data..";
      }
  }
}

// for Weather Report Image

String weatherReportImage(int value) {
  switch (value) {
    case 0:
      {
        return "assets/wind.png";
      }
    case 1:
      {
        return "assets/wind.png";
      }
    case 2:
      {
        return "assets/wind.png";
      }
    case 3:
      {
        return "assets/wind.png";
      }
    case 45:
      {
        return "assets/wind.png";
      }
    case 48:
      {
        return "assets/wind.png";
      }
    case 51:
      {
        return "assets/wind.pngy";
      }
    case 53:
      {
        return "assets/wind.png";
      }
    case 55:
      {
        return "assets/wind.png";
      }
    case 56:
      {
        return "assets/snow.png";
      }
    case 57:
      {
        return "assets/snow.png";
      }
    case 61:
      {
        return "assets/rain.png";
      }
    case 63:
      {
        return "assets/rain.png";
      }
    case 66:
      {
        return "assets/rain.png";
      }
    case 67:
      {
        return "assets/snow.png";
      }
    case 71:
      {
        return "assets/snow.png";
      }
    case 73:
      {
        return "assets/snow.png";
      }
    case 75:
      {
        return "assets/snow.png";
      }
    case 77:
      {
        return "assets/snow.png";
      }
    case 80:
      {
        return "assets/thundercloud.png";
      }
    case 81:
      {
        return "assets/thundercloud.png";
      }
    case 82:
      {
        return "assets/thundercloud.png";
      }
    case 85:
      {
        return "assets/snow.png";
      }
    case 86:
      {
        return "assets/snow.png";
      }
    case 95:
      {
        return "assets/blackcloud.png";
      }
    case 96:
      {
        return "assets/blackcloud.png";
      }
    case 97:
      {
        return "assets/blackcloud.png";
      }

    default:
      {
        return "assets/wind.png";
      }
  }
}
