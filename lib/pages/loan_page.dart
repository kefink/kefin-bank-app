import 'package:flutter/material.dart';

class LoanPage extends StatelessWidget {
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Loan Overview',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Background image
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
          // Main content wrapped in a SingleChildScrollView to avoid overflow
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildInfoCard(
                    context,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Current Loan Balance: \$5,000',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.tealAccent),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Total Loan Amount: \$10,000',
                          style:
                              TextStyle(fontSize: 16, color: Colors.tealAccent),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Interest Rate: 5%',
                          style:
                              TextStyle(fontSize: 16, color: Colors.tealAccent),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Payment Schedule: Monthly',
                          style:
                              TextStyle(fontSize: 16, color: Colors.tealAccent),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Apply for a Loan',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.tealAccent),
                  ),
                  SizedBox(height: 10),
                  _buildInputCard(
                    context,
                    TextField(
                      controller: _amountController,
                      decoration: InputDecoration(
                        labelText: 'Enter Loan Amount',
                        labelStyle: TextStyle(color: Colors.tealAccent),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.tealAccent),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.tealAccent),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      final amount = _amountController.text;
                      _showLoanConfirmation(context, amount);
                    },
                    child: Text('Apply for Loan'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.tealAccent,
                      padding: EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 16.0),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Loan History',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.tealAccent),
                  ),
                  SizedBox(height: 10),
                  _buildLoanHistory(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build a styled card for displaying loan info
  Widget _buildInfoCard(BuildContext context, Widget child) {
    return Card(
      color: Colors.black.withOpacity(0.8),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: BorderSide(color: Colors.yellowAccent, width: 3.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }

  // Helper method to build a card for the loan input field
  Widget _buildInputCard(BuildContext context, Widget child) {
    return Card(
      color: Colors.black.withOpacity(0.8),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: BorderSide(color: Colors.yellowAccent, width: 3.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: child,
      ),
    );
  }

  // Helper method to display the loan history
  Widget _buildLoanHistory() {
    return Column(
      children: [
        _buildLoanHistoryTile('Loan Application - \$2,000', 'Status: Approved'),
        _buildLoanHistoryTile('Loan Application - \$1,000', 'Status: Pending'),
      ],
    );
  }

  // Builds a styled loan history item
  Widget _buildLoanHistoryTile(String title, String subtitle) {
    return Card(
      color: Colors.black.withOpacity(0.8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: BorderSide(color: Colors.yellowAccent, width: 3.0),
      ),
      child: ListTile(
        title: Text(title, style: TextStyle(color: Colors.tealAccent)),
        subtitle: Text(subtitle, style: TextStyle(color: Colors.grey)),
      ),
    );
  }

  // Helper method to show loan confirmation dialog
  void _showLoanConfirmation(BuildContext context, String amount) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black.withOpacity(0.8),
          title: Text('Loan Application',
              style: TextStyle(color: Colors.tealAccent)),
          content: Text('You have applied for a loan of \$${amount}.',
              style: TextStyle(color: Colors.tealAccent)),
          actions: <Widget>[
            TextButton(
              child: Text('OK', style: TextStyle(color: Colors.tealAccent)),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }
}
