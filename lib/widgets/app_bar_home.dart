part of 'package:news_app/home/view.dart';

class AppBarHomeWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHomeWidget({super.key, required this.widget});
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: widget,
      ),
      backgroundColor: Color(0xffE9EEFA),
      title: Text(
        "Explore",
        style: AppStyles.textStyle30,
      ),
      actions: [
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                context.push(AppRoutes.search);
              },
              icon: Icon(
                Icons.search,
                color: Colors.black,
                size: 25.sp,
              ),
            ))
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100.h);
}
