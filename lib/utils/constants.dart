class AppConstants {
  AppConstants._();
  static const List<Map<String, String>> temperatureTypes = [
    {
      'title': 'Celsius (°C)',
      'description':
          'The Celsius scale, also known as Centigrade, is used widely around the world. It is based on the freezing point of water (0°C) and the boiling point (100°C) at standard atmospheric pressure. Commonly used in most countries and scientific contexts.',
    },
    {
      'title': 'Fahrenheit (°F)',
      'description':
          'The Fahrenheit scale is based on the freezing point of water (32°F) and the boiling point (212°F) at standard atmospheric pressure. Primarily used in the United States and a few other countries for everyday temperature measurements.',
    },
    {
      'title': 'Kelvin (K)',
      'description':
          'The Kelvin scale starts at absolute zero, the theoretical point where all molecular motion ceases. It is used in scientific contexts where absolute temperature measurements are necessary. Common in scientific research and engineering.',
    },
    {
      'title': 'Rankine (°R)',
      'description':
          'The Rankine scale is similar to the Kelvin scale but uses Fahrenheit degrees. It starts at absolute zero (0°R). Used in thermodynamics and engineering, particularly in the United States.',
    },
    {
      'title': 'Reaumur (°Re)',
      'description':
          'The Reaumur scale sets the freezing point of water at 0°Re and the boiling point at 80°Re. It was used historically but is now largely obsolete. Mostly historical; some applications in specific regions.',
    },
    {
      'title': 'Rømer (°Rø)',
      'description':
          'The Rømer scale was used in the early 18th century. It sets the freezing point of water at 7.5°Rø and the boiling point at 60°Rø. Mostly historical; replaced by more widely accepted scales.',
    },
    {
      'title': 'Newton (°N)',
      'description':
          'The Newton scale was designed in the 17th century by Isaac Newton. It is less common and sets the freezing point of water at 0°N and the boiling point at 33°N. Mostly historical; not commonly used today.',
    },
    {
      'title': 'Delisle (°D)',
      'description':
          'The Delisle scale was used in the 18th century. It sets the boiling point of water at 0°D and the freezing point at 150°D. Mostly historical; not in common use today.',
    },
  ];
}
