import 'package:flutter/material.dart';
import 'package:news_app/core/styles.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 12,
            ),
            Row(spacing: 12, children: [
              Expanded(
                  flex: 4,
                  child: TextFormField(
                    decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              BorderSide(color: Color(0xff0E0AB1), width: 0)),
                      hintText: "Search",
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey.shade500,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              BorderSide(color: Color(0xff0E0AB1), width: 0)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              color: Colors.grey.shade500, width: 0)),
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: Text(
                    "Cancel",
                    style: AppStyles.textStyle14Blue,
                  ))
            ]),
          ],
        ),
      ),
    ));
  }
}
