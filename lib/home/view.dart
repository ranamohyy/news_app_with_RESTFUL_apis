import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/assets.dart';
import 'package:news_app/core/styles.dart';
part 'package:news_app/widgets/item_types_of_service.dart';
part 'package:news_app/widgets/app_bar_home.dart';
part 'package:news_app/widgets/top_home_view.dart';
part 'package:news_app/widgets/travel_item.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});
  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  List<String> titles = ["travel", "Technology", "Business", "Entertainment"];
  List<String> images = [
    AppAssets.airPods,
    AppAssets.lamp,
    AppAssets.ballon,
    AppAssets.nile
  ];
  List<String> dates = ["May 3,2025", "May 2,2025", "May 1,2025", "May 4,2025"];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarHomeWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.h,
                child: ListView.builder(
                    itemCount: titles.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ItemTypesOfSrevicesWidget(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          index: index,
                          selectedIndex: selectedIndex,
                          titles: titles[index]);
                    }),
              ),
              SizedBox(
                height: 10,
              ),
              TopHomeViewWidget(),
              SizedBox(
                height: 24,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: images.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: TravelItemWidget(
                      image: images[index],
                      title: "Apple Unveils Revolutionary AI Features",
                      date: dates[index],
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
