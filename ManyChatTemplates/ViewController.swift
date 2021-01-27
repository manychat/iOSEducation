import UIKit

class ViewController: UIViewController {
    let content: UIView = UIView()
    let label: UILabel = UILabel()
    let text: UILabel = UILabel()
    let button = UIButton()
    let footer: UITextView = UITextView()
    let logo = UIImage(named: "logo")
    
	override func viewDidLoad() {
		super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let logoIv = UIImageView(image: logo)
        
        view.addSubview(label)
        view.addSubview(text)
        view.addSubview(logoIv)
        view.addSubview(footer)
        view.addSubview(button)
        
        label.text = "ManyChat Template Store"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 40)
        [
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            label.bottomAnchor.constraint(equalTo: view.centerYAnchor)
        ].forEach { constraint in
            constraint.isActive = true
        }
        
        text.text = "Welcome to ManyChat Template store! Get your chatbot up and running instantly by choosing a template that fits your industry. See what’s inside by clicking “show more” and trying a live demo."
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textAlignment = .left
        text.lineBreakMode = .byWordWrapping
        text.numberOfLines = 0
        text.font = .systemFont(ofSize: 17)
        text.textColor = .gray
        [
            text.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            text.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            text.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 12)
        ].forEach { constraint in
            constraint.isActive = true
        }
        
        logoIv.translatesAutoresizingMaskIntoConstraints = false
        [
            logoIv.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            logoIv.bottomAnchor.constraint(equalTo: label.topAnchor, constant: -16)
        ].forEach { constraint in
            constraint.isActive = true
        }

        button.setTitle("Choose Template", for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 12
        [
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -106),
            button.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -150)
        ].forEach { constraint in
            constraint.isActive = true
        }
        
        let linkString = "Terms & Privacy Policy"
        let lintAttributeString = NSMutableAttributedString(string: linkString)
        lintAttributeString.addAttribute(.link, value: "https://manychat.com", range: NSRange(location: 0, length: linkString.count))
        let footerString = "By choosing in here, you agree to our"
        let divider = NSMutableAttributedString(string: "\n")
        let footerAttributeString = NSMutableAttributedString(string: footerString)
        footerAttributeString.append(divider)
        footerAttributeString.append(lintAttributeString)
        footer.attributedText = footerAttributeString
        footer.translatesAutoresizingMaskIntoConstraints = false
        footer.textAlignment = .center
        footer.isScrollEnabled = false
        footer.isEditable = false
        footer.font = .systemFont(ofSize: 15)
        footer.linkTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.gray]
        [
            footer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            footer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            footer.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 10)
        ].forEach { constraint in
            constraint.isActive = true
        } 
	}
}
