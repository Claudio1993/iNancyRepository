//
//  TestView.swift
//  iNancy WatchKit Extension
//
//  Created by Simone Punzo on 21/01/2020.
//  Copyright © 2020 Massimo Maddaluno. All rights reserved.
//

import SwiftUI

struct ExerciseChosenView: View {
    @State private var timerItem : Timer?
    @State var progressBarValue:CGFloat = 0
    var exercise: Exercise
    
    var body: some View {
        VStack {
            ProgressionBarView(value: $progressBarValue, exerciseImageName: exercise.imageName)
            }
        .navigationBarTitle(Text("Exercises")).navigationBarHidden(false)
        .onAppear() {
            self.timerItem=Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                self.progressBarValue += 
                    CGFloat( 0.1/(Double(self.exercise.duration))) // (0.01) 1/(10*durata), esempio: 180 secondi è: self.progressBarValue += (0.00055556)
                if (self.progressBarValue >= 1.0) {
                    WKInterfaceDevice.current().play(.success)
                    timer.invalidate()
                    
                }
            }
        }
        .onDisappear(){
            self.timerItem?.invalidate()
        }
        
        
    
    
    
        
    }
}

#if DEBUG
struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseChosenView(exercise: exerciseList[1])
    }
}
#endif
