import 'package:finances_flutter/constants.dart';
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
                    borderRadius: BorderRadius.circular(3.h)),
                child: Column(
                  children: [
                    Text(
                      'Weekly Spendin',
                      style: GoogleFonts.abel(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                        color: kTextColor,
                        letterSpacing: 1.0,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustonBtn(
                            onPress: () {},
                            iconData: Icons.arrow_back_outlined),
                        Text(
                          'Nov 10, 2020 - Nov 18, 2021',
                          style: GoogleFonts.atma(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              color: kTextColor),
                        ),
                        CustonBtn(
                            onPress: () {},
                            iconData: Icons.arrow_forward_outlined),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
