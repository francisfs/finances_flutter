import 'package:finances_flutter/constants.dart';
import 'package:finances_flutter/widgets/icon_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.expenses});
  final List<double>? expenses;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double monstExpensive = 0;
    widget.expenses!.forEach((double price) {
      if (price > monstExpensive) {
        monstExpensive = price;
      }
    });
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
                child: Padding(
                  padding: EdgeInsets.all(1.w),
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
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        children: [
                          CustonBar(
                            day: 'Su',
                            amountSpend: widget.expenses![0],
                            expensive: expensive,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustonBar extends StatelessWidget {
  CustonBar(
      {super.key,
      required this.day,
      required this.expensive,
      required this.amountSpend});

  final String day;
  final double amountSpend;
  final double expensive;
  final double _maxBarHeght = 20.h;

  @override
  Widget build(BuildContext context) {
    final barHeight = amountSpend / expensive * _maxBarHeght;
    return Column(
      children: [
        Text(
          '\$${amountSpend.toStringAsFixed(2)}',
          style: GoogleFonts.aubrey(
              fontSize: 11.sp, fontWeight: FontWeight.w500, color: kTextColor),
        ),
        SizedBox(
          height: 1.h,
        ),
        Container(
          height: barHeight,
          width: 3.w,
          decoration: BoxDecoration(
            color: kSecundaryColor,
            borderRadius: BorderRadius.circular(1.h),
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        Text(
          day,
          style: GoogleFonts.aubrey(
              fontSize: 11.sp, fontWeight: FontWeight.w600, color: kTextColor),
        ),
      ],
    );
  }
}
