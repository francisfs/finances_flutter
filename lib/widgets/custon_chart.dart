import 'package:finances_flutter/pages/tela_principal.dart';
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
                dia: 'Dom',
                valorGasto: expenses![0],
                maisCaro: monstExpensive,
              ),
              CustonBar(
                dia: 'Seg',
                valorGasto: expenses![1],
                maisCaro: monstExpensive,
              ),
              CustonBar(
                dia: 'Ter',
                valorGasto: expenses![2],
                maisCaro: monstExpensive,
              ),
              CustonBar(
                dia: 'Qua',
                valorGasto: expenses![3],
                maisCaro: monstExpensive,
              ),
              CustonBar(
                dia: 'Qui',
                valorGasto: expenses![4],
                maisCaro: monstExpensive,
              ),
              CustonBar(
                dia: 'Sex',
                valorGasto: expenses![5],
                maisCaro: monstExpensive,
              ),
              CustonBar(
                dia: 'Sab',
                valorGasto: expenses![6],
                maisCaro: monstExpensive,
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
      required this.dia,
      required this.maisCaro,
      required this.valorGasto});

  final String dia;
  final double valorGasto;
  final double maisCaro;
  final double _maxBarHeght = 20.h;

  @override
  Widget build(BuildContext context) {
    final barHeight = valorGasto / maisCaro * _maxBarHeght;
    return Column(
      children: [
        Text(
          '\$${valorGasto.toStringAsFixed(2)}',
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
          dia,
          style: GoogleFonts.aubrey(
              fontSize: 11.sp, fontWeight: FontWeight.w600, color: kTextColor),
        ),
      ],
    );
  }
}
