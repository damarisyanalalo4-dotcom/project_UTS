# Kosan Finder - Aplikasi Pencarian Kos-Kosan

## 📱 Deskripsi
Aplikasi mobile Flutter untuk sistem pencarian dan manajemen kamar kos-kosan dengan 3 halaman utama:
- Halaman 1: Login Screen
- Halaman 2: Lupa Password Screen
- Halaman 3: Dashboard

## 🎯 Fitur

### Halaman 1 - Login
- ✅ Form login dengan Email & Password
- ✅ Validasi client-side (GlobalKey<FormState>)
- ✅ Email: tidak kosong + format regex
- ✅ Password: min 8 karakter + huruf & angka
- ✅ State: isLoading, errorMessage, isPasswordVisible
- ✅ Loading indicator pada tombol
- ✅ Navigasi ke Halaman 2 (Lupa Password)
- ✅ Snackbar success/error
- ✅ Navigasi ke Dashboard setelah login sukses

### Halaman 2 - Lupa Password
- ✅ Form input email dengan validasi
- ✅ Tombol dengan loading state
- ✅ Snackbar feedback
- ✅ Navigator.pop ke Login
- ✅ Layout: Column, Padding, SizedBox, SafeArea

### Halaman 3 - Dashboard
- ✅ AppBar dengan judul + logout button
- ✅ Tampilkan data user dari login
- ✅ GridView.builder (12+ items)
- ✅ Card dengan styling (shadow, rounded, padding)
- ✅ Logout dengan pushAndRemoveUntil
- ✅ Bottom Navigation Bar

## 🛠️ Tech Stack
- **Framework:** Flutter
- **Language:** Dart
- **State Management:** setState
- **Navigation:** Navigator 1.0 (named routes)
- **Null Safety:** Aktif

## 📁 Struktur Folder
lib/ ├── main.dart 
     ├── screens/ │ 
     ├── login_screen.dart 
     ├── forgot_password_screen.dart │ 
     └── dashboard_screen.dart 
     ├── widgets/ 
     └── utils/ 
     └── validators.dart




## 🚀 Cara Menjalankan

```bash
# Clone repository
git clone <repo-url>

# Install dependencies
flutter pub get

# Run aplikasi
flutter run

👤 Kredensial Demo
Admin: admin@kosan.com / Admin123
Penghuni: penghuni@kosan.com / admin12345

Halaman 1 - Login

[alt text](image.png)
Halaman 2 - Lupa Password
![alt text](image-1.png)

Halaman 3 - Dashboard

![alt text](image.png)
