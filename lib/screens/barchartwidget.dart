import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import './bar_data.dart';

class BarChartWidget extends StatefulWidget {
  @override
  _BarChartWidgetState createState() => _BarChartWidgetState();
}

class _BarChartWidgetState extends State<BarChartWidget> {
  final double barWidth = 14;

  @override
  void initState() {
    super.initState();
    BarData.loadData().then((_) {
      setState(() {});
    });
  }
  @override
 Widget build(BuildContext context) => Transform.scale(
      scale: 0.80,
      child:Container(
      width: 600,
      height: 500,
      margin: const EdgeInsets.only(top: 60, left: 0, right:0),
      // margin: const EdgeInsets.only(left: 20),
      child:Stack(
      children:[BarChart(
      BarChartData(
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        alignment:BarChartAlignment.spaceAround,
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(sideTitles:
           SideTitles(
            showTitles: true,
            interval: 400, 

  ),
  ),
           
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              // EdgeInsets:.only(left:-30),
              showTitles: true,
              getTitlesWidget: getTopBottomTitles,
            ),
          ),
        ),
        // alignment: BarChartAlignment.center,
        maxY: 2000,
        minY: 0,
        groupsSpace: 12,
        barTouchData: BarTouchData(enabled: true),
        barGroups: BarData.barData.isNotEmpty
            ? BarData.barData.map(
                (e) => BarChartGroupData(
                  x: e.month,
                  barRods: [
                    BarChartRodData(
                      toY: e.profit,
                      width: barWidth,
                      color: Colors.deepOrange,
                      borderRadius: e.profit > 0
                          ? const BorderRadius.only(
                        topLeft: Radius.circular(6),
                        topRight: Radius.circular(6),
                      )
                          : const BorderRadius.only(
                        bottomLeft: Radius.circular(6),
                        bottomRight: Radius.circular(6),
                      ),
                    ),
                    BarChartRodData(
                      toY: e.revenue,
                      width: barWidth,
                      color: Colors.green,
                      borderRadius: e.revenue > 0
                          ? const BorderRadius.only(
                        topLeft: Radius.circular(6),
                        topRight: Radius.circular(6),
                      )
                          : const BorderRadius.only(
                        topLeft: Radius.circular(6),
                        topRight: Radius.circular(6),
                      ),
                    ),
                  ],
                ),
              ).toList()
            : [],
      ),
      
    ),
    Positioned(
              right: 0,
              top: 0,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Text('Profit', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(6),

                        ),
                      ),
                      const SizedBox(width:5),
                      const Text('Revenue',style:TextStyle(fontSize: 14)),
                      ]),


    
    ]
    )

    )
    ])
    )
    );


// Widget getLeftTitles(double value, TitleMeta meta) {
//   Widget text=;
//   if (value == 200) {
//     return Text('200');
//   } else if (value == 1800) {
//     return Text('1800');
//   } else {
//      double y=value;
//      y=y/100;
//      if(y%2==0)
//      {
//       double z = y*100;
//       return Text(z.toString());
//      }
//      else
//      {

//      }

//   }
// }

Widget getTopBottomTitles(double value,TitleMeta meta){
  const style= TextStyle(color: Colors.grey, 
  fontWeight: FontWeight.bold,
  fontSize: 14,);
Widget text;
switch (value.toInt()){
  case 1:
  text = const Text('Jan',style:style);
  break;
  case 2:
  text = const Text('Feb',style:style);
  break;
  case 3:
  text = const Text('Mar',style:style);
  break;
  case 4:
  text = const Text('Apr',style:style);
  break;
  case 5:
  text = const Text('May',style:style);
  break;
  case 6:
  text = const Text('Jun',style:style);
  break;
  case 7:
  text = const Text('Jul',style:style);
  break;
  case 8:
  text = const Text('Aug',style:style);
  break;
  case 9:
  text = const Text('Sept',style:style);
  break;
  case 10:
  text = const Text('Oct',style:style);
  break;
  case 11:
  text = const Text('Nov',style:style);
  break;
  case 12:
  text = const Text('Dec',style:style);
  break;
  default:
  text = const Text('Jan',style:style);
};
  return SideTitleWidget(child: text, axisSide: meta.axisSide);
}
}