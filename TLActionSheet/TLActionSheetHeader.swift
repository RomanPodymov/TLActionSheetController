//
// Created by Terry Lewis on 12/10/20.
//

import Foundation
import UIKit

class TLActionSheetHeader: UIView {
  private static let padding: CGFloat = 16

  private static let extendedPadding: CGFloat = 24

  private let titleLabel = UILabel()

  private let messageLabel = UILabel()

  private let stackView = UIStackView()

  internal var bottomConstraint: NSLayoutConstraint?

  lazy var visualEffectView: UIVisualEffectView = {
    let blurEffect = UIBlurEffect(style: UIBlurEffect.Style(rawValue: 1200) ?? .dark)
    let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect, style: .secondaryLabel)

    return UIVisualEffectView(effect: vibrancyEffect)
  }()

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  init(title: NSAttributedString?, message: NSAttributedString?) {
    super.init(frame: .zero)

    self.translatesAutoresizingMaskIntoConstraints = false

    addSubview(visualEffectView)
    visualEffectView.contentView.addSubview(stackView)
    visualEffectView.contentView.addSubview(titleLabel)
    visualEffectView.contentView.addSubview(messageLabel)

    setTitleLabelText(attributedString: title)
    titleLabel.numberOfLines = 0
    titleLabel.textAlignment = .center
    stackView.addArrangedSubview(titleLabel)

    setMessageLabelText(attributedString: message)
    messageLabel.numberOfLines = 0
    messageLabel.textAlignment = .center
    stackView.addArrangedSubview(messageLabel)

    stackView.spacing = 8
    stackView.axis = .vertical

    visualEffectView.translatesAutoresizingMaskIntoConstraints = false
    stackView.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    messageLabel.translatesAutoresizingMaskIntoConstraints = false

    visualEffectView.topAnchor.constraint(equalTo: topAnchor, constant: TLActionSheetHeader.padding).isActive = true
    visualEffectView.leftAnchor.constraint(equalTo: leftAnchor, constant: TLActionSheetHeader.padding).isActive = true
    visualEffectView.rightAnchor.constraint(equalTo: rightAnchor, constant: -TLActionSheetHeader.padding).isActive = true
    bottomConstraint = visualEffectView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -TLActionSheetHeader.padding)
    bottomConstraint?.isActive = true

    stackView.topAnchor.constraint(equalTo: visualEffectView.topAnchor).isActive = true
    stackView.leftAnchor.constraint(equalTo: visualEffectView.leftAnchor).isActive = true
    stackView.rightAnchor.constraint(equalTo: visualEffectView.rightAnchor).isActive = true
    stackView.bottomAnchor.constraint(equalTo: visualEffectView.bottomAnchor).isActive = true

    titleLabel.leftAnchor.constraint(equalTo: visualEffectView.leftAnchor).isActive = true
    titleLabel.rightAnchor.constraint(equalTo: visualEffectView.rightAnchor).isActive = true

    messageLabel.leftAnchor.constraint(equalTo: visualEffectView.leftAnchor).isActive = true
    messageLabel.rightAnchor.constraint(equalTo: visualEffectView.rightAnchor).isActive = true
  }

  func setHasActionViewsBelow(_ hasViewBelow: Bool) {
    bottomConstraint?.constant = hasViewBelow ? -TLActionSheetHeader.extendedPadding : -TLActionSheetHeader.padding
  }

  private func setTitleLabelText(attributedString: NSAttributedString?) {
    titleLabel.attributedText = attributedString
    titleLabel.isHidden = titleLabel.attributedText == nil
  }

  private func setMessageLabelText(attributedString: NSAttributedString?) {
    messageLabel.attributedText = attributedString
    messageLabel.isHidden = messageLabel.attributedText == nil
  }
}
