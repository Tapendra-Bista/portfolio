import 'dart:math';

import 'package:flutter/material.dart';

class SnowEffect extends StatefulWidget {
  final int numberOfSnowflakes;
  final Color snowColor;

  const SnowEffect({
    super.key,
    this.numberOfSnowflakes = 50,
    this.snowColor = Colors.white,
  });

  @override
  State<SnowEffect> createState() => _SnowEffectState();
}

class _SnowEffectState extends State<SnowEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Snowflake> _snowflakes;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();

    _snowflakes = List.generate(
      widget.numberOfSnowflakes,
      (index) => Snowflake(
        x: _random.nextDouble(),
        y: _random.nextDouble(),
        radius: _random.nextDouble() * 1.0 + 0.8,
        speed: _random.nextDouble() * 0.5 + 0.3,
        windSpeed: (_random.nextDouble() - 0.5) * 0.1,
        opacity: _random.nextDouble() * 0.3 + 0.1,
      ),
    );

    _controller.addListener(() {
      setState(() {
        for (var snowflake in _snowflakes) {
          snowflake.fall();
          if (snowflake.y > 1.0) {
            snowflake.reset(_random);
          }
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: CustomPaint(
        painter: SnowPainter(
          snowflakes: _snowflakes,
          color: widget.snowColor,
        ),
        child: Container(),
      ),
    );
  }
}

class Snowflake {
  double x;
  double y;
  double radius;
  double speed;
  double windSpeed;
  double opacity;

  Snowflake({
    required this.x,
    required this.y,
    required this.radius,
    required this.speed,
    required this.windSpeed,
    required this.opacity,
  });

  void fall() {
    y += speed * 0.01;
    x += windSpeed * 0.01;

    // Wrap around horizontally
    if (x > 1.0) x = 0.0;
    if (x < 0.0) x = 1.0;
  }

  void reset(Random random) {
    x = random.nextDouble();
    y = -0.1;
    radius = random.nextDouble() * 1.0 + 0.8;
    speed = random.nextDouble() * 0.5 + 0.3;
    windSpeed = (random.nextDouble() - 0.5) * 0.1;
    opacity = random.nextDouble() * 0.3 + 0.1;
  }
}

class SnowPainter extends CustomPainter {
  final List<Snowflake> snowflakes;
  final Color color;

  SnowPainter({
    required this.snowflakes,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (var snowflake in snowflakes) {
      final paint = Paint()
        ..color = color.withValues(alpha: snowflake.opacity)
        ..style = PaintingStyle.fill;

      canvas.drawCircle(
        Offset(
          snowflake.x * size.width,
          snowflake.y * size.height,
        ),
        snowflake.radius,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
