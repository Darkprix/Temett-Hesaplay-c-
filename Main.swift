import Foundation

let hisseFiyat = 58.50  //Alınan hissenin fiyatının girildiği alan
let aylıkTemettü = 0.40  //Aylık verdiği temettünün girileceği yer

func lothesaplayici(para: Double) -> Double {
    return para / hisseFiyat
}

func temettüHesaplayici(lot: Double) -> (Double, Double) {
    
    func aylikTemettuHesaplayici(lot: Double) -> Double {
        return lot * aylıkTemettü
    }
        
    func yillikTemettuHesaplayici(lot: Double) -> Double {
        return lot * aylıkTemettü * 12
    }
    
    let aylik = aylikTemettuHesaplayici(lot: lot)
    let yillik = yillikTemettuHesaplayici(lot: lot)
    return (aylik, yillik)
}

var aylar = ["Ocak", "Şubat", "Mart", "Nisan", "Mayıs", "Haziran", "Temmuz", "Ağustos", "Eylül", "Ekim", "Kasım", "Aralık"]

print("Para miktarınızı giriniz: ")
let paraBaslangic = Double(readLine() ?? "") ?? 0.0

print("Aylık dışarıdan ekleme miktarı: ")
let artis = Double(readLine() ?? "") ?? 0.0

var toplamPara = paraBaslangic
var toplamEkleme = 0.0
var lotSayisi = lothesaplayici(para: toplamPara)

var yilUcIlkAylikTemettu: Double = 0.0
var yilBesIlkAylikTemettu: Double = 0.0

print("==============================================")
print("Başlangıç:")
print("Toplam para: \(String(format: "%.2f", toplamPara))")
print("Lot sayısı: \(String(format: "%.2f", lotSayisi))")
print("==============================================\n")

for yil in 1...5 {
    for ayIndex in 0..<aylar.count {
        let ay = aylar[ayIndex]
        
       
        let temettu = temettüHesaplayici(lot: lotSayisi)
        let aylikToplamEkleme = artis + temettu.0
        
        toplamPara += aylikToplamEkleme
        toplamEkleme += aylikToplamEkleme
        
        
        lotSayisi = lothesaplayici(para: toplamPara)
        
        if yil == 1 {
            print("\(yil). Yıl \(ay):")
            print("- Toplam para: \(String(format: "%.2f", toplamPara))")
            print("- Lot sayısı: \(String(format: "%.2f", lotSayisi))")
            print("- O ay dışarıdan eklenen miktar + temettü: \(String(format: "%.2f", aylikToplamEkleme))")
            print("- O ay kazanılan temettü: \(String(format: "%.2f", temettu.0))")
            print("----------------------------------------------\n")
        }
        

        if yil == 3 && ayIndex == 0 {
            yilUcIlkAylikTemettu = temettu.0
        }
        if yil == 5 && ayIndex == 0 {
            yilBesIlkAylikTemettu = temettu.0
        }
    }
    
    if yil == 1 || yil == 3 || yil == 5 {
        let toplamTemettu = temettüHesaplayici(lot: lotSayisi)
        print("\(yil). Yıl Sonu İstatistikleri:")
        print("- Toplam para: \(String(format: "%.2f", toplamPara))")
        print("- Toplam dışarıdan eklenen miktar (temettü dahil): \(String(format: "%.2f", toplamEkleme))")
        print("- Yıllık temettü: \(String(format: "%.2f", toplamTemettu.1))")
        
        if yil == 3 {
            print("- 3. yılın ilk ayında kazanılan temettü: \(String(format: "%.2f", yilUcIlkAylikTemettu))")
        }
        
        if yil == 5 {
            print("- 5. yılın ilk ayında kazanılan temettü: \(String(format: "%.2f", yilBesIlkAylikTemettu))")
        }
        
        print("==============================================\n")
    }
}
