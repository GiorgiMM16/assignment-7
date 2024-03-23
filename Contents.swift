import Foundation

/* შექმენით Enum-ი სახელით WeekDay შესაბამისი ქეისებით. დაწერეთ ფუნქცია რომელიც იღებს ამ ენამის ტიპს და ბეჭდავს გადაწოდებული დღე სამუშაოა თუ დასვენების */

enum Weekday {
    case monday, tuesday, wedensday, thursday, friday
    case saturday, sunday
}

var day: Weekday

func checker (day: Weekday){
    switch(day) {
    case .monday:
        print("სამუშაო დღეა")
    case .tuesday:
        print("სამუშაო დღეა")
    case .wedensday:
        print("სამუშაო დღეა")
    case .thursday:
        print("სამუშაო დღეა")
    case .friday:
        print("სამუშაო დღეა")
    case .saturday:
        print("დასვენების დღეა")
    case .sunday:
        print("დასვენების დღეა");
    }
}
checker(day: Weekday.sunday)

/* შექმენით Enum-ი სახელად GialaSquad, რომელიც აღწერს გია სურამელაშვილის ფანკლუბის წევრების დონეებს ქეისებით : “TsigroviManto”, “MoshishvlebuliMkerdi”, “TuGapatio”. შექმენით ფროფერთი GialaSquad-ში, რომელსაც ექნება ინფორმაცია თუ რა ღირს თითოეული დონე თვეში (დონეები დალაგებულია ძვირიდან იაფისაკენ). დაუმატეთ მეთოდი რომელიც დაბეჭდავს თითოეული დონის ფასს */

print("მეორე დავალება")

enum GialaSquad {
    case TsigroviManto
    case MoshishvlebuliMkerdi
    case Tugapatio
    
    var pasunia: Double {
        switch self {
        case .TsigroviManto:
            return 10
        case .MoshishvlebuliMkerdi:
            return 20
        case .Tugapatio:
            return 30
        }
    }
    
    func pasebiPasebi() {
            switch self {
            case .TsigroviManto:
                print("წიგროვი მანტოს ფასი: \(GialaSquad.TsigroviManto.pasunia)")
            case .MoshishvlebuliMkerdi:
                print("მოშიშვლებული მკერდის ფასი: \(GialaSquad.MoshishvlebuliMkerdi.pasunia)")
            case .Tugapatio:
                print("თუგაპატიოს ფასი: \(GialaSquad.Tugapatio.pasunia)")
            }
        }
}

let fan = GialaSquad.MoshishvlebuliMkerdi
fan.pasebiPasebi()


/* შექმენით enum-ი Weather შემდეგი ქეისებით, Sunny, Cloudy, Rainy და Snowy. ამ ქეისებს უნდა ჰქონდეს associated value Celsius-ის სახით. დაწერეთ function რომელიც მიიღებს ამ enum-ს, და მოგვცემს რეკომენდაციას რა უნდა ჩავიცვათ შესაბამისი ამინდის მიხედვით */

enum Weather {
    case sunny(Celsius: Int)
    case cloudy(Celsius: Int)
    case rainy(Celsius: Int)
    case snowy(Celsius: Int)
}


func raChavicvat (amindi: Weather) -> String {
    switch amindi {
    case .sunny(Celsius: 25):
        return("გარეთ გრილი ტანსაცმელი ჩაიცვით")
    case .cloudy(Celsius: 15):
        return("ჟაკეტით ან ჟილეტით შეიფუთეთ გეთაყვა")
    case .rainy(Celsius: 5):
        return("დედუ თბილად ჩაიცვი არ დასველდე")
    case .snowy(Celsius: 0):
        return("თოვს დე რა და თბილად ჩაიცვი")
    default:
        return "error"
    }
}

raChavicvat(amindi: Weather.cloudy(Celsius: 15))

/* შექმენით struct-ი Kanye, ფროფერთებით: album, releaseYear. ამის შემდეგ შექმენით array-ი Kanye-ს ტიპის, ჩაამატეთ რამოდენიმე Kanye-ს ობიექტი, და შეავსეთ მასივი კანიეებით. დაწერეთ ფუნქცია, რომელიც მიიღებს ამ კანიეების მასივს და წელს. ფუნქციამ უნდა დაგვიბრუნოს ყველა ალბომი რომელიც გამოშვებულია გადაწოდებული წლის შემდეგ და დაბეჭდოს ისინი */

struct Kanye {
    var album = ""
    var releaseYear = 0
}

var kanyeArr = [
    Kanye(album: "College Dropout", releaseYear: 2004),
    Kanye(album: "Late Registration", releaseYear: 2005),
    Kanye(album: "Graduation", releaseYear: 2007),
    Kanye(album: "808s & Heartbreak", releaseYear: 2008),
    Kanye(album: "My Beautiful Dark Twisted Fantasy", releaseYear: 2010)
]
func anyeWanye (masivi: Array<Kanye>, year1: Int) -> Array<Kanye> {
    var albumsAfterYear1: [Kanye] = []
    for kanushka in masivi {
        if kanushka.releaseYear > year1 {
            albumsAfterYear1.append(kanushka)
        }
    }
    return albumsAfterYear1
}

print(anyeWanye(masivi: kanyeArr, year1: 2005)
      /* აქ ბეჭდავს მაგრამ რაღაც უცნაური ნაწერები ეწერება წინ და მაგაზე ხომ არ გაქვს თიფი რამე?*/


/* შექმენით String-ის ტიპის lazy property wrapper სახელად, cachedData. ინიციალიზება გაუკეთეთ ქლოჟერით რომელიც აბრუნებს სტრინგს მნიშვნელობით “lazy ინიციალიზებულია”. მიწვდით ამ ფროფერთის და დაბეჭდეთ მისი მნიშვნელობა */

@propertyWrapper
struct CachedData<String> {
    private var closure: () -> String
    private var value: String?

    var wrappedValue: String {
        mutating get {
            if value == nil {
                value = closure()
            }
            return value!
        }
    }

    init(wrappedValue: @escaping () -> String) {
        self.closure = wrappedValue
    }
}

struct struktura {
    var cachedValue: String = { "lazy დავაინიციალაიზეთ წვალებით" }()
}

var samagalitoStruktura = struktura()
print(samagalitoStruktura.cachedValue)

 /* ბევრი რესურსი ვერ ვნახე ამაზე ინტერნეტში და ვერ გავასწორე ბოლომდე
  escaping closure გამოვიყენე მაგრამ არვარ დარწმუნებული რომ სწორია, ოფშენალებს დავუმუღამე მგონი, btw ტაროების ამოცანა რომ ყოფილიყო ქულიანი ამის ნაცვლად მაგრად გაასწორებდა*/

