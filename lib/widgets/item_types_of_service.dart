part of 'package:news_app/home/view.dart';

class ItemTypesOfSrevicesWidget extends StatelessWidget {
  const ItemTypesOfSrevicesWidget(
      {super.key,
      required this.selectedIndex,
      required this.titles,
      required this.index,
      required this.onTap});

  final int selectedIndex;
  final int index;
  final String titles;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, top: 8, bottom: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          width: 120.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(23.r),
              color: Colors.white,
              // selectedIndex == index ? Colors.grey.shade300 : Colors.white,
              border: Border.all(width: 1, color: Colors.grey.shade300)),
          child: Text(
            titles,
            style: AppStyles.textStyle15,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
