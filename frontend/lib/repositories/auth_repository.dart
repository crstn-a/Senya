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

    print("Sign-up response: $response");

    final user = response.user;
    if (user == null) {
      throw Exception('User is null. Check if email is already registered.');
    }

    print("User ID: ${user.id}");

    final profileInsertResponse = await _supabaseService.client
        .from('profiles')
        .insert({
          'id': user.id,
          'email': email,
          'name': name,
          'streaks': 1,
          'hearts': 5,
          'rubies': 50,
          'avatar': null,
        })
        .select();

    print("Profile insert response: $profileInsertResponse");

    if (profileInsertResponse.isEmpty) {
      throw Exception('Profile creation failed.');
    }

    return my_models.User.fromJson(profileInsertResponse.first);
  } catch (e) {
    print("Signup error: $e");
    throw Exception('Unexpected error during signup: $e');
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