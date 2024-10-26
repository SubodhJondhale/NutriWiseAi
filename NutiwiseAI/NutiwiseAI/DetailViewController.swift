
import UIKit

class DetailViewController: UIViewController {
    var passedString: String? {
        didSet {
            textView.text = passedString ?? "No content available." // Set default text if nil
        }
    }
    
    let dismissButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Dismiss", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.systemBlue
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let textView: UITextView = {
        let tv = UITextView()
        tv.font = UIFont.systemFont(ofSize: 20)
        tv.textColor = .black
        tv.isEditable = false
        tv.backgroundColor = UIColor(white: 0.95, alpha: 1)
        tv.layer.cornerRadius = 8
        tv.layer.masksToBounds = true
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupUI()
        
        // Check and log passedString value
        if let content = passedString {
            print("Received content: \(content)")
        } else {
            print("No content was passed.")
        }
    }
    
    private func setupUI() {
        view.addSubview(textView)
        view.addSubview(dismissButton)
        
        // Constraints for the text view
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60) // Adjust to leave space for button
        ])

        // Constraints for the dismiss button
        NSLayoutConstraint.activate([
            dismissButton.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 10),
            dismissButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            dismissButton.heightAnchor.constraint(equalToConstant: 44),
            dismissButton.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        dismissButton.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
    }
    
    @objc func dismissViewController() {
        dismiss(animated: true, completion: nil)
    }
}
