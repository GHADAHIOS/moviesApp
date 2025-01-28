import SwiftUI

struct ProfileEditing: View {
    var body: some View {
        VStack(spacing: 0) {
            // Header Section
            VStack(spacing: 0) {
                HStack {
                    Button(action: {
                        // Action for back button
                    }) {
                        HStack(spacing: 8) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.yellow)
                                .font(.system(size: 20))
                            Text("Back")
                                .foregroundColor(.yellow)
                                .font(.system(size: 18))
                        }
                    }
                    Spacer()
                    Text("Profile info")
                        .font(.headline)
                        .foregroundColor(.white)
                    Spacer()
                    Button(action: {
                        // Action for Edit button
                    }) {
                        Text("Edit")
                            .foregroundColor(.yellow)
                            .font(.system(size: 18))
                    }
                }
                .padding(.horizontal)
                .padding(.top)
                
                // Thin Divider
                Divider()
                    .background(Color.gray.opacity(0.5))
                    .padding(.top, 8)
            }
            
            // Profile Image Section
            VStack {
                Circle()
                    .fill(Color.gray)
                    .frame(width: 78, height: 78)
                    .overlay(
                        Text("👩‍💻") // Replace with a real image if needed
                            .font(.largeTitle)
                    )
            }
            .padding(.top, 60) // إنزال الدائرة قليلاً
            
            // Info Fields
            VStack(spacing: 0) {
                InfoRow(title: "First name", value: "Sarah")
                Divider()
                    .background(Color.white.opacity(0.5)) // White line to divide
                InfoRow(title: "Last name", value: "Abdullah")
            }
            
            .padding(16) // Add padding to the container
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.gray.opacity(0.2))
            )
            .padding(.horizontal)
            .padding(.top, 20)
            
            Spacer()
            
            // Sign Out Button
            Button(action: {
                // Action for sign out
            }) {
                Text("Sign Out")
                    .font(.system(size: 18))
                    .foregroundColor(.red) // Red text
                    .frame(width: 364, height: 41)
                    .background(Color.gray) // Gray background
                    .cornerRadius(12)
            }
            .padding(.bottom, 20)
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

// InfoRow View
struct InfoRow: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.gray)
                .font(.headline)
            Spacer()
            Text(value)
                .foregroundColor(.white)
                .font(.headline)
        }
        .padding(.vertical, 8) // Add padding between rows
        .frame(height: 48) // Uniform row height
    }
}

// Preview
struct ProfileEditing_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditing()
    }
}
