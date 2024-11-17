# product_catalog
# Flutter API Integration with Infinite Scroll and Favorites

This Flutter project demonstrates:
1. Email/Password login using the [DummyJSON API](https://dummyjson.com/auth/login).
2. Fetching products with infinite scrolling.
3. Displaying product details with image, title, price, and description.
4. Adding and listing favorite products, with favorites persisted using `SharedPreferences`.

---

## Features
- **Login Functionality:** Authenticate users via the DummyJSON API.
- **Infinite Scrolling:** Load products dynamically as the user scrolls.
- **Favorites Management:** Save, retrieve, and list favorite products across app sessions.
- **Provider State Management:** Efficient state handling with the `provider` package.

---

## API Endpoints
- **Login:** `https://dummyjson.com/auth/login`
- **Fetch Products:** `https://dummyjson.com/products`
- **Fetch Single Product:** `https://dummyjson.com/products/:id`

---

## Tech Stack
- **Flutter:** Framework for building cross-platform apps.
- **HTTP Package:** API integration for network requests.
- **SharedPreferences:** Persistent local storage for favorite products.
- **Provider:** State management solution.

---

## Project Structure

![WhatsApp Image 2024-11-17 at 03 35 05_c42338ea](https://github.com/user-attachments/assets/fd7cd63c-3f1a-4ff4-8d6d-f808b0aa95b4)
![WhatsApp Image 2024-11-17 at 03 35 06_f65cfbda](https://github.com/user-attachments/assets/bcb8bfa0-ab1f-4c16-b148-25449f83a798)
![WhatsApp Image 2024-11-17 at 03 35 06_afe39b3b](https://github.com/user-attachments/assets/aab64d29-3858-4668-ac91-414ba38e974d)
![WhatsApp Image 2024-11-17 at 03 35 06_cd35473d](https://github.com/user-attachments/assets/176e2ffb-ab63-4fbc-971e-4c9ba4e2fe95)
![WhatsApp Image 2024-11-17 at 03 35 07_5503763e](https://github.com/user-attachments/assets/8a076934-0a32-4b67-a89d-6c8d8d1615ce)
![Uploading WhatsApp Image 2024-11-17 at 03.36.32_874760b7.jpg…]()

Implement email/password login using the API from dummyjson.com. Fetch products from dummyjson.com and load more as the user scrolls. Show product details with an image, title, price, description, and "Add to Favorites" button. List all favorite items, ensuring they are saved across sessions

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
