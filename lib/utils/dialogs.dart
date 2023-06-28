import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


showLoading(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Center(
      child: SizedBox(
        height: 50.0.h,
        width: 50.0.w,
        child: const FittedBox(
          child: CircularProgressIndicator(
            strokeWidth: 3,
            color: Colors.deepPurpleAccent,
          ),
        ),
      ),
    ),
    barrierDismissible: false,
  );
}
showLogoutDialog(BuildContext context, String userId) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0.r),
      ),
      title: Text(
        'Logout',
      ),
      content: Text(
      'Are you sure you want to logout?',
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () async {
            Navigator.pop(context);
          },
          child: Text(
           'Cancel',
          ),
        ),
        TextButton(
          onPressed: () async {

          },
          child: Text(
            'Logout',
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
      ],
    ),
  );
}

hideLoading(BuildContext context) {
  Navigator.pop(context);
}

