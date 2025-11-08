// screens/analytics_screen.dart
import 'package:flutter/material.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({Key? key}) : super(key: key);

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  String selectedPeriod = 'Week';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFCF9),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Analytics',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF134252),
                          ),
                        ),
                        Text(
                          'Track your progress',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF626C71),
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(Icons.calendar_today, color: Color(0xFF134252)),
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(height: 24),

                // Period Selector
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFD),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Color(0xFF5E5240).withOpacity(0.2),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: _buildPeriodTab('Week', selectedPeriod == 'Week'),
                      ),
                      Expanded(
                        child: _buildPeriodTab('Month', selectedPeriod == 'Month'),
                      ),
                      Expanded(
                        child: _buildPeriodTab('Year', selectedPeriod == 'Year'),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 24),

                // Overview Stats
                Text(
                  'Overview',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF134252),
                  ),
                ),
                SizedBox(height: 16),

                Row(
                  children: [
                    Expanded(
                      child: _buildStatCard(
                        '42h 30m',
                        'Total Focus',
                        Icons.timer,
                        Color(0xFF21808D),
                        '+12% vs last week',
                        true,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: _buildStatCard(
                        '127',
                        'Sessions',
                        Icons.check_circle,
                        Color(0xFF32B8C6),
                        '+8% vs last week',
                        true,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 12),

                Row(
                  children: [
                    Expanded(
                      child: _buildStatCard(
                        '87%',
                        'Focus Rate',
                        Icons.psychology,
                        Color(0xFFA84B2F),
                        '-2% vs last week',
                        false,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: _buildStatCard(
                        '24',
                        'Streak Days',
                        Icons.local_fire_department,
                        Color(0xFF626C71),
                        'Best: 30 days',
                        null,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 24),

                // Weekly Activity Chart
                Text(
                  'Weekly Activity',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF134252),
                  ),
                ),
                SizedBox(height: 16),

                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFD),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Color(0xFF5E5240).withOpacity(0.2),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Focus Time (hours)',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF134252),
                            ),
                          ),
                          Text(
                            '8h 15m avg',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF626C71),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      _buildBarChart(),
                    ],
                  ),
                ),

                SizedBox(height: 24),

                // Study Categories Breakdown
                Text(
                  'Study Categories',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF134252),
                  ),
                ),
                SizedBox(height: 16),

                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFD),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Color(0xFF5E5240).withOpacity(0.2),
                    ),
                  ),
                  child: Column(
                    children: [
                      _buildCategoryItem(
                        'Programming',
                        '18h 45m',
                        0.45,
                        Color(0xFF21808D),
                      ),
                      SizedBox(height: 16),
                      _buildCategoryItem(
                        'Mathematics',
                        '12h 30m',
                        0.30,
                        Color(0xFF32B8C6),
                      ),
                      SizedBox(height: 16),
                      _buildCategoryItem(
                        'Data Structures',
                        '8h 15m',
                        0.20,
                        Color(0xFFA84B2F),
                      ),
                      SizedBox(height: 16),
                      _buildCategoryItem(
                        'Others',
                        '3h 00m',
                        0.05,
                        Color(0xFF626C71),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 24),

                // Peak Performance Times
                Text(
                  'Peak Performance',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF134252),
                  ),
                ),
                SizedBox(height: 16),

                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFD),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Color(0xFF5E5240).withOpacity(0.2),
                    ),
                  ),
                  child: Column(
                    children: [
                      _buildPerformanceItem(
                        'Morning (6AM - 12PM)',
                        '92%',
                        'Best time for deep work',
                        Icons.wb_sunny,
                        Color(0xFFA84B2F),
                      ),
                      SizedBox(height: 16),
                      _buildPerformanceItem(
                        'Afternoon (12PM - 6PM)',
                        '78%',
                        'Good for review sessions',
                        Icons.wb_twilight,
                        Color(0xFF32B8C6),
                      ),
                      SizedBox(height: 16),
                      _buildPerformanceItem(
                        'Evening (6PM - 12AM)',
                        '65%',
                        'Light study recommended',
                        Icons.nightlight,
                        Color(0xFF626C71),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 24),

                // Recent Achievements
                Text(
                  'Recent Milestones',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF134252),
                  ),
                ),
                SizedBox(height: 16),

                _buildAchievementCard(
                  'Century Milestone',
                  'Completed 100+ focus sessions',
                  '2 days ago',
                  Icons.emoji_events,
                  Color(0xFFA84B2F),
                ),
                SizedBox(height: 12),
                _buildAchievementCard(
                  'Study Streak',
                  'Maintained 7-day study streak',
                  '5 days ago',
                  Icons.local_fire_department,
                  Color(0xFF21808D),
                ),
                SizedBox(height: 12),
                _buildAchievementCard(
                  'Early Bird',
                  'Started sessions before 7 AM',
                  '1 week ago',
                  Icons.wb_sunny,
                  Color(0xFF32B8C6),
                ),

                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPeriodTab(String title, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPeriod = title;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF21808D) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : Color(0xFF626C71),
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(
    String value,
    String label,
    IconData icon,
    Color color,
    String comparison,
    bool? isPositive,
  ) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFD),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Color(0xFF5E5240).withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: color, size: 24),
              if (isPositive != null)
                Icon(
                  isPositive ? Icons.trending_up : Icons.trending_down,
                  color: isPositive ? Colors.green : Colors.red,
                  size: 16,
                ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF134252),
            ),
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF626C71),
            ),
          ),
          SizedBox(height: 8),
          Text(
            comparison,
            style: TextStyle(
              fontSize: 11,
              color: isPositive == true
                  ? Colors.green
                  : isPositive == false
                      ? Colors.red
                      : Color(0xFF626C71),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBarChart() {
  final List<Map<String, dynamic>> data = [
    {'day': 'Mon', 'hours': 0.6},
    {'day': 'Tue', 'hours': 0.8},
    {'day': 'Wed', 'hours': 0.5},
    {'day': 'Thu', 'hours': 0.9},
    {'day': 'Fri', 'hours': 0.7},
    {'day': 'Sat', 'hours': 0.4},
    {'day': 'Sun', 'hours': 0.6},
  ];

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: data.map((item) {
      // Cast to the correct types
      final String day = item['day'] as String;
      final double hours = item['hours'] as double;
      
      return Column(
        children: [
          Container(
            width: 32,
            height: 120 * hours,
            decoration: BoxDecoration(
              color: Color(0xFF21808D),
              borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
            ),
          ),
          SizedBox(height: 8),
          Text(
            day,
            style: TextStyle(
              fontSize: 11,
              color: Color(0xFF626C71),
            ),
          ),
        ],
      );
    }).toList(),
  );
}


  Widget _buildCategoryItem(
      String title, String time, double progress, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Color(0xFF134252),
              ),
            ),
            Text(
              time,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: Color(0xFF5E5240).withOpacity(0.1),
            valueColor: AlwaysStoppedAnimation<Color>(color),
            minHeight: 8,
          ),
        ),
      ],
    );
  }

  Widget _buildPerformanceItem(
    String title,
    String percentage,
    String description,
    IconData icon,
    Color color,
  ) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF134252),
                    ),
                  ),
                  Text(
                    percentage,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2),
              Text(
                description,
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF626C71),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAchievementCard(
    String title,
    String description,
    String time,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFD),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Color(0xFF5E5240).withOpacity(0.2),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          SizedBox(width: 16),
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
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF626C71),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 11,
                    color: Color(0xFF626C71),
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
