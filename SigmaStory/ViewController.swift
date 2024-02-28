//
//  ViewController.swift
//  SigmaStory
//
//  Created by Nessie Reema S on 27/2/24.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var collectionView: UICollectionView!
        let images = ["book1", "book2", "book3", "book4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "storyBackground")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        let overlay = UIView(frame: self.view.bounds)
        overlay.backgroundColor = UIColor.white.withAlphaComponent(0.6)
        self.view.addSubview(overlay)
        self.view.insertSubview(overlay, aboveSubview: backgroundImage)
        
        setupCarouselView()
    }
    
    func setupCarouselView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: view.frame.size.width, height: view.frame.size.height)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
       
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CarouselCell.self, forCellWithReuseIdentifier: "CarouselCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor.clear
       
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
       
        NSLayoutConstraint.activate([
           collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
           collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
           collectionView.topAnchor.constraint(equalTo: view.topAnchor),
           collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
       ])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarouselCell", for: indexPath) as? CarouselCell else {
            fatalError("Unable to dequeue CarouselCell")
        }
        
        cell.imageView.image = UIImage(named: images[indexPath.item])
        cell.button.tag = indexPath.item // Set the tag to identify the button
        cell.button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        return cell
        
    }

    @objc func buttonTapped(sender: UIButton) {
        print("Button in carousel at index \(sender.tag) tapped.")
    }
    
}

class CarouselCell: UICollectionViewCell {
    
    let imageView = UIImageView()
    let button = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        self.backgroundColor = UIColor.clear
        contentView.backgroundColor = UIColor.clear
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
        contentView.addSubview(imageView)
        
        button.setTitle("Read Story", for: .normal)
        button.backgroundColor = UIColor.darkGray
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(button)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            button.heightAnchor.constraint(equalToConstant: 50),
            button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 60),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -60),
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40)
        ])
    }
}
