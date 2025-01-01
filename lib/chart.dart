import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartSampleTwoLines extends StatelessWidget {
  const LineChartSampleTwoLines({Key? key}) : super(key: key);

  List<LineChartBarData> _buildLineChartBars() {
    return [
      _buildLineChartBar(
        color: Colors.green,
        spots: [
          FlSpot(0, 75),
          FlSpot(1, 160),
          FlSpot(2, 240),
          FlSpot(3, 320),
          FlSpot(4, 200),
          FlSpot(5, 100),
          FlSpot(6, 180),
          FlSpot(7, 280),
          FlSpot(8, 260),
          FlSpot(9, 180),
          FlSpot(10, 140),
          FlSpot(11, 160),
        ],
      ),
      _buildLineChartBar(
        color: Colors.black,
        spots: [
          FlSpot(0, 160),
          FlSpot(1, 280),
          FlSpot(2, 360),
          FlSpot(3, 480),
          FlSpot(4, 320),
          FlSpot(5, 240),
          FlSpot(6, 360),
          FlSpot(7, 440),
          FlSpot(8, 400),
          FlSpot(9, 300),
          FlSpot(10, 220),
          FlSpot(11, 280),
        ],
      ),
    ];
  }

  LineChartBarData _buildLineChartBar(
      {required Color color, required List<FlSpot> spots}) {
    return LineChartBarData(
      spots: spots,
      isCurved: true,
      color: color,
      barWidth: 2,
      dotData: const FlDotData(show: false),
      belowBarData: BarAreaData(
        show: true,
        gradient: LinearGradient(
          colors: [color.withOpacity(0.2), color.withOpacity(0.0)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }

  Widget _getBottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(color: Colors.black, fontSize: 10);
    final titles = ['J', 'F', 'M', 'A', 'M', 'J', 'J', 'A', 'S', 'O', 'N', 'D'];
    return Text(
      titles[value.toInt()],
      style: style,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          height: 300, // Adjusted height for better display
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: LineChart(
              LineChartData(
                lineTouchData: const LineTouchData(enabled: false),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 80,
                      reservedSize: 30,
                      getTitlesWidget: (value, meta) => Text(
                        value.toInt().toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 10),
                      ),
                    ),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      reservedSize: 30,
                      showTitles: true,
                      getTitlesWidget: _getBottomTitles,
                    ),
                  ),
                ),
                gridData: const FlGridData(show: false),
                borderData: FlBorderData(
                  show: true,
                  border: const Border(
                    left: BorderSide(color: Colors.black, width: 1),
                    bottom: BorderSide(color: Colors.black, width: 1),
                  ),
                ),
                lineBarsData: _buildLineChartBars(),
                minX: 0,
                maxX: 11,
                minY: 0,
                maxY: 560,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
