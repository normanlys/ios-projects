import UIKit

func test() {
    var tmp: String? = nil
    
    if let a = tmp {
        print(a)
    } else {
        print("a is nil")
    }
    
    guard let a = tmp else {
        print("a is nil")
        return
    }
    print(a)
    return
}

test()
