part of '../login_screen.dart';

class _CustomPainer extends CustomPainter {
  final Color color;

  _CustomPainer(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final h = size.height, w = size.width;
    final paint = Paint()
      ..color = color
      ..strokeWidth = 15;
    final path = Path()
      ..lineTo(0, h)
      ..quadraticBezierTo(w * 0.5, h + (h * 0.5), w, h)
      ..lineTo(w, h)
      ..lineTo(w, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _LoginBanner extends ConsumerWidget {
  _LoginBanner({Key? key}) : super(key: key);

  final _isKbVisible =
      StreamProvider((ref) => KeyboardVisibilityController().onChange);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prov = ref.watch(_isKbVisible);
    final widget = Stack(
      children: [
        CustomPaint(
          size: Size(MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height * 0.16),
          painter: _CustomPainer(Colors.teal),
        ),
        SafeArea(
          child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Shapiping',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.shopping_cart,
                      size: 50,
                      color: Colors.white,
                    ),
                  ],
                ),
                Text(
                  'Your online basurahan shope',
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            color: Colors.teal,
            width: MediaQuery.of(context).size.width,
            child: Center(
                child: Text(
              'v1.0.0',
              style: TextStyle(color: Colors.white),
            )),
          ),
        ),
      ],
    );
    return prov.maybeWhen<Widget>(
      data: (visible) {
        print('Keyboard is visible: $visible');
        if (visible) return Container();

        return widget;
      },
      loading: () => widget,
      orElse: () => Container(),
    );
  }
}
