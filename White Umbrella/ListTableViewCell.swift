//
//  ListTableViewCell.swift
//  White Umbrella
//
//  Created by Александр Прайд on 18.05.2022.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    lazy var cellView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 7
        view.clipsToBounds = true
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        
        return view
    }()
    
    lazy var cityNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont(name: "Avenir", size: 18)
        
        return label
        
    }()
    
    lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont(name: "Avenir", size: 25)
        label.text = "+32"
        
        return label
    }()
    
    lazy var conditionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont(name: "Avenir", size: 15)
        label.text = "сегодня солнечно"
        return label
    }()
    
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "sun.min")
        imageView.tintColor = .black
        return imageView
    }()
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        setupUIElements()
        
        // Configure the view for the selected state
    }

}

extension ListTableViewCell {
    
    private func setupUIElements() {
        
        addSubview(cellView)
        cellView.addSubview(cityNameLabel)
        cellView.addSubview(temperatureLabel)
        cellView.addSubview(conditionLabel)
        cellView.addSubview(iconImageView)
        
        setupCellView()
        setupCityNameLabel()
        setupTemperatureLabel()
        setupConditionLabel()
        setupIconImageView()
        
    }
    
    private func setupCellView() {
        
        cellView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([

            cellView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5),
            cellView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            cellView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            cellView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 5),
            cellView.heightAnchor.constraint(equalToConstant: 90),
            cellView.widthAnchor.constraint(equalToConstant: 370)
        ])
    }
    
    private func setupCityNameLabel() {
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cityNameLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 10),
            cityNameLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 10),
            cityNameLabel.heightAnchor.constraint(equalToConstant: 21),
            cityNameLabel.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func setupTemperatureLabel() {
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            temperatureLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 10),
            temperatureLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -10),
            temperatureLabel.heightAnchor.constraint(equalToConstant: 50),
            temperatureLabel.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupConditionLabel() {
        conditionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            conditionLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -10),
            conditionLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -10),
            conditionLabel.heightAnchor.constraint(equalToConstant: 16),
            conditionLabel.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func setupIconImageView() {
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            iconImageView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 10),
            iconImageView.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -10),
            iconImageView.heightAnchor.constraint(equalToConstant: 40),
            iconImageView.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
}
