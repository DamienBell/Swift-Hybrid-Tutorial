//
//  DataViewController.swift
//  build a hybird app
//
//  Created by Damien Bell on 10/19/14.
//  Copyright (c) 2014 Damien Bell. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {

    var dataObject: AnyObject?
    
    //Let's add our views as properies of this view controller
    var headerView:UIView = UIView()
    var contentView:UIView = UIView()
    var footerView:UIView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        setUpLayout();
    }
    
func setUpLayout(){

//This is an example of setting up a responsive layout using NSConstraints
//Compared to html/css it is absolutely insane. We'll try to do this as little as possible,
//but this setup will go a long way in future profing our layout.


//set view properties
//By Default these are white. For now let's make them different colors so we can see where they are
//set view properties
headerView.backgroundColor = UIColor.greenColor()
contentView.backgroundColor = UIColor.redColor();
footerView.backgroundColor = UIColor.blueColor()

//Xcode will attempt to create constraints for us.
//Setting this propery to false will prevent a conflict of constraints.
headerView.setTranslatesAutoresizingMaskIntoConstraints(false);
contentView.setTranslatesAutoresizingMaskIntoConstraints(false);
footerView.setTranslatesAutoresizingMaskIntoConstraints(false);

//The views dictionary will be passed to NSLayout functions.
//We'll stuff our views into here. We'll be referencing these views by their key value in the array
//so name them something sensible.
var views = NSMutableDictionary()
//add views to dictionary
views["header"] = headerView;
views["content"] = contentView;
views["footer"] = footerView;

//The view property is the main view in our viewcontroller. 
//We're going to add these views to the main view
//It's good to note that at this point they have no dimension or position.
//Simply adding views will not suffice in having them show up.
view.addSubview(headerView)
view.addSubview(contentView)
view.addSubview(footerView)

//Time to add our Constraints.
//For an NSConstraint to be viable the compiler must be able to determine it's height, width, and position.
//We're going add constraints to our view, and reference the subviews that we have in our views array.

//Below we're saying that this view is as wide as the screen. We would like either side of this view to be
//0 points from it's parent view.
//Note: the 'H' does not stand for Height, but Horizontal.
view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[header]-0-|",
    options: NSLayoutFormatOptions.AlignAllBaseline,
    metrics: nil,
    views: views))


//Cool, so we've defined the width of our header, and we're going to explicitly define the height as 40 points.
//So now we've defined the height, and width of the header view. We still need to define the position.
//We'll take care of that at the end the setUpLayout method.
view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[header(==40)]",
    options: NSLayoutFormatOptions.AlignAllBaseline,
    metrics: nil,
    views: views))


//Notice that we're not setting a height constraint for our content.
//We actually don't need to because we're going to define the height of the content in relation to
//the space between the header and footer. We'll do that in our very last constraint at the end of this method.
view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[content]-0-|",
    options: NSLayoutFormatOptions.AlignAllBaseline,
    metrics: nil,
    views: views))

//We'll set up the footer similar to the header.
//We want it to take up all of the horizontal space in the view, and have a height of 40 points.
view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[footer]-0-|",
    options: NSLayoutFormatOptions.AlignAllBaseline,
    metrics: nil,
    views: views))

view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[footer(==40)]",
    options: NSLayoutFormatOptions.AlignAllBaseline,
    metrics: nil,
    views: views))

//This is the constraint where we tie everything together.

//We're basically saying to stack the views in this vertial order. The '|'s encapsulating the views represent the top and bottom of the parent view.
//We're saying: "stack the header view 16 points away from the top, then squish the content view between the header and footer by making the top 0 points from the bottom of the header and the bottom 0 points from the top of the footer.
view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-16-[header]-0-[content]-0-[footer]-0-|",
    options: NSLayoutFormatOptions.AlignAllCenterX,
    metrics: nil,
    views: views))

}
}

