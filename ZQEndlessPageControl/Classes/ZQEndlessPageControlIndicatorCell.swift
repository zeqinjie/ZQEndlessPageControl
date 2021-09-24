import UIKit

final class ZQEndlessPageControlIndicatorCell: UICollectionViewCell, ZQEndlessPageControlIndicatorCellProtocol {
    private var configuration: ZQEndlessPageControlConfiguration?
    private var state: ZQEndlessPageControlIndicatorCellState = .unselected
    
    func set(configuration: ZQEndlessPageControlConfiguration) {
        self.configuration = configuration
    }
    
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
    
    override var isSelected: Bool {
        didSet {
            let newState: ZQEndlessPageControlIndicatorCellState = isSelected ? .selected : .unselected
            update(state: newState)
        }
    }

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
}

extension ZQEndlessPageControlIndicatorCell {
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
        update(state: .unselected)
    }
        
    private func updateDotLayer(for state: ZQEndlessPageControlIndicatorCellState) {
        var scale: CGFloat = 1
        switch self.state {
            case .unselected:
                scale = configuration?.unselectedScale ?? 0.6
                self.dotLayer.fillColor = (configuration?.unselectedDotColor ?? .lightGray).cgColor
            case .selected:
                scale = configuration?.selectedScale ?? 1.0
                self.dotLayer.fillColor = (configuration?.selectedDotColor ?? .darkGray).cgColor
            case .small:
                scale = configuration?.smallScale ?? 0.4
                self.dotLayer.fillColor = (configuration?.unselectedDotColor ?? .lightGray).cgColor
        }
        self.dotLayer.transform = CATransform3DMakeScale(scale, scale, scale)
    }
}
