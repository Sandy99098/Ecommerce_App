import 'package:ecommerce_app/constants/esewa.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:esewa_flutter_sdk/esewa_config.dart';
import 'package:esewa_flutter_sdk/esewa_flutter_sdk.dart';
import 'package:esewa_flutter_sdk/esewa_payment.dart';
import 'package:esewa_flutter_sdk/esewa_payment_success_result.dart';
import 'package:flutter/material.dart';

class Esewa {
  void pay({required Product product}) {
    try {
      EsewaFlutterSdk.initPayment(
        esewaConfig: EsewaConfig(
          environment: Environment.live,
          clientId: kEsewaClientId,
          secretId: kEsewaSecretKey,
        ),
        esewaPayment: EsewaPayment(
          productId: product.id,
          productName: product.name,
          productPrice: product.price.toStringAsFixed(2),
          callbackUrl: kEsewaCallbackUrl,
        ),
        onPaymentSuccess: (EsewaPaymentSuccessResult data) {
          debugPrint(":::SUCCESS::: => $data");
          verifyPayment(data);
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

  void verifyPayment(EsewaPaymentSuccessResult result) {
    // // TODO after success call this function to verify transaction

    print("Payment Status  : ${result.message}");
  }
}
