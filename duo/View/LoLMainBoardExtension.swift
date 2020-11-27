
import UIKit

extension LoLMainBoard {
    // 버튼을 직접 작성으로 만든 이유... 스토리보드로 만드니 크기조절을 못함...
   
    func extension_upLoadBtnStyle(_ upLoadBtn : UIButton) {
        upLoadBtn.setTitle("글 쓰기", for: .normal);
        upLoadBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        upLoadBtn.setTitleColor(.white, for: .normal)
        upLoadBtn.backgroundColor = UIColor(displayP3Red: 71/255, green: 123/255, blue: 209/255, alpha: 1)
        upLoadBtn.layer.cornerRadius = 18;
        self.view.addSubview(upLoadBtn);
        
        // 코드로 constraint 사용하기
        // 버튼의 x좌표를 superview의 x축 기준 가운데 정렬
        // 크기 조절
        upLoadBtn.translatesAutoresizingMaskIntoConstraints = false
        upLoadBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true;
        upLoadBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true;
        

        // 오른쪽 -140만큼 띄움 safeAreaLayoutGuid => bar랑 메뉴바 같은거 제외한 뷰
        if #available(iOS 11.0, *) {
            upLoadBtn.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -( (self.view.frame.width - 100)/2 )).isActive = true
            upLoadBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        }
        else {
            upLoadBtn.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor, constant: 0).isActive = true
            upLoadBtn.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -10).isActive = true
        }
        
        // 클릭시 이벤트 지정, 터치한 컴포넌트에서 손을 땟을때 실행
        upLoadBtn.addTarget(self, action: #selector(extension_upLoadPost), for: .touchUpInside)
        
    }
    
    //@ogjc => 각각의 변수, 함수 등에 적용하여 ObjectiveC의 접근을 가능하게 해준다.
    @objc func extension_upLoadPost() {
        if let upLoadView = self.storyboard?.instantiateViewController(identifier: "UpLoadLoLPost") as? UpLoadLoLPost {
            
            // 네이베이션 바 만들어서 보내기
            let navController = UINavigationController(rootViewController: upLoadView);
            navController.modalTransitionStyle = UIModalTransitionStyle.coverVertical;
            navController.modalPresentationStyle = .fullScreen
            
            present(navController, animated: true, completion: nil)
        }
    }

    func extension_cellSetting(_ cell : LoLPostCell) {
        cell.tier.layer.cornerRadius = 7;
        cell.tier.tintColor = UIColor(displayP3Red: 71/255, green: 123/255, blue: 209/255, alpha: 1)
//        cell.tier.backgroundColor = UIColor(displayP3Red: 71/255, green: 123/255, blue: 209/255, alpha: 1)
        cell.tier.backgroundColor = UIColor.white
        cell.tier.layer.masksToBounds = true;
        cell.tier.layer.borderColor =  UIColor(displayP3Red: 71/255, green: 123/255, blue: 209/255, alpha: 1).cgColor
        cell.tier.layer.borderWidth = 1
        
        cell.gameMode.layer.cornerRadius = 7;
        cell.gameMode.tintColor = UIColor(displayP3Red: 71/255, green: 123/255, blue: 209/255, alpha: 1)
        cell.gameMode.backgroundColor = UIColor.white
        cell.gameMode.layer.masksToBounds = true;
        cell.gameMode.layer.borderColor =  UIColor(displayP3Red: 71/255, green: 123/255, blue: 209/255, alpha: 1).cgColor
        cell.gameMode.layer.borderWidth = 1
        
        cell.headCount.layer.cornerRadius = 7;
        cell.headCount.tintColor = UIColor(displayP3Red: 71/255, green: 123/255, blue: 209/255, alpha: 1)
        cell.headCount.backgroundColor = UIColor.white
        cell.headCount.layer.masksToBounds = true;
        cell.headCount.layer.borderColor =  UIColor(displayP3Red: 71/255, green: 123/255, blue: 209/255, alpha: 1).cgColor
        cell.headCount.layer.borderWidth = 1
        
        cell.endTime.textColor = UIColor.black
        cell.micFillBtn.tintColor = UIColor.black
        cell.micNotBtn.tintColor = UIColor.black
        
    }
    
}
