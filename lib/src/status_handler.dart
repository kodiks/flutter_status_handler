import 'package:flutter/material.dart';
import 'package:status_handler/src/status_handler_manager.dart';
import 'package:status_handler/src/status.dart';

class WidgetStatusHandler extends StatefulWidget {
  final StatusHandlerManager manager;

  final Widget Function(Status) builder;

  const WidgetStatusHandler({
    Key key,
    @required this.manager,
    @required this.builder,
  }) : super(key: key);
  @override
  _WidgetStatusHandlerState createState() => _WidgetStatusHandlerState();
}

class _WidgetStatusHandlerState extends State<WidgetStatusHandler> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Status>(
        stream: widget.manager.statusCommand,
        initialData: widget.manager.statusCommand.lastResult,
        builder: (context, snapshot) {
          return widget.builder(snapshot.data);
        });
  }
}
