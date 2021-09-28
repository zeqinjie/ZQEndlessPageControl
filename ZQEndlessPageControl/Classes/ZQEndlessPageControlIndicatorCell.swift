import UIKit

final class ZQEndlessPageControlIndicatorCell: UICollectionViewCell, ZQEndlessPageControlIndicatorCellProtocol {
    private var configuration: ZQEndlessPageControlConfiguration?
    private var state: ZQEndlessPageControlIndicatorCellState = .medium
    
    private lazy var dotLayer: CAShapeLayer = {
        let dotLayer = CAShapeLayer()
        let allBorderWidth = (configuration?.dotBorderWidth ?? 0) * 2
        dotLayer.frame = CGRect(x: 0, y: 0, width: self.bounds.width - allBorderWidth, height: self.bounds.height - allBorderWidth)
        dotLayer.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: self.bounds.width - allBorderWidth, height: self.bounds.height - allBorderWidth)).cgPath
        dotLayer.fillColor = UIColor.clear.cgColor
        if let dotBorderWidth = configuration?.dotBorderWidth {
            dotLayer.lineWidth = dotBorderWidth
            if let dotBorderColor = configuration?.dotBorderColor {
                dotLayer.strokeColor = dotBorderColor.cgColor
            }
        }
        return dotLayer
    }()
    
    private lazy var indicatorImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.isHidden = true
        imgView.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        return imgView
    }()
    
    override var reuseIdentifier: String? {
        return ZQEndlessPageControlConstants.indicatorCellReuseIdentifier
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        dotLayer.position = contentView.center
    }
    
    // MARK: - ZQEndlessPageControlIndicatorCellProtocol
    override var isSelected: Bool {
        didSet {
            let newState: ZQEndlessPageControlIndicatorCellState = isSelected ? .selected : .medium
            update(state: newState)
        }
    }
    
    func set(configuration: ZQEndlessPageControlConfiguration) {
        if self.configuration == nil {
            self.configuration = configuration
            setup()
        }
    }
    
    func update(state: ZQEndlessPageControlIndicatorCellState, animated: Bool = true) {
        self.state = state
        if animated {
            updateDotLayer(for: self.state)
        } else {
            CALayer.endless_performWithoutAnimation {
                updateDotLayer(for: self.state)
            }
        }
    }
}

extension ZQEndlessPageControlIndicatorCell {
    private func setup() {
        isUserInteractionEnabled = false
        backgroundColor = .clear
        layer.addSublayer(dotLayer)
        update(state: .medium)
        contentView.addSubview(indicatorImageView)
    }
        
    private func updateDotLayer(for state: ZQEndlessPageControlIndicatorCellState) {
        
        guard let configuration = configuration else { return  }
        var scale: CGFloat = 1
        switch self.state {
            case .medium:
                scale = configuration.unselectedScale
                self.dotLayer.fillColor = (configuration.unselectedDotColor).cgColor
                if let unselectedIndicatorImage = configuration.unselectedIndicatorImage {
                    self.indicatorImageView.image = unselectedIndicatorImage
                }
            case .selected:
                scale = configuration.selectedScale
                self.dotLayer.fillColor = (configuration.selectedDotColor).cgColor
                if let selectedIndicatorImage = configuration.selectedIndicatorImage {
                    self.indicatorImageView.image = selectedIndicatorImage
                }
            case .small:
                scale = configuration.smallScale
                self.dotLayer.fillColor = (configuration.unselectedDotColor).cgColor
                if let unselectedIndicatorImage = configuration.unselectedIndicatorImage {
                    self.indicatorImageView.image = unselectedIndicatorImage
                }
        }
        if configuration.selectedIndicatorImage != nil && configuration.unselectedIndicatorImage != nil {
            self.indicatorImageView.isHidden = false
            self.dotLayer.isHidden = true
        }

        self.dotLayer.transform = CATransform3DMakeScale(scale, scale, scale)
        self.indicatorImageView.transform = CGAffineTransform(scaleX: scale, y: scale);
        
    }
}
