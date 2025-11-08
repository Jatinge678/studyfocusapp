// screens/settings_screen.dart
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notificationsEnabled = true;
  bool soundEnabled = true;
  bool vibrationEnabled = false;
  bool darkModeEnabled = false;
  bool aiSuggestionsEnabled = true;
  String selectedLanguage = 'English';
  String selectedTheme = 'System Default';

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
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back, color: Color(0xFF134252)),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Settings',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF134252),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30),

                // Account Section
                _buildSectionHeader('Account'),
                SizedBox(height: 12),
                _buildSettingItem(
                  'Profile',
                  'Manage your profile information',
                  Icons.person_outline,
                  () {},
                ),
                SizedBox(height: 8),
                _buildSettingItem(
                  'Subscription',
                  'Manage your premium subscription',
                  Icons.workspace_premium,
                  () {},
                  trailing: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Color(0xFF21808D).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Premium',
                      style: TextStyle(
                        color: Color(0xFF21808D),
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 30),

                // Notifications Section
                _buildSectionHeader('Notifications'),
                SizedBox(height: 12),
                _buildSwitchItem(
                  'Push Notifications',
                  'Receive study reminders and updates',
                  Icons.notifications_outlined,
                  notificationsEnabled,
                  (value) {
                    setState(() {
                      notificationsEnabled = value;
                    });
                  },
                ),
                SizedBox(height: 8),
                _buildSwitchItem(
                  'Sound',
                  'Play sounds during focus sessions',
                  Icons.volume_up_outlined,
                  soundEnabled,
                  (value) {
                    setState(() {
                      soundEnabled = value;
                    });
                  },
                ),
                SizedBox(height: 8),
                _buildSwitchItem(
                  'Vibration',
                  'Vibrate on timer completion',
                  Icons.vibration,
                  vibrationEnabled,
                  (value) {
                    setState(() {
                      vibrationEnabled = value;
                    });
                  },
                ),

                SizedBox(height: 30),

                // Appearance Section
                _buildSectionHeader('Appearance'),
                SizedBox(height: 12),
                _buildSettingItem(
                  'Theme',
                  selectedTheme,
                  Icons.palette_outlined,
                  () {
                    _showThemeDialog();
                  },
                ),
                SizedBox(height: 8),
                _buildSettingItem(
                  'Language',
                  selectedLanguage,
                  Icons.language,
                  () {
                    _showLanguageDialog();
                  },
                ),

                SizedBox(height: 30),

                // AI & Features Section
                _buildSectionHeader('AI & Features'),
                SizedBox(height: 12),
                _buildSwitchItem(
                  'AI Suggestions',
                  'Get personalized study recommendations',
                  Icons.psychology,
                  aiSuggestionsEnabled,
                  (value) {
                    setState(() {
                      aiSuggestionsEnabled = value;
                    });
                  },
                ),
                SizedBox(height: 8),
                _buildSettingItem(
                  'Focus Modes',
                  'Customize your focus session settings',
                  Icons.timer_outlined,
                  () {},
                ),
                SizedBox(height: 8),
                _buildSettingItem(
                  'Flashcard Settings',
                  'Configure flashcard review settings',
                  Icons.style_outlined,
                  () {},
                ),

                SizedBox(height: 30),

                // Data & Privacy Section
                _buildSectionHeader('Data & Privacy'),
                SizedBox(height: 12),
                _buildSettingItem(
                  'Data Usage',
                  'View your app data usage',
                  Icons.storage_outlined,
                  () {},
                ),
                SizedBox(height: 8),
                _buildSettingItem(
                  'Privacy Policy',
                  'Read our privacy policy',
                  Icons.privacy_tip_outlined,
                  () {},
                ),
                SizedBox(height: 8),
                _buildSettingItem(
                  'Export Data',
                  'Download your study data',
                  Icons.download_outlined,
                  () {},
                ),

                SizedBox(height: 30),

                // Support Section
                _buildSectionHeader('Support'),
                SizedBox(height: 12),
                _buildSettingItem(
                  'Help Center',
                  'Get help and support',
                  Icons.help_outline,
                  () {},
                ),
                SizedBox(height: 8),
                _buildSettingItem(
                  'Send Feedback',
                  'Share your thoughts with us',
                  Icons.feedback_outlined,
                  () {},
                ),
                SizedBox(height: 8),
                _buildSettingItem(
                  'Rate Us',
                  'Rate the app on store',
                  Icons.star_outline,
                  () {},
                ),

                SizedBox(height: 30),

                // About Section
                _buildSectionHeader('About'),
                SizedBox(height: 12),
                _buildSettingItem(
                  'Version',
                  '1.0.0',
                  Icons.info_outline,
                  () {},
                  trailing: SizedBox(),
                ),
                SizedBox(height: 8),
                _buildSettingItem(
                  'Terms of Service',
                  'Read our terms of service',
                  Icons.description_outlined,
                  () {},
                ),

                SizedBox(height: 30),

                // Logout Button
                GestureDetector(
                  onTap: () {
                    _showLogoutDialog();
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xFFC0152F).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Color(0xFFC0152F).withOpacity(0.3),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.logout,
                          color: Color(0xFFC0152F),
                          size: 20,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFC0152F),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Color(0xFF626C71),
        letterSpacing: 0.5,
      ),
    );
  }

  Widget _buildSettingItem(
    String title,
    String subtitle,
    IconData icon,
    VoidCallback onTap, {
    Widget? trailing,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFD),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Color(0xFF5E5240).withOpacity(0.2),
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: Color(0xFF21808D), size: 24),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF134252),
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF626C71),
                    ),
                  ),
                ],
              ),
            ),
            trailing ??
                Icon(
                  Icons.chevron_right,
                  color: Color(0xFF626C71),
                ),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchItem(
    String title,
    String subtitle,
    IconData icon,
    bool value,
    Function(bool) onChanged,
  ) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFD),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Color(0xFF5E5240).withOpacity(0.2),
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: Color(0xFF21808D), size: 24),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF134252),
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF626C71),
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Color(0xFF21808D),
          ),
        ],
      ),
    );
  }

  void _showThemeDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Select Theme'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile<String>(
              title: Text('System Default'),
              value: 'System Default',
              groupValue: selectedTheme,
              activeColor: Color(0xFF21808D),
              onChanged: (value) {
                setState(() {
                  selectedTheme = value!;
                });
                Navigator.pop(context);
              },
            ),
            RadioListTile<String>(
              title: Text('Light'),
              value: 'Light',
              groupValue: selectedTheme,
              activeColor: Color(0xFF21808D),
              onChanged: (value) {
                setState(() {
                  selectedTheme = value!;
                });
                Navigator.pop(context);
              },
            ),
            RadioListTile<String>(
              title: Text('Dark'),
              value: 'Dark',
              groupValue: selectedTheme,
              activeColor: Color(0xFF21808D),
              onChanged: (value) {
                setState(() {
                  selectedTheme = value!;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Select Language'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile<String>(
              title: Text('English'),
              value: 'English',
              groupValue: selectedLanguage,
              activeColor: Color(0xFF21808D),
              onChanged: (value) {
                setState(() {
                  selectedLanguage = value!;
                });
                Navigator.pop(context);
              },
            ),
            RadioListTile<String>(
              title: Text('Hindi'),
              value: 'Hindi',
              groupValue: selectedLanguage,
              activeColor: Color(0xFF21808D),
              onChanged: (value) {
                setState(() {
                  selectedLanguage = value!;
                });
                Navigator.pop(context);
              },
            ),
            RadioListTile<String>(
              title: Text('Spanish'),
              value: 'Spanish',
              groupValue: selectedLanguage,
              activeColor: Color(0xFF21808D),
              onChanged: (value) {
                setState(() {
                  selectedLanguage = value!;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Logout'),
        content: Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Cancel',
              style: TextStyle(color: Color(0xFF626C71)),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Handle logout
            },
            child: Text(
              'Logout',
              style: TextStyle(color: Color(0xFFC0152F)),
            ),
          ),
        ],
      ),
    );
  }
}
