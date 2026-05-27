class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Email tidak boleh kosong';
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!regex.hasMatch(value)) return 'Format email tidak valid';
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Password tidak boleh kosong';
    if (value.length < 8) return 'Minimal 8 karakter';
    if (!RegExp(r'(?=.*[A-Za-z])(?=.*\d)').hasMatch(value)) {
      return 'Harus ada huruf & angka';
    }
    return null;
  }
}
