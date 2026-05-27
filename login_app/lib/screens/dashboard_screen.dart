import 'package:flutter/material.dart';
import 'login_screen.dart'; // ✅ Hanya ini yang ada

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Map<String, dynamic>? userData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    userData =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
  }

  void _logout() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Logout'),
            content: Text('Keluar dari Kosan Finder?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Batal'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    (route) => false,
                  );
                },
                style: TextButton.styleFrom(foregroundColor: Colors.red),
                child: Text('Logout'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final role = userData?['role'] ?? 'penghuni';
    final name = userData?['name'] ?? 'User';
    final email = userData?['email'] ?? 'email@kosan.com';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard $role',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange.shade600,
        actions: [IconButton(icon: Icon(Icons.logout), onPressed: _logout)],
      ),
      body: RefreshIndicator(
        onRefresh: () async => setState(() {}),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Profile Card ✅
              Card(
                elevation: 12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.orange.shade400, Colors.orange.shade600],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person,
                          size: 40,
                          color: Colors.orange,
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Selamat datang,',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white70,
                              ),
                            ),
                            Text(
                              name,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              email,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white70,
                              ),
                            ),
                            Text(
                              'Role: $role',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),

              // 4 Stat Containers ✅
              Row(
                children: [
                  Expanded(
                    child: _statCard('🏠 Okupansi', '85%', Colors.green),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: _statCard('💰 Tagihan', 'Rp 800K', Colors.orange),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Expanded(child: _statCard('📋 Booking', '2', Colors.blue)),
                  SizedBox(width: 15),
                  Expanded(
                    child: _statCard('📊 Revenue', 'Rp 3.2jt', Colors.purple),
                  ),
                ],
              ),
              SizedBox(height: 30),

              // GridView 12+ Kamar ✅
              Text(
                'Daftar Kamar Kos',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: 12,
                itemBuilder: (context, index) {
                  final rooms = [
                    'Kos 101',
                    'Kos 102',
                    'Kos 201',
                    'Kos 202',
                    'Kos 301',
                    'Kos 302',
                    'Kos 401',
                    'Kos 402',
                    'Kos 501',
                    'Kos 502',
                    'Kos 601',
                    'Kos 602',
                  ];
                  return Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap:
                          () => ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Detail ${rooms[index]}')),
                          ),
                      child: Column(
                        children: [
                          Container(
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.orange.shade50,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            child: Center(
                              child: Text('🏠', style: TextStyle(fontSize: 40)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(12),
                            child: Column(
                              children: [
                                Text(
                                  rooms[index],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Rp 800rb',
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text('⭐ 4.8'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // ✅ Bonus
        currentIndex: 0,
        selectedItemColor: Colors.orange,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Kamar'),
          BottomNavigationBarItem(icon: Icon(Icons.payment), label: 'Bayar'),
        ],
      ),
    );
  }

  Widget _statCard(String title, String value, Color color) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [color.withOpacity(0.8), color]),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(blurRadius: 20, color: color.withOpacity(0.3))],
      ),
      child: Column(
        children: [
          Icon(Icons.analytics_outlined, size: 32, color: Colors.white),
          SizedBox(height: 8),
          Text(title, style: TextStyle(color: Colors.white70)),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
        // layout colum,padding
      ),
    );
  }
}
