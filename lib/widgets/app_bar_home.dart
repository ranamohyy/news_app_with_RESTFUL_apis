part of 'package:news_app/home/view.dart';

class AppBarHomeWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHomeWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xffE9EEFA),
      title: Text(
        "Explore",
        style: AppStyles.textStyle30,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.search,
            color: Colors.black,
            size: 25.sp,
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(65.h);
}
