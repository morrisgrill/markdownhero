import UIKit
import MarkdownHero

class Demo:UIViewController {
    private let hero = Hero()
    private weak var label:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addLabel()
        loadExample()
    }
    
    private func addLabel() {
        let label:UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        view.addSubview(label)
        self.label = label
        label.topAnchor.constraint(equalTo:view.topAnchor, constant:80).isActive = true
        label.leftAnchor.constraint(equalTo:view.leftAnchor, constant:20).isActive = true
        label.rightAnchor.constraint(equalTo:view.rightAnchor, constant:20).isActive = true
    }
    
    private func loadExample() {
        let url = Bundle(for:Demo.self).url(forResource:"Demo", withExtension:"md")!
        if let data = try? Data.init(contentsOf:url, options:.mappedRead) {
            let string = String(data:data, encoding:.utf8)!
            hero.parse(string:string) { [weak self] result in
                self?.label.attributedText = result
            }
        }
    }
}
