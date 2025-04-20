import 'package:demo_app_v1_1/screens/home.dart';
import 'package:demo_app_v1_1/screens/signup.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();

  String? _emailError;
  String? _passwordError;

  @override
  void dispose() {
    _emailFocus.dispose();
    _passwordFocus.dispose();
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

  void _handleLogin() {
    if (_loginFormKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Form(
              key: _loginFormKey,
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
                      FocusScope.of(
                        context,
                      ).requestFocus(_confirmPasswordFocus);
                    },
                    validator: validatePassword,
                    onChanged: (value) => _validatePassword(),
                  ),
                
                  //Login Button with padding
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      onPressed: _handleLogin,
                      child: Text('Login'),
                    ),
                  ),
                
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account?'),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Register here',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
        
            Spacer(),
                
            //OR
            Text('OR'),
        
            Spacer(),
                
            //Continue with Google & Phone Column
            Column(
              children: [
                ElevatedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        "https://img.icons8.com/plasticine/100/google-logo.png",
                        height: 30,
                      ),
                      SizedBox(width: 10),
                      Text('Continue with Google'),
                    ],
                  ),
                  onPressed: () {},
                ),

                SizedBox(height: 30),
        
                ElevatedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network("https://img.icons8.com/dusk/64/phone.png", height: 30,),
                      SizedBox(width: 10,),
                      Text('Continue with Phone'),
                    ],
                  ),
                  onPressed: () {},
                  )
              ],
            ),

            Spacer(),
          ],
        
        ),
      ),
    );
  }
}
