import SwiftUI

struct ContentView: View {
    @State private var textArray: [TextModel] = []
    let targetText = "イラッ"  // 表示したい文字列
    let X = UIScreen.main.bounds.width / 2
    let Y = UIScreen.main.bounds.height
    
    var body: some View {
        ZStack {
            ForEach(textArray, id: \.id) { textModel in
                Text(textModel.text)
                    .font(.largeTitle)
                    .position(textModel.position)
            }
            
            Button(action: {
                let randomPosition = self.randomPosition()
                let randomTextModel = TextModel(text: targetText, position: randomPosition)
                textArray.append(randomTextModel)
            }) {
                Text("イラ")
                    .bold()
                    .padding()
                    .frame(width: 500, height: 500)
                    .foregroundColor(Color.black)
                    .background(Color.red)
                    .clipShape(Circle())
            }
            .position(x:X,y:Y)
        }
    }
    
    func randomPosition() -> CGPoint {
        let maxX = UIScreen.main.bounds.width
        let maxY = UIScreen.main.bounds.height - 200
        
        let randomX = CGFloat.random(in: 0...maxX)
        let randomY = CGFloat.random(in: 0...maxY)
        
        return CGPoint(x: randomX, y: randomY)
    }
}

struct TextModel: Identifiable {
    let id = UUID()
    let text: String
    let position: CGPoint
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
