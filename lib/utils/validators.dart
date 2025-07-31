bool isValidPhone(String phone) {
  final pattern = RegExp(r'^[6-9]\d{9}$');
  return pattern.hasMatch(phone.trim());
}