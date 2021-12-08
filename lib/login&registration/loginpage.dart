import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:immolux/welcome/delayanimation.dart';

class LoginPage extends StatefulWidget {
  final Function basculation;
  LoginPage({this.basculation});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  //Collection User depuis firebase
  final CollectionReference collectionUtil =
      FirebaseFirestore.instance.collection('users');

  String nom = '';
  String prenom = '';
  String email = '';
  String numero = '';
  String password = '';
  String ConfMP = '';

  bool delay = false;

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;

    String _idUtil() {
      if (user != null) {
        return user.uid;
      } else {
        return "pas d'utilisateur courant";
      }
    }

    return delay
        ? DelayAnimation()
        : Stack(
            children: [
              Scaffold(
                body: SingleChildScrollView(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Image.asset(
                            'assets/logo.jpg',
                            height: 100.0,
                            width: 300.0,
                          ),
                          Center(
                            child: Text('Connectez-vous a votre compte',
                                style: Theme.of(context).textTheme.headline6),
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: 'nom', border: OutlineInputBorder()),
                            validator: (val) =>
                                val.isEmpty ? 'Entrer votre nom' : null,
                            onChanged: (val) => nom = val,
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Prenom',
                                border: OutlineInputBorder()),
                            validator: (val) =>
                                val.isEmpty ? 'Entrer votre prenom' : null,
                            onChanged: (val) => prenom = val,
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Numero de Telephone',
                                border: OutlineInputBorder()),
                            validator: (val) =>
                                val.isEmpty ? 'Entrer votre numero' : null,
                            onChanged: (val) => numero = val,
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Email',
                                border: OutlineInputBorder()),
                            validator: (val) =>
                                val.isEmpty ? 'Entrer votre Email' : null,
                            onChanged: (val) => email = val,
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Mot de Passe',
                                border: OutlineInputBorder()),
                            validator: (val) => val.length < 6
                                ? 'pas moins de 6 caracteres'
                                : null,
                            onChanged: (val) => password = val,
                            obscureText: true,
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Confirmer Mot de Passe',
                                border: OutlineInputBorder()),
                            validator: (val) => val.isEmpty
                                ? 'pas moins de 6 caracteres'
                                : null,
                            onChanged: (val) => ConfMP = val,
                          ),
                          Container(
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(49),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (_formkey.currentState.validate()) {
                                      setState(() => delay = true);
                                      UserCredential result = await _auth
                                          .createUserWithEmailAndPassword(
                                              email: email, password: password);

                                      await collectionUtil.doc(_idUtil()).set({
                                        'idUtil': _idUtil(),
                                        'nom': nom,
                                        'emailUtil': email
                                      });

                                      if (result == null) {
                                        //error
                                      }
                                    }
                                    widget.basculation();
                                  },
                                  child: Text('Creation Compte',
                                      style: TextStyle(color: Colors.white)),
                                )),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(29),
                            ),
                            child: OutlinedButton(
                              onPressed: () {
                                widget.basculation();
                              },
                              child: Text('deja un compte?'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}
