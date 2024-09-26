import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var ship: NSImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // 改為在 viewDidAppear 中呼叫 makeFirstResponder
    override func viewDidAppear() {
        super.viewDidAppear()
        self.view.window?.makeFirstResponder(self)
    }

    override var acceptsFirstResponder: Bool {
        return true
    }

    // 處理鍵盤事件
    override func keyDown(with event: NSEvent) {
        switch event.keyCode {
        case 123: // 左方向鍵
            moveShip(x: -10, y: 0)
            print("按下  左")
        case 124: // 右方向鍵
            moveShip(x: 10, y: 0)
            print("按下  右")
        case 125: // 下方向鍵
            moveShip(x: 0, y: -10)
            print("按下  下")
        case 126: // 上方向鍵
            moveShip(x: 0, y: 10)
            print("按下  上")
        default:
            break
        }
    }

    // 移動 ship 的方法
    func moveShip(x: CGFloat, y: CGFloat) {
        guard let ship = ship else { return }

        // 獲取當前船的frame
        var newFrame = ship.frame

        // 計算新的位置
        newFrame.origin.x += x
        newFrame.origin.y += y

        // 確保不會超出邊界（假設視圖邊界）
        let parentBounds = view.bounds
        if newFrame.origin.x < 0 { newFrame.origin.x = 0 }
        if newFrame.origin.y < 0 { newFrame.origin.y = 0 }
        if newFrame.maxX > parentBounds.width { newFrame.origin.x = parentBounds.width - newFrame.width }
        if newFrame.maxY > parentBounds.height { newFrame.origin.y = parentBounds.height - newFrame.height }

        // 更新船的位置
        ship.frame = newFrame
    }

}
