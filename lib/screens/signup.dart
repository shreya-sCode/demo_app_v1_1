import 'package:demo_app_v1_1/screens/home.dart';
import 'package:demo_app_v1_1/screens/login.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _signupFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();

  String? _emailError;
  String? _passwordError;
  String? _confirmPasswordError;

  @override
  void dispose() {
    _emailFocus.dispose();
    _passwordFocus.dispose();
    _confirmPasswordFocus.dispose();
    super.dispose();
  }

  void _validateEmail() {
    setState(() {
      _emailError = validateEmail(_emailController.text);
    });
  }

  void _validatePassword() {
    setState(() {
      _passwordError = validatePassword(_passwordController.text);
    });
  }

  void _validateConfirmPassword() {
    setState(() {
      _confirmPasswordError = validateConfirmPassword(
        _confirmPasswordController.text,
      );
    });
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }

    final conditions = [
      {
        'regex': r'.{6,}',
        'message': 'Password must be at least 6 characters long',
      },
      {
        'regex': r'[a-z]',
        'message': 'Password must contain at least one lowercase letter',
      },
      {
        'regex': r'[A-Z]',
        'message': 'Password must contain at least one uppercase letter',
      },
      {
        'regex': r'[0-9]',
        'message': 'Password must contain at least one number',
      },
      {
        'regex': r'[!@#$%^&*(),.?":{}|<>]',
        'message': 'Password must contain at least one special character',
      },
    ];
    for (var condition in conditions) {
      if (!RegExp(condition['regex']!).hasMatch(value)) {
        return condition['message'];
      }
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  void _handleSignup() {
    if (_signupFormKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: _signupFormKey,
          child: Column(
            children: [
              //Email
              TextFormField(
                controller: _emailController,
                focusNode: _emailFocus,
                decoration: InputDecoration(
                  labelText: 'Email',
                  errorText: _emailError,
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_passwordFocus);
                },
                validator: validateEmail,
                onChanged: (value) => _validateEmail(),
              ),

              //Password
              TextFormField(
                controller: _passwordController,
                focusNode: _passwordFocus,
                decoration: InputDecoration(
                  labelText: 'Password',
                  errorText: _passwordError,
                ),
                obscureText: true,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_confirmPasswordFocus);
                },
                validator: validatePassword,
                onChanged: (value) => _validatePassword(),
              ),

              //Confirm Password
              TextFormField(
                controller: _confirmPasswordController,
                focusNode: _confirmPasswordFocus,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  errorText: _confirmPasswordError,
                ),
                obscureText: true,
                onFieldSubmitted: (_) {
                  _handleSignup();
                },
                validator: validateConfirmPassword,
                onChanged: (value) => _validateConfirmPassword(),
              ),

              //Signup Button with padding
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: _handleSignup,
                  child: Text('Register'),
                ),
              ),

              //Login Text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text(
                      'Login here',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),

              //OR
              Text('OR'),

              SizedBox(height: 20),

              TextButton(
                child: Text(
                  'Login with Google / Phone',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
