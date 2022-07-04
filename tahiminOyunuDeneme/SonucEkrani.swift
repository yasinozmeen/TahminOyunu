import UIKit

class SonucEkrani: UIViewController {
    
    var sonuc = true
    var rastgeleSayi:Int?
    
    @IBOutlet var sonucImage: UIImageView!
    @IBOutlet var sonucLabel: UILabel!
    @IBOutlet var rastgeleSayiLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light // sadece beyaz tema
        navigationItem.hidesBackButton = true// navigation back item gizleme
        
        if let temp = rastgeleSayi{
            rastgeleSayiLabel.text = "Rastgele Sayı :\(temp)"
        }// RastgeleSayıyı gösterir
        print(sonuc,rastgeleSayi)
        switch sonuc {
        case true:
            sonucLabel.text = "Kazandınız"
        case false:
            sonucLabel.text = "Kaybettiniz"
            sonucImage.image = UIImage(named: "uzgunSurat")
        } //sonuç label ve sonuçimage değiştirme
    }
    
    @IBAction func tekrarOynaButton(_ sender: Any) {
        ////kjbhlajhlahfaolıshfaf
    }
    
    
    
}
