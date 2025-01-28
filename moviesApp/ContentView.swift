import SwiftUI

struct ContentView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    @State private var isPasswordIncorrect: Bool = false
    @State private var canSignIn: Bool = false
    
    var body: some View {
        ZStack {
            // الخلفية (الصورة)
            Image("backgroundImage") // استبدل "backgroundImage" باسم الصورة لديك
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            // طبقة التدرج
            LinearGradient(
                gradient: Gradient(stops: [
                    Gradient.Stop(color: Color.black.opacity(0.5), location: 0.0),
                    Gradient.Stop(color: Color.black.opacity(1.0), location: 0.8)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            // محتوى تسجيل الدخول
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 12) {
                    // عنوان الصفحة
                    Text("Sign in")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.8), radius: 4, x: 0, y: 2)
                    
                    // وصف الصفحة
                    Text("You'll find what you're looking for in the ocean of movies")
                        .font(.title3)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        .shadow(color: .black.opacity(0.8), radius: 4, x: 0, y: 2)
                    
                    // حقل "Email"
                    Group {
                        Text("Email")
                            .font(.title2)
                            .foregroundColor(Color.gray)
                            .shadow(color: .black.opacity(0.6), radius: 4, x: 0, y: 2)
                        
                        TextField("Enter your email", text: $email)
                            .padding()
                            .frame(width: 358, height: 44)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(email.isEmpty ? Color.gray.opacity(0.3) : Color.yellow, lineWidth: 2)
                            )
                            .foregroundColor(.white) // النص الذي يكتبه المستخدم
                            .placeholder(when: email.isEmpty) {
                                Text("Enter your email") // نص placeholder
                                    .foregroundColor(Color.white.opacity(0.7))
                            }
                            .onChange(of: email) { _ in
                                validateForm()
                            }
                            .accentColor(.yellow)
                    }
                    
                    // حقل "Password"
                    Group {
                        Text("Password")
                            .font(.title2)
                            .foregroundColor(Color.gray)
                            .shadow(color: .black.opacity(0.6), radius: 4, x: 0, y: 2)
                        
                        ZStack(alignment: .trailing) {
                            if isPasswordVisible {
                                TextField("Enter your password", text: $password)
                                    .padding()
                                    .frame(width: 358, height: 44)
                                    .background(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(isPasswordIncorrect ? Color.red : (password.isEmpty ? Color.gray.opacity(0.3) : Color.yellow), lineWidth: 2)
                                    )
                                    .foregroundColor(.white) // النص الذي يكتبه المستخدم
                                    .placeholder(when: password.isEmpty) {
                                        Text("Enter your password") // نص placeholder
                                            .foregroundColor(Color.white.opacity(0.7))
                                    }
                                    .onChange(of: password) { _ in
                                        validateForm()
                                    }
                                    .accentColor(.yellow)
                            } else {
                                SecureField("Enter your password", text: $password)
                                    .padding()
                                    .frame(width: 358, height: 44)
                                    .background(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(isPasswordIncorrect ? Color.red : (password.isEmpty ? Color.gray.opacity(0.3) : Color.yellow), lineWidth: 2)
                                    )
                                    .foregroundColor(.white) // النص الذي يكتبه المستخدم
                                    .placeholder(when: password.isEmpty) {
                                        Text("Enter your password") // نص placeholder
                                            .foregroundColor(Color.white.opacity(0.7))
                                    }
                                    .onChange(of: password) { _ in
                                        validateForm()
                                    }
                                    .accentColor(.yellow)
                            }

                            Button(action: {
                                isPasswordVisible.toggle()
                            }) {
                                Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 10)
                            }
                        }
                    }
                    
                    // زر "Sign In"
                    Button(action: {
                        isPasswordIncorrect = password != "12345" // افتراض أن كلمة المرور الصحيحة "12345"
                    }) {
                        Text("Sign In")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(canSignIn ? .black : .gray)
                            .frame(width: 358, height: 44)
                            .background(canSignIn ? Color.yellow : Color.gray.opacity(0.5))
                            .cornerRadius(8)
                            .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 2)
                    }
                    .disabled(!canSignIn) // منع الزر إذا لم تكن الحقول مكتملة
                    .padding(.top, 16)
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 50)
            }
        }
    }
    
    // التحقق من الحقول وتفعيل زر "Sign In"
    private func validateForm() {
        canSignIn = !email.isEmpty && !password.isEmpty
    }
}

extension View {
    // إضافة طريقة عرض placeholder
    func placeholder<Content: View>(when shouldShow: Bool, alignment: Alignment = .leading, @ViewBuilder placeholder: () -> Content) -> some View {
        ZStack(alignment: alignment) {
            if shouldShow {
                placeholder()
            }
            self
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
