import 'package:flutter/material.dart';

void main() {
  runApp(const VibeRoomApp());
}

class VibeRoomApp extends StatelessWidget {
  const VibeRoomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VibeRoom',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF090716),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFB832FF),
          brightness: Brightness.dark,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final rooms = const [
    {
      'name': 'Midnight Vibes',
      'host': 'Evan King',
      'listeners': '1.2K',
      'emoji': '🌙',
    },
    {
      'name': 'Bangladesh Party',
      'host': 'Nisa Queen',
      'listeners': '856',
      'emoji': '🇧🇩',
    },
    {
      'name': 'Love & Music',
      'host': 'Rafi Star',
      'listeners': '642',
      'emoji': '❤️',
    },
    {
      'name': 'VIP Lounge',
      'host': 'Sami Boss',
      'listeners': '389',
      'emoji': '👑',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: selectedIndex == 0
            ? _home()
            : selectedIndex == 1
                ? _rooms()
                : selectedIndex == 2
                    ? _profile()
                    : _settings(),
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: const Color(0xFF100C20),
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() => selectedIndex = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.mic_none),
            selectedIcon: Icon(Icons.mic),
            label: 'Rooms',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget _home() {
    return ListView(
      padding: const EdgeInsets.all(18),
      children: [
        Row(
          children: [
            const Expanded(
              child: Text(
                'VibeRoom',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none, size: 28),
            ),
          ],
        ),
        const SizedBox(height: 6),
        const Text(
          'Find your vibe. Meet your people.',
          style: TextStyle(color: Colors.white60),
        ),
        const SizedBox(height: 24),

        // Coin card
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFF6D1BFF),
                Color(0xFFE31CFF),
              ],
            ),
            borderRadius: BorderRadius.circular(22),
          ),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white24,
                child: Text('🪙', style: TextStyle(fontSize: 25)),
              ),
              const SizedBox(width: 14),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'My Coins',
                      style: TextStyle(color: Colors.white70),
                    ),
                    SizedBox(height: 3),
                    Text(
                      '12,580',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              FilledButton(
                onPressed: () {},
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.deepPurple,
                ),
                child: const Text('Recharge'),
              ),
            ],
          ),
        ),

        const SizedBox(height: 28),

        Row(
          children: [
            const Expanded(
              child: Text(
                '🔥 Live Rooms',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() => selectedIndex = 1);
              },
              child: const Text('See All'),
            ),
          ],
        ),

        const SizedBox(height: 8),

        ...rooms.map((room) => _roomCard(room)).toList(),
      ],
    );
  }

  Widget _rooms() {
    return ListView(
      padding: const EdgeInsets.all(18),
      children: [
        const Text(
          '🎙️ Live Voice Rooms',
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Join a room and start your vibe.',
          style: TextStyle(color: Colors.white60),
        ),
        const SizedBox(height: 20),
        ...rooms.map((room) => _roomCard(room)).toList(),
      ],
    );
  }

  Widget _roomCard(Map<String, String> room) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF151025),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF8C35FF).withOpacity(.35),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF7A2CFF),
                  Color(0xFFFF2BD6),
                ],
              ),
            ),
            child: Center(
              child: Text(
                room['emoji']!,
                style: const TextStyle(fontSize: 26),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  room['name']!,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '🎤 ${room['host']}',
                  style: const TextStyle(color: Colors.white60),
                ),
                const SizedBox(height: 4),
                Text(
                  '👥 ${room['listeners']} listeners',
                  style: const TextStyle(color: Colors.white54),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => VoiceRoomScreen(
                    roomName: room['name']!,
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF8B2CFF),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: const Text('Join'),
          ),
        ],
      ),
    );
  }

  Widget _profile() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 48,
            child: Icon(Icons.person, size: 50),
          ),
          SizedBox(height: 15),
          Text(
            'VibeRoom User',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text('Level 1 • VIP 0'),
        ],
      ),
    );
  }

  Widget _settings() {
    return ListView(
      padding: const EdgeInsets.all(18),
      children: [
        const Text(
          '⚙️ Settings',
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        ListTile(
          leading: const Icon(Icons.notifications),
          title: const Text('Notifications'),
          trailing: Switch(value: true, onChanged: (_) {}),
        ),
        const ListTile(
          leading: Icon(Icons.lock),
          title: Text('Privacy & Security'),
        ),
        const ListTile(
          leading: Icon(Icons.language),
          title: Text('Language'),
        ),
        const ListTile(
          leading: Icon(Icons.help_outline),
          title: Text('Help & Support'),
        ),
      ],
    );
  }
}

class VoiceRoomScreen extends StatelessWidget {
  final String roomName;

  const VoiceRoomScreen({
    super.key,
    required this.roomName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(roomName),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            '🎙️ LIVE',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 25),

          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _UserAvatar(name: 'Evan', emoji: '👑'),
              _UserAvatar(name: 'Nisa', emoji: '💜'),
              _UserAvatar(name: 'Rafi', emoji: '🔥'),
            ],
          ),

          const Spacer(),

          Container(
            padding: const EdgeInsets.all(20),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _RoomButton(icon: Icons.mic, label: 'Mic'),
                _RoomButton(icon: Icons.card_giftcard, label: 'Gift'),
                _RoomButton(icon: Icons.favorite, label: 'Like'),
                _RoomButton(icon: Icons.more_horiz, label: 'More'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _UserAvatar extends StatelessWidget {
  final String name;
  final String emoji;

  const _UserAvatar({
    required this.name,
    required this.emoji,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundColor: const Color(0xFF752CFF),
          child: Text(
            emoji,
            style: const TextStyle(fontSize: 28),
          ),
        ),
        const SizedBox(height: 7),
        Text(name),
      ],
    );
  }
}

class _RoomButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _RoomButton({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 27,
          backgroundColor: const Color(0xFF211733),
          child: Icon(icon),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
