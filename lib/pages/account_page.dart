import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Overview'),
        backgroundColor: Colors.yellow,
      ),
      body: SingleChildScrollView(
        // Making the content scrollable
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/jk.jpg'), // Background image
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.6), // Apply a darker overlay
                BlendMode.darken,
              ),
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                
                _buildInfoCard('Account Holder', 'Kevin Kinyua', Icons.person),
                SizedBox(height: 20),

                
                _buildInfoCard(
                    'Account Number', '5012346789', Icons.account_balance),
                SizedBox(height: 20),

              
                _buildInfoCard(
                    'Account Balance', '\$8,000', Icons.attach_money),
                SizedBox(height: 30),

                
                Text(
                  'Account Details',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),

                // ListTile for email
                _buildDetailTile('kevinmugo359@gmail.com', Icons.email),
                // ListTile for phone
                _buildDetailTile('Phone: +254 05 204-804', Icons.phone),

                SizedBox(height: 30),

                // Button for editing account settings
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      _showAccountSettings(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 30.0),
                      child: Text('Edit Account Settings'),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 5, // Shadow for button
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // A method to build a card-like widget for account information
  Widget _buildInfoCard(String label, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white
            .withOpacity(0.2), // Slightly transparent white background
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70, // Slightly faded white for labels
                ),
              ),
              SizedBox(height: 5),
              Text(
                value,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // A method to build a ListTile for account details like email and phone
  Widget _buildDetailTile(String detail, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        detail,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 5.0),
    );
  }

  // Method to show account settings dialog
  void _showAccountSettings(BuildContext context) {
    showDialog(
      context: context, // Context for the dialog
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Account Settings'),
          content: Text('You can edit your account settings here.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
