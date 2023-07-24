import 'package:flutter/material.dart';
import 'package:flutter1/Views/signup_screen.dart';
import 'package:flutter1/Views/home_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward_ios),
                color: Colors.blue,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignupScreen()),
              );
            },
          ),
        ],
         backgroundColor: Color(0xFFFAF0E6),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFAF0E6),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/imagens/scimg.png',
                width: 200,
              ),
              SizedBox(height: 20),
              Text(
                'Entre com seu email e senha',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navegar para a tela HomeScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                child: Text('Entrar'),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Não é cadastrado'),
                  SizedBox(width: 5),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupScreen()),
                      );
                    },
                    child: Text('Cadastre-se'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
