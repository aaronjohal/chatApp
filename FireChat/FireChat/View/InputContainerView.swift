//
//  We have a lot of repeat code to create container views e.g. for textfields
// so we create a subclass that can be reaused
//

import UIKit

class InputContainerView: UIView {
    
    init(image: UIImage?, textField: UITextField) {
        
        super.init(frame: .zero) //view needs to call its parent initizalier
        
        //view properties
        setHeight(height: 50)
        backgroundColor = .clear
        
        //adding an image view to the view
        
        let imageV = UIImageView()
        imageV.image = image
        imageV.tintColor = .white
        imageV.alpha = 0.87
        
        addSubview(imageV)
        
        //Constraints for image position on the view
        imageV.centerY(inView: self)
        imageV.anchor(left: self.leftAnchor, paddingLeft: 8)
        imageV.setDimensions(height: 24, width: 24)
        
    
        addSubview(textField)
        textField.centerY(inView: self)
        textField.anchor(left: imageV.rightAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingLeft: 8, paddingBottom: -8)
        
        let dividerView = UIView()
        dividerView.backgroundColor = .white
        addSubview(dividerView)
        dividerView.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor,paddingLeft: 8, height: 0.75)
        
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
