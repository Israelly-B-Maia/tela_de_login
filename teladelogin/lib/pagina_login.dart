import 'package:flutter/material.dart';

class PaginaLogin extends StatefulWidget {
  const PaginaLogin({super.key});

  @override
  State<PaginaLogin> createState() => _PaginaLoginState();
}

class _PaginaLoginState extends State<PaginaLogin> {
  late Color myColor;
  late Size mediaSize;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberUser = false;

  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: myColor,
        image: DecorationImage(
          image: const AssetImage('assets/fundo.png'),
          fit: BoxFit.cover, 
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(top: 80, child: _buildTop()),
            Positioned(bottom: 0, child: _buildBottom())
          ],
        ),
      ),
    );
  }

  Widget _buildTop() {
    return SizedBox(
      width: mediaSize.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/logo.png',
            width: 100,
            height: 100,
          ),
          Text(
            'Bem vindo à tripulação',
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold,
                fontSize: 40,
                letterSpacing: 2),
          )
        ],
      ),
    );
  }
  Widget _buildBottom(){
    return SizedBox(
    width: mediaSize.width,
    child: Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
        )),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: _buildForm(),
      ),
      ),
    );
  }
  Widget _buildForm(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Bem-vindo',
          style: TextStyle(
            color: myColor, fontSize: 32, fontWeight: FontWeight.w500 ),
        ),
        _buildGreyText("Faça o login com as suas informações"),
        const SizedBox(height: 60),
        _buildGreyText("Email"),
        _buildInputField(emailController),
        const SizedBox(height: 40),
        _buildGreyText('Senha'),
        _buildInputField(passwordController, isPassword: true),
        const SizedBox(height: 20),
        _buildRememberForgot(),
        const SizedBox(height: 20),
        _buildLoginBottom(),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildGreyText(String text){
    return Text(
      text,
      style: const TextStyle(color: Color.fromARGB(255, 111, 2, 135)),
      );
  }
  Widget _buildInputField(TextEditingController controller,
      {isPassword = false}){
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: isPassword ? Icon(Icons.remove_red_eye) : Icon(Icons.done),
      ),
      obscureText: isPassword
    );
  }
  Widget _buildRememberForgot(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [Checkbox(value: rememberUser, onChanged: (value){
            setState(() {
              rememberUser = value!;
            });
          }),
          _buildGreyText('Relembrar'),
        ],
        ),
        TextButton( 
          onPressed: () {}, child: _buildGreyText('Perdi minha senha'))
      ],
    );
  }
  Widget _buildLoginBottom(){
    return ElevatedButton(
      onPressed: () {
        debugPrint('Email : ${emailController.text}');
        debugPrint('Password : ${passwordController.text}');
      },
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        elevation: 20,
        shadowColor: myColor,
        minimumSize: const Size.fromHeight(60),
      ),
      child: const Text('LOGIN'),
      );
  }
}

