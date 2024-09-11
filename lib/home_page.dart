import 'package:flutter/material.dart';
import 'package:frlutter_demo_mixpanel/services/mixpanel_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final mixPanelService = MixPanelService();
  final String userName = 'Francisco';
  final String userId = '123';
  final String email = 'fnoceda83@gmail.com';
  final String country = 'PY';
  final String city = 'Asunción';
  //IMPORTANT:  the identifier for the user inside the mixpanel dashboard
  final String userIdentity = 'fnoceda83';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  mixPanelService.signUpEvent(
                    userName: userName,
                    email: email,
                    country: country,
                    city: city,
                  );

                  // better call this function when you have approved your sign up
                  mixPanelService.changeIdentify(
                    newUserIdentity: userIdentity,
                    userId: userId,
                    userName: userName,
                    email: email,
                    country: country,
                    city: city,
                  );
                },
                child: const Text('Sign up event'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  mixPanelService.signInEvent(
                    userName: userName,
                  );

                  // better call this function when you have approved your sign in
                  mixPanelService.changeIdentify(
                    newUserIdentity: userIdentity,
                    userId: userId,
                    userName: userName,
                    email: email,
                    country: country,
                    city: city,
                  );
                },
                child: const Text('Sign in event'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  mixPanelService.showHomePageEvent(userName: userName);
                },
                child: const Text('Home screen'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  mixPanelService.visitProductEvent(
                    userName: userName,
                    produtId: '1',
                  );
                },
                child: const Text('Visit product 1 event'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  mixPanelService.visitProductEvent(
                    userName: userName,
                    produtId: '2',
                  );
                },
                child: const Text('Visit product 2 event'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  mixPanelService.buyProductEvent(
                    userName: userName,
                    produtId: '2',
                  );
                },
                child: const Text('Buy product 2 event'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
