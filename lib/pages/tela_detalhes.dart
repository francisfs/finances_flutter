import 'package:finances_flutter/constants.dart';
import 'package:finances_flutter/widgets/icon_btn.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../models/tipo_model.dart';
import '../widgets/circle_painter.dart';

class DetailScreen extends StatefulWidget {
  final CategoriaModel? tipoModel;
  const DetailScreen({super.key, this.tipoModel});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    double valorGastoTotal = 0;
    for (var expenses in widget.tipoModel!.despesas!) {
      valorGastoTotal += expenses.custo;
    }
    final double amountLeft = widget.tipoModel!.valorMaximo! - valorGastoTotal;
    final double porcentagem = amountLeft / widget.tipoModel!.valorMaximo!;
    return Scaffold(
      appBar: AppBar(
        leading: CustonBtn(
          onPress: () {
            Navigator.pop(context);
          },
          iconData: Icons.arrow_back_outlined,
        ),
        title: Text(
          widget.tipoModel!.nome!,
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
                    lineColor: setupColor(porcentagem),
                    porcentagem: porcentagem,
                    width: 5.w),
                child: Center(
                  child: Text(
                    '\$${amountLeft.toStringAsFixed(2)}/\$${widget.tipoModel!.valorMaximo!.toStringAsFixed(2)}',
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
    for (var expense in widget.tipoModel!.despesas!) {
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
                  expense.nome!,
                  style: GoogleFonts.atma(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: kTextColor,
                      letterSpacing: 1.0),
                ),
                Text(
                  '\$${expense.custo.toStringAsPrecision(2)}',
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
    }
    return Column(
      children: expensiveList,
    );
  }
}
