import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class CurvedNavigationBar extends StatefulWidget {
  final List<BottomBarItem> items;
  final int index;
  final Color color;
  final Color buttonBackgroundColor;
  final Color backgroundColor;
  final ValueChanged<int> onTap;
  final Curve animationCurve;
  final Duration animationDuration;
  final double height;
  final Color selectedColor;
  final Color defaultColor;

  CurvedNavigationBar({
    Key key,
    @required this.items,
    this.index = 0,
    this.color = Colors.purple,
    this.buttonBackgroundColor,
    this.backgroundColor = Colors.blue,
    this.onTap,
    this.animationCurve = Curves.easeOut,
    this.animationDuration = const Duration(milliseconds: 600),
    this.height = 75.0,
    this.selectedColor = Colors.white,
    this.defaultColor = Colors.black54,
  })  : assert(items != null),
        assert(items.length >= 1),
        assert(0 <= index && index < items.length),
        assert(0 <= height && height <= 75.0),
        super(key: key);

  @override
  CurvedNavigationBarState createState() => CurvedNavigationBarState();
}

class CurvedNavigationBarState extends State<CurvedNavigationBar>
    with SingleTickerProviderStateMixin {
  double _pos;
  int _length;
  int tapIndex;

  @override
  void initState() {
    super.initState();
    _length = widget.items.length;
    _pos = widget.index / _length;
    tapIndex = 0;
  }

  @override
  void didUpdateWidget(CurvedNavigationBar oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: widget.height,
      color: Colors.transparent,
      child: Stack(
        overflow: Overflow.visible,
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            bottom: 0 - (80.0 - widget.height),
            child: CustomPaint(
              painter: NavCustomPainter(
                  _pos, _length, Colors.grey[300], Directionality.of(context)),
              child: Container(
                height: 82.0,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0 - (80.0 - widget.height),
            child: CustomPaint(
              painter: NavCustomPainter(
                  _pos, _length, widget.color, Directionality.of(context)),
              child: Container(
                height: 80.0,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0 - (75.0 - widget.height),
            child: SizedBox(
                height: 100.0,
                child: Row(
                    children: widget.items.map((item) {
                  return NavButton(
                    onTap: _buttonTap,
                    position: _pos,
                    length: _length,
                    index: widget.items.indexOf(item),
                    item: item,
                    tapIndex: tapIndex,
                    selectedColor: widget.selectedColor,
                    defaultColor: widget.defaultColor,
                  );
                }).toList())),
          ),
        ],
      ),
    );
  }

  void setPage(int index) {
    _buttonTap(index);
  }

  void _buttonTap(int index) {
    if (widget.onTap != null) {
      setState(() {
        if (index == _getMidIndexOfList())
          tapIndex = tapIndex;
        else
          tapIndex = index;
      });
      widget.onTap(index);
    }
  }

  _getMidIndexOfList() {
    var index;
    if (widget.items.length % 2 != 0)
      index = widget.items.length / 2 - 0.5;
    else
      index = widget.items.length / 2;

    return index;
  }
}

class NavCustomPainter extends CustomPainter {
  double loc;
  double s;
  Color color;
  TextDirection textDirection;

  NavCustomPainter(
      double startingLoc, int itemsLength, this.color, this.textDirection) {
    final span = 1.0 / itemsLength;
    s = 0.12;
    double l = startingLoc + (span - s) / 2;
    loc = textDirection == TextDirection.rtl ? 0.4 - l : l;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo((loc - 0.075) * size.width, 0)
      ..cubicTo(
        (loc + s * 0.05) * size.width,
        size.height * 0.05,
        loc * size.width,
        size.height * 0.32,
        (loc + s * 0.50) * size.width,
        size.height * 0.32,
      )
      ..cubicTo(
        (loc + s) * size.width,
        size.height * 0.32,
        (loc + s - s * 0.05) * size.width,
        size.height * 0.05,
        (loc + s + 0.075) * size.width,
        0,
      )
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}

class NavButton extends StatelessWidget {
  final double position;
  final int length;
  final int index;
  final ValueChanged<int> onTap;
  final BottomBarItem item;
  final int tapIndex;
  final Color selectedColor;
  final Color defaultColor;

  NavButton(
      {this.onTap,
      this.position,
      this.length,
      this.index,
      this.item,
      this.tapIndex,
      this.selectedColor,
      this.defaultColor});

  @override
  Widget build(BuildContext context) {
    final desiredPosition = 1.0 / length * index;
    final difference = (position - desiredPosition).abs();
    final verticalAlignment = 1 - length * difference;
    final opacity = length * difference;
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          onTap(index);
        },
        child: Container(
            height: 75.0,
            child: Transform.translate(
              offset: Offset(
                  0, difference < 1.0 / length ? verticalAlignment * 40 : 0),
              child: Opacity(
                  opacity: difference < 1.0 / length * 0.99 ? opacity : 1.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      (item.icon != null)
                          ? Icon(
                              item.icon,
                              size: 24,
                              color: (index == tapIndex)
                                  ? selectedColor
                                  : defaultColor,
                            )
                          : SizedBox(),
                      Text(
                        item.title ?? '',
                        style: TextStyle(
                            fontSize: 13,
                            color: (index == tapIndex)
                                ? selectedColor
                                : defaultColor),
                      )
                    ],
                  )),
            )),
      ),
    );
  }
}

class BottomBarItem {
  IconData icon;
  String title;

  BottomBarItem({this.icon, this.title});
}
