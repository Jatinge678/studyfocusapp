// screens/pomodoro_screen.dart
import 'package:flutter/material.dart';
import 'dart:math' as math;

class PomodoroScreen extends StatefulWidget {
  const PomodoroScreen({Key? key}) : super(key: key);

  @override
  State<PomodoroScreen> createState() => _PomodoroScreenState();
}

class _PomodoroScreenState extends State<PomodoroScreen> with SingleTickerProviderStateMixin {
  bool isPlaying = false;
  String selectedMode = 'Focus';
  double progress = 0.65; // sample progress
  late AnimationController playPauseController;

  @override
  void initState() {
    super.initState();
    playPauseController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
      upperBound: 1,
      lowerBound: 0,
    )..value = 0;
  }

  @override
  void dispose() {
    playPauseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double bottomNavHeight = 72; // estimate for bottom nav height

    return Container(
      color: const Color(0xFFFCFCF9),
      child: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom -
                  bottomNavHeight,
            ),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  // Header
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.arrow_back, color: Color(0xFF134252)),
                        Text(
                          'Adaptive Pomodoro',
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF134252),
                          ),
                        ),
                        Icon(Icons.settings, color: Color(0xFF134252)),
                      ],
                    ),
                  ),
                  // AI Suggestion
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 18, 20, 0),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Color(0xFF32B8C6).withOpacity(0.08),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Color(0xFF32B8C6).withOpacity(0.15)),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.auto_awesome, color: Color(0xFF21808D), size: 20),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'AI suggests: 30 min focus based on your energy level',
                            style: TextStyle(fontSize: 13, color: Color(0xFF134252)),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('Apply', style: TextStyle(color: Color(0xFF21808D), fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),
                  // Timer Section
                  Center(
                    child: Container(
                      width: 282,
                      height: 282,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.white.withOpacity(0.32), Color(0xFF32B8C6).withOpacity(0.09)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(180),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF134252).withOpacity(0.07),
                            blurRadius: 24,
                            offset: const Offset(0, 16),
                          ),
                        ],
                        border: Border.all(color: Color(0xFF32B8C6).withOpacity(0.13), width: 2.4),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CustomPaint(
                            painter: ModernPomodoroPainter(progress: progress),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeOut,
                                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 26),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.63),
                                  borderRadius: BorderRadius.circular(18),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFF21808D).withOpacity(0.07),
                                      blurRadius: 10,
                                      offset: Offset(0, 8),
                                    ),
                                  ],
                                ),
                                child: Text(
                                  selectedMode,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    letterSpacing: 1.2,
                                    color: Color(0xFF21808D),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 17),
                              Text(
                                '16:30',
                                style: TextStyle(
                                  fontSize: 62,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF134252),
                                  letterSpacing: -2,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Color(0xFF32B8C6).withOpacity(0.12),
                                  borderRadius: BorderRadius.circular(22),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.psychology, color: Color(0xFF21808D), size: 15),
                                    SizedBox(width: 6),
                                    Text('Focus: 82%',
                                        style: TextStyle(color: Color(0xFF21808D), fontWeight: FontWeight.bold, fontSize: 13)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  // Play/Pause Button (fully visible, below timer)
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isPlaying = !isPlaying;
                          isPlaying
                              ? playPauseController.forward()
                              : playPauseController.reverse();
                        });
                      },
                      child: AnimatedScale(
                        scale: 1.12,
                        duration: Duration(milliseconds: 200),
                        child: Container(
                          width: 84,
                          height: 84,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFF21808D).withOpacity(0.28),
                                blurRadius: 18,
                                offset: Offset(0, 7),
                              ),
                            ],
                            gradient: LinearGradient(
                              colors: [Color(0xFF21808D), Color(0xFF32B8C6)],
                            ),
                          ),
                          child: Center(
                            child: AnimatedIcon(
                              icon: AnimatedIcons.play_pause,
                              progress: playPauseController,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 36),
                  // Mode Selector
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    child: Container(
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Color(0xFF5E5240).withOpacity(0.11),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF21808D).withOpacity(0.03),
                            blurRadius: 12,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(child: _buildModeTab('Focus', selectedMode == 'Focus')),
                          Expanded(child: _buildModeTab('Break', selectedMode == 'Break')),
                          Expanded(child: _buildModeTab('Long Break', selectedMode == 'Long Break')),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  // Session Info Row
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildInfoItem('3/4', 'Session', Icons.repeat),
                        Container(height: 30, width: 1, color: Color(0xFF5E5240).withOpacity(0.13)),
                        _buildInfoItem('2h 15m', 'Today', Icons.timer),
                        Container(height: 30, width: 1, color: Color(0xFF5E5240).withOpacity(0.13)),
                        _buildInfoItem('7 days', 'Streak', Icons.local_fire_department),
                      ],
                    ),
                  ),
                  SizedBox(height: 36),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildModeTab(String title, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMode = title;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 250),
        padding: EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF21808D) : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: isSelected ? Colors.white : Color(0xFF626C71),
            letterSpacing: 0.2,
          ),
        ),
      ),
    );
  }

  Widget _buildInfoItem(String value, String label, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Color(0xFF21808D), size: 20),
        SizedBox(height: 2),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF134252),
          ),
        ),
        SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Color(0xFF626C71),
          ),
        ),
      ],
    );
  }
}

class ModernPomodoroPainter extends CustomPainter {
  final double progress;
  ModernPomodoroPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width / 2) - 18;

    // Gradient progress colors:
    final Gradient sweep = SweepGradient(
      startAngle: -math.pi / 2,
      endAngle: 3 * math.pi / 2,
      colors: [Color(0xFF21808D), Color(0xFF32B8C6), Color(0xFF21808D)],
      stops: [0.0, 0.65, 1.0],
      transform: GradientRotation(-math.pi / 2),
    );

    // Background Circle
    final bgPaint = Paint()
      ..color = Color(0xFF32B8C6).withOpacity(0.09)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 21;

    canvas.drawCircle(center, radius, bgPaint);

    // Progress Arc
    final rect = Rect.fromCircle(center: center, radius: radius);
    final progressPaint = Paint()
      ..shader = sweep.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 21
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      rect,
      -math.pi / 2,
      2 * math.pi * progress,
      false,
      progressPaint,
    );
    // Glowing effect for moving arc head
    var headAngle = -math.pi / 2 + 2 * math.pi * progress;
    final headOffset = Offset(center.dx + radius * math.cos(headAngle), center.dy + radius * math.sin(headAngle));
    final glowPaint = Paint()
      ..color = Color(0xFF21808D).withOpacity(0.18)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 16);
    canvas.drawCircle(headOffset, 20, glowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
