//
//  TSButton.swift
//  Tesark Technologies
//
//  Created by Tesark Technologies on 31/12/16.
//  Copyright © 2016 Tesark Technologies. All rights reserved.
//


enum SBContentAlignment {
    case left,right, center
}


enum SBStyle {
    case primary,ghost,dashed, none
}

import UIKit

class spinnerButton: UIButton {
    
    //MARK:  Badge
    var SB_badgeview = UIView()
    var SB_lblBadge = UILabel()
    var SB_circleButtonview = UIView()
    
    var circleButtonsubview = UIButton()

    
    //MARK: Loading Activity
    var  activityIndictor = UIActivityIndicatorView()
    
    //MARK: Button Styles Attributes
    
    var SBBorderColor = UIColor()
    var SBBackgroundColor = UIColor()
    var SBTextColor = UIColor()
    let shapeLayer = CAShapeLayer()
    
    //MARK: Button Title
    private var SBTitle = String()
    

    //MARK: Button Style Dynamic Attributes
    @IBInspectable var SB_style:SBStyle =  .primary {
        didSet {
           SB_ConfigureButtonstyles(style: SB_style)
            
        }
    }
    
    
    //MARK: Initial Styles configurations
    
    func SB_ConfigureButtonstyles(style : SBStyle){
        
        layer.cornerRadius = 8.0
       // layer.borderWidth = 1.0
        /// print("types",style)
        
        if(SB_style == .primary){
            
            SBBorderColor = UIColor.hexStringToUIColor(hex:"#108ee9")
            SBBackgroundColor = UIColor.hexStringToUIColor(hex:"#108ee9")
            SBTextColor = UIColor.white
            
        }else if(SB_style == .ghost){
            
            SBBorderColor = UIColor.hexStringToUIColor(hex:"#d9d9d9")
            SBBackgroundColor = UIColor.clear
            SBTextColor = UIColor.hexStringToUIColor(hex: "#666666")
            
        }else if(SB_style == .none){
            SBBorderColor = UIColor.hexStringToUIColor(hex:"#d9d9d9")
            SBBackgroundColor = UIColor.hexStringToUIColor(hex:"#f7f7f7")
            SBTextColor = UIColor.hexStringToUIColor(hex: "#666666")
            
            
        }else{
            layer.addSublayer(self.addDashedBorder(withColor: UIColor.hexStringToUIColor(hex:"#d9d9d9").cgColor))
            layer.borderWidth = 0
            SBBorderColor = UIColor.hexStringToUIColor(hex:"#d9d9d9")
            SBBackgroundColor = UIColor.clear
            SBTextColor = UIColor.hexStringToUIColor(hex: "#666666")
        }
        
        layer.borderColor = SBBorderColor.cgColor
        backgroundColor =  SBBackgroundColor
        self.tintColor = SBTextColor
        self.setTitleColor(SBTextColor, for: .normal)

        SB_setTextwithIcon(buttonicon: SB_setButtonicon, titleText: SB_setbuttonTitle, position: SB_alignemnt)

        self.setFATitleColor(color: SBTextColor)

    }
    
    
    
    //MARK: Add Dashed Border
    
    private func addDashedBorder(withColor color: CGColor) -> CAShapeLayer {
        shapeLayer .removeFromSuperlayer()
        let frameSize = self.frame.size
        let shapeRect = CGRect(x: CGFloat(0.0), y: CGFloat(0.0), width: CGFloat(frameSize.width), height: CGFloat(frameSize.height))
        shapeLayer.bounds = shapeRect
        shapeLayer.position = CGPoint(x: CGFloat(frameSize.width / 2), y: CGFloat(frameSize.height / 2))
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color
        shapeLayer.lineWidth = 3.0
        shapeLayer.lineJoin = kCALineJoinRound
        shapeLayer.lineDashPattern = [4, 4]
        let path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 8.0)
        shapeLayer.path = path.cgPath
        return shapeLayer
    }
    
   
    //MARK : Set Title
    
    @IBInspectable var SB_setbuttonTitle : String = ""{
        
        didSet{
            SB_setTextwithIcon(buttonicon: SB_setButtonicon, titleText: SB_setbuttonTitle, position: SB_alignemnt)
            //super.setTitle("", for: .normal)
        }
    }
    
    //MARK: Set Button Title Color
    
    @IBInspectable var SB_setbuttoncolor : UIColor = UIColor.red{
        didSet{
            
            self.setFATitleColor(color: SBTextColor)

        }
    }
    
    
    //MARK: set Button Icon
    
    @IBInspectable var SB_setButtonicon : FAType? {
        
        didSet{
            SB_setTextwithIcon(buttonicon: SB_setButtonicon, titleText: SB_setbuttonTitle, position: SB_alignemnt)
        }
    }
    
    
    //MARK: Set Button Name and Icons ( Commom Methods )
    
    
    func SB_setTextwithIcon(buttonicon:FAType?,titleText: String, position:SBContentAlignment ){
     
        if(!titleText.isEmpty && (buttonicon != nil)){
            switch position {
            case .left:
            
                self.setFAText(prefixText: "", icon: buttonicon, postfixText: "  \(SB_setbuttonTitle)", size: self.titleLabel?.font.pointSize, forState: .normal)
                self.contentHorizontalAlignment = .left
                self.contentEdgeInsets = UIEdgeInsets(top: 0, left: 13, bottom: 0, right: 0)
                
                break
                
            case .right:
                
                self.setFAText(prefixText: "\(SB_setbuttonTitle)   ", icon: buttonicon, postfixText: "", size: self.titleLabel?.font.pointSize, forState: .normal)
                self.contentHorizontalAlignment = .right
                self.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 13)
                
                break
                
            default:
                self.setFAText(prefixText: "", icon: buttonicon, postfixText: "  \(SB_setbuttonTitle)  ", size: self.titleLabel?.font.pointSize, forState: .normal)
                self.contentHorizontalAlignment = .center
                
                break
            }
        }else if(!titleText.isEmpty){
            
            self.setFAText(prefixText: "", icon: buttonicon, postfixText: "\(SB_setbuttonTitle)", size: self.titleLabel?.font.pointSize, forState: .normal)
            self.contentHorizontalAlignment = .center
            
        }else{
            self.setFAText(prefixText: "", icon: buttonicon, postfixText: "\(SB_setbuttonTitle)", size: self.titleLabel?.font.pointSize, forState: .normal)
            self.contentHorizontalAlignment = .center
        }
        
        if SB_setCirlebutton {
           
            self.setFAText(prefixText: "", icon: nil, postfixText: "", size: self.titleLabel?.font.pointSize, forState: .normal)
            circleButtonsubview.setFAText(prefixText: "", icon: buttonicon, postfixText: "\(SB_setbuttonTitle)", size: self.titleLabel?.font.pointSize, forState: .normal)
            circleButtonsubview.contentHorizontalAlignment = .center
            self.contentHorizontalAlignment = .center



        }
        self.setFATitleColor(color: SBTextColor)
    }

    
    //MARK:  Circle Button
    @IBInspectable var SB_setCirlebutton:Bool =  false {
        didSet {
            if SB_setCirlebutton {
                
                layer.cornerRadius = self.frame.size.width / 2
                self.clipsToBounds = true
                
            }else {
                layer.cornerRadius = 8
            }
            
        }
    }

    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        SB_setup()
        
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        SB_setup()
    }
    
    
    //MARK: Setup 
    
    func SB_setup(){
        self.addTarget(self, action: #selector(spinnerButton.SB_buttonClicked(button:)), for: .touchUpInside)
        layer.cornerRadius = 8.0
        backgroundColor =  UIColor.hexStringToUIColor(hex:"#108ee9")
        self.tintColor = UIColor.white
        self.setTitleColor(UIColor.white, for: .normal)
        SB_ConfigureButtonstyles(style: .primary)
    }
    
    
     @objc private func SB_buttonClicked(button:UIButton) {
        
        UIView.animate(withDuration: 0.1, animations: {
                button.transform = CGAffineTransform.identity.scaledBy(x: 0.9, y: 0.9)
            }, completion: { (finish) in
                UIView.animate(withDuration: 0.1, animations: {
                    button.transform = CGAffineTransform.identity
                })
            })
    }
    
    
    
    override func setTitle(_ title: String?, for state: UIControlState) {
        UIView.performWithoutAnimation({
            super.setTitle(title, for: state)
            self.layoutIfNeeded()
        })
    }
    
    
    //MARK: Set Badge
    func SB_setBadge(badge: String){
       
        SB_badgeview = UIView.init(frame: CGRect(x: self.frame.size.width - 16, y: -8, width: 20, height: 20))
       
        SB_badgeview.layer.cornerRadius = SB_badgeview.frame.size.width / 2
        SB_badgeview.clipsToBounds = true
        SB_badgeview.backgroundColor = UIColor.red
        SB_badgeview.layer.borderColor = UIColor.darkGray.cgColor
        SB_badgeview.layer.borderWidth = 1
        
        
        SB_lblBadge.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        SB_lblBadge.text = badge
        SB_lblBadge.textColor = UIColor.white
        SB_lblBadge.font = UIFont.systemFont(ofSize: 11)
        SB_lblBadge.textAlignment = .center
        SB_lblBadge.backgroundColor = UIColor.clear
        
        SB_badgeview.addSubview(SB_lblBadge)
        
        addSubview(SB_badgeview)
        
        let currentBadge = Int(badge)
        
        if(currentBadge == 0 || badge.isEmpty){
            SB_badgeview.removeFromSuperview()
        }
        else{
            
            if currentBadge! > 100 && currentBadge! <= 999 {
                
                SB_badgeview.frame = CGRect(x: self.frame.size.width - 20, y: -8, width: 30, height: 20)
                SB_lblBadge.frame = CGRect(x: 0, y: 0, width: SB_badgeview.frame.size.width, height: SB_badgeview.frame.size.height)
                
            }else if(currentBadge! >= 1000){
                SB_badgeview.frame = CGRect(x: self.frame.size.width - 20, y: -8, width: 40, height: 20)
                SB_lblBadge.text = "1000+"
                
            }
        }
        
        if( SB_setCirlebutton)
        {
         SB_badgeview.frame = CGRect(x: self.frame.size.width/2, y: 5, width: 30, height: 20)
            
            //TESARK_lblBadge.center = CGPoint(x: CGFloat(TESARK_badgeview.frame.size.width / 2), y: CGFloat(TESARK_badgeview.frame.size.height / 2))
        }
        SB_lblBadge.frame = CGRect(x: 0, y: 0, width: SB_badgeview.frame.size.width, height: SB_badgeview.frame.size.height)
    }
    
    
    //MARK: Button Alignment
    
    @IBInspectable var SB_alignemnt : SBContentAlignment = .center{
        
        didSet{
            
            SB_setTextwithIcon(buttonicon: SB_setButtonicon, titleText: SB_setbuttonTitle, position: SB_alignemnt)

        }
    }
    
    
    //MARK: Set Loading Animations
    
    func SB_setLoadinganimation(_animation: Bool, color: UIColor){
        
        if(_animation){
            SB_closeanimation()
            
            activityIndictor = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.white)
            activityIndictor.frame = CGRect(x: 0, y: 0, width: self.frame.size.height, height: self.frame.size.height)
            
            switch SB_alignemnt {
            case .left:
                activityIndictor.center = CGPoint(x: (self.frame.size.width - activityIndictor.frame.size.width) + 5 , y: 2 + self.frame.size.height/2)
                break
            case .right:
                activityIndictor.center = CGPoint(x:activityIndictor.frame.size.width + 5  , y: 2 + self.frame.size.height/2)
                break
            default:
                activityIndictor.center = CGPoint(x: 2 + (self.frame.size.width/2) , y: 2 + self.frame.size.height/2)
                break
            }
            
                    if SB_setCirlebutton {
                        activityIndictor.center = CGPoint(x: 2 + (self.frame.size.width/2) , y: 2 + self.frame.size.height/2)
                    }
            
            activityIndictor.color = color
            activityIndictor.isHidden = true
            activityIndictor.isUserInteractionEnabled = false
            
            
            self.addSubview(activityIndictor)
        }else{
            SB_closeanimation()
        }
        
    }
    
    //MARK: Start Loading
    
   func SB_startloading(){
    activityIndictor.startAnimating()
    activityIndictor.isHidden = false
   }
    
    //MARK: Stop Loading
    
    func SB_stoploading(){
        activityIndictor.startAnimating()
        activityIndictor.isHidden = true
        
    }
    
    
    func SB_closeanimation(){
        activityIndictor.removeFromSuperview()
    }
    

    
    
}

//MARK: Color from Hexa String
extension UIColor {
    
    //MARK: Conver Hexa to RGB color from Hex String
    class func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}


