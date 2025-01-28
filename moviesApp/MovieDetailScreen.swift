import SwiftUI

struct MovieDetailScreen: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                // ✅ الصورة الكبيرة مع زر الرجوع
                ZStack(alignment: .topLeading) {
                    Image("shawshank")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 300)
                        .clipped()
                    
                    Button(action: {
                        // 👇 ضع هنا كود الرجوع
                    }) {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.white)
                            .padding()
                            .background(Circle().fill(Color.black.opacity(0.6)))
                            .padding(.leading, 16)
                            .padding(.top, 50)
                    }
                }
                
                // ✅ اسم الفيلم
                Text("Shawshank")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                
                // ✅ تفاصيل الفيلم
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        movieDetailRow(title: "Duration", value: "2 hours 22 mins")
                        movieDetailRow(title: "Genre", value: "Drama")
                    }
                    Spacer()
                    VStack(alignment: .leading, spacing: 4) {
                        movieDetailRow(title: "Language", value: "English")
                        movieDetailRow(title: "Age", value: "+15")
                    }
                }
                .padding(.horizontal, 16)

                // ✅ القصة (Story)
                VStack(alignment: .leading, spacing: 8) {
                    Text("Story")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Synopsis. In 1947, Andy Dufresne (Tim Robbins), a banker in Maine, is convicted of murdering his wife and her lover, a golf pro. Since the state of Maine has no death penalty, he is given two consecutive life sentences and sent to the notoriously harsh Shawshank Prison.")
                        .foregroundColor(.gray)
                }
                .padding(.horizontal, 16)
                
                // ✅ تقييم IMDb
                VStack(alignment: .leading, spacing: 4) {
                    Text("IMDb Rating")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("9.3 / 10")
                        .font(.title)
                        .foregroundColor(.yellow)
                }
                .padding(.horizontal, 16)

                Divider().background(Color.gray)
                
                // ✅ المخرج
                VStack(alignment: .leading, spacing: 8) {
                    Text("Director")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                    HStack {
                        Image("frankdarabont") // استبدل بصورة المخرج
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())

                        Text("Frank Darabont")
                            .foregroundColor(.white)
                    }
                }
                .padding(.horizontal, 16)
                
                // ✅ النجوم (الممثلين)
                VStack(alignment: .leading, spacing: 8) {
                    Text("Stars")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            actorView(imageName: "timrobbins", name: "Tim Robbins")
                            actorView(imageName: "morganfreeman", name: "Morgan Freeman")
                            actorView(imageName: "bobgunton", name: "Bob Gunton")
                        }
                    }
                }
                .padding(.horizontal, 16)

                Divider().background(Color.gray)

                // ✅ التقييمات والمراجعات
                VStack(alignment: .leading, spacing: 8) {
                    Text("Rating & Reviews")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                    Text("4.8")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.yellow)

                    Text("out of 5")
                        .foregroundColor(.gray)
                }
                .padding(.horizontal, 16)

                // ✅ عرض المراجعات
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        reviewCard(name: "Afnan Abdullah", rating: 4, comment: "This is an engagingly simple, good-hearted film, with just enough darkness around the edges to give contrast and relief to its glowingly human view of human nature.")
                        reviewCard(name: "User2", rating: 5, comment: "A tough, compassionate and ultimately rewarding movie.")
                    }
                }
                .padding(.horizontal, 16)

            }
            .padding(.top)
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .navigationBarHidden(true)
    }

    // ✅ صف بيانات الفيلم (مثل المدة واللغة)
    func movieDetailRow(title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
            Text(value)
                .foregroundColor(.white)
                .font(.body)
        }
    }

    // ✅ مكون الممثل
    func actorView(imageName: String, name: String) -> some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 70, height: 70)
                .clipShape(Circle())

            Text(name)
                .font(.caption)
                .foregroundColor(.white)
        }
    }

    // ✅ كرت التقييم والمراجعة
    func reviewCard(name: String, rating: Int, comment: String) -> some View {
        VStack(alignment: .leading) {
            HStack {
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

                Text(name)
                    .foregroundColor(.white)
                    .fontWeight(.bold)

                Spacer()
                
                Text("\(rating).0 ⭐️")
                    .foregroundColor(.yellow)
            }

            Text(comment)
                .foregroundColor(.gray)
                .font(.body)

            Text("Tuesday")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
        .frame(width: 300)
    }
}

// ✅ تشغيل التطبيق
struct MovieDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailScreen()
    }
}
