import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      _buildHomeContent(),
      _buildPlaceholderContent("Reload Screen"),
      _buildPlaceholderContent("Margin Screen"),
      _buildPlaceholderContent("Profile Screen"),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      body: SafeArea(
        child: screens[_selectedIndex],
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildPlaceholderContent(String title) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.construction, size: 64, color: const Color(0xFF6338F2).withOpacity(0.5)),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54),
          ),
          const Text("Coming Soon", style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildHomeContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          _buildWalletCard(),
          _buildSectionHeader("Recharge & Pay Services", onViewAll: () {}),
          _buildServicesGrid(),
          _buildSectionHeader("Recent Transactions", onViewAll: () {}),
          _buildTransactionsList(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF6338F2).withOpacity(0.15),
                  const Color(0xFF4B2BD9).withOpacity(0.15),
                ],
              ),
            ),
            child: const Center(
              child: Text(
                "RS",
                style: TextStyle(
                  color: Color(0xFF6338F2),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    "Hello, Rahul!",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Image.network(
                    "https://cdnjs.cloudflare.com/ajax/libs/twemoji/14.0.2/72x72/1f44b.png",
                    width: 20,
                    height: 20,
                  ),
                ],
              ),
              const Text(
                "Welcome back",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const Spacer(),
          _buildHeaderIcon(Icons.headset_mic_outlined, "Support"),
          const SizedBox(width: 15),
          _buildHeaderIcon(Icons.notifications_none_outlined, "Notifications"),
        ],
      ),
    );
  }

  Widget _buildHeaderIcon(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.black54, size: 28),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(fontSize: 10, color: Colors.black54),
        ),
      ],
    );
  }

  Widget _buildWalletCard() {
    return Container(
      margin: const EdgeInsets.all(20),
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF6338F2), Color(0xFF4B2BD9)],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6338F2).withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Background line chart simulation
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomPaint(
              size: const Size(double.infinity, 80),
              painter: WalletChartPainter(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Wallet Balance",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(Icons.visibility_outlined, color: Colors.white70, size: 18),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.add, color: Colors.white, size: 16),
                          SizedBox(width: 4),
                          Text(
                            "Add Money",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  "₹4,673.57",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.trending_up, color: Colors.white, size: 14),
                      SizedBox(width: 4),
                      Text(
                        "+12.5% vs last month",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: Image.asset(
              'assets/wallet.png',
              width: 120,
              height: 120,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, {VoidCallback? onViewAll}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A1A),
            ),
          ),
          TextButton(
            onPressed: onViewAll,
            child: const Row(
              children: [
                Text(
                  "View All",
                  style: TextStyle(color: Color(0xFF6338F2)),
                ),
                Icon(Icons.arrow_right_alt, color: Color(0xFF6338F2)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServicesGrid() {
    final services = [
      {"icon": Icons.phone_android, "label": "Mobile\nRecharge", "color": Colors.purple},
      {"icon": Icons.settings_input_antenna, "label": "DTH\nRecharge", "color": Colors.blue},
      {"icon": Icons.bolt, "label": "Electricity\nBill", "color": Colors.orange},
      {"icon": Icons.credit_card, "label": "FASTag\nRecharge", "color": Colors.teal},
      {"icon": Icons.local_fire_department, "label": "Gas\nBooking", "color": Colors.red},
      {"icon": Icons.water_drop, "label": "Water\nBill", "color": Colors.lightBlue},
      {"icon": Icons.wifi, "label": "Broadband\nRecharge", "color": Colors.indigo},
      {"icon": Icons.phone_in_talk, "label": "Landline\nBill", "color": Colors.brown},
    ];

    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        childAspectRatio: 0.8,
      ),
      itemCount: services.length,
      itemBuilder: (context, index) {
        final service = services[index];
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(
                service["icon"] as IconData,
                color: service["color"] as Color,
                size: 28,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              service["label"] as String,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: Color(0xFF444444),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTransactionsList() {
    final transactions = [
      {
        "title": "Mobile Recharge",
        "subtitle": "Airtel • 9876543210",
        "amount": "₹199.00",
        "date": "Today, 09:30 AM",
        "icon": Icons.phone_android,
        "color": Colors.purple
      },
      {
        "title": "Electricity Bill",
        "subtitle": "BSES Rajdhani",
        "amount": "₹1,245.00",
        "date": "Yesterday, 07:45 PM",
        "icon": Icons.bolt,
        "color": Colors.orange
      },
      {
        "title": "FASTag Recharge",
        "subtitle": "MH12AB1234",
        "amount": "₹500.00",
        "date": "22 May 2024",
        "icon": Icons.credit_card,
        "color": Colors.teal
      },
      {
        "title": "Gas Booking",
        "subtitle": "Indane • 123456",
        "amount": "₹899.00",
        "date": "21 May 2024",
        "icon": Icons.local_fire_department,
        "color": Colors.red
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final tx = transactions[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 15),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: (tx["color"] as Color).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(tx["icon"] as IconData, color: tx["color"] as Color, size: 24),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tx["title"] as String,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text(
                      tx["subtitle"] as String,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    tx["amount"] as String,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(radius: 3, backgroundColor: Colors.green),
                        SizedBox(width: 4),
                        Text(
                          "Success",
                          style: TextStyle(color: Colors.green, fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    tx["date"] as String,
                    style: const TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBottomNav() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(0, Icons.home, "Home"),
            _buildNavItem(1, Icons.refresh, "Reload"),
            _buildNavItem(2, Icons.bar_chart, "Margin"),
            _buildNavItem(3, Icons.person_outline, "Profile"),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final bool isActive = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isActive ? const Color(0xFF6338F2) : Colors.grey,
            size: 28,
          ),
          Text(
            label,
            style: TextStyle(
              color: isActive ? const Color(0xFF6338F2) : Colors.grey,
              fontSize: 12,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          if (isActive)
            Container(
              margin: const EdgeInsets.only(top: 4),
              width: 20,
              height: 2,
              color: const Color(0xFF6338F2),
            ),
        ],
      ),
    );
  }
}

class WalletChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.15)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    final path = Path();
    path.moveTo(0, size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.15, size.height * 0.7, size.width * 0.3, size.height * 0.85);
    path.quadraticBezierTo(size.width * 0.45, size.height * 1.0, size.width * 0.6, size.height * 0.75);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.5, size.width * 0.9, size.height * 0.65);
    path.lineTo(size.width, size.height * 0.55);

    canvas.drawPath(path, paint);

    // Add a second, fainter line
    final paint2 = Paint()
      ..color = Colors.white.withOpacity(0.08)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final path2 = Path();
    path2.moveTo(0, size.height * 0.9);
    path2.quadraticBezierTo(size.width * 0.2, size.height * 0.8, size.width * 0.4, size.height * 0.95);
    path2.quadraticBezierTo(size.width * 0.6, size.height * 1.1, size.width * 0.8, size.height * 0.85);
    path2.lineTo(size.width, size.height * 0.95);

    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
