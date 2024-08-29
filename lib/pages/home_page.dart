import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gustwarm/utils/colors.dart';
import 'package:gustwarm/pages/cupertino_bottom_sheet.dart';
import 'package:gustwarm/pages/custom_drawer.dart';
import 'package:gustwarm/pages/explaination_page.dart';
import 'package:gustwarm/services/temperature_convert_service.dart';
import 'package:gustwarm/widgets/custom_text_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final scaffoldState = GlobalKey<ScaffoldState>();
  bool isSwitch = false;
  final controller = TextEditingController(text: "22.0");
  final List<String> temperatureTypes = [
    'Celsius (°C)',
    'Fahrenheit (°F)',
    'Kelvin (K)',
    'Rankine (°R)',
    'Reaumur (°Re)',
    'Rømer (°Rø)',
    'Newton (°N)',
    'Delisle (°D)',
  ];
  void showCupertinoMenu(BuildContext context, {required Function(String value) onPressed}) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: const Text('Select an Option'),
          actions: temperatureTypes
              .map(
                (e) => CupertinoActionSheetAction(
                  onPressed: () {
                    onPressed(e);
                    Navigator.pop(context);
                  },
                  child: Text(e),
                ),
              )
              .toList(),
          cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
      drawer: const CustomDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Search',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
          onPressed: () {
            scaffoldState.currentState!.openDrawer();
          },
          icon: const Icon(Icons.menu),
        ),
        iconTheme: const IconThemeData(color: AppColors.whiteColor),
        title: const Text(
          "Gust Warm",
          style: TextStyle(
            color: AppColors.whiteColor,
          ),
        ),
      ),
      body: _selectedIndex == 0
          ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Card(
                      child: Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: AppColors.primaryColor,
                          ),
                        ),
                        child: Column(
                          children: [
                            CustomTextField(
                              controller: controller,
                              labelText: "Temperature Value",
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(TemperatureConvert().fromScale),
                                CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  child: const Icon(CupertinoIcons.ellipsis),
                                  onPressed: () => showCupertinoMenu(
                                    context,
                                    onPressed: (value) {
                                      TemperatureConvert().fromScale = value;
                                      setState(() {});
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const Icon(CupertinoIcons.resize_v),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(TemperatureConvert().toScale),
                                CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  child: const Icon(CupertinoIcons.ellipsis),
                                  onPressed: () => showCupertinoMenu(
                                    context,
                                    onPressed: (value) {
                                      TemperatureConvert().toScale = value;
                                      setState(() {});
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Switch Scale"),
                                CupertinoSwitch(
                                  value: isSwitch,
                                  activeColor: AppColors.primaryColor,
                                  onChanged: (value) {
                                    if (value) {
                                      TemperatureConvert().inputValue = double.parse(controller.text);
                                      TemperatureConvert().convertTemperature();
                                      showCupertinoBottomSheet(context, () {
                                        setState(() {
                                          isSwitch = !isSwitch;
                                        });
                                      });
                                    }
                                    setState(() {
                                      isSwitch = !isSwitch;
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : const ExplainationPage(),
    );
  }
}

class CustomPopupMenuContent extends StatelessWidget {
  final String title;
  final IconData icon;

  const CustomPopupMenuContent({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(icon, color: Colors.black54),
        const SizedBox(width: 8),
        Text(title),
      ],
    );
  }
}
