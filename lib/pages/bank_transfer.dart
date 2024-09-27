import 'package:flutter/material.dart';

class BankTransferPage extends StatelessWidget {
  final TextEditingController recipientNameController = TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bank Transfer',
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
                image: AssetImage(
                    'assets/jk.jpg'), // Ensure jk.jpg is in the assets folder
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Semi-transparent overlay to ensure readability of text
          Container(
            color: Colors.black.withOpacity(0.6),
          ),
          // Content area
          SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20),
                _buildTextField(
                  controller: recipientNameController,
                  label: 'Recipient\'s Name',
                  icon: Icons.person,
                ),
                SizedBox(height: 20),
                _buildTextField(
                  controller: accountNumberController,
                  label: 'Recipient\'s Account Number',
                  icon: Icons.account_balance,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                _buildTextField(
                  controller: amountController,
                  label: 'Amount',
                  icon: Icons.attach_money,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 30),
                // Transfer Button
                ElevatedButton(
                  onPressed: () {
                    String recipientName = recipientNameController.text;
                    String accountNumber = accountNumberController.text;
                    String amount = amountController.text;

                    if (_validateInputs(
                        context, recipientName, accountNumber, amount)) {
                      print(
                          'Transferring $amount to $recipientName (Account: $accountNumber)');
                      _showConfirmationDialog(
                          context, recipientName, accountNumber, amount);
                    }
                  },
                  child: Text(
                    'Transfer',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Reusable TextField widget
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      style: TextStyle(color: Colors.white), // Text color for better visibility
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.tealAccent), // Label color
        prefixIcon: Icon(icon, color: Colors.tealAccent), // Icon inside input
        filled: true,
        fillColor:
            Colors.white.withOpacity(0.1), // Subtle background for input fields
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.tealAccent),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.tealAccent, width: 2.0),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      keyboardType: keyboardType,
    );
  }

  // Validate inputs
  bool _validateInputs(
      BuildContext context, String name, String account, String amount) {
    if (name.isEmpty || account.isEmpty || amount.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in all fields'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return false;
    }
    return true;
  }

  // Show confirmation dialog after transfer
  void _showConfirmationDialog(
      BuildContext context, String name, String account, String amount) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Transfer Confirmation'),
          content: Text(
              'Successfully transferred $amount to $name (Account: $account).'),
          actions: [
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
