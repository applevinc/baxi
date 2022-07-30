import 'package:baxi/styles/colors.dart';
import 'package:baxi/styles/text.dart';
import 'package:baxi/ui/screens/agent_location_detail_view.dart';
import 'package:baxi/widgets/app_button.dart';
import 'package:baxi/widgets/custom_bottomsheet.dart';
import 'package:baxi/widgets/custom_dialog.dart';
import 'package:baxi/widgets/location_search_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Find a Baxi Agent',
          style: AppText.bold500(context).copyWith(
            fontSize: 16.sp,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Stack(
            alignment: Alignment.center,
            children: [
              const _MapView(),
              Positioned(
                top: 24.h,
                child: const LocationSearchTextField(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(
          Icons.my_location,
          color: AppColors.yellow,
          size: 30.sp,
        ),
        onPressed: () {
          //showSelectedSearchResultBottomSheet(context);
          // showLocationAccessDialog(context);
          showFullLocationDetailsBottomSheet(context);
        },
      ),
    );
  }
}

Future<dynamic> showLocationAccessDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return const LocationAccessDialog();
    },
  );
}

class LocationAccessDialog extends StatelessWidget {
  const LocationAccessDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomDialogBody(
      content: [
        Text(
          'LOCATION ACCESS',
          style: AppText.bold700(context).copyWith(
            fontSize: 24.sp,
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          'Your will need to turn on your location to find Agents closest to you',
          textAlign: TextAlign.center,
          style: AppText.bold400(context).copyWith(
            fontSize: 18.sp,
          ),
        ),
        SizedBox(height: 15.h),
        AppButton(
          label: 'TURN ON MY LOCATION',
          onTap: () {},
        ),
        SizedBox(height: 15.h),
        AppButton(
          label: 'IGNORE',
          backgroundColor: Colors.white,
          border: const BorderSide(color: AppColors.yellow),
          onTap: () {},
        ),
      ],
    );
  }
}

class _MapView extends StatelessWidget {
  const _MapView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.r),
      child: Container(
        height: 780.h,
        color: Colors.red,
      ),
    );
  }
}

Future<dynamic> showSelectedSearchResultBottomSheet(BuildContext context) {
  return showCustomBottomSheet(
    context: context,
    child: BottomsheetBody(
      content: [
        const Dragger(),
        SizedBox(height: 36.h),
        const AgentLocationSummaryView(),
        SizedBox(height: 17.5.h),
        AppButton(
          label: 'VIEW MORE',
          onTap: () {},
        ),
        SizedBox(height: 14.h),
      ],
    ),
  );
}
