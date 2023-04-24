import 'package:finances_flutter/constants.dart';
import 'package:finances_flutter/data/data.dart';
import 'package:finances_flutter/models/custo_model.dart';
import 'package:finances_flutter/models/tipo_model.dart';
import 'package:finances_flutter/pages/tela_detalhes.dart';
import 'package:finances_flutter/widgets/custon_chart.dart';
import 'package:finances_flutter/widgets/icon_btn.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

//https://www.youtube.com/watch?v=MJFz6K8lXyA&list=PPSV

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
                'Minhas Finanças',
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
            delegate: SliverChildBuilderDelegate((context, index) {
              if (index == 0) {
                return Container(
                  margin: EdgeInsets.only(
                      left: 2.w, right: 2.w, top: 2.h, bottom: 2.h),
                  decoration: BoxDecoration(
                    color: kPrimariColor,
                    borderRadius: BorderRadius.circular(3.h),
                  ),
                  child: CustonChart(
                    expenses: gastosSemanais,
                  ),
                );
              } else {
                final CategoriaModel tipoModel = categoriasNomes[index - 1];
                double valorGastoTotal = 0;
                tipoModel.despesas!.forEach((CustoModel despesa) {
                  valorGastoTotal += despesa.custo!;
                });
                return _buildCategories(tipoModel, valorGastoTotal);
              }
            }, childCount: 1 + categoriasNomes.length),
          ),
        ],
      ),
    );
  }

  _buildCategories(CategoriaModel categoria, double valorGastoTotal) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              tipoModel: categoria,
            ),
          ),
        );
      },
      child: Container(
        width: 100.w,
        height: 13.h,
        margin: kMargin,
        padding: kPadding,
        decoration: BoxDecoration(
          color: kPrimariColor,
          borderRadius: BorderRadius.circular(2.h),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  categoria.nome!,
                  style: GoogleFonts.abel(
                    fontSize: 14.sp,
                    color: kTextColor,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.0,
                  ),
                ),
                Text(
                  '\$${(categoria.valorMaximo! - valorGastoTotal).toStringAsFixed(2)} / \$${categoria.valorMaximo!.toStringAsFixed(2)}',
                  style: GoogleFonts.atma(
                    fontSize: 14.sp,
                    color: kTextColor,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            LayoutBuilder(builder: (context, constraints) {
              final double maxBarWidth = constraints.maxWidth;
              final double percentage = (categoria.valorMaximo! - valorGastoTotal) /
                  categoria.valorMaximo!;
              double width = percentage * maxBarWidth;
              if (width < 0) {
                width = 0;
              }
              return Stack(
                children: [
                  Container(
                    height: 2.4.h,
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(2.h),
                            bottomRight: Radius.circular(2.h))),
                  ),
                  Container(
                    height: 2.4.h,
                    width: width,
                    decoration: BoxDecoration(
                        color: setupColor(percentage),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(2.h),
                            bottomRight: Radius.circular(2.h))),
                  )
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}
