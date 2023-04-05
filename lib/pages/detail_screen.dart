import 'package:finances_flutter/constants.dart';
import 'package:finances_flutter/models/cost_model.dart';
import 'package:finances_flutter/pages/home_page.dart';
import 'package:finances_flutter/widgets/icon_btn.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../models/type_model.dart';
import '../widgets/circle_painter.dart';

class DetailScreen extends StatefulWidget {
  final TypeModel? typeModel;
  const DetailScreen({super.key, this.typeModel});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    double tAmountSpend = 0;
    widget.typeModel!.expenses!.forEach((CostModel expenses) {
      tAmountSpend += expenses.cost!;
    });
    final double amountLeft = widget.typeModel!.maxAmount! - tAmountSpend;
    final double percentage = amountLeft / widget.typeModel!.maxAmount!;
    return Scaffold(
      appBar: AppBar(
        leading: CustonBtn(
          onPress: () {
            Navigator.pop(context);
          },
          iconData: Icons.arrow_back_outlined,
        ),
        title: Text(
          widget.typeModel!.name!,
          style: GoogleFonts.aBeeZee(
              fontSize: 12.sp,
              letterSpacing: 1.0,
              fontWeight: FontWeight.w500,
              color: kTextColor),
        ),
        actions: [
          CustonBtn(
              onPress: () {
                Navigator.pop(context);
              },
              iconData: Icons.add_outlined)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: kMargin,
              padding: kPadding,
              height: 35.h,
              width: 100.w,
              decoration: BoxDecoration(
                color: kPrimariColor,
                borderRadius: kRadius,
              ),
              child: CustomPaint(
                foregroundPainter: CirclePainter(
                    bgColor: Colors.grey[200],
                    lineColor: setupColor(percentage),
                    percentage: percentage,
                    width: 5.w),
                child: Center(
                  child: Text(
                    '\$${amountLeft.toStringAsFixed(2)}/\$${widget.typeModel!.maxAmount!.toStringAsFixed(2)}',
                    style: GoogleFonts.aubrey(
                        fontWeight: FontWeight.w500,
                        color: kSecundaryColor,
                        fontSize: 16.5.sp,
                        letterSpacing: 2.0),
                  ),
                ),
              ),
            ),
            _buildExpensiveList()
          ],
        ),
      ),
    );
  }

  _buildExpensiveList() {
    List<Widget> expensiveList = [];
    widget.typeModel!.expenses!.forEach((CostModel expense) {
      expensiveList.add(
        Container(
          margin: kMargin,
          alignment: Alignment.center,
          width: 100.w,
          height: 10.h,
          decoration:
              BoxDecoration(color: kPrimariColor, borderRadius: kRadius),
          child: Padding(
            padding: kPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  expense.name!,
                  style: GoogleFonts.atma(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: kTextColor,
                      letterSpacing: 1.0),
                ),
                Text(
                  '\$${expense.cost!.toStringAsPrecision(2)}',
                  style: GoogleFonts.atma(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: kSecundaryColor,
                      letterSpacing: 1.0),
                )
              ],
            ),
          ),
        ),
      );
    });
    return Column(
      children: expensiveList,
    );
  }
}