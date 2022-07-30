import 'package:baxi/styles/text.dart';
import 'package:baxi/widgets/custom_bottomsheet.dart';
import 'package:baxi/widgets/custom_star_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<dynamic> showFullLocationDetailsBottomSheet(BuildContext context) {
  return showCustomBottomSheet(
    context: context,
    padding: EdgeInsets.zero,
    child: const _FullLocationDetailsBody(),
  );
}

class _FullLocationDetailsBody extends StatelessWidget {
  const _FullLocationDetailsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomsheetBody(
      content: [
        Padding(
          padding: EdgeInsets.only(
            top: 10.h,
            left: 20.w,
            right: 20.w,
          ),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              const Dragger(),
              SizedBox(height: 36.h),
              const _Title(),
              SizedBox(height: 5.h),
              const _Rating(),
              SizedBox(height: 8.h),
              const _Address(),
              SizedBox(height: 14.67.h),
              const _PhoneNumber(isLarge: true),
            ],
          ),
        ),
        SizedBox(height: 18.49.h),
        SizedBox(
          height: 185.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            itemCount: 2,
            itemBuilder: (context, index) {
              return Container(
                height: 185.h,
                width: 303.99.w,
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(8.15.r),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 16.01.w);
            },
          ),
        ),
        SizedBox(height: 20.h),
        const CustomDivider(),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Open hours',
                  style: AppText.bold400(context).copyWith(
                    fontSize: 14.sp,
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              day(context),
              SizedBox(height: 4.h),
              day(context),
              SizedBox(height: 4.h),
              day(context),
              SizedBox(height: 4.h),
              day(context),
              SizedBox(height: 4.h),
              day(context),
            ],
          ),
        ),
        SizedBox(height: 40.h),
      ],
    );
  }

  Widget day(BuildContext context) {
    final style = AppText.bold400(context).copyWith(
      fontSize: 14.sp,
      color: const Color(0xff857D7D),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Monday', style: style),
        Text('9:00AM - 10:00PM', style: style),
        Text(
          'Monday',
          style: style.copyWith(
            color: Colors.transparent,
          ),
        ),
      ],
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.h,
      width: 375.w,
      color: Colors.black.withOpacity(.20),
    );
  }
}

class AgentLocationSummaryView extends StatelessWidget {
  const AgentLocationSummaryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        showFullLocationDetailsBottomSheet(context);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _Title(),
          SizedBox(height: 5.h),
          const _Address(),
          SizedBox(height: 5.h),
          Row(
            children: const [
              _Rating(),
              Spacer(),
              _PhoneNumber(),
            ],
          ),
        ],
      ),
    );
  }
}

class _PhoneNumber extends StatelessWidget {
  const _PhoneNumber({
    Key? key,
    this.isLarge = false,
  }) : super(key: key);

  final bool isLarge;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.phone_outlined,
          color: Colors.black,
          size: isLarge ? 25.sp : 20.sp,
        ),
        SizedBox(width: 6.33.w),
        Text(
          '08012332112',
          style: AppText.bold400(context).copyWith(
            fontSize: isLarge ? 20.sp : 13.sp,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class _Rating extends StatelessWidget {
  const _Rating({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '4.5',
          style: AppText.bold400(context).copyWith(
            fontSize: 13.sp,
            color: Colors.black,
          ),
        ),
        SizedBox(width: 6.38.w),
        const CustomStarRatingBar(),
      ],
    );
  }
}

class _Address extends StatelessWidget {
  const _Address({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.contact_mail_outlined,
          color: Colors.black,
          size: 20.sp,
        ),
        SizedBox(width: 5.w),
        Text(
          'Mama Tife Stores, Total Filling Station, Marylan, Ikeja.',
          style: AppText.bold400(context).copyWith(
            fontSize: 13.sp,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Mama Tife Stores',
        style: AppText.bold500(context).copyWith(
          fontSize: 24.sp,
          color: Colors.black,
        ),
      ),
    );
  }
}
