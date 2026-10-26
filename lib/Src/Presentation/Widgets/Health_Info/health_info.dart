import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tab_time/Src/Presentation/Common/Bottom_NavBar/bottom_navbar.dart';
import 'package:tab_time/Src/Presentation/Common/Common_Button/common_button.dart';

class HealthInfo extends StatefulWidget {
  const HealthInfo({super.key});

  @override
  State<HealthInfo> createState() => _HealthInfoState();
}

class _HealthInfoState extends State<HealthInfo> {
  final List<Map<String, dynamic>> items = [
    {
      'title': 'Gender',
      'icon': Icons.person_outline,
      'titleColor': null,
      'iconColor': null,
      'type': 'dropdown',
      'value': 'Male',
      'options': ['Male', 'Female', 'Other'],
    },
    {
      'title': 'Blood Pressure',
      'icon': Icons.monitor_heart_outlined,
      'titleColor': null,
      'iconColor': null,
      'type': 'switch',
      'value': true,
    },
    {
      'title': 'Diabetes',
      'icon': Icons.water_drop_outlined,
      'titleColor': null,
      'iconColor': null,
      'type': 'switch',
      'value': false,
    },
    {
      'title': 'Heart Issues',
      'icon': Icons.favorite_border,
      'titleColor': null,
      'iconColor': null,
      'type': 'switch',
      'value': false,
    },
    {
      'title': 'Allergies',
      'icon': Icons.shield_outlined,
      'titleColor': null,
      'iconColor': null,
      'type': 'dropdown',
      'value': 'None',
      'options': ['None', 'Food', 'Medicine', 'Other'],
    },
    {
      'title': 'Current Medicines',
      'icon': Icons.medication_outlined,
      'titleColor': null,
      'iconColor': null,
      'type': 'dropdown',
      'value': 'None',
      'options': ['None', 'Daily', 'Occasionally', 'Other'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final textstyle = Theme.of(context).textTheme;

    // Apply onPrimary to every item's text and icon.
    for (final item in items) {
      item['titleColor'] = color.onPrimary;
      item['iconColor'] = color.onPrimary;
    }

    return Scaffold(
      backgroundColor: color.primary,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: color.primary,
        elevation: 5,
        shadowColor: color.surface,
        title: Text(
          'Health Info',
          style: textstyle.headlineLarge?.copyWith(color: color.onPrimary),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: _buildItemCard(items[index]),
                  );
                },
              ),
            ),
            CommonButton(
              text: 'Continue',
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => BottomNavBar()),
                );
              },
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }

  Widget _buildItemCard(Map<String, dynamic> item) {
    final color = Theme.of(context).colorScheme;
    final textstyle = Theme.of(context).textTheme;

    final bool isSwitch = item['type'] == 'switch';

    final List<String> options = isSwitch
        ? <String>[]
        : List<String>.from(item['options'] as List);

    final String? storedValue = item['value'] is String
        ? item['value'] as String
        : null;

    final String? selectedValue = options.contains(storedValue)
        ? storedValue
        : null;

    return Container(
      constraints: BoxConstraints(minHeight: 60.h),
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      decoration: BoxDecoration(
        color: color.surface,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: color.onPrimary, width: 1),
      ),
      child: Row(
        children: [
          Icon(
            item['icon'] as IconData,
            size: 27.r,
            color: item['iconColor'] as Color? ?? color.onPrimary,
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: Text(
              item['title'] as String,
              style: textstyle.titleMedium?.copyWith(
                color: item['titleColor'] as Color? ?? color.onPrimary,
              ),
            ),
          ),
          if (isSwitch)
            Switch(
              value: item['value'] as bool? ?? false,
              onChanged: (value) {
                setState(() {
                  item['value'] = value;
                });
              },
              activeThumbColor: color.primary,
              activeTrackColor: color.error,
              inactiveThumbColor: color.primary,
              inactiveTrackColor: color.onPrimary,
              trackOutlineColor: WidgetStateProperty.all(Colors.black),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            )
          else
            SizedBox(
              width: 80.w,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: selectedValue,
                  hint: Text(
                    'Select',
                    style: textstyle.bodyMedium?.copyWith(
                      color: color.onPrimary,
                    ),
                  ),
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: color.onPrimary,
                    size: 25.r,
                  ),
                  borderRadius: BorderRadius.circular(14.r),
                  items: options.map((option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(
                        option,
                        overflow: TextOverflow.ellipsis,
                        style: textstyle.bodyMedium?.copyWith(
                          color: color.onPrimary,
                        ),
                      ),
                    );
                  }).toList(),
                  style: textstyle.bodyMedium?.copyWith(color: color.onPrimary),
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() {
                      item['value'] = value;
                    });
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
