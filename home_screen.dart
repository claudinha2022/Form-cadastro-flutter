import 'package:flutter/material.dart';
import 'package:flutter1/Views/login_screen.dart';
import 'package:flutter1/Views/list_user.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    LoginScreen(),
    ListUserScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ListUserScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
           color: Colors.blue,
         onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          },
        ),
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
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontSize: 24, color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Bem-vindo à ',
                    ),
                    TextSpan(
                      text: '\n',
                    ),
                    TextSpan(
                      text: 'livraria do Sr. Carlos',
                    ),
                    TextSpan(
                      text: '\n',
                    ),
                    TextSpan(
                      text: 'Aqui você encontra',
                    ),
                    TextSpan(
                      text: '\n',
                    ),
                    TextSpan(
                      text: 'os melhores livros',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
         showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
         
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Lista de Usuários',
          ),
        ],
      ),
    );
  }
}
