import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class TransformSlider extends StatefulWidget {
  const TransformSlider(this.type, this.value, this.onChanged, {Key? key})
      : super(key: key);
  final int type;
  final int value;
  final Function(int) onChanged;

  @override
  State<TransformSlider> createState() => _TransformSliderState();
}

class _TransformSliderState extends State<TransformSlider> {
  Color activeTrackColor = Colors.red;
  String title = 'R';

  @override
  void initState() {
    // TODO: implement initState
    if (widget.type == 0) {
      activeTrackColor = Colors.red;
      title = 'R';
    } else if (widget.type == 1) {
      activeTrackColor = Colors.green;
      title = 'G';
    } else if (widget.type == 2) {
      activeTrackColor = Colors.blue;
      title = 'B';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 33,
      child: <Widget>[
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 6,
        ),
        Expanded(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: activeTrackColor,
              inactiveTrackColor: const Color(0xffd5d5d5),
              thumbShape:const WhiteDotThumbShape(),
              thumbColor: activeTrackColor,
              overlayColor: const Color(0xffd5d5d5),
              valueIndicatorColor: activeTrackColor,
              trackHeight: 4,
              showValueIndicator: ShowValueIndicator.always,
            ),
            child: Slider(
              value: widget.value.toDouble(),
              min: 0,
              max: 255,
              divisions: 255,
              onChanged: (v) {
                widget.onChanged(v.toInt());
              },
            ),
          ),
        )
      ].toRow(),
    );
  }
}

class WhiteDotThumbShape extends SliderComponentShape {
  const WhiteDotThumbShape();

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size(17, 17);
  }

  @override
  void paint(
      PaintingContext context,
      Offset center, {
        required Animation<double> activationAnimation,
        required Animation<double> enableAnimation,
        required bool isDiscrete,
        required TextPainter labelPainter,
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required TextDirection textDirection,
        required double value,
        required double textScaleFactor,
        required Size sizeWithOverflow,
      }) {
    final Canvas canvas = context.canvas;

    final Paint outerPaint = Paint()
      ..color = sliderTheme.thumbColor ?? Colors.blue
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, 8.5, outerPaint);

    final Paint innerPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, 3.5, innerPaint);
  }
}
