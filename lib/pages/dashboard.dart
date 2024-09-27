import 'package:flutter/material.dart';
import 'savings_page.dart';
import 'loan_page.dart';
import 'account_page.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = <Widget>[
    DashboardGrid(),
    SavingsPage(),
    LoanPage(),
    AccountPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PocketWallet',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/jk.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Semi-transparent overlay
          Container(
            color: Colors.black.withOpacity(0.6),
          ),
          // Main content
          _pages[_selectedIndex],
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.tealAccent,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black.withOpacity(0.8),
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.savings), label: 'Savings'),
          BottomNavigationBarItem(icon: Icon(Icons.money), label: 'Loan'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Account'),
        ],
      ),
    );
  }
}

class DashboardGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GridView.count(
        crossAxisCount: 3,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 16.0,
        children: <Widget>[
          _buildDashboardItem(context, Icons.send, 'Send Money', '/sendmoney'),
          _buildDashboardItem(context, Icons.payment, 'Pay Bills', '/paybills'),
          _buildDashboardItem(
              context, Icons.phone, 'Buy Airtime', '/buyairtime'),
          _buildDashboardItem(
              context, Icons.attach_money, 'Withdraw', '/withdraw'),
          _buildDashboardItem(
              context, Icons.sync_alt, 'Bank Transfer', '/banktransfer'),
          _buildDashboardItem(
              context, Icons.account_balance_wallet, 'Deposit', '/deposit'),
        ],
      ),
    );
  }

  // Builds each dashboard item with hover animation
  Widget _buildDashboardItem(
      BuildContext context, IconData icon, String label, String route) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: MouseRegion(
        onEnter: (_) {},
        onExit: (_) {},
        child: _HoverIconCard(icon: icon, label: label),
      ),
    );
  }
}

class _HoverIconCard extends StatefulWidget {
  final IconData icon;
  final String label;

  const _HoverIconCard({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  _HoverIconCardState createState() => _HoverIconCardState();
}

class _HoverIconCardState extends State<_HoverIconCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: AnimatedScale(
        scale: _isHovered ? 1.1 : 1.0,
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        child: Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
            side: BorderSide(
              color: _isHovered
                  ? Colors.yellow
                  : Colors.transparent, // Yellow border on hover
              width: _isHovered ? 3.0 : 2.0, // Increased border width on hover
            ),
          ),
          color:
              Colors.black.withOpacity(0.7), // Darker background for the card
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(widget.icon, size: 40.0, color: Colors.tealAccent),
              SizedBox(height: 10.0),
              Text(
                widget.label,
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.tealAccent),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
