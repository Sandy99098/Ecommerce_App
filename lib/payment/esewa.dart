import 'package:ecommerce_app/constants/esewa.dart';
import 'package:esewa_flutter_sdk/esewa_config.dart';
import 'package:esewa_flutter_sdk/esewa_flutter_sdk.dart';
import 'package:esewa_flutter_sdk/esewa_payment.dart';
import 'package:esewa_flutter_sdk/esewa_payment_success_result.dart';
import 'package:flutter/material.dart';

class Esewa {
  void pay() {
    try {
      EsewaFlutterSdk.initPayment(
        esewaConfig: EsewaConfig(
          environment: Environment.test, // Use Environment.live for production
          clientId: kEsewaClientId,
          secretId: kEsewaSecretKey,
        ),
        esewaPayment: EsewaPayment(
          productId: "1d71jd81",
          productName: "Product One",
          productPrice: "20",
          callbackUrl: '',
        ),
        onPaymentSuccess: (EsewaPaymentSuccessResult data) {
          debugPrint(":::SUCCESS::: => $data");
          verify(data);
        },
        onPaymentFailure: (data) {
          debugPrint(":::FAILURE::: => $data");
        },
        onPaymentCancellation: (data) {
          debugPrint(":::CANCELLATION::: => $data");
        },
      );
    } catch (e) {
      debugPrint("EXCEPTION : ${e.toString()}");
    }
  }

  verify(EsewaPaymentSuccessResult result) {
    // TODO after success call this function to verify transaction
  }
}
