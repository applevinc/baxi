import 'package:baxi/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<dynamic> showCustomBottomSheet({
  required BuildContext context,
  required Widget child,
  bool isDismissible = true,
  bool enableDrag = true,
  EdgeInsetsGeometry? padding,
  double bottomSpace = 0,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    enableDrag: enableDrag,
    isDismissible: isDismissible,
    backgroundColor: Colors.transparent,
    builder: (context) => SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: padding ??
              EdgeInsets.only(
                top: 10.h,
                right: 21.w,
                left: 21.w,
                bottom: bottomSpace,
              ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50.r),
              topRight: Radius.circular(50.r),
            ),
          ),
          child: child,
        ),
      ),
    ),
  );
}

class BottomsheetBody extends StatelessWidget {
  const BottomsheetBody({Key? key, required this.content}) : super(key: key);

  final List<Widget> content;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: content,
    );
  }
}

class Dragger extends StatelessWidget {
  const Dragger({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.h,
      width: 124.w,
      color: AppColors.yellow,
    );
  }
}
