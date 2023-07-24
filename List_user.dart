import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter1/Views/home_screen.dart';
import 'package:flutter1/Views/signup_screen.dart';
import 'package:flutter1/api/api_service.dart';

class ListUserScreen extends StatefulWidget {
  const ListUserScreen({Key? key}) : super(key: key);
  @override
  _ListUserScreenState createState() => _ListUserScreenState();
}

class _ListUserScreenState extends State<ListUserScreen> {
  List<dynamic> userList = [];
  List<dynamic> filteredUserList = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future<void> fetchUsers() async {
    try {
      userList = await ApiService.fetchUsers();
      filteredUserList = userList;
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  void filterUsers(String keyword) {
    setState(() {
      filteredUserList = userList
          .where((user) =>
              user['nome'].toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    });
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
              MaterialPageRoute(builder: (context) => SignupScreen()),
            );
          },
        ),
        backgroundColor: Color(0xFFFAF0E6),
        elevation: 0,
      ),
      body: Container(
        color: Color(0xFFFAF0E6),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(50),
              child: TextField(
                controller: searchController,
                autofocus: true,
                onChanged: (value) {
                  filterUsers(value);
                },
                decoration: InputDecoration(
                  labelText: 'Buscar usuários',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredUserList.length,
                itemBuilder: (context, index) {
                  final user = filteredUserList[index];
                  return ListTile(
                    leading: Icon(Icons.person),
                    title: Text(user['nome'] ?? ''),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.green,
                          ),
                          onPressed: () {
                            // Logic for editing the user
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'List',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignupScreen()),
            );
          }
        },
      ),
    );
  }
}
