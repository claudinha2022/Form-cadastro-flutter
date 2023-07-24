import 'package:flutter/material.dart';
import 'package:flutter1/Views/home_screen.dart';
import 'package:flutter1/Views/list_user.dart';
import 'package:flutter1/Views/login_screen.dart';
import 'package:flutter1/api/api_service.dart';


class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final List<String> idTypes = ['1', '2', '3'];
  final List<String> brazilianStates = [
    'AC',
    'AL',
    'AP',
    'AM',
    'BA',
    'CE',
    'DF',
    'ES',
    'GO',
    'MA',
    'MT',
    'MS',
    'MG',
    'PA',
    'PB',
    'PR',
    'PE',
    'PI',
    'RJ',
    'RN',
    'RS',
    'RO',
    'RR',
    'SC',
    'SP',
    'SE',
    'TO'
  ];
  final List<String> brazilianCities = [
    'Itabira',
    'Belo Horizonte',
    'São Paulo',
    'Rio de Janeiro',
    'Salvador',
    'Brasília',
    'Fortaleza',
    // Adicione mais cidades conforme necessário
  ];

  String? selectedState;
  String? selectedCity;

  TextEditingController nomeController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController logradouroController = TextEditingController();
  TextEditingController numeroController = TextEditingController();
  TextEditingController complementoController = TextEditingController();
  TextEditingController bairroController = TextEditingController();
  TextEditingController cepController = TextEditingController();
  String? selectedType;

  int currentTab = 0;
  List<Widget> screens = [HomeScreen(), ListUserScreen()];

  void saveUser() {
    // Crie um mapa com os dados do novo usuário
    Map<String, dynamic> userData = {
      'nome': nomeController.text,
      'telefone': telefoneController.text,
      'email': emailController.text,
      'logradouro': logradouroController.text,
      'numero': numeroController.text,
      'complemento': complementoController.text,
      'bairro': bairroController.text,
      'cidade': selectedCity,
      'uf': selectedState,
      'cep': cepController.text,
      'idtipo_cliente': selectedType,
    };

    // Chame a função ApiService.saveUser para gravar o novo usuário
    ApiService.saveUser(userData);

    // Exiba o alerta de sucesso
    showSuccessSnackbar();
  }

  void showSuccessSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              Icons.thumb_up,
              color: Colors.white,
            ),
            SizedBox(width: 8),
            Text(
              'Cliente cadastrado com sucesso!',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
            backgroundColor: Colors.green,
      ),
    );
  }

  @override
  void dispose() {
    nomeController.dispose();
    telefoneController.dispose();
    emailController.dispose();
    logradouroController.dispose();
    numeroController.dispose();
    complementoController.dispose();
    bairroController.dispose();
    cepController.dispose();
    super.dispose();
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
        padding: const EdgeInsets.only(top: 0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 100),
                Text(
                  'Preencha o formulário de cadastro',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: nomeController,
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: telefoneController,
                  decoration: InputDecoration(
                    labelText: 'Telefone',
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: logradouroController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Logradouro',
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: numeroController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Número',
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: complementoController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Complemento',
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: bairroController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Bairro',
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Cidade',
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                  ),
                  value: selectedCity,
                  items: brazilianCities.map((city) {
                    return DropdownMenuItem<String>(
                      value: city,
                      child: Text(city),
                    );
                  }).toList(),
                  onChanged: (selected) {
                    setState(() {
                      selectedCity = selected;
                    });
                  },
                ),
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'UF',
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                  ),
                  value: selectedState,
                  items: brazilianStates.map((state) {
                    return DropdownMenuItem<String>(
                      value: state,
                      child: Text(state),
                    );
                  }).toList(),
                  onChanged: (selected) {
                    setState(() {
                      selectedState = selected;
                    });
                  },
                ),
                SizedBox(height: 20),
                TextField(
                  controller: cepController,
                  decoration: InputDecoration(
                    labelText: 'Cep',
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Tipo de Usuário',
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                  ),
                  items: idTypes.map((type) {
                    return DropdownMenuItem<String>(
                      value: type,
                      child: Text(type),
                    );
                  }).toList(),
                  onChanged: (selectedType) {
                    setState(() {
                      this.selectedType = selectedType;
                    });
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: saveUser,
                  child: Text('Cadastrar'),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTab,
        onTap: (index) {
          setState(() {
            currentTab = index;
          });
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen(),
            )
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ListUserScreen()),
            );
          }
        },
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
