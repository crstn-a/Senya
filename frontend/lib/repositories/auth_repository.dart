import 'package:supabase_flutter/supabase_flutter.dart' hide User;
import '../models/user_model.dart' as my_models;
import '../services/supabase_service.dart';

class AuthRepository {
  final SupabaseService _supabaseService = SupabaseService();

  Future<my_models.User?> signUp(String email, String password, String name) async {
  try {
    final response = await _supabaseService.client.auth.signUp(
      email: email,
      password: password,
      data: {'name': name},
    );

    if (response.user != null) {
      return my_models.User.fromJson({
        'userID': response.user!.id,
        'email': email,
        'name': name,
      });
    } else {
      throw Exception('User creation failed');
    }
  } catch (e) {
    throw Exception('Error during signup: $e');
  }
}

  Future<my_models.User?> login(String email, String password) async {
    try {
      final response = await _supabaseService.client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user != null) {
        return my_models.User.fromJson({
          'id': response.user!.id,
          'email': email,
        });
      }
    } on AuthException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
    return null;
  }

  Future<void> logout() async {
    await _supabaseService.client.auth.signOut();
  }
}