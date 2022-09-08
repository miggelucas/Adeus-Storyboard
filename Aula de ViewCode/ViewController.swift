//
//  ViewController.swift
//  Aula de ViewCode
//
//  Created by Lucas Migge de Barros on 05/09/22.
//

import UIKit

class ViewController: UIViewController {

    
    let diceView = DicesView()
    
    let collectionDice = [UIImage(named: "dice-1"),
                          UIImage(named: "dice-2"),
                          UIImage(named: "dice-3"),
                          UIImage(named: "dice-4"),
                          UIImage(named: "dice-5"),
                          UIImage(named: "dice-6")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view = diceView
        diceView.delegate = self

    }

}


extension ViewController : DicesViewDelegate {
    func rollDices() {
        let randomNumber = Int.random(in: 0...collectionDice.count - 1)
        diceView.updateDiceImage(diceImage: collectionDice[randomNumber]!)
    }


}


// MARK: - Preview
#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct ViewController_Preview: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        Group {
            ViewController().showPreview().previewDevice("iPhone SE (3rd generation)")
            ViewController().showPreview().previewDevice("iPhone SE (3rd generation)").previewInterfaceOrientation(.landscapeRight)
        }
    }
}
#endif


