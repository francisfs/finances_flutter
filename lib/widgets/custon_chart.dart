import 'package:finances_flutter/pages/home_page.dart';
import 'package:finances_flutter/widgets/icon_btn.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:finances_flutter/constants.dart';
import 'package:sizer/sizer.dart';

class CustonChart extends StatelessWidget {
  CustonChart({super.key, required this.expenses});
  final List<double>? expenses;

  @override
  Widget build(BuildContext context) {
    double monstExpensive = 0;
    expenses?.forEach((double price) {
      if (price > monstExpensive) {
        monstExpensive = price;
      }
    });

    return Padding(
      padding: EdgeInsets.all(1.w),
      child: Column(
        children: [
          Text(
            'Despesas Semanais',
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
              CustonBtn(onPress: () {}, iconData: Icons.arrow_back_outlined),
              Text(
                '02 Abr 2023 - 08 Abr 2023',
                style: GoogleFonts.atma(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: kTextColor),
              ),
              CustonBtn(onPress: () {}, iconData: Icons.arrow_forward_outlined),
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustonBar(
                day: 'Dom',
                amountSpend: expenses![0],
                expensive: monstExpensive,
              ),
              CustonBar(
                day: 'Seg',
                amountSpend: expenses![1],
                expensive: monstExpensive,
              ),
              CustonBar(
                day: 'Ter',
                amountSpend: expenses![2],
                expensive: monstExpensive,
              ),
              CustonBar(
                day: 'Qua',
                amountSpend: expenses![3],
                expensive: monstExpensive,
              ),
              CustonBar(
                day: 'Qui',
                amountSpend: expenses![4],
                expensive: monstExpensive,
              ),
              CustonBar(
                day: 'Sex',
                amountSpend: expenses![5],
                expensive: monstExpensive,
              ),
              CustonBar(
                day: 'Sab',
                amountSpend: expenses![6],
                expensive: monstExpensive,
              ),
            ],
          )
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
