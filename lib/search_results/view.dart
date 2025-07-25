import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/core/network_services/home_services.dart';
import 'package:news_app/home/view.dart';
import 'package:news_app/models/news_home_model.dart';

class SearchResultsScreen extends StatefulWidget {
  const SearchResultsScreen({super.key});
  @override
  State<SearchResultsScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<SearchResultsScreen> {
  final Future<dynamic> newsHomeModel = HomeServices().getHomeData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Search Results"),
        centerTitle: true,
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
                        flex: 1,
                        child: ListView.builder(
                          itemCount: data.articles!.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: TravelItemWidget(
                              image: data.articles![index].urlToImage ??
                                  "https://static.xx.fbcdn.net/rsrc.php/y1/r/4lCu2zih0ca.svg",
                              title: data.articles![index].title ??
                                  "Apple Unveils Revolutionary AI Features",
                              date: DateFormat('yyy:MM:dd-kk:mm')
                                  .format(DateTime.parse(
                                data.articles![index].publishedAt ?? "",
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
