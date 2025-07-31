part of 'package:news_app/home/view.dart';

class TopHomeViewWidget extends StatelessWidget {
  const TopHomeViewWidget({
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
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Image.network(image, errorBuilder: (context, error, stackTrace) {
        return Image.asset(AppAssets.ballon);
      }),
      SizedBox(
        height: 10,
      ),
      Text(title, style: AppStyles.textStyle15),
      SizedBox(
        height: 5.h,
      ),
      Text(date, style: AppStyles.textStyle12Grey),
    ]);
  }
}
