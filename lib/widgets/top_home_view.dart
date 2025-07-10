part of 'package:news_app/home/view.dart';

class TopHomeViewWidget extends StatelessWidget {
  const TopHomeViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Image.asset(AppAssets.ballon),
      SizedBox(
        height: 10,
      ),
      Text("Apple Unveils Revolutionary AI Features ",
          style: AppStyles.textStyle15),
      SizedBox(
        height: 5.h,
      ),
      Text("May 1, 2025", style: AppStyles.textStyle12Grey),
    ]);
  }
}
