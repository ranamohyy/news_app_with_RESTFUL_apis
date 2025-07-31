part of 'package:news_app/home/view.dart';

class TravelItemWidget extends StatelessWidget {
  const TravelItemWidget({
    super.key,
    required this.title,
    required this.date,
    required this.image,
  });
  final String title;
  final String date;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 15.w,
      children: [
        Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppStyles.textStyle15,
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  date,
                  style: AppStyles.textStyle12Grey,
                ),
              ],
            )),
        Expanded(
            child: Image.network(
          image,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset(AppAssets.ballon);
          },
        ))
      ],
    );
  }
}
