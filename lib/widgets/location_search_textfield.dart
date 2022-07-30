import 'package:baxi/ui/screens/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:searchfield/searchfield.dart';

class LocationSearchTextField extends StatefulWidget {
  const LocationSearchTextField({Key? key}) : super(key: key);

  @override
  State<LocationSearchTextField> createState() => _LocationSearchTextFieldState();
}

class _LocationSearchTextFieldState extends State<LocationSearchTextField> {
  final items = [
    'USA',
    'UK',
    'JPN',
    'TUR',
    'CHN',
    'CND',
    'GHN',
    'NGN',
  ];

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.r),
      borderSide: const BorderSide(
        color: Color(0xff9EA1A9),
        width: 1,
      ),
    );

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: SizedBox(
        height: 70.h,
        width: 375.w,
        child: SearchField(
          suggestions: items.map((e) => SearchFieldListItem(e)).toList(),
          suggestionAction: SuggestionAction.unfocus,
          suggestionState: Suggestion.expand,
          onTap: (item) {
            showSelectedSearchResultBottomSheet(context);
          },
          searchInputDecoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: border,
            enabledBorder: border,
            focusedBorder: border,
            hintText: 'Search here',
            suffixIcon: IconButton(
              icon: const Icon(
                Icons.search,
                color: Color(0xffB2B5BD),
              ),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}
