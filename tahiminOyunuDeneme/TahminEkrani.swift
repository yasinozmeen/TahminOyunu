import UIKit

class TahminEkrani: UIViewController {
    
    let rastgeleSayi = Int.random(in: 0...100)
    var tahmin = 0
    var kalanHak = 5
    var sonuc = true
    var sonucVeRastgeleSayi:(Int,Bool)?
    
    
    
    @IBOutlet var kalanHakLabel: UILabel!
    @IBOutlet var yardımLabel: UILabel!
    @IBOutlet var tahminTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(rastgeleSayi)
        overrideUserInterfaceStyle = .light // sadece beyaz tema
        sonucVeRastgeleSayi = (rastgeleSayi, sonuc)
    }
    
    @IBAction func tarhminEtButton(_ sender: Any) {
        
        if kalanHak != 1{
            
            if let temp = Int(tahminTextField.text!){
                tahmin = temp
                kalanHak-=1
                kalanHakLabel.text = "Kalan Hak : \(kalanHak)"
                print(kalanHak)
                
                if rastgeleSayi == tahmin{
                    performSegue(withIdentifier: "sonucEkraniGecis", sender: sonucVeRastgeleSayi)
                }
                
                yardımLabel.isHidden = false
                
                if tahmin > rastgeleSayi{
                    yardımLabel.text = "Azaltın"
                }else{
                    yardımLabel.text = "Arttırın"
                }
                
            }else{
                kalanHakLabel.text = "Lütfen Sayı Giriniz"
            } // Girilen sayıyı Int çevirme
        }else{
            sonucVeRastgeleSayi?.1 = false
            performSegue(withIdentifier: "sonucEkraniGecis", sender: sonucVeRastgeleSayi)
        }
        tahminTextField.text = ""
    }
    @IBAction func hakArttır(_ sender: Any) {
        kalanHak+=1
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        let gidilecekVC = segue.destination as! SonucEkrani
        //gidilecekVC.sonuc = (sonucVeRastgeleSayi.1)
        
        if let temp = sonucVeRastgeleSayi?.1{
            gidilecekVC.sonuc = temp
        } // Sonuc gönderir
        if let temp = sonucVeRastgeleSayi?.0{
            gidilecekVC.rastgeleSayi = temp
        }//rastgelesaayıı gönderir
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }// ekrana tıklanınca klavyenin yok olması
}
