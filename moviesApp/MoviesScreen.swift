import SwiftUI

struct MoviesScreen: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    
                    // ✅ شريط البحث
                    HStack {
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                            TextField("Search for Movie name, actors ...", text: .constant(""))
                                .foregroundColor(.white)
                        }
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                    }
                    .padding(.horizontal, 16)
                    
                    // ✅ قسم الأفلام الأعلى تقييمًا
                    VStack(alignment: .leading, spacing: 8) {
                        Text("High Rated")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.leading, 16)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                movieCard(imageName: "topgun", title: "Top Gun", rating: "4.8 out of 5", genre: "Action", duration: "2 hr 9 min", width: 366, height: 434)
                            }
                            .padding(.horizontal, 16)
                        }
                    }

                    // ✅ قسم الدراما
                    movieSection(title: "Drama", movies: ["shawshank", "starisborn"])

                    // ✅ قسم الكوميديا
                    movieSection(title: "Comedy", movies: ["worldsgreatestdad", "houseparty"])
                }
                .padding(.top)
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
            .navigationBarTitle("Movies Center", displayMode: .inline)
            .navigationBarItems(trailing: profileIcon)
        }
    }
    
    // ✅ أيقونة الحساب الشخصي في شريط التنقل
    var profileIcon: some View {
        Circle()
            .fill(Color.gray.opacity(0.3))
            .frame(width: 40, height: 40)
            .overlay(
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35, height: 35)
                    .foregroundColor(.white)
            )
    }
    
    // ✅ تصميم كرت الفيلم الكبير
    func movieCard(imageName: String, title: String, rating: String, genre: String, duration: String, width: CGFloat, height: CGFloat) -> some View {
        ZStack(alignment: .bottomLeading) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: width, height: height)
                .cornerRadius(10)

            // ✅ تفاصيل الفيلم
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                HStack {
                    Text("⭐️ \(rating)")
                    Text("\(genre) • \(duration)")
                }
                .font(.caption)
                .foregroundColor(.white.opacity(0.8))
            }
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.6), Color.clear]), startPoint: .bottom, endPoint: .top))
        }
    }
    
    // ✅ تصميم قسم الأفلام (مع عناوين وأزرار Show More)
    func movieSection(title: String, movies: [String]) -> some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.leading, 16)
                Spacer()
                Text("Show more")
                    .foregroundColor(.yellow)
                    .padding(.trailing, 16)
            }

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(movies, id: \.self) { movie in
                        Image(movie)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 208, height: 275)
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }
}

// ✅ تشغيل التطبيق
struct MoviesScreen_Previews: PreviewProvider {
    static var previews: some View {
        MoviesScreen()
    }
}
