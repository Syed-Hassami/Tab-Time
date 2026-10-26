import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tab_time/Src/Domain/medicines_model.dart';

class HomeDashboard extends StatefulWidget {
  const HomeDashboard({super.key});

  @override
  State<HomeDashboard> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  late final List<MedicinesModel> medicines;

  @override
  void initState() {
    super.initState();

    medicines = [
      MedicinesModel(
        name: 'Paracetamol 500mg',
        dosage: '1 tablet',
        instructions: 'After meal',
        time: '08:00 AM',
        istaken: true,
      ),
      MedicinesModel(
        name: 'Vitamin D3',
        dosage: '1 capsule',
        instructions: 'After breakfast',
        time: '12:00 PM',
      ),
      MedicinesModel(
        name: 'Metformin 500mg',
        dosage: '1 tablet',
        instructions: 'With meal',
        time: '08:00 PM',
      ),
    ];
  }

  @override
  void dispose() {
    for (final medicine in medicines) {
      medicine.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final textstyle = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: color.primary,
      appBar: AppBar(
        backgroundColor: color.primary,
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back,',
              style: textstyle.displayMedium?.copyWith(color: color.onPrimary),
            ),
            Text(
              'Hassam',
              style: textstyle.headlineLarge?.copyWith(color: color.onPrimary),
            ),
            Text(
              "Today's Medicines",
              style: textstyle.displayMedium?.copyWith(color: color.onPrimary),
            ),
          ],
        ),
        elevation: 5,
        shadowColor: color.surface,
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: color.surface,
                child: Icon(Icons.person),
              ),

              Text(
                "view all",
                style: textstyle.displayMedium?.copyWith(
                  color: color.onPrimary,
                ),
              ),
            ],
          ),
          SizedBox(width: 5.w),
        ],
      ),

      body: SafeArea(
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          itemCount: medicines.length,
          itemBuilder: (context, index) {
            final medicine = medicines[index];
            return Container(
              margin: EdgeInsets.only(bottom: 10.h),
              decoration: BoxDecoration(
                color: color.surface,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: ValueListenableBuilder<bool>(
                valueListenable: medicine.istaken,
                builder: (context, isTaken, child) {
                  return ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 10.h,
                    ),
                    leading: Container(
                      width: 50.w,
                      height: 50.w,
                      decoration: BoxDecoration(
                        color: isTaken
                            ? const Color(0xFFE5FAF3)
                            : const Color.fromARGB(255, 198, 218, 249),
                        borderRadius: BorderRadius.circular(13.r),
                      ),
                      child: Icon(
                        Icons.medication_outlined,
                        color: isTaken ? color.secondary : color.surface,
                        size: 27.sp,
                      ),
                    ),
                    title: Text(
                      medicine.name,
                      style: textstyle.displayMedium?.copyWith(
                        color: color.onPrimary,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 4.h),
                        Text(
                          '${medicine.dosage} • ${medicine.instructions}',
                          style: textstyle.displayMedium?.copyWith(
                            color: color.onPrimary,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          medicine.time,
                          style: textstyle.headlineSmall?.copyWith(
                            color: isTaken
                                ? const Color(0xFF00B982)
                                : color.onPrimary,
                          ),
                        ),
                      ],
                    ),
                    trailing: GestureDetector(
                      onTap: () {
                        medicine.istaken.value = !isTaken;
                      },
                      child: Container(
                        width: 29.w,
                        height: 29.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isTaken ? color.secondary : color.surface,
                          border: Border.all(
                            color: isTaken
                                ? const Color(0xFF10B981)
                                : const Color(0xFFDCE5F1),
                            width: 2,
                          ),
                        ),
                        child: isTaken
                            ? Icon(
                                Icons.check,
                                color: color.surface,
                                size: 20.sp,
                              )
                            : null,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
