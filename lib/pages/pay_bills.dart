import 'package:flutter/material.dart';

class PayBillsPage extends StatefulWidget {
  @override
  _PayBillsPageState createState() => _PayBillsPageState();
}

class _PayBillsPageState extends State<PayBillsPage> {
  // Controllers for input fields
  final TextEditingController billNumberController = TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  // List of available bill types for the dropdown menu
  final List<String> billTypes = ['DSTV', 'Water', 'Netflix', 'Showmax'];

  // Variable to store the currently selected bill type
  String selectedBillType = 'DSTV'; // Default selection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pay Bills'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/jk.jpg'), // Ensure jk.jpg is in assets/images
            fit: BoxFit.cover, // Fit the image to the screen
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0), // Padding around the content
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Dropdown button for selecting the type of bill
              _buildDropdown(),
              const SizedBox(
                  height: 16.0), // Space between the dropdown and input fields

              // Input fields for bill number, account number, and amount
              _buildTextField(
                controller: billNumberController,
                label: 'Bill Number',
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 16.0), // Space between input fields

              _buildTextField(
                controller: accountNumberController,
                label: 'Account Number',
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 16.0), // Space between input fields

              _buildTextField(
                controller: amountController,
                label: 'Amount',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                  height: 20.0), // Space between input fields and button

              // Button to trigger the payment action
              Center(
                child: ElevatedButton(
                  onPressed: _handlePayment,
                  child: const Text(
                    'Send Payment',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.tealAccent,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32.0, vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    elevation: 4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build a DropdownButton for bill type selection
  Widget _buildDropdown() {
    return DropdownButtonFormField<String>(
      value: selectedBillType, // Current selected bill type
      onChanged: (String? newValue) {
        setState(() {
          selectedBillType = newValue!;
        });
      },
      decoration: InputDecoration(
        labelText: 'Select Bill Type',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.yellow, width: 2.0),
        ),
        filled: true,
        fillColor: Colors.grey[200]!.withOpacity(0.8),
        labelStyle: const TextStyle(color: Colors.black),
      ),
      dropdownColor: Colors.white,
      style: const TextStyle(color: Colors.black),
      items: billTypes.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value, // The value for the dropdown item
          child: Row(
            children: [
              const Icon(Icons.receipt,
                  color: Colors.teal), // Icon for the bill type
              const SizedBox(width: 8), // Space between icon and text
              Text(value,
                  style: const TextStyle(
                      color: Colors.black)), // Display the bill type text
            ],
          ),
        );
      }).toList(), // Convert the list of bill types to dropdown items
    );
  }

  // Helper method to build styled TextField widgets
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required TextInputType keyboardType,
  }) {
    return TextField(
      controller: controller, // Connects the controller to the input field
      keyboardType: keyboardType, // Set keyboard type based on input
      decoration: InputDecoration(
        labelText: label, // Label shown in the input field
        labelStyle: const TextStyle(color: Colors.black54),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.yellow, width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.yellow, width: 2.0),
        ),
        filled: true,
        fillColor: Colors.grey[200]!.withOpacity(0.8),
      ),
      style: const TextStyle(color: Colors.black),
    );
  }

  // Method to handle payment logic and display confirmation dialog
  void _handlePayment() {
    final billNumber = billNumberController.text;
    final accountNumber = accountNumberController.text;
    final amount = amountController.text;

    // Show a confirmation dialog with payment details
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('Payment Confirmation',
              style: TextStyle(color: Colors.black)),
          content: Text(
            'Paying $amount for $selectedBillType\nBill Number: $billNumber\nAccount Number: $accountNumber',
            style: const TextStyle(color: Colors.black),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('OK', style: TextStyle(color: Colors.teal)),
            ),
          ],
        );
      },
    );
  }
}
