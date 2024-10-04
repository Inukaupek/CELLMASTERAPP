import 'package:flutter/material.dart';
import 'package:battery_plus/battery_plus.dart';

class BatteryStatusWidget extends StatefulWidget {
  @override
  _BatteryStatusWidgetState createState() => _BatteryStatusWidgetState();
}

class _BatteryStatusWidgetState extends State<BatteryStatusWidget> {
  final Battery _battery = Battery();
  int _batteryLevel = 0;
  BatteryState _batteryState = BatteryState.charging;

  @override
  void initState() {
    super.initState();
    _initBatteryStatus();
  }

  Future<void> _initBatteryStatus() async {
    // Get the initial battery level
    _batteryLevel = await _battery.batteryLevel;

    // Listen for changes in battery state
    _battery.onBatteryStateChanged.listen((BatteryState state) {
      setState(() {
        _batteryState = state;
      });
    });

    // Update the UI for initial battery level
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$_batteryLevel%",
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 6.0),
        Text(
          _batteryState == BatteryState.charging ? 'Charging' : 'Not Charging',
          style: TextStyle(
            fontSize: 12,
            color: _batteryState == BatteryState.charging
                ? Colors.green
                : Colors.red,
          ),
        ),
      ],
    );
  }
}
