import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var ship: NSImageView!
    
    // 移動步長常量
    private let moveDistance: CGFloat = 10

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 檢查 ship outlet 是否正確連接
        if ship == nil {
            print("警告：ship outlet 未連接")
        } else {
            print("ship outlet 已正確連接")
        }
        
        // 設置初始位置（如果需要）
        ship?.frame = CGRect(x: 100, y: 100, width: 50, height: 50)
        
        // 確保 ship 在最上層
        if let ship = ship {
            // 從當前父視圖中移除
            ship.removeFromSuperview()
            // 將 ship 添加到視圖的最上層
            view.addSubview(ship, positioned: .above, relativeTo: nil)
        }
        
        print("視圖已加載，ship 初始位置：\(String(describing: ship?.frame))")
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        self.view.window?.makeFirstResponder(self)
        print("視圖已出現，準備接收鍵盤事件")
    }

    override var acceptsFirstResponder: Bool {
        return true
    }

    override func keyDown(with event: NSEvent) {
        switch event.keyCode {
        case 123: // 左方向鍵
            moveShip(x: -moveDistance, y: 0)
            print("按下左方向鍵")
        case 124: // 右方向鍵
            moveShip(x: moveDistance, y: 0)
            print("按下右方向鍵")
        case 125: // 下方向鍵
            moveShip(x: 0, y: -moveDistance)
            print("按下下方向鍵")
        case 126: // 上方向鍵
            moveShip(x: 0, y: moveDistance)
            print("按下上方向鍵")
        default:
            print("按下其他鍵，keyCode: \(event.keyCode)")
        }
    }

    func moveShip(x: CGFloat, y: CGFloat) {
        guard let ship = ship else {
            print("錯誤：ship 是 nil")
            return
        }

        var newFrame = ship.frame
        newFrame.origin.x += x
        newFrame.origin.y += y

        let parentBounds = view.bounds
        if newFrame.origin.x < 0 { newFrame.origin.x = 0 }
        if newFrame.origin.y < 0 { newFrame.origin.y = 0 }
        if newFrame.maxX > parentBounds.width { newFrame.origin.x = parentBounds.width - newFrame.width }
        if newFrame.maxY > parentBounds.height { newFrame.origin.y = parentBounds.height - newFrame.height }

        ship.frame = newFrame
        print("船隻新位置：\(newFrame)")
        
        // 檢查 ship 是否可見
        if !view.bounds.intersects(ship.frame) {
            print("警告：ship 可能不在可見區域內")
        }
    }
}
