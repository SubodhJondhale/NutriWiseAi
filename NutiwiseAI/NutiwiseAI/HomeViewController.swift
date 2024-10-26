//
//  HomeViewController.swift
//  NutiwiseAI
//
//  Created by GOQii-Subodh on 25/10/24.
//

import UIKit

class HomeViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    let cameraButton = UIButton(type: .system)
    let galleryButton = UIButton(type: .system)
    let activityIndicator = UIActivityIndicatorView(style: .large)
    let DescriptionLabel = UILabel()
    let stackView = UIStackView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        animateElements()
    }

    func setupUI() {
        view.backgroundColor = UIColor(named: "BackgroundColor") ?? UIColor.systemGray6
        
        // Logo/Title Label
        let titleLabel = UILabel()
        titleLabel.text = "NutriWise AI"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 40)
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor(named: "TitleColor") ?? UIColor.purple
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        let imageView = UIImageView()
               imageView.image = UIImage(named: "7990279")  // Replace "yourImageName" with the name of your image in assets
               imageView.contentMode = .scaleAspectFit
               imageView.translatesAutoresizingMaskIntoConstraints = false
               view.addSubview(imageView)


        
        // Description Label
        
       //DescriptionLabel.text = "NutriWise AI helps you"
        DescriptionLabel.font = UIFont.boldSystemFont(ofSize: 22)
        DescriptionLabel.textColor = UIColor(named: "TitleColor") ?? UIColor.purple
        DescriptionLabel.alpha = 0.5
        DescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        DescriptionLabel.numberOfLines = 0 // Allows unlimited lines
        DescriptionLabel.lineBreakMode = .byWordWrapping
           view.addSubview(DescriptionLabel)
           
           // Create a Stack View for the bullet points
       
            DescriptionLabel.text = "NutriWise AI helps you"
          
            stackView.axis = .vertical
            stackView.alignment = .leading
            stackView.spacing = 8
            stackView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(stackView)
            
            // List items
            let listItems = [
                "Scan ingredients instantly.",
                "AI analysis based on health standards.",
                "Understand nutritional food content.",
                "Cheak unhealthy harmful ingresdients.",
                "Is product safe to consume ??",
                
            ]
            
            // Create a label for each list item with a bold bullet
            for item in listItems {
                let listItemLabel = UILabel()
                let bulletPoint = "\u{2022}  " // Bold bullet with space
                let attributedText = NSMutableAttributedString(string: bulletPoint, attributes: [.font: UIFont.boldSystemFont(ofSize: 15)])
                attributedText.append(NSAttributedString(string: item, attributes: [.font: UIFont.systemFont(ofSize: 18)]))
                listItemLabel.attributedText = attributedText
                listItemLabel.textColor = UIColor.darkGray
                stackView.addArrangedSubview(listItemLabel)
            }
            NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: DescriptionLabel.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)])
            
     
    
           
           // Constraints
         
        
        // Camera Button
        cameraButton.setTitle("Scan with Camera", for: .normal)
        cameraButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        cameraButton.backgroundColor = UIColor.systemBlue
        cameraButton.tintColor = .white
        cameraButton.layer.cornerRadius = 20
        cameraButton.layer.shadowColor = UIColor.black.cgColor
        cameraButton.layer.shadowRadius = 8
        cameraButton.layer.shadowOpacity = 0.3
        cameraButton.layer.shadowOffset = CGSize(width: 0, height: 5)
        cameraButton.translatesAutoresizingMaskIntoConstraints = false
        cameraButton.addTarget(self, action: #selector(openCamera), for: .touchUpInside)
        view.addSubview(cameraButton)
        
        // Gallery Button
        galleryButton.setTitle("Upload from Gallery", for: .normal)
        galleryButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        galleryButton.backgroundColor = UIColor.systemGreen
        galleryButton.tintColor = .white
        galleryButton.layer.cornerRadius = 20
        galleryButton.layer.shadowColor = UIColor.black.cgColor
        galleryButton.layer.shadowRadius = 8
        galleryButton.layer.shadowOpacity = 0.3
        galleryButton.layer.shadowOffset = CGSize(width: 0, height: 5)
        galleryButton.translatesAutoresizingMaskIntoConstraints = false
        galleryButton.addTarget(self, action: #selector(openGallery), for: .touchUpInside)
        view.addSubview(galleryButton)
       
        // Constraints
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            //imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 350),  // Set the desired width
            imageView.heightAnchor.constraint(equalToConstant: 300),  // Set the desired height
            DescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            DescriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
          
            cameraButton.topAnchor.constraint(equalTo: DescriptionLabel.bottomAnchor, constant: 200),
              
            cameraButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            cameraButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            cameraButton.heightAnchor.constraint(equalToConstant: 50),

            galleryButton.topAnchor.constraint(equalTo: cameraButton.bottomAnchor, constant: 15),
            galleryButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            galleryButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            galleryButton.heightAnchor.constraint(equalToConstant: 50),
        ])
        // Set up the activity indicator properties
    
                activityIndicator.color = UIColor.systemBlue
                activityIndicator.translatesAutoresizingMaskIntoConstraints = false
                activityIndicator.hidesWhenStopped = true
                view.addSubview(activityIndicator)
                
                // Set up constraints to center it on the screen
                NSLayoutConstraint.activate([
                    activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
                ])

    }

    // Animating the elements when the screen loads
    func animateElements() {
        for subview in view.subviews {
            subview.transform = CGAffineTransform(translationX: 0, y: 100)
            subview.alpha = 0
        }

        UIView.animate(withDuration: 1.0, delay: 0.2, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            for subview in self.view.subviews {
                subview.transform = .identity
                subview.alpha = 1
            }
        }, completion: nil)
    }

    // Action Methods
    @objc func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = true
            present(imagePicker, animated: true, completion: nil)
        } else {
            print("Camera not available")
        }
    }

    @objc func openGallery() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            present(imagePicker, animated: true, completion: nil)
        } else {
            print("Gallery not available")
        }
    }
    
    // UIImagePickerControllerDelegate Methods
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        if let editedImage = info[.editedImage] as? UIImage {
            // Handle the edited image here
            uploadImage(editedImage)
            print("editedImage \(editedImage )" )
        } else if let originalImage = info[.originalImage] as? UIImage {
            // Handle the original image here
            print("originalImage \(originalImage )" )
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
        func uploadImage(_ image: UIImage) {
            activityIndicator.startAnimating()
            self.activityIndicator.isHidden = false
                DispatchQueue.global(qos: .background).async {
                    // Background work
    
                    let urlString = "https://apiv7.goqii.com/user/upload_endoded_image"
                    guard let url = URL(string: urlString) else {
                        print("Invalid URL string")
                        return
                    }
    
                    var request = URLRequest(url: url)
                    request.httpMethod = "POST"
    
                    let boundary = "---------------------------14737809831466499882746641449"
                    request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
    
                    var body = Data()
                    body.append("--\(boundary)\r\n".data(using: .utf8)!)
                    body.append("Content-Disposition: form-data; name=\"image\"; filename=\"image.jpg\"\r\n".data(using: .utf8)!)
                    body.append("Content-Type: application/octet-stream\r\n\r\n".data(using: .utf8)!)
                    if let imageData = image.jpegData(compressionQuality: 1.0) {
                        body.append(imageData)
                    }
                    body.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
                    request.httpBody = body
    
                    let task = URLSession.shared.dataTask(with: request) { data, response, error in
                        // Handle response
    
                        guard error == nil, let data = data else {
                            print("Error uploading image: \(String(describing: error))")
                            return
                        }
    
                        do {
                            if let results = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? [String: Any],
                               let code = results["code"] as? Int, code == 200,
                               let serverImageURL = (results["data"] as? [String: Any])?["image"] as? String {
                                self.getContentOfImageLlama(serverImageURL)
//                                self.generateContentVartex(withMessage:"Analyse all the ingrediets of the product in image and give detail info if there are any ingredients present in the product which are harmful for health and their percentage.Also suggest whether a person should consume that product or not.Give responce in well presnted and organised structure.", imageURL: serverImageURL)
                                DispatchQueue.main.async {
                                    // Main thread work (UI updates)
                                    print("Server Image URL: \(serverImageURL)")
                                }
                            } else {
                                print("Invalid response data or code")
                            }
                        } catch {
                            print("Error parsing JSON: \(error)")
                        }
                    }
                    task.resume()
                }
    
        }
    
    func getContentOfImageLlama(_ imageUrl:String){
           
        let parameters = """
        {
            "model": "meta-llama/Llama-3.2-11B-Vision-Instruct",
            "messages": [
                {
                    "role": "user",
                    "content": [
                        {
                            "type": "text",
                            "text": "Analyse all the ingrediets of the product in image and give detail info if there are any ingredients present in the product which are harmful for health and their percentage.Also suggest whether a person should consume that product or not.Give responce in well presnted and organised structure."
                        },
                        {
                            "type": "image_url",
                            "image_url": {
                                "url": "\(imageUrl)"
                            }
                        }
                    ]
                }
            ]
        }
        """
    
        print("parameters = \(parameters)")
        
            sendRequestAndDisplayResult(parameters)
        }
//        func generateContentVartex(withMessage message: String, imageURL: String) {
//            activityIndicator.startAnimating()
//         self.activityIndicator.isHidden = false
//            let parameters: [String: Any] = [
//                "message": message,
//                "image1": [
//                    "inlineData": [
//                        "mimeType": "image/jpeg",
//                        "data": imageURL
//                    ]
//                ]
//            ]
//    
//            guard let postData = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
//                print("Error: Unable to serialize JSON")
//                return
//            }
//    
//            var request = URLRequest(url: URL(string: "http://34.93.150.135:3004/generate-content")!, timeoutInterval: .infinity)
//            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//            request.httpMethod = "POST"
//            request.httpBody = postData
//    
//            let task = URLSession.shared.dataTask(with: request) { data, response, error in
//                guard let data = data, error == nil else {
//                    print("Error: \(String(describing: error))")
//                    return
//                }
//    
//                if let responseString = String(data: data, encoding: .utf8) {
//                    print("Response: \(responseString)")
//                    self.activityIndicator.stopAnimating()
//                    self.activityIndicator.isHidden = true
//                       
//                    DispatchQueue.main.async {
//                        let detailVC = DetailViewController()
//                        detailVC.passedString = responseString  // Pass the string
//                        detailVC.modalPresentationStyle = .fullScreen // or .overFullScreen for a different effect
//                        self.present(detailVC, animated: true, completion: nil)
//                    }
//                } else {
//                    print("Error: Unable to decode response")
//                }
//            }
//            task.resume()
//        }
    
    //}
        func sendRequestAndDisplayResult(_ tempParameters:String) {
            // Start the activity indicator before making the request
            activityIndicator.startAnimating()
            self.activityIndicator.isHidden = false
    
            let parameters = tempParameters
            let postData = parameters.data(using: .utf8)
    
            var request = URLRequest(url: URL(string: "http://34.28.28.107:30000/v1/chat/completions")!, timeoutInterval: Double.infinity)
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"
            request.httpBody = postData
    
            let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
                guard let self = self else { return }
    
                DispatchQueue.main.async {
                     //Stop activity indicator
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.isHidden = true
    
                    if let error = error {
                        self.DescriptionLabel.text = "Error: \(error.localizedDescription)"
                        return
                    }
    
                    guard let data = data else {
                        self.DescriptionLabel.text = "No data received"
                        return
                    }
    
                    self.parseAndDisplayResponse(jsonResponse: String(data: data, encoding: .utf8) ?? "")
    
                }
            }
    
            task.resume()
        }
    
        // Method to parse the response and display in the label
        func parseAndDisplayResponse(jsonResponse: String) {
            // Convert the JSON response string into Data
            
            print("parseAndDisplayResponse = \(jsonResponse)")
            
            guard let jsonData = jsonResponse.data(using: .utf8) else {
                print("Failed to convert JSON string to Data")
                return
            }
    
            // Parse the JSON response
            do {
                if let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any],
                   let choices = jsonObject["choices"] as? [[String: Any]],
                   let firstChoice = choices.first,
                   let message = firstChoice["message"] as? [String: Any],
                   let content = message["content"] as? String {
    
                    let detailVC = DetailViewController()
                         detailVC.passedString = content  // Pass the string
                    detailVC.modalPresentationStyle = .fullScreen // or .overFullScreen for a different effect
                    present(detailVC, animated: true, completion: nil)
                }
            } catch {
                print("Failed to parse JSON: \(error.localizedDescription)")
            }
        }
}
