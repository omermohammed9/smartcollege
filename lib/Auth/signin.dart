import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // Get a reference to the FirebaseAuth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create text editing controllers for email and password fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Create a global key for the form state
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Sign in a user with email and password
  void _signInWithEmailAndPassword() async {
    try {
      // Validate the form fields
      if (_formKey.currentState?.validate() ?? false) {
        // Sign in the user and get the UserCredential object
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );

        // Get the User object from the UserCredential
        User? user = userCredential.user;

        // Check if the user is not null and is verified
        if (user != null && user.emailVerified) {
          // Show a success message and navigate to home screen
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Signed in successfully'),
            ),
          );
          Navigator.pushReplacementNamed(context, '/Nav_Main');
        } else {
          // Show an error message and ask the user to verify their email
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Please verify your email'),
            ),
          );
        }
      }
    } on FirebaseAuthException catch (e) {
      // Handle different Firebase auth exceptions
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('No user found for that email'),
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Wrong password provided'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message ?? 'An error occurred'),
          ),
        );
      }
    } catch (e) {
      // Handle any other errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) =>
                    value?.isEmpty == true ? 'Please enter your email' : null,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText:
                    true, // Hide the password as it is typed by showing dots instead of characters
                validator: (value) => value?.isEmpty == true
                    ? 'Please enter your password'
                    : null,
              ),
              ElevatedButton(
                onPressed:
                    _signInWithEmailAndPassword, // Call the sign in function when pressed
                child: Text(
                    'Sign In'), // Display "Sign In" text on the button widget
              ),
            ],
          ),
        ),
      ),
    );
  }
}
