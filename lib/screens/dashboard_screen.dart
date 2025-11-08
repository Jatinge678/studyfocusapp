// screens/dashboard_screen.dart
import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'analytics_screen.dart';
import 'pomodoro_screen.dart';
import 'flashcards_screen.dart';
import 'meditation_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with greeting and profile
              _buildHeader(context),
              SizedBox(height: 24),

              // Today's Progress Card with gradient
              _buildProgressCard(),
              SizedBox(height: 32),

              // Quick Actions Section
              _buildSectionHeader('Quick Actions'),
              SizedBox(height: 16),
              _buildQuickActionsGrid(context),
              SizedBox(height: 32),

              // AI Insights Section
              _buildSectionHeader('AI Insights'),
              SizedBox(height: 16),
              _buildAIInsightCard(),
              SizedBox(height: 32),

              // Recent Sessions Section
              _buildSectionHeader('Recent Sessions'),
              SizedBox(height: 16),
              _buildSessionsList(),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  // Header Widget
  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, Student! 👋',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF134252),
                  letterSpacing: -0.5,
                ),
              ),
              SizedBox(height: 6),
              Text(
                'Ready to focus today?',
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF626C71),
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfileScreen(),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF21808D).withOpacity(0.2),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 26,
              backgroundColor: Color(0xFF21808D),
              child: Icon(Icons.person, color: Colors.white, size: 26),
            ),
          ),
        ),
      ],
    );
  }

  // Progress Card Widget
  Widget _buildProgressCard() {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF21808D), Color(0xFF32B8C6)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF21808D).withOpacity(0.4),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Today\'s Progress',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.3,
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.trending_up, color: Colors.white, size: 22),
              ),
            ],
          ),
          SizedBox(height: 28),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatItem('2h 30m', 'Focus Time', Icons.timer),
              Container(
                height: 50,
                width: 1.5,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.0),
                      Colors.white.withOpacity(0.4),
                      Colors.white.withOpacity(0.0),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              _buildStatItem('12', 'Sessions', Icons.check_circle_outline),
              Container(
                height: 50,
                width: 1.5,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.0),
                      Colors.white.withOpacity(0.4),
                      Colors.white.withOpacity(0.0),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              _buildStatItem('85%', 'Focus Rate', Icons.psychology_outlined),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label, IconData icon) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: Colors.white, size: 22),
        ),
        SizedBox(height: 10),
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withOpacity(0.85),
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  // Section Header Widget
  Widget _buildSectionHeader(String title) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 24,
          decoration: BoxDecoration(
            color: Color(0xFF21808D),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        SizedBox(width: 12),
        Text(
          title,
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: Color(0xFF134252),
            letterSpacing: -0.3,
          ),
        ),
      ],
    );
  }

  // Quick Actions Grid
  Widget _buildQuickActionsGrid(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildQuickActionCard(
                context,
                'Focus Session',
                Icons.play_circle_filled,
                Color(0xFF21808D),
                Colors.white,
                isPrimary: true,
                onTap: () {},
              ),
            ),
            SizedBox(width: 14),
            Expanded(
              child: _buildQuickActionCard(
                context,
                'Flashcards',
                Icons.style,
                Color(0xFFFFFFFD),
                Color(0xFF21808D),
                hasBorder: true,
                onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FlashcardsScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
        SizedBox(height: 14),
        Row(
          children: [
            Expanded(
              child: _buildQuickActionCard(
                context,
                'Meditation',
                Icons.self_improvement,
                Color(0xFFFFFFFD),
                Color(0xFF32B8C6),
                hasBorder: true,
                onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MeditationScreen(),
                  ),
                );
              },
            ),
          ),
            SizedBox(width: 14),
            Expanded(
              child: _buildQuickActionCard(
                context,
                'Analytics',
                Icons.bar_chart_rounded,
                Color(0xFFFFFFFD),
                Color(0xFFA84B2F),
                hasBorder: true,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AnalyticsScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildQuickActionCard(
    BuildContext context,
    String title,
    IconData icon,
    Color bgColor,
    Color textColor, {
    bool hasBorder = false,
    bool isPrimary = false,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 22, horizontal: 16),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(18),
          border: hasBorder
              ? Border.all(
                  color: Color(0xFF5E5240).withOpacity(0.15),
                  width: 1.5,
                )
              : null,
          boxShadow: isPrimary
              ? [
                  BoxShadow(
                    color: bgColor.withOpacity(0.4),
                    blurRadius: 15,
                    offset: Offset(0, 6),
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isPrimary
                    ? Colors.white.withOpacity(0.2)
                    : textColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: textColor, size: 28),
            ),
            SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor,
                fontSize: 13,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // AI Insight Card
  Widget _buildAIInsightCard() {
    return Container(
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF32B8C6).withOpacity(0.08),
            Color(0xFF21808D).withOpacity(0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Color(0xFF21808D).withOpacity(0.15),
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Color(0xFF21808D).withOpacity(0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              Icons.lightbulb_outline,
              color: Color(0xFF21808D),
              size: 28,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Peak Focus Time',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF134252),
                      ),
                    ),
                    SizedBox(width: 6),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: Color(0xFF21808D).withOpacity(0.15),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'AI',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF21808D),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Text(
                  'You focus best between 10 AM - 12 PM. Schedule important tasks then!',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF626C71),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Sessions List
  Widget _buildSessionsList() {
    return Column(
      children: [
        _buildSessionItem('Deep Focus', '45 min', '2 hours ago', 0.9, Icons.timer_outlined),
        SizedBox(height: 12),
        _buildSessionItem('Quick Study', '25 min', '4 hours ago', 0.75, Icons.menu_book_outlined),
        SizedBox(height: 12),
        _buildSessionItem('Meditation', '15 min', '6 hours ago', 1.0, Icons.self_improvement_outlined),
      ],
    );
  }

  Widget _buildSessionItem(
    String title,
    String duration,
    String time,
    double completion,
    IconData icon,
  ) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFD),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Color(0xFF5E5240).withOpacity(0.1),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Color(0xFF21808D).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: Color(0xFF21808D),
              size: 24,
            ),
          ),
          SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF134252),
                    letterSpacing: -0.2,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 13,
                      color: Color(0xFF626C71),
                    ),
                    SizedBox(width: 4),
                    Text(
                      duration,
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF626C71),
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '•',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF626C71),
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF626C71),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Color(0xFF21808D).withOpacity(0.12),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '${(completion * 100).toInt()}%',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF21808D),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: 65,
                height: 5,
                decoration: BoxDecoration(
                  color: Color(0xFF5E5240).withOpacity(0.08),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: completion,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF21808D), Color(0xFF32B8C6)],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
