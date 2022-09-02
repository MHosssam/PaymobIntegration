String? validateEmail(String? value) {
  String pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value!)) {
    return 'البريد الالكتروني غير صحيح';
  } else {
    return null;
  }
}

String? validatePassword(String? value) {
  if (value!.isEmpty) {
    return 'كلمة المرور مطلوبة';
  } else if (value.length < 8) {
    return 'كلمة المرور يجب الا تكون اقل من 8';
  }
  return null;
}

String? validateNotEmpty(String? value) {
  if (value!.isEmpty) {
    return 'هذا الحقل مطلوب';
  }
  return null;
}
