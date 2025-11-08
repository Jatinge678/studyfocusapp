// screens/collaborative_flashcards_screen.dart
import 'package:flutter/material.dart';

class CollaborativeFlashcardsScreen extends StatelessWidget {
  const CollaborativeFlashcardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Create Group Button
            GestureDetector(
              onTap: () {
                _showCreateGroupDialog(context);
              },
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF21808D), Color(0xFF32B8C6)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF21808D).withOpacity(0.3),
                      blurRadius: 15,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.group_add,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Create Study Group',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Start collaborating with friends',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white.withOpacity(0.9),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                ),
              ),
            ),

            SizedBox(height: 24),

            // My Groups Section
            Text(
              'My Study Groups',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF134252),
              ),
            ),
            SizedBox(height: 16),

            _buildGroupCard(
              'Flutter Study Circle',
              '12 members',
              '145 cards',
              '8 active now',
              Icons.code,
              Color(0xFF21808D),
              context,
            ),
            SizedBox(height: 12),
            _buildGroupCard(
              'Data Science Masters',
              '24 members',
              '287 cards',
              '3 active now',
              Icons.analytics,
              Color(0xFF32B8C6),
              context,
            ),
            SizedBox(height: 12),
            _buildGroupCard(
              'CS Interview Prep',
              '45 members',
              '512 cards',
              '15 active now',
              Icons.work,
              Color(0xFFA84B2F),
              context,
            ),

            SizedBox(height: 24),

            // Discover Groups Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Discover Groups',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF134252),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'See all',
                    style: TextStyle(
                      color: Color(0xFF21808D),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            _buildDiscoverCard(
              'React Native Study',
              '87 members',
              '342 cards',
              true,
              context,
            ),
            SizedBox(height: 12),
            _buildDiscoverCard(
              'Machine Learning Basics',
              '156 members',
              '678 cards',
              false,
              context,
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildGroupCard(
    String title,
    String members,
    String cards,
    String activeNow,
    IconData icon,
    Color color,
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GroupDetailScreen(
              groupName: title,
              color: color,
            ),
          ),
        );
      },
      child: Container(
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
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: color, size: 24),
                ),
                SizedBox(width: 12),
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
                        '$members • $cards',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF626C71),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.chevron_right, color: Color(0xFF626C71)),
              ],
            ),
            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Color(0xFF21808D).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Color(0xFF21808D),
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 6),
                  Text(
                    activeNow,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF21808D),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDiscoverCard(
    String title,
    String members,
    String cards,
    bool isPublic,
    BuildContext context,
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
              color: Color(0xFF626C71).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.explore, color: Color(0xFF626C71), size: 24),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF134252),
                      ),
                    ),
                    SizedBox(width: 6),
                    if (isPublic)
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Color(0xFF21808D).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          'PUBLIC',
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF21808D),
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  '$members • $cards',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF626C71),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF21808D),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Join',
              style: TextStyle(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  void _showCreateGroupDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Create Study Group'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Group Name',
                hintText: 'Enter group name',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Description',
                hintText: 'What will you study?',
              ),
              maxLines: 2,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // Create group logic
            },
            child: Text('Create'),
          ),
        ],
      ),
    );
  }
}

// Group Detail Screen
class GroupDetailScreen extends StatelessWidget {
  final String groupName;
  final Color color;

  const GroupDetailScreen({
    Key? key,
    required this.groupName,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFCF9),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [color, color.withOpacity(0.8)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () => Navigator.pop(context),
                        ),
                        Expanded(
                          child: Text(
                            groupName,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.more_vert, color: Colors.white),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildStatItem('12', 'Members', Icons.people),
                        _buildStatItem('145', 'Cards', Icons.style),
                        _buildStatItem('8', 'Active', Icons.access_time),
                      ],
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Shared Decks
                    Text(
                      'Shared Flashcard Decks',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF134252),
                      ),
                    ),
                    SizedBox(height: 16),
                    _buildSharedDeck(
                      'Core Concepts',
                      'by Sarah Johnson',
                      '45 cards',
                      152,
                      4.8,
                      color,
                    ),
                    SizedBox(height: 12),
                    _buildSharedDeck(
                      'Advanced Topics',
                      'by Mike Chen',
                      '67 cards',
                      98,
                      4.6,
                      color,
                    ),
                    SizedBox(height: 12),
                    _buildSharedDeck(
                      'Quick Review',
                      'by Alex Kumar',
                      '23 cards',
                      203,
                      4.9,
                      color,
                    ),

                    SizedBox(height: 24),

                    // Active Members
                    Text(
                      'Active Now',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF134252),
                      ),
                    ),
                    SizedBox(height: 16),
                    _buildActiveMember(
                      'Sarah J.',
                      'Studying Core Concepts',
                      '2 min ago',
                      Colors.green,
                    ),
                    SizedBox(height: 12),
                    _buildActiveMember(
                      'Mike C.',
                      'Added 5 new cards',
                      '5 min ago',
                      Colors.blue,
                    ),
                    SizedBox(height: 12),
                    _buildActiveMember(
                      'Alex K.',
                      'Completed Quick Review',
                      '12 min ago',
                      Colors.orange,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: color,
        label: Text('Add Cards'),
        icon: Icon(Icons.add),
      ),
    );
  }

  Widget _buildStatItem(String value, String label, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 28),
        SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.white.withOpacity(0.9),
          ),
        ),
      ],
    );
  }

  Widget _buildSharedDeck(
    String title,
    String author,
    String cards,
    int upvotes,
    double rating,
    Color deckColor,
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
            children: [
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
                      '$author • $cards',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF626C71),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      SizedBox(width: 4),
                      Text(
                        rating.toString(),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF134252),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.thumb_up, color: deckColor, size: 14),
                      SizedBox(width: 4),
                      Text(
                        upvotes.toString(),
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF626C71),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActiveMember(
    String name,
    String activity,
    String time,
    Color statusColor,
  ) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFD),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Color(0xFF5E5240).withOpacity(0.2),
        ),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: color.withOpacity(0.2),
                child: Text(
                  name[0],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: statusColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF134252),
                  ),
                ),
                Text(
                  activity,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF626C71),
                  ),
                ),
              ],
            ),
          ),
          Text(
            time,
            style: TextStyle(
              fontSize: 11,
              color: Color(0xFF626C71),
            ),
          ),
        ],
      ),
    );
  }
}
