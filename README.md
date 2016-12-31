# SpinnerButtoniOS


# SpinnerButton

SpinnerButton is a UIButton subclass optimized for non-rectangular button shapes


# Create Button 

     let myButton = spinnerButton.init(frame:CGRect(x:50,y:250,width:150,height:40))
     
# Button Style

  There are primary button, default button, ghost button and dashed button in TESARK Button

SB_style  can be set as primary or ghost or dashed, in order to create primary button or ghost button or dashed button. If nothing is provided to type, we will get default button. Users can tell the significance of button from it's appearance.

SB_style {
primary
ghost
dashed
none
}


        myButton.SB_style = .primary
        
# Button Title

We can set uibutton title with SB_setbuttonTitle attributes

        myButton.SB_setbuttonTitle = "Button"

# Circle Button

        myButton.SB_setCirlebutton = true

# Button Badge

        myButton.SB_setBadge(badge: "73")

# Button Icon

        myButton.SB_setBadge(badge: "73")

# Button Icon Alignment 

        myButton.SB_alignemnt = .left

# Button Loading Animation with color

        myButton.SB_setLoadinganimation(_animation: true, color: .blue)

# Start loading 

        myButton.SB_startloading()

# Stop Loading
        myButton.SB_stoploading()


# SpinnerButton Example 
        let myButton = spinnerButton.init(frame:CGRect(x:50,y:250,width:150,height:40))

        myButton.addTarget(self, action: #selector(self.demo(button:)), for: UIControlEvents.touchUpInside)
        myButton.SB_setBadge(badge: "73")
        myButton.SB_setbuttonTitle = "Button"
        myButton.SB_setLoadinganimation(_animation: true, color: .blue)
        myButton.SB_alignemnt = .left
        myButton.SB_setButtonicon = FAType.FAAlignLeft
        myButton.SB_style = .primary

        self.view.addSubview(myButton)
 

# Demo Screens

![alt tag](https://github.com/tesark/SpinnerButtoniOS/blob/master/screen.png)

![alt tag](https://github.com/tesark/SpinnerButtoniOS/blob/master/badge.png)
