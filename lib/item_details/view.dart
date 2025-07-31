import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:news_app/core/styles.dart';
import 'package:news_app/models/news_home_model.dart';

class ItemDetailsScreen extends StatelessWidget {
  const ItemDetailsScreen({super.key, required this.articles});
  final Articles articles;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Container(
          margin: EdgeInsets.all(12),
          height: 40.h,
          width: 40.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: BackButton(
            color: Colors.white,
            onPressed: () {
              context.pop();
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Image.network(
                articles.urlToImage ?? "",
                height: 400.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                  top: 300.h,
                  child: Container(
                    padding: EdgeInsets.all(12),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20.r))),
                    child: Column(
                      spacing: 12,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(articles.title ?? "",
                            style: AppStyles.textStyle15),
                        Text(
                            "${articles.author ?? ""} - ${DateFormat('yyy:MM:dd').format(DateTime.parse(articles.publishedAt ?? ""))}",
                            style: AppStyles.textStyle12Grey),
                        Text(
                          articles.description ?? "",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
