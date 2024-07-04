import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:water_supply_app/customer_screens/bottom_nav.dart';
import 'package:water_supply_app/main.dart';

void main() => runApp(MyApp());

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  bool _isSupplier = false;
  String _selectedLocation = 'Location 3';
  List<String> _locations = [
    'Location 1',
    'Location 2',
    'Location 3'
  ]; // Replace with your locations

  Future<void> _signUp() async {
    if (_formKey.currentState!.validate()) {
      print('key');
      final response = await http.post(
        Uri.parse(
            'http://192.168.2.1:3333/auth/sign-up'), // Replace with your endpoint
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'firstName': _firstNameController.text,
          'lastName': _lastNameController.text,
          'userName': _userNameController.text,
          'password': _passwordController.text,
          'phone': _phoneController.text,
          'location': _selectedLocation,
          'userType': _isSupplier ? 'supplier' : 'customer',
        }),
      );
      print('key2');
      print(response);

      final responseBody = jsonDecode(response.body);
      print(responseBody);
      if (responseBody['status'] == 200) {
        print("inside successful.");
        final token = responseBody['data'];

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Sign up successful! Token saved.')),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainPage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to sign up.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(labelText: 'First Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your first name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(labelText: 'Last Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your last name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _userNameController,
                decoration: InputDecoration(labelText: 'User Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your user name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Phone'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(labelText: 'Location'),
                value: _selectedLocation,
                items: _locations.map((location) {
                  return DropdownMenuItem(
                    value: location,
                    child: Text(location),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedLocation = newValue!;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select your location';
                  }
                  return null;
                },
              ),
              SwitchListTile(
                title: Text('Is Supplier'),
                value: _isSupplier,
                onChanged: (newValue) {
                  setState(() {
                    _isSupplier = newValue;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: (_signUp),
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
