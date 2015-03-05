//
//  ViewController.swift
//  Drag caret between text views
//
//  Created by Kåre Morstøl on 04.03.15.
//  Copyright (c) 2015 NotTooBad Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

	@IBOutlet weak var view1: UITextView!
	@IBOutlet weak var view2: UITextView!

	override func viewDidLoad() {
		super.viewDidLoad()
		view1.delegate = self
	}

	func textViewDidChangeSelection(textView: UITextView) {
		if textView.selectedRange.length == 0 && textView.selectedRange.location == count(textView.text){
			if let loupegesture1 = textView.loupeGesture(), let loupegesture2 = view2.loupeGesture() {
				view1.removeGestureRecognizer(loupegesture1)
				view2.addGestureRecognizer(loupegesture1)
				view2.removeGestureRecognizer(loupegesture2)
				view1.addGestureRecognizer(loupegesture2)
				view2.becomeFirstResponder()
				println("swapped loupe recognisers between text views")
			}
		}
	}
}

extension UITextView {
	func loupeGesture () -> UILongPressGestureRecognizer? {
		return gestureRecognizers?.filter { (recogniser) in
			return recogniser.isKindOfClass(NSClassFromString( "UIVariableDelayLoupeGesture"))
			}.first as? UILongPressGestureRecognizer
	}
}
