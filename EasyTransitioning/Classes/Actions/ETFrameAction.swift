//
//  ETFrameAction.swift
//  EasyTransitioning
//
//  Created by Jerry Yu on 2016-11-12.
//  Copyright © 2016 Jerry Yu. All rights reserved.
//

import UIKit

public struct ETFrameAction: ETAction {
	public let toFrame: CGRect
	public let fromFrame: CGRect

	public init(toFrame: CGRect, fromFrame: CGRect) {
		self.toFrame = toFrame
		self.fromFrame = fromFrame
	}

	public init(toFrame: CGRect, fromFrameOfView view: UIView) {
		let fromFrame = view.superview?.convert(view.frame, to: nil) ?? view.frame
		self.init(toFrame: toFrame, fromFrame: fromFrame)
	}

	public func setup(snapshotView: UIView?, in containerView: UIView) {
		guard let snapshotView = snapshotView else { return }
		snapshotView.frame = fromFrame
	}

	public func animate
		(snapshotView: UIView?, in containerView: UIView, animationDuration: TimeInterval) {
		guard let snapshotView = snapshotView else { return }
		snapshotView.frame = toFrame
	}

	public func reversed() -> ETAction {
		return ETFrameAction(toFrame: fromFrame, fromFrame: toFrame)
	}
}
