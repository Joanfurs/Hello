//
//  View.swift
//  Hello
//
//  Created by Zhanna Fursova on 10/28/14.
//  Copyright (c) 2014 John Doe. All rights reserved.
//

import UIKit

class View: UIView {

	var f: CGFloat = 0;

	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)

		backgroundColor = UIColor.blackColor();

	}

	override func drawRect(rect: CGRect) {
		
		
		let s: String = "Emergency distruct";
		
		if f < 44 {
			f += 2;
			} else {
			f = 0;
			}
		
		let font: UIFont = UIFont.systemFontOfSize(f);
		let foregroundColor: UIColor = UIColor.redColor();

		let attributes: [NSObject: AnyObject] = [
			NSFontAttributeName: font,
			NSForegroundColorAttributeName: foregroundColor
		];

		let size: CGSize = s.sizeWithAttributes(attributes);
		let x: CGFloat = bounds.origin.x + (bounds.size.width - size.width) / 2;
		let y: CGFloat = bounds.origin.y + (bounds.size.height - size.height) / 2;
		let point: CGPoint = CGPointMake(x, y);
		s.drawAtPoint(point, withAttributes: attributes);
		
		let t: dispatch_time_t = dispatch_time(DISPATCH_TIME_NOW, Int64(NSEC_PER_SEC/30));
		dispatch_after(t, dispatch_get_main_queue(), {self.setNeedsDisplay();});
		
	}
}

