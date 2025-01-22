import SwiftUI

struct ContentView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false

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
                    Gradient.Stop(color: Color.black.opacity(0.7), location: 0.0),
                    Gradient.Stop(color: Color.black.opacity(1.0), location: 0.8)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            // محتوى تسجيل الدخول
            VStack {
                Spacer() // مسافة فارغة تجعل العناصر تنزل للأسفل
                
                VStack(alignment: .leading, spacing: 12) { // تقليل المسافات العمودية
                    // عنوان الصفحة
                    Text("Sign in")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.8), radius: 4, x: 0, y: 2) // Drop Shadow
                    
                    // وصف الصفحة
                    Text("You'll find what you're looking for in the ocean of movies")
                        .font(.title3)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        .shadow(color: .black.opacity(0.8), radius: 4, x: 0, y: 2) // Drop Shadow
                    
                    // نص "Email" وحقل الإدخال
                    Group {
                        Text("Email")
                            .font(.title2)
                            .foregroundColor(Color.gray)
                            .shadow(color: .black.opacity(0.6), radius: 4, x: 0, y: 2) // Drop Shadow
                        
                        TextField("Enter your email", text: $email)
                            .frame(width: 358, height: 44)
                            .background(Color.gray.opacity(0.3))
                            .cornerRadius(8)
                            .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 2) // Drop Shadow
                    }
                    
                    // نص "Password" وحقل الإدخال
                    Group {
                        Text("Password")
                            .font(.title2)
                            .foregroundColor(Color.gray)
                            .shadow(color: .black.opacity(0.6), radius: 4, x: 0, y: 2) // Drop Shadow
                        
                        ZStack(alignment: .trailing) {
                            if isPasswordVisible {
                                TextField("Enter your password", text: $password)
                                    .frame(width: 358, height: 44)
                                    .background(Color.gray.opacity(0.3))
                                    .cornerRadius(8)
                                    .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 2) // Drop Shadow
                            } else {
                                SecureField("Enter your password", text: $password)
                                    .frame(width: 358, height: 44)
                                    .background(Color.gray.opacity(0.3))
                                    .cornerRadius(8)
                                    .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 2) // Drop Shadow
                            }

                            // رمز العين داخل الحقل
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
                        // هنا يمكن إضافة الكود الذي يجب تنفيذه عند الضغط على الزر
                    }) {
                        Text("Sign In")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .frame(width: 358, height: 44)
                            .background(Color.yellow)
                            .cornerRadius(8)
                            .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 2) // Drop Shadow
                    }
                    .padding(.top, 16) // مسافة صغيرة أعلى الزر
                }
                .padding(.horizontal, 30) // الحفاظ على مسافة الأمان من الحواف
                .padding(.bottom, 50) // مسافة إضافية في الأسفل
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

