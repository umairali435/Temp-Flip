class TemperatureConvert {
  // Private constructor
  TemperatureConvert._();

  // Static instance of the class
  static final TemperatureConvert _instance = TemperatureConvert._();

  // Factory constructor to return the same instance
  factory TemperatureConvert() => _instance;

  // Instance variables
  String _fromScale = 'Celsius (°C)';
  String _toScale = 'Fahrenheit (°F)';
  double _inputValue = 0.0;
  String _result = '';

  // Getters
  String get fromScale => _fromScale;
  String get toScale => _toScale;
  double get inputValue => _inputValue;
  String get result => _result;

  // Setters
  set fromScale(String scale) => _fromScale = scale;
  set toScale(String scale) => _toScale = scale;
  set inputValue(double value) => _inputValue = value;

  // Convert temperature based on current values
  String convertTemperature() {
    double convertedValue;
    switch (_fromScale) {
      case 'Celsius (°C)':
        convertedValue = _convertFromCelsius();
        break;
      case 'Fahrenheit (°F)':
        convertedValue = _convertFromFahrenheit();
        break;
      case 'Kelvin (K)':
        convertedValue = _convertFromKelvin();
        break;
      case 'Rankine (°R)':
        convertedValue = _convertFromRankine();
        break;
      case 'Reaumur (°Re)':
        convertedValue = _convertFromReaumur();
        break;
      case 'Rømer (°Rø)':
        convertedValue = _convertFromRomer();
        break;
      case 'Newton (°N)':
        convertedValue = _convertFromNewton();
        break;
      case 'Delisle (°D)':
        convertedValue = _convertFromDelisle();
        break;
      default:
        convertedValue = 0.0;
    }
    _result = convertedValue.toStringAsFixed(2);
    return _result;
  }

  double _convertFromCelsius() {
    switch (_toScale) {
      case 'Fahrenheit (°F)':
        return _inputValue * 9 / 5 + 32;
      case 'Kelvin (K)':
        return _inputValue + 273.15;
      case 'Rankine (°R)':
        return (_inputValue + 273.15) * 9 / 5;
      case 'Reaumur (°Re)':
        return _inputValue * 4 / 5;
      case 'Rømer (°Rø)':
        return _inputValue * 21 / 40 + 7.5;
      case 'Newton (°N)':
        return _inputValue * 33 / 100;
      case 'Delisle (°D)':
        return (100 - _inputValue) * 3 / 2;
      default:
        return _inputValue;
    }
  }

  double _convertFromFahrenheit() {
    print(_inputValue);
    switch (_toScale) {
      case 'Celsius (°C)':
        return (_inputValue - 32) * 5 / 9;
      case 'Kelvin (K)':
        return (_inputValue - 32) * 5 / 9 + 273.15;
      case 'Rankine (°R)':
        return _inputValue + 459.67;
      case 'Reaumur (°Re)':
        return (_inputValue - 32) * 4 / 9;
      case 'Rømer (°Rø)':
        return (_inputValue - 32) * 7 / 24 + 7.5;
      case 'Newton (°N)':
        return (_inputValue - 32) * 11 / 60;
      case 'Delisle (°D)':
        return (212 - _inputValue) * 5 / 6;
      default:
        return _inputValue;
    }
  }

  double _convertFromKelvin() {
    switch (_toScale) {
      case 'Celsius (°C)':
        return _inputValue - 273.15;
      case 'Fahrenheit (°F)':
        return (_inputValue - 273.15) * 9 / 5 + 32;
      case 'Rankine (°R)':
        return _inputValue * 9 / 5;
      case 'Reaumur (°Re)':
        return (_inputValue - 273.15) * 4 / 5;
      case 'Rømer (°Rø)':
        return (_inputValue - 273.15) * 21 / 40 + 7.5;
      case 'Newton (°N)':
        return (_inputValue - 273.15) * 33 / 100;
      case 'Delisle (°D)':
        return (373.15 - _inputValue) * 3 / 2;
      default:
        return _inputValue;
    }
  }

  double _convertFromRankine() {
    switch (_toScale) {
      case 'Celsius (°C)':
        return (_inputValue - 491.67) * 5 / 9;
      case 'Fahrenheit (°F)':
        return _inputValue - 459.67;
      case 'Kelvin (K)':
        return _inputValue * 5 / 9;
      case 'Reaumur (°Re)':
        return (_inputValue - 491.67) * 4 / 9;
      case 'Rømer (°Rø)':
        return (_inputValue - 491.67) * 7 / 24 + 7.5;
      case 'Newton (°N)':
        return (_inputValue - 491.67) * 11 / 60;
      case 'Delisle (°D)':
        return (671.67 - _inputValue) * 5 / 6;
      default:
        return _inputValue;
    }
  }

  double _convertFromReaumur() {
    switch (_toScale) {
      case 'Celsius (°C)':
        return _inputValue * 5 / 4;
      case 'Fahrenheit (°F)':
        return _inputValue * 9 / 4 + 32;
      case 'Kelvin (K)':
        return _inputValue * 5 / 4 + 273.15;
      case 'Rankine (°R)':
        return (_inputValue * 9 / 4) + 491.67;
      case 'Rømer (°Rø)':
        return _inputValue * 21 / 32 + 7.5;
      case 'Newton (°N)':
        return _inputValue * 33 / 80;
      case 'Delisle (°D)':
        return (80 - _inputValue) * 15 / 8;
      default:
        return _inputValue;
    }
  }

  double _convertFromRomer() {
    switch (_toScale) {
      case 'Celsius (°C)':
        return (_inputValue - 7.5) * 40 / 21;
      case 'Fahrenheit (°F)':
        return (_inputValue - 7.5) * 24 / 7 + 32;
      case 'Kelvin (K)':
        return (_inputValue - 7.5) * 40 / 21 + 273.15;
      case 'Rankine (°R)':
        return (_inputValue - 7.5) * 24 / 7 + 491.67;
      case 'Reaumur (°Re)':
        return (_inputValue - 7.5) * 32 / 21 * 4 / 5;
      case 'Newton (°N)':
        return (_inputValue - 7.5) * 33 / 21;
      case 'Delisle (°D)':
        return (60 - _inputValue) * 15 / 7;
      default:
        return _inputValue;
    }
  }

  double _convertFromNewton() {
    switch (_toScale) {
      case 'Celsius (°C)':
        return _inputValue * 100 / 33;
      case 'Fahrenheit (°F)':
        return _inputValue * 60 / 11 + 32;
      case 'Kelvin (K)':
        return _inputValue * 100 / 33 + 273.15;
      case 'Rankine (°R)':
        return _inputValue * 60 / 11 + 491.67;
      case 'Reaumur (°Re)':
        return _inputValue * 80 / 33;
      case 'Rømer (°Rø)':
        return _inputValue * 21 / 33 + 7.5;
      case 'Delisle (°D)':
        return (33 - _inputValue) * 150 / 33;
      default:
        return _inputValue;
    }
  }

  double _convertFromDelisle() {
    switch (_toScale) {
      case 'Celsius (°C)':
        return 100 - _inputValue * 2 / 3;
      case 'Fahrenheit (°F)':
        return 212 - _inputValue * 6 / 5;
      case 'Kelvin (K)':
        return 373.15 - _inputValue * 2 / 3;
      case 'Rankine (°R)':
        return 671.67 - _inputValue * 6 / 5;
      case 'Reaumur (°Re)':
        return (80 - _inputValue) * 15 / 8;
      case 'Rømer (°Rø)':
        return 60 - _inputValue * 15 / 7;
      case 'Newton (°N)':
        return (33 - _inputValue) * 5 / 6;
      default:
        return _inputValue;
    }
  }
}
