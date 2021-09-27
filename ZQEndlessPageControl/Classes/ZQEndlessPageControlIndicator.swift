import UIKit

public final class ZQEndlessPageControlIndicator: UIView, ZQEndlessPageControlIndicatorProtocol {
    
    // MARK: - Private Method
    private var configuration: ZQEndlessPageControlConfiguration?
    private lazy var collectionView: UICollectionView = {
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = .zero
        collectionView.backgroundColor = .clear
        collectionView.allowsMultipleSelection = false
        (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.scrollDirection = .horizontal
        collectionView.register(ZQEndlessPageControlIndicatorCell.self, forCellWithReuseIdentifier: ZQEndlessPageControlConstants.indicatorCellReuseIdentifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isUserInteractionEnabled = false
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    // MARK: - Public Method
    /// 代理
    weak public var delegate: ZQEndlessPageControlIndicatorDelegate? {
        didSet {
            guard let cellClass = delegate?.registerCell() else { return }
            collectionView.register(cellClass, forCellWithReuseIdentifier: ZQEndlessPageControlConstants.indicatorCellReuseIdentifier)
        }
    }
    
    public var selectedIndex = 0 {
        didSet {
            updateIndicator(for: selectedIndex)
        }
    }
    
    public func setup(configuration: ZQEndlessPageControlConfiguration) {
        self.configuration = configuration
        setupConstraints()
        setupInitialSelection()
        updateCells()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.collectionViewLayout.invalidateLayout()
    }
}

extension ZQEndlessPageControlIndicator {
    private func setupConstraints() {
        guard let configuration = self.configuration else { return }
        addSubview(collectionView)
        collectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        let spacing = CGFloat(configuration.maxNumberOfDots.rawValue - 1) * configuration.spacing
        let widthOfItem = configuration.dotSize
        let heightOfItem = configuration.dotSize
        heightAnchor.constraint(equalToConstant: heightOfItem).isActive = true
        widthAnchor.constraint(equalToConstant: CGFloat(configuration.maxNumberOfDots.rawValue) * widthOfItem + spacing).isActive = true
        setNeedsLayout()
        layoutIfNeeded()
    }
    
    private func setupInitialSelection() {
        let selectedIndexPath = IndexPath(row: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: .centeredHorizontally)
    }
}

extension ZQEndlessPageControlIndicator: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return configuration?.numberOfDots ?? 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ZQEndlessPageControlConstants.indicatorCellReuseIdentifier, for: indexPath)
        if let EndlessPageControlIndicatorCell = cell as? ZQEndlessPageControlIndicatorCellProtocol, let configuration = configuration {
            EndlessPageControlIndicatorCell.set(configuration: configuration)
        }
        return cell
    }
}

extension ZQEndlessPageControlIndicator: UIScrollViewDelegate {
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateCells()
    }
}

extension ZQEndlessPageControlIndicator: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: configuration?.dotSize ?? 0, height: collectionView.frame.height)
    }
    
    public func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        (cell as? ZQEndlessPageControlIndicatorCellProtocol)?.update(state: .small, animated: false)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return configuration?.spacing ?? 0
    }
}

extension ZQEndlessPageControlIndicator {
    private func updateIndicator(for selectedIndex: Int) {
        guard let configuration = configuration else { return }
        
        guard selectedIndex >= 0 else { return }
        
        guard selectedIndex < configuration.numberOfDots else { return }
        
        let selectedIndexPath = IndexPath(row: selectedIndex, section: 0)
        self.collectionView.selectItem(at: selectedIndexPath, animated: true, scrollPosition: .centeredHorizontally)
    }
    
    private func updateCells() {
        guard let configuration = configuration else {
            return
        }
        
        let cellAndPaths = collectionView.endless_getAllVisibleCellsAndPaths()
        
        for (index, cellAndPath) in cellAndPaths.enumerated() {
            // 更新下标
            if cellAndPath.indexPath.row == selectedIndex {
                cellAndPath.cell.update(state: .selected, animated: true)
            } else if cellAndPath.indexPath.row == 0 || cellAndPath.indexPath.row == configuration.numberOfDots - 1 {
                cellAndPath.cell.update(state: .unselected, animated: true)
            } else if index == 0 || index == cellAndPaths.count - 1 {
                cellAndPath.cell.update(state: .small, animated: true)
            } else {
                cellAndPath.cell.update(state: .unselected, animated: true)
            }
        }
    }
}
