import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegistrationPage(),
      routes: {
        '/next': (context) => NextPage(),
      },
    );
  }
}

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _lifeStoryController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              _buildTextFormField(
                controller: _nameController,
                hintText: 'Name',
                icon: Icons.person,
              ),
              SizedBox(height: 8),
              _buildTextFormField(
                controller: _emailController,
                hintText: 'Email',
                icon: Icons.email,
              ),
              SizedBox(height: 8),
              _buildTextFormField(
                controller: _phoneController,
                hintText: 'Phone',
                icon: Icons.phone,
              ),
              SizedBox(height: 8),
              _buildTextFormField(
                controller: _countryController,
                hintText: 'Country',
                icon: Icons.location_city,
              ),
              SizedBox(height: 8),
              _buildTextFormField(
                controller: _lifeStoryController,
                hintText: 'Life Story',
                icon: Icons.book,
                maxLines: 5,
              ),
              SizedBox(height: 8),
              _buildTextFormField(
                controller: _passwordController,
                hintText: 'Password',
                icon: Icons.lock,
                obscureText: true,
              ),
              SizedBox(height: 8),
              _buildTextFormField(
                controller: _confirmPasswordController,
                hintText: 'Confirm Password',
                icon: Icons.lock,
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, '/next');
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool obscureText = false,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: hintText,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $hintText';
        }
        return null;
      },
    );
  }
}

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Page'),
      ),
      body: Center(
        child: Text('Data Submitted Successfully!'),
      ),
    );
  }
}
