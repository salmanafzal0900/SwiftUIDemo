import SwiftUI

struct CountdownTimerView: View {
    @State private var inputTime: String = ""
    @State private var remainingTime: Int = 0
    @State private var timerActive: Bool = false
    @State private var timer: Timer? = nil
    @FocusState private var isInputFocused: Bool
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Countdown Timer")
                .font(.largeTitle)
                .bold()
            
            HStack {
                TextField("Enter seconds", text: $inputTime)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 120)
                    .focused($isInputFocused)
                Button("Start") {
                    startTimer()
                }
                .disabled(timerActive || Int(inputTime) == nil || Int(inputTime) ?? 0 <= 0)
            }
            
            if timerActive {
                Text("Time Remaining: \(remainingTime)s")
                    .font(.title)
                    .foregroundColor(.blue)
            } else if remainingTime == 0 && (Int(inputTime) ?? 0) > 0 {
                Text("Countdown Complete!")
                    .font(.title2)
                    .foregroundColor(.green)
            }
            
            Spacer()
        }
        .padding()
        .onDisappear {
            timer?.invalidate()
        }
    }
    
    private func startTimer() {
        guard let seconds = Int(inputTime), seconds > 0 else { return }
        remainingTime = seconds
        timerActive = true
        isInputFocused = false
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { t in
            if remainingTime > 0 {
                remainingTime -= 1
            }
            if remainingTime == 0 {
                timerActive = false
                timer?.invalidate()
            }
        }
    }
}

struct CountdownTimerView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownTimerView()
    }
} 