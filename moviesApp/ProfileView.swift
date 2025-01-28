import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                // Header Section
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
                }
                .padding(.horizontal)
                
                // Profile Title
                Text("Profile")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                
                // Profile Section
                VStack(spacing: 10) {
                    HStack {
                        Circle()
                            .fill(Color.gray)
                            .frame(width: 60, height: 60)
                            .overlay(
                                Text("👩‍💻") // Replace with a real image if needed
                                    .font(.largeTitle)
                            )
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Sarah Abdullah")
                                .font(.headline)
                                .foregroundColor(.white)
                            Text("Xxxx234@gmail.com")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: 358, height: 80)
                    )
                    .padding(.horizontal)
                }
                
                // Saved Movies Section
                Text("Saved movies")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                
                // Movies Grid
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                    ForEach(movies, id: \.id) { movie in
                        MovieView(movie: movie)
                    }
                }
                .padding(.horizontal)
            }
            .padding(.top)
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

// Movie Data Model
struct Movie: Identifiable {
    let id = UUID()
    let imageName: String
}

// Example Movies Data
let movies = [
    Movie(imageName: "move1"),
    Movie(imageName: "move2"),
    Movie(imageName: "move3")
]

// Movie Card View
struct MovieView: View {
    let movie: Movie
    
    var body: some View {
        Image(movie.imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 172, height: 237)
            .cornerRadius(20, corners: [.topLeft, .topRight, .bottomLeft, .bottomRight]) // Mixed corners
    }
}

// Corner Radius Extension
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat
    var corners: UIRectCorner

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

// Preview
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
