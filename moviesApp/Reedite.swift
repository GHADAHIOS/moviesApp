//import SwiftUI
//
//struct Reedite: View {
//    @State private var firstName: String = "Sarah"
//    @State private var lastName: String = "Abdullah"
//
//    var body: some View {
//        VStack(spacing: 0) {
//            // Header Section
//            VStack(spacing: 0) {
//                HStack {
//                    Button(action: {
//                        // Action for back button
//                    }) {
//                        HStack(spacing: 8) {
//                            Image(systemName: "chevron.left")
//                                .foregroundColor(.yellow)
//                                .font(.system(size: 20))
//                            Text("Back")
//                                .foregroundColor(.yellow)
//                                .font(.system(size: 18))
//                        }
//                    }
//                    Spacer()
//                    Text("Edit profile")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                    Spacer()
//                    Button(action: {
//                        // Action for Save button
//                    }) {
//                        Text("Save")
//                            .foregroundColor(.yellow)
//                            .font(.system(size: 18))
//                    }
//                }
//                .padding(.horizontal)
//                .padding(.top)
//                
//                // Thin Divider
//                Divider()
//                    .background(Color.gray.opacity(0.5))
//                    .padding(.top, 8)
//            }
//            
//            // Profile Image Section
//            VStack {
//                ZStack {
//                    Circle()
//                        .fill(Color.gray)
//                        .frame(width: 78, height: 78)
//                    Image(systemName: "camera.fill")
//                        .foregroundColor(.yellow)
//                        .font(.system(size: 30))
//                }
//                .onTapGesture {
//                    // Action for editing profile picture
//                }
//            }
//            .padding(.top, 60)
//            
//            // Info Fields
//            VStack(spacing: 0) {
//                InfoRow(title: "First name", value: $firstName) // تعديل لتحديث الاسم الأول
//                Divider()
//                    .background(Color.white.opacity(0.5))
//                InfoRow(title: "Last name", value: $lastName) // تعديل لاستخدام الـ Binding
//            }
//            .padding(16)
//            .background(
//                RoundedRectangle(cornerRadius: 12)
//                    .fill(Color.gray.opacity(0.2))
//            )
//            .padding(.horizontal)
//            .padding(.top, 20)
//            
//            Spacer()
//            
//            // Sign Out Button
//            Button(action: {
//                // Action for sign out
//            }) {
//                Text("Sign Out")
//                    .font(.system(size: 18))
//                    .foregroundColor(.red)
//                    .frame(width: 364, height: 41)
//                    .background(Color.gray)
//                    .cornerRadius(12)
//            }
//            .padding(.bottom, 20)
//        }
//        .background(Color.black.edgesIgnoringSafeArea(.all))
//    }
//}
//
//// InfoRow View
//struct InfoRow: View {
//    let title: String
//    @Binding var value: String // استخدام Binding لتحديث القيم
//    
//    var body: some View {
//        HStack {
//            Text(title)
//                .foregroundColor(.gray)
//                .font(.headline)
//            Spacer()
//            TextField("", text: $value)
//                .foregroundColor(.white)
//                .font(.headline)
//                .multilineTextAlignment(.trailing)
//        }
//        .padding(.vertical, 8)
//        .frame(height: 48)
//    }
//}
//
//// Preview
//struct Reedite_Previews: PreviewProvider {
//    static var previews: some View {
//        Reedite()
//    }
//}
