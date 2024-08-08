import 'package:googleapis_auth/auth_io.dart';

class access {
  static String fireBaseMessagingScope =
      "https://www.googleapis.com/auth/firebase.messaging";

  Future<String> getAccess() async {
    final client = await clientViaServiceAccount(
        ServiceAccountCredentials.fromJson({
          "type": "service_account",
          "project_id": "stay-14ef1",
          "private_key_id": "537718dbf0e5b9afb4a43fbb5725754fcabe34e9",
          "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCseqjpugkkaYz/\n+SP51Vx436nSpqGvs/dIewMhvP30x2jyKkZf9lJ3XMLUWSahpH41EWRhfWP8/kgT\nWqDbtRgusHBDuV1I2/DC1jgvkb2DxTTmjgBfA6xTBI9jJ0CgbVfLhSPoPBjhCgq2\noJICxka5ioL1cxAZ497FdGjo5s8L2Zvtc1h0e7A4nmGbUjJbnk7SwoEoDvQz/LoU\n/FT/98nfAQ5VrYrEyVmn/kgunqpuvURC5RX6EQiSlAj5M9P0AhRlcqLfHeUdc03m\nUsifOP+BWBk9Li/kWrK1M7QLQJAp7lPgZshCdYcBNPNYsE0MPhQOfAToXP469XDf\nDyzGOxgZAgMBAAECggEAA/53lKkhOSNicKm49XDp3HREmW6ivhR1dt2/Oe0He79a\nhyzHOQ66JFwZXQXTnssfGKBIzGVHZzd8obeHyrRhrCdk30UtkAGJQ2kwA9Gyi2HJ\n8GvTBylf3QL+RXUPfLwe5Tv+3OdAymBrVOCGXZ8CuC9pHG7hJD/Efj9n4hY4wRvZ\nXvspWSsA3gPorE3FXwSbk4UwbJW3mEZ7Xfztd7PMjoaatOJ7djXSRkeWXARWAgag\nnU/D+WA42ivv78aPkvCq8LI2jB3XPGAjld+m0tb1MwUu7sIvwT5Cu27XFlYINrKn\nXpiwYwJlnd6TxkbVC35YbmglrXRqz+PHG0Fw0ZMUbQKBgQDqanGArdSFFftTUjXf\nx6/S62YOGHegS7buIxwlo4oc9pnMPSqhCgH/ZdlBFG+PSrV+uR2vOqcMhAFC0wya\niin6YeRzSL2DtrXlHNRGaoLHkM0qbPv8t8qAq0D6IQ8jcLn6M0AIEfLSltPrCXjx\nVtZ7ywVDpZ93pCVF7nTCpAEFpQKBgQC8XEUiq+YmIDLY8drZQvKPCkbTJFb/a7Ja\nQtsW+E3YqdFK8QyNEGfau3pLHp8JlaFIa08domWdTyMzHu4kqKg+s7wZkP9VDoad\n6ks5iJeI+qpmnuU46k2Obap29vaG0CHQQ1Uz4ALhGL6CPYKfYBRtSMIdDRspe4l7\nj3Y8okoGZQKBgQC6hZXo0OhAOTxwkQKjHC3wAzSCVL+jAXv+QlucK2OzJhk8ZRMt\nblwmjzDuUsdt2gFOYxeWnXHcSJEEThBCS1uZihkQDjoVuuVC98yEdy22g6ZscqmS\n7d8owJuEK5fzGDgzOGJjyXxQSok3BKOCTRl/CQ0YRYn81dR+r32ifoL9rQKBgQCM\nGHSzXPdI1Bn9kaUcgta13Qbgc97hCtEUoTUi2HvN8kBgZPjY0qLr5RUIWjYfgtL6\nchXeDLNXVUzw8MhfK7I3MKduvJGsSamGOoTIvfc3QnkK6pPCyUH19UscQIMLsjH0\nHKB6fNqnYSgQ5n8I2wVWYw89XEofiGqxI/rlDi/QoQKBgHpYhoLo3RkzO+AUk+rs\nF2VAXRvRhAyJgE8uRP3QCX0NG40mdIikU02nE2p6+f/bc9y0lQjQi8x326DQadGc\nFmH1l7XaV7DV3ZLNKqve+ZZ0HfiJ/6Ddjr3Ff79GeCNarwL15ZqvKcbMtzOlnYLQ\ndGeJh1NpLPP1HxsLgeDJppPK\n-----END PRIVATE KEY-----\n",
          "client_email": "firebase-adminsdk-ocfu4@stay-14ef1.iam.gserviceaccount.com",
          "client_id": "104058032526038718837",
          "auth_uri": "https://accounts.google.com/o/oauth2/auth",
          "token_uri": "https://oauth2.googleapis.com/token",
          "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
          "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-ocfu4%40stay-14ef1.iam.gserviceaccount.com",
          "universe_domain": "googleapis.com"

        }), [fireBaseMessagingScope]);
    final accessToken = client.credentials.accessToken.data;
    return accessToken;
  }
}
