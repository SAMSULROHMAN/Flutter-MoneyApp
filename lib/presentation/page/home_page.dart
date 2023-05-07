import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:moneyrecord/config/app_asset.dart';
import 'package:moneyrecord/config/session.dart';
import 'package:moneyrecord/presentation/controller/c_user.dart';
import 'package:moneyrecord/presentation/page/auth/login_page.dart';
import 'package:d_chart/d_chart.dart';

import '../../config/app_color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cUser = Get.put(CUser());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: Drawer(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 30),
              child: Row(
                children: [
                  Image.asset(AppAsset.profile),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi,',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Obx(() {
                          return Text(
                            cUser.data.name ?? '',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          );
                        })
                      ],
                    ),
                  ),
                  Builder(builder: (ctx) {
                    return Material(
                      borderRadius: BorderRadius.circular(4),
                      color: AppColor.chart,
                      child: InkWell(
                          onTap: () {
                            Scaffold.of(ctx).openEndDrawer();
                          },
                          borderRadius: BorderRadius.circular(4),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.menu,
                              color: AppColor.primary,
                            ),
                          )),
                    );
                  }),
                ],
              ),
            ),
            Expanded(
                child: ListView(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
              children: [
                Text(
                  'Pengeluaran Hari Ini',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                DView.spaceHeight(),
                cardToday(context),
                DChartBar(
                  data: [
                    {
                      'id': 'Bar',
                      'data': [
                        {'domain': '2020', 'measure': 3},
                        {'domain': '2021', 'measure': 4},
                        {'domain': '2022', 'measure': 6},
                        {'domain': '2023', 'measure': 0.3},
                      ],
                    },
                  ],
                  domainLabelPaddingToAxisLine: 16,
                  axisLineTick: 2,
                  axisLinePointTick: 2,
                  axisLinePointWidth: 10,
                  axisLineColor: Colors.green,
                  measureLabelPaddingToAxisLine: 16,
                  barColor: (barData, index, id) => Colors.green,
                  showBarValue: true,
                ),
                Material(
                  borderRadius: BorderRadius.circular(16),
                  elevation: 4,
                  color: AppColor.primary,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 20, 16, 4),
                        child: Text(
                          'Rp 500.000,00',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.secondary),
                        ),
                      ),
                      const Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 30),
                        child: Text(
                          '+20% dibanding kemarin',
                          style: TextStyle(color: AppColor.bg, fontSize: 16),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(16, 0, 0, 16),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Selengkapnya'),
                            Icon(Icons.navigate_next)
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            )),
          ],
        ));
  }

  cardToday(BuildContext context) => cardToday(context);
}
