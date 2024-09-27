import 'package:flutter/material.dart';

class DepositPage extends StatelessWidget {
  final TextEditingController amountController = TextEditingController();
  String depositMethod = "Bank Account";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Deposit',
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Deposit amount input field
                  _buildInputCard(
                    context,
                    TextField(
                      controller: amountController,
                      decoration: InputDecoration(
                        labelText: 'Deposit Amount',
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
                  SizedBox(height: 16.0),
                  // Deposit method dropdown
                  _buildInputCard(
                    context,
                    DropdownButtonFormField<String>(
                      value: depositMethod,
                      decoration: InputDecoration(
                        labelText: 'Deposit Method',
                        labelStyle: TextStyle(color: Colors.tealAccent),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.tealAccent),
                        ),
                      ),
                      items: [
                        DropdownMenuItem<String>(
                          value: 'Bank Account',
                          child: Text('Bank Account'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Debit/Credit Card',
                          child: Text('Debit/Credit Card'),
                        ),
                      ],
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          depositMethod = newValue;
                        }
                      },
                      style: TextStyle(color: Colors.tealAccent),
                      dropdownColor: Colors.black,
                    ),
                  ),
                  SizedBox(height: 24.0),
                  // Deposit button
                  ElevatedButton(
                    onPressed: () {
                      String amount = amountController.text;
                      print('Depositing $amount via $depositMethod');
                    },
                    child: Text('Deposit'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.tealAccent,
                      padding: EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 16.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build input cards with consistent styling
  Widget _buildInputCard(BuildContext context, Widget child) {
    return Card(
      color: Colors.black.withOpacity(0.8),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: BorderSide(
          color: Colors.yellowAccent,
          width: 3.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: child,
      ),
    );
  }
}
