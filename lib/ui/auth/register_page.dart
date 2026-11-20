import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_foodstore_1/bloc/auth/auth_bloc.dart';
import 'package:flutter_foodstore_1/core/utils/error_handle.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _fullNameFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _confirmPasswordFocus = FocusNode();

  Map<String, String> _errorMessages = {};

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _fullNameFocus.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    _confirmPasswordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            registerSuccess: (message) {
              context.pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: Colors.green,
                ),
              );
            },
            registerFailure: (message) {
              setState(() {
                _errorMessages = ErrorHandler.parseErrors(message);
              });
            },
          );
        },
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Create Your Account',
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _textFieldFullName(),
                            const SizedBox(height: 20),
                            _textFieldEmail(),
                            const SizedBox(height: 20),
                            _textFieldPassword(),
                            const SizedBox(height: 20),
                            _textFieldConfirmPassword(),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buttonRegister(),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account? '),
                        TextButton(
                          onPressed: () => context.pop(),
                          child: const Text('Login'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _textFieldFullName() {
    return TextFormField(
      controller: _fullNameController,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        labelText: 'Full Name',
        hintText: 'Enter your full name',
        prefixIcon: Icon(Icons.person),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your full name';
        }
        return null;
      },
    );
  }

  Widget _textFieldEmail() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email',
        errorText: _errorMessages['email'],
        hintText: 'Enter your email',
        prefixIcon: const Icon(Icons.email),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
          return 'Please enter a valid email';
        }
        return null;
      },
    );
  }

  Widget _textFieldPassword() {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        prefixIcon: Icon(Icons.lock),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        if (value.length < 6) {
          return 'Password must be at least 6 characters long';
        }
        return null;
      },
    );
  }

  Widget _textFieldConfirmPassword() {
    return TextFormField(
      controller: _confirmPasswordController,
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Confirm Password',
        hintText: 'Re-enter your password',
        prefixIcon: Icon(Icons.lock_outline),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please confirm your password';
        }
        if (value != _passwordController.text) {
          return 'Passwords do not match';
        }
        return null;
      },
    );
  }

  Widget _buttonRegister() {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            final name = _fullNameController.text;
            final email = _emailController.text;
            final password = _passwordController.text;
            final confirmPassword = _confirmPasswordController.text;

            context.read<AuthBloc>().add(
                  AuthEvent.registerRequested(
                    name: name,
                    email: email,
                    password: password,
                    passwordConfirmation: confirmPassword,
                  ),
                );
          }
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.orange,
        ),
        child: const Text(
          'Register',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}