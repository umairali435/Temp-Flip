import 'package:flutter/cupertino.dart';
import 'package:gustwarm/colors.dart';
import 'package:gustwarm/services/temperature_convert_service.dart';

class CustomCupertinoBottomSheet extends StatelessWidget {
  final VoidCallback onClose;
  const CustomCupertinoBottomSheet({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: const Text(
        'Transform Result',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.primaryColor,
          fontSize: 22,
        ),
      ),
      message: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TemperatureConvert().fromScale,
                style: const TextStyle(
                  fontSize: 18.0,
                  color: AppColors.blackColor,
                ),
              ),
              Text(
                TemperatureConvert().inputValue.toString(),
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
          const Icon(
            CupertinoIcons.arrow_right,
            size: 24,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TemperatureConvert().toScale,
                style: const TextStyle(
                  fontSize: 18.0,
                  color: AppColors.blackColor,
                ),
              ),
              Text(
                TemperatureConvert().result,
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        CupertinoActionSheetAction(
          onPressed: () {
            onClose();
            Navigator.pop(context);
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}

void showCupertinoBottomSheet(BuildContext context, VoidCallback onClose) {
  showCupertinoModalPopup(
    barrierDismissible: false,
    context: context,
    builder: (context) => CustomCupertinoBottomSheet(
      onClose: onClose,
    ),
  );
}
