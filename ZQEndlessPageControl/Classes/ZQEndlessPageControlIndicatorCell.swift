import UIKit

final class ZQEndlessPageControlIndicatorCell: UICollectionViewCell, ZQEndlessPageControlIndicatorCellProtocol {
    private var configuration: ZQEndlessPageControlConfiguration?
    private var state: ZQEndlessPageControlIndicatorCellState = .medium
    
    private lazy var dotLayer: CAShapeLayer = {
        let dotSize = configuration?.dotSize ?? 10
        let dotLayer = CAShapeLayer()
        dotLayer.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        dotLayer.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)).cgPath
        dotLayer.fillColor = UIColor.clear.cgColor
        dotLayer.lineWidth = 1.0
        guard let dotBorderColor = configuration?.dotBorderColor else { return dotLayer }
        dotLayer.strokeColor = dotBorderColor.cgColor
        return dotLayer
    }()
    
    private lazy var indicatorImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.isHidden = true
        imgView.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        return imgView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
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
        self.configuration = configuration
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
        var scale: CGFloat = 1
        switch self.state {
            case .medium:
                scale = configuration?.unselectedScale ?? 0.6
                self.dotLayer.fillColor = (configuration?.unselectedDotColor ?? .lightGray).cgColor
                if let unselectedIndicatorImage = configuration?.unselectedIndicatorImage {
                    self.indicatorImageView.image = unselectedIndicatorImage
                }
            case .selected:
                scale = configuration?.selectedScale ?? 1.0
                self.dotLayer.fillColor = (configuration?.selectedDotColor ?? .darkGray).cgColor
                if let selectedIndicatorImage = configuration?.selectedIndicatorImage {
                    self.indicatorImageView.image = selectedIndicatorImage
                }
            case .small:
                scale = configuration?.smallScale ?? 0.4
                self.dotLayer.fillColor = (configuration?.unselectedDotColor ?? .lightGray).cgColor
                if let unselectedIndicatorImage = configuration?.unselectedIndicatorImage {
                    self.indicatorImageView.image = unselectedIndicatorImage
                }
        }
        if configuration?.selectedIndicatorImage != nil && configuration?.unselectedIndicatorImage != nil {
            self.indicatorImageView.isHidden = false
            self.dotLayer.isHidden = true
        } 
        self.dotLayer.transform = CATransform3DMakeScale(scale, scale, scale)
        self.indicatorImageView.transform = CGAffineTransform(scaleX: scale, y: scale);
    }
}
