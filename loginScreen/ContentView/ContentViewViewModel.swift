import Foundation
import Combine

final class ContentViewViewModel: ObservableObject {
    //  Свойство, позволяющее сообщать об изменении объекта
    let objectWillChange = ObservableObjectPublisher()
    var counter = 3
    
    private var timer: Timer?
    
    func startTimer() {
        //  ScheduledTimer - функция, которая позволяет установить расписание для таймера
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(updateCounter),
            userInfo: nil,
            repeats: true
        )
    }
    //  @objc перед названием функции, потому что #selector  - API из Objective-C
    @objc private func updateCounter() {
        if counter > 0 {
            counter -= 1
        } else {
            killTimer()
        }
        //  Отправляем сообщение о том, что наш класс изменился (свойство counter обновилось)
        objectWillChange.send()
    }
    //  Недостаточно timer'у присвоить nil - нужно сам timer выгрузить из системы (инвалидировать)
    private func killTimer() {
        timer?.invalidate()
        timer = nil
    }
}
