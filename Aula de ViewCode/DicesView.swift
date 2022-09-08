//
//  DicesView.swift
//  Aula de ViewCode
//
//  Created by Lucas Migge de Barros on 06/09/22.
//

import UIKit

class DicesView: UIView {
    
    // MARK: - Inicialização dos componentes
    let backgraoundView = UIImageView(image: UIImage(named: "background"))
    
    let logoView = UIImageView()
    let diceView = UIImageView()
    let playButton = UIButton(configuration: .filled())
    
    let logoContainer = UIView()
    let diceContainer = UIView()
    let playButtonContainer = UIView()
    
    let stackView = UIStackView()
    
    weak var delegate : DicesViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewsHierarchy()
        setupViewsAttributes()
        setupConstraints()
        setupAdditionalConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupViewsHierarchy(){
        
        //MARK: - Setup na hierarquia das views
        
        logoContainer.addSubview(logoView)
        diceContainer.addSubview(diceView)
        playButtonContainer.addSubview(playButton)
        
        
        //let stackView = UIStackView(arrangedSubviews: [logoContainer, diceContainer, playButtonContainer])
        stackView.addArrangedSubview(logoContainer)
        stackView.addArrangedSubview(diceContainer)
        stackView.addArrangedSubview(playButtonContainer)
        
        
        self.addSubview(backgraoundView)
        self.addSubview(stackView)
        
    }
    
    func setupViewsAttributes(){
        //MARK: - Configuração dos atributos dos componentes
        backgraoundView.contentMode = .scaleAspectFill
        
        logoView.image = UIImage(named: "logo-jogada")
        logoView.contentMode = .scaleAspectFit
        
        diceView.image = UIImage(named : "dice-1")
        diceView.contentMode = .scaleAspectFit
        
        //playButton.contentMode = .scaleAspectFit
        
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 32
        
        playButton.setTitle("Jogar!", for: .normal)
        playButton.setTitleColor(.label, for: .normal)
        playButton.tintColor = .systemOrange
        

       
        
        
        // cores para visualizar melhor os containers
//        logoContainer.backgroundColor = .systemPink
//        diceContainer.backgroundColor = .green
//        playButtonContainer.backgroundColor = .purple
    }
    
    
    func setupConstraints(){
        //MARK: - Configuração das constraints de auto layout
        backgraoundView.translatesAutoresizingMaskIntoConstraints = false
        
        // background
        NSLayoutConstraint.activate([
            backgraoundView.topAnchor.constraint(equalTo: topAnchor),
            backgraoundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgraoundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgraoundView.trailingAnchor.constraint(equalTo: trailingAnchor)
            
        ])

        //stackview
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
            
        ])
        
        //logo view
        logoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            //logoView.topAnchor.constraint(equalTo: logoContainer.topAnchor),
            logoView.centerYAnchor.constraint(equalTo: logoContainer.centerYAnchor),
            logoView.centerXAnchor.constraint(equalTo: logoContainer.centerXAnchor),
            logoView.bottomAnchor.constraint(equalTo: logoContainer.bottomAnchor),
            logoView.topAnchor.constraint(equalTo: logoContainer.topAnchor),
            
            // devido ao aspectFit, a imagem consegue ser redimensionada apenas como os paramentros anteriores
            // logoView.trailingAnchor.constraint(equalTo: logoContainer.trailingAnchor),
            // logoView.leadingAnchor.constraint(equalTo: logoContainer.leadingAnchor),
        
        ])
        
        //diceView
        diceView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            diceView.centerXAnchor.constraint(equalTo: diceContainer.centerXAnchor),
            diceView.centerYAnchor.constraint(equalTo: diceContainer.centerYAnchor),
            diceView.topAnchor.constraint(equalTo: diceContainer.topAnchor),
            diceView.bottomAnchor.constraint(equalTo: diceContainer.bottomAnchor)
            
        ])

        //playbutton
        playButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            playButton.centerXAnchor.constraint(equalTo: playButtonContainer.centerXAnchor),
            playButton.centerYAnchor.constraint(equalTo: playButtonContainer.centerYAnchor),
            playButton.trailingAnchor.constraint(equalTo: playButtonContainer.trailingAnchor, constant: -16),
            playButton.heightAnchor.constraint(equalToConstant: 60)
            //playButton.bottomAnchor.constraint(equalTo: playButtonContainer.)
        ])
        
    }
    
    func setupAdditionalConfiguration(){
        playButton.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        
    }
    
    @objc func tappedButton(sender: UIButton) {
//        let randomNumber = Int.random(in: 0...5)
//        diceView.image = collectionDice[randomNumber]
        print("Apertou botão")
        delegate?.rollDices()
        
    }
    
    
    func updateDiceImage(diceImage : UIImage){
        diceView.image = diceImage
    }
    
}




// MARK: - Preview
#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct View_Preview: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        Group {
            DicesView().showPreview().previewDevice("iPhone SE (3rd generation)")
            ViewController().showPreview().previewDevice("iPhone SE (3rd generation)").previewInterfaceOrientation(.landscapeRight)
        
        }
    }
}
#endif


