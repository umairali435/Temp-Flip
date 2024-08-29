import 'package:flutter/material.dart';
import 'package:gustwarm/utils/colors.dart';
import 'package:gustwarm/utils/constants.dart';

class ExplainationPage extends StatelessWidget {
  const ExplainationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(
        bottom: 50.0,
        top: 10.0,
        left: 5.0,
        right: 5.0,
      ),
      itemCount: AppConstants.temperatureTypes.length,
      itemBuilder: (context, index) {
        final item = AppConstants.temperatureTypes[index];
        final title = item['title']!;
        final description = item['description']!;
        final symbol = _getSymbol(title);

        return Card(
          child: ListTile(
            isThreeLine: true,
            leading: Container(
              height: double.infinity,
              width: 80.0,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text(
                  symbol,
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
            title: Text(
              title,
              style: const TextStyle(
                color: AppColors.primaryColor,
              ),
            ),
            subtitle: Text(
              description,
              style: const TextStyle(
                color: AppColors.blackColor,
              ),
            ),
          ),
        );
      },
    );
  }

  String _getSymbol(String title) {
    switch (title) {
      case 'Celsius (°C)':
        return '°C';
      case 'Fahrenheit (°F)':
        return '°F';
      case 'Kelvin (K)':
        return 'K';
      case 'Rankine (°R)':
        return '°R';
      case 'Reaumur (°Re)':
        return '°Re';
      case 'Rømer (°Rø)':
        return '°Rø';
      case 'Newton (°N)':
        return '°N';
      case 'Delisle (°D)':
        return '°D';
      default:
        return '';
    }
  }
}
