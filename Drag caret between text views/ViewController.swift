//
//  ViewController.swift
//  Drag caret between text views
//
//  Created by Kåre Morstøl on 04.03.15.
//  Copyright (c) 2015 NotTooBad Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var view1: MyTextView!
	@IBOutlet weak var view2: UITextView!

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.

		view1.caretReachedTheEndListener = {
			view2.becomeFirstResponder()
		}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

class MyTextView : UITextView {

	var caretReachedTheEndListener: (() -> ())?

	override func caretRectForPosition(position: UITextPosition!) -> CGRect {
		if selectedRange.length == 0 && selectedRange.location == count(self.text) {
			//resignFirstResponder()
			caretReachedTheEndListener?()
		}
		return super.caretRectForPosition(position)
	}
}