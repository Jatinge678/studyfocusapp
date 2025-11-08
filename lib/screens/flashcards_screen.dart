// screens/flashcards_screen.dart
import 'package:flutter/material.dart';
import 'collaborative_flashcards_screen.dart';

class FlashcardsScreen extends StatefulWidget {
  const FlashcardsScreen({Key? key}) : super(key: key);

  @override
  State<FlashcardsScreen> createState() => _FlashcardsScreenState();
}

class _FlashcardsScreenState extends State<FlashcardsScreen> {
  bool isFlipped = false;
  String selectedTab = 'My Decks';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Flashcards',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF134252),
                      ),
                    ),
                    Text(
                      'Learn and collaborate',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF626C71),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.add_circle, color: Color(0xFF21808D)),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.more_vert, color: Color(0xFF134252)),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Tab Selector
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
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
                    child: _buildTab('My Decks', selectedTab == 'My Decks'),
                  ),
                  Expanded(
                    child: _buildTab('Groups', selectedTab == 'Groups'),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 20),

          // Content
          Expanded(
            child: selectedTab == 'My Decks'
                ? _buildMyDecksContent()
                : CollaborativeFlashcardsScreen(),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String title, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = title;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
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

  Widget _buildMyDecksContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // My Decks List
            _buildDeckCard(
              'Flutter Basics',
              '15 cards',
              '3 of 15',
              0.2,
              Color(0xFF21808D),
            ),
            SizedBox(height: 12),
            _buildDeckCard(
              'Data Structures',
              '24 cards',
              '18 of 24',
              0.75,
              Color(0xFF32B8C6),
            ),
            SizedBox(height: 12),
            _buildDeckCard(
              'Algorithms',
              '30 cards',
              '30 of 30',
              1.0,
              Color(0xFFA84B2F),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildDeckCard(
      String title, String total, String progress, double progressValue, Color color) {
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
            child: Icon(Icons.style, color: color, size: 28),
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
                  '$total • $progress completed',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF626C71),
                  ),
                ),
                SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: progressValue,
                    backgroundColor: Color(0xFF5E5240).withOpacity(0.1),
                    valueColor: AlwaysStoppedAnimation<Color>(color),
                    minHeight: 6,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: Color(0xFF626C71)),
        ],
      ),
    );
  }
}
