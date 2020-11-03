import UIKit


class Book {
    var pages: [Page] = []
    var title: String
    var writerName: String
    var numberOfPages: Int {
        get {
            return pages.count
        }
    }
    
    init(texts: [String], writerName: String, title: String){
        self.writerName = writerName
        self.title = title
        self.pages = texts.map({ (text) -> Page in
            return Page(text: text, book: self)
        })
    }
    
    init(pages: [Page], writerName: String, title: String) {
        self.pages = pages
        self.writerName = writerName
        self.title = title
    }
}

class Page {
    var text: String
    
    weak var book: Book?
    
    init(text: String = "", book: Book?) {
        self.text = text
        self.book = book
    }
}
