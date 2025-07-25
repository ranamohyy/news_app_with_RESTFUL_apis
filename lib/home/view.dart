import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:news_app/core/assets.dart';
import 'package:news_app/core/network_services/home_services.dart';
import 'package:news_app/core/styles.dart';
import 'package:news_app/models/news_home_model.dart';
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
  int selectedIndex = 0;
  final Future<dynamic> newsHomeModel = HomeServices().getHomeData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarHomeWidget(
        widget: SizedBox(
          height: 50.h,
          child: ListView.builder(
            itemCount: titles.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: ItemTypesOfSrevicesWidget(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    index: index,
                    selectedIndex: selectedIndex,
                    titles: titles[index]),
              );
            },
          ),
        ),
      ),
      body: FutureBuilder(
          future: newsHomeModel,
          builder: (context, snapshot) {
            final wait = snapshot.connectionState == ConnectionState.waiting;
            if (wait) {
              return Center(
                  child: CircularProgressIndicator(
                color: Colors.black,
              ));
            }
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            if (snapshot.hasData) {
              NewsHomeModel data = snapshot.data as NewsHomeModel;
              if (snapshot.data == null || data.totalResults == 0) {
                return Center(child: Text("No Data"));
              }
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 24,
                      ),
                      Expanded(
                        flex: wait ? 1 : 0,
                        child: TopHomeViewWidget(
                            image: data.articles![0].urlToImage ??
                                "https://static.xx.fbcdn.net/rsrc.php/y1/r/4lCu2zih0ca.svg",
                            title: data.articles![0].title ??
                                "Apple Unveils Revolutionary AI Features",
                            date: DateFormat('yyy:MM:dd-kk:mm')
                                .format(DateTime.parse(
                              data.articles![0].publishedAt ?? "",
                            ))),
                      ),
                      Expanded(
                        flex: 1,
                        child: ListView.builder(
                          itemCount: data.articles!.length - 1,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: TravelItemWidget(
                              image: data.articles![index + 1].urlToImage ??
                                  "https://static.xx.fbcdn.net/rsrc.php/y1/r/4lCu2zih0ca.svg",
                              title: data.articles![index + 1].title ??
                                  "Apple Unveils Revolutionary AI Features",
                              date: DateFormat('yyy:MM:dd-kk:mm')
                                  .format(DateTime.parse(
                                data.articles![index + 1].publishedAt ?? "",
                              )),
                            ),
                          ),
                        ),
                      ),
                    ]),
              );
            }
            return Center(child: Text("No Data"));
          }),
    );
  }
}
