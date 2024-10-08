import '../../../const/my_theme.dart';
import '../../../helpers/navigator_push.dart';
import '../../../repository/payment_repository.dart';
import '../../account/account_middleware.dart';
import '../../core.dart';
import '../../package/package_history.dart';

ThunkAction<AppState> offlinePaymentMiddleware({
  postBody,
}) {
  return (Store<AppState> store) async {
    store.state.offlinePaymentState!.isSubmit = true;
    var response = await PaymentRepository().offlinePayment(postBody: postBody);

    if (response.result!) {
      store.dispatch(
          ShowMessageAction(msg: response.message, color: MyTheme.success));

      NavigatorPush.push_replace(page: PackageHistory());
      store.dispatch(accountMiddleware());
      store.dispatch(Reset.offlinePayment);
    } else {
      store.dispatch(
        ShowMessageAction(msg: response.message, color: MyTheme.failure),
      );
    }
    store.state.offlinePaymentState!.isSubmit = false;
  };
}
