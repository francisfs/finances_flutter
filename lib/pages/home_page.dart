import 'package:finances_flutter/constants.dart';
import 'package:finances_flutter/data/data.dart';
import 'package:finances_flutter/widgets/custon_chart.dart';
import 'package:finances_flutter/widgets/icon_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            forceElevated: true,
            floating: true,
            expandedHeight: 10.h,
            leading: CustonBtn(
              onPress: () {},
              iconData: Icons.settings_outlined,
            ),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                'My Buget',
                style: GoogleFonts.aBeeZee(
                    fontSize: 12.sp,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w500,
                    color: kTextColor),
              ),
            ),
            actions: [
              CustonBtn(
                onPress: () {},
                iconData: Icons.add_outlined,
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              //childCount: 1,
              (context, index) => Container(
                margin: EdgeInsets.only(
                    left: 2.w, right: 2.w, top: 2.h, bottom: 2.h),
                decoration: BoxDecoration(
                  color: kPrimariColor,
                  borderRadius: BorderRadius.circular(3.h),
                ),
                child: CustonChart(expenses: weeklySpending,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

