import 'package:flutter/material.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';

class MixPanelService {
  static const mixpanelToken = 'f72d8c5eb64dee16ed14232e6b2041c5';
  static Mixpanel? _instance;

  static Future<Mixpanel> init() async {
    // ignore: prefer_conditional_assignment
    if (_instance == null) {
      _instance = await Mixpanel.init(
        mixpanelToken,
        optOutTrackingDefault: false,
        trackAutomaticEvents: true,
      );
    }
    return _instance!;
  }

  Future<void> openApp() async {
    // you should call this method when the app starts
    // this id its a random ID, but dont worry we will set a better ID after the user sign in or sign up
    debugPrint('openApp');

    String distinctId = await _instance!.getDistinctId();
    _instance!.identify(distinctId);
    _instance!.track('App_open');
  }

  Future<void> changeIdentify({
    required String newUserIdentity,
    required String userId,
    required String userName,
    required String email,
    required String country,
    required String city,
  }) async {
    debugPrint('changeIdentify');

    // change the random user ID for our custom user identifier
    // so you will be able to check fnoceda83 profile in this case
    _instance!.identify(newUserIdentity);

    // all of these properties you will be able to check on the user profile inside mixpanel
    _instance!.getPeople().set('\$name', userName);
    _instance!.getPeople().set('\$email', email);
    _instance!.getPeople().set('Business Country', country);
    _instance!.getPeople().set('Business City', city);

    // this properties will be available in each event, you can add a lot
    _instance!.registerSuperProperties({
      'userId': userId,
    });
  }

  //events
  signInEvent({required String userName}) {
    debugPrint('signInEvent');

    _instance!.track(
      'signInEvent',
      properties: {'userName': userName, 'datetime': DateTime.now().toUtc()},
    );
  }

  signUpEvent({
    required String userName,
    required String email,
    required String country,
    required String city,
  }) {
    debugPrint('signUpEvent');

    _instance!.track('signUpEvent', properties: {
      'userName': userName,
      'email': email,
      'country': country,
      'city': city,
      'datetime': DateTime.now().toUtc()
    });
  }

  showHomePageEvent({required String userName}) {
    debugPrint('showHomePageEvent');
    _instance!.track(
      'showHomePageEvent',
      properties: {'userName': userName, 'datetime': DateTime.now().toUtc()},
    );
  }

  visitProductEvent({
    required String userName,
    required String produtId,
  }) {
    debugPrint('visitProductEvent');

    _instance!.track(
      'visitProductEvent',
      properties: {
        'userName': userName,
        'produtId': produtId,
        'datetime': DateTime.now().toUtc()
      },
    );
  }

  buyProductEvent({
    required String userName,
    required String produtId,
  }) {
    debugPrint('buyProductEvent');

    _instance!.track(
      'buyProductEvent',
      properties: {
        'userName': userName,
        'produtId': produtId,
        'datetime': DateTime.now().toUtc()
      },
    );
  }
}
