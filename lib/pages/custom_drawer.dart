import 'package:flutter/material.dart';
import 'package:gustwarm/colors.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    void launchURL(String url) async {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        throw 'Could not launch $url';
      }
    }

    void launchWebsite() {
      const url = 'https://temperatureswitcher.blogspot.com/2024/08/temperature-switcher-privacy-policy.html';
      launchURL(url);
    }

    void launchAppStore() {
      Share.share("""You can find GustWarm: Temperature Flip https://apps.apple.com/store/apps/details?id=com.burhan.TempConversion""");
    }

    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.5,
      child: Container(
        color: AppColors.whiteColor,
        child: Column(
          children: [
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(10.0),
            //   child: Image.asset(
            //     "assets/app_icon.png",
            //     width: 150.0,
            //     height: 150.0,
            //   ),
            // ),
            const Divider(),
            ListTile(
              onTap: () {
                launchWebsite();
              },
              leading: const Icon(
                Icons.privacy_tip,
                color: AppColors.primaryColor,
              ),
              title: const Text(
                "Privacy Policy",
                style: TextStyle(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                launchAppStore();
              },
              leading: const Icon(
                Icons.share,
                color: AppColors.primaryColor,
              ),
              title: const Text(
                "Share App",
                style: TextStyle(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
