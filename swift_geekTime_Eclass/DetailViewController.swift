//
//  DetailViewController.swift
//  swift_geekTime_Eclass
//
//  Created by Yuhong He on 13/10/2023.
//

import UIKit
import Kingfisher
import SnapKit

class DetailViewController: BaseViewController {

    var product: Product!
      var avatarView: UIImageView!
      var nameLabel: UILabel!
      var descLabel: UILabel!
      var teacherLabel: UILabel!
      var courseCountLabel: UILabel!
      var studentCountLabel: UILabel!
      var tab: Tab!
      
      override func viewDidLoad() {
          super.viewDidLoad()
          title = "Detail"
          crateTop()
          createMiddle()
          createBottom()
      }
      
      func createBottom() {
          let button = UIButton(type: .custom)
          button.setTitleColor(.white, for: .normal)
          button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
          button.setTitle("Buy £\(product.price)", for: .normal)
          button.setBackgroundImage(UIColor.hexColor(0xf8892e).toImage(), for: .normal)
          button.addTarget(self, action: #selector(didClickBuyButton), for: .touchUpInside)
          view.addSubview(button)
          button.snp.makeConstraints { (make) in
              make.left.right.bottom.equalToSuperview()
              make.height.equalTo(50)
          }
      }
      
      @objc func didClickBuyButton() {
          let loginVC = LoginViewController()
          navigationController?.pushViewController(loginVC, animated: true)
      }
      
      private func createMiddle() {
          tab = Tab(items: ["Introduction", "Content"])
          view.addSubview(tab)
          tab.snp.makeConstraints { (make) in
              make.left.right.equalToSuperview()
              make.top.equalTo(200)
              make.height.equalTo(50)
          }
      }
      
      private func crateTop() {
          let topView = UIView()
          topView.layer.contents = R.image.detailBg()?.cgImage
          let blurEffect = UIBlurEffect(style: .dark)
          let blurView = UIVisualEffectView(effect: blurEffect)
          blurView.layer.masksToBounds = true
          blurView.alpha = 0.7
          view.addSubview(topView)
          topView.addSubview(blurView)
          blurView.snp.makeConstraints { (make) in
              make.left.right.top.equalToSuperview()
              make.height.equalTo(200)
          }
          topView.snp.makeConstraints { (make) in
              make.left.right.top.equalToSuperview()
              make.height.equalTo(200)
          }
          
          avatarView = UIImageView()
          let round = RoundCornerImageProcessor(cornerRadius: 10)
          avatarView.kf.setImage(with: URL(string: product.imageUrl), placeholder: nil, options: [.processor(round)])
          topView.addSubview(avatarView)
          avatarView.snp.makeConstraints { (make) in
              make.left.top.equalTo(topView).offset(20)
              make.width.equalTo(82)
              make.height.equalTo(108)
          }
          
          nameLabel = UILabel(frame: .zero)
          nameLabel.textColor = .white
          nameLabel.font = UIFont.boldSystemFont(ofSize: 18)
          nameLabel.text = product.name
          topView.addSubview(nameLabel)
          nameLabel.snp.makeConstraints { (make) in
              make.left.equalTo(avatarView.snp_right).offset(10)
              make.top.equalTo(avatarView)
              make.right.equalTo(topView).offset(-15)
          }
          
          descLabel = UILabel(frame: .zero)
          descLabel.textColor = .white
          descLabel.font = UIFont.systemFont(ofSize: 14)
          descLabel.text = product.desc
          descLabel.numberOfLines = 2
          topView.addSubview(descLabel)
          descLabel.snp.makeConstraints { (make) in
              make.left.equalTo(avatarView.snp_right).offset(10)
              make.top.equalTo(nameLabel.snp_bottom).offset(5)
              make.right.equalTo(topView).offset(-15)
          }
          
          teacherLabel = UILabel(frame: .zero)
          teacherLabel.textColor = .white
          teacherLabel.font = UIFont.systemFont(ofSize: 14)
          teacherLabel.text = "Tutor: \(product.teacher)"
          topView.addSubview(teacherLabel)
          teacherLabel.snp.makeConstraints { (make) in
              make.left.equalTo(avatarView.snp_right).offset(10)
              make.bottom.equalTo(avatarView)
              make.right.equalTo(topView).offset(-15)
          }
          
          
          let bookAttachment = NSTextAttachment()
          bookAttachment.image = R.image.book()
          bookAttachment.bounds = CGRect(x: -2, y: -3, width: bookAttachment.image?.size.width ?? 0, height: bookAttachment.image?.size.height ?? 0)
          let bookAttachmentString = NSAttributedString(attachment: bookAttachment)
          let courseCountString = NSMutableAttributedString(string: "")
          courseCountString.append(bookAttachmentString)
          
          let courseCountStringAfterIcon = NSAttributedString(string: " \(product.total) class in total, updated to \(product.update)")
          courseCountString.append(courseCountStringAfterIcon)
          
          courseCountLabel = UILabel(frame: .zero)
          courseCountLabel.textColor = .white
          courseCountLabel.font = UIFont.systemFont(ofSize: 14)
          courseCountLabel.attributedText = courseCountString
          topView.addSubview(courseCountLabel)
          courseCountLabel.snp.makeConstraints { (make) in
              make.left.equalTo(topView).offset(20)
              make.bottom.equalTo(topView).offset(-15)
          }
          
          
          let studentAttachment = NSTextAttachment()
          studentAttachment.image = R.image.student()
          studentAttachment.bounds = CGRect(x: -2, y: -3, width: studentAttachment.image?.size.width ?? 0, height: studentAttachment.image?.size.height ?? 0)
          let studentAttachmentString = NSAttributedString(attachment: studentAttachment)
          let studentCountString = NSMutableAttributedString(string: "")
          studentCountString.append(studentAttachmentString)
          
          let studentCountStringAfterIcon = NSAttributedString(string: " \(product.studentCount) studies")
          studentCountString.append(studentCountStringAfterIcon)
          
          studentCountLabel = UILabel(frame: .zero)
          studentCountLabel.textColor = .white
          studentCountLabel.font = UIFont.systemFont(ofSize: 14)
          studentCountLabel.attributedText = studentCountString
          topView.addSubview(studentCountLabel)
          studentCountLabel.snp.makeConstraints { (make) in
              make.right.equalTo(topView).offset(-20)
              make.bottom.equalTo(topView).offset(-15)
          }
          
      }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
