import UIKit


class Book {
    var pages: [Page] = []
    
    init(texts: [String]) {
        self.pages = texts.map({ (text) -> Page in
            Page(text: text, book: self)
        })
    }
    
    init(pages: [Page]) {
        self.pages = pages
    }
}

class Page {
    var text: String
    
    weak var book: Book?
    
    init(text: String = "", book: Book) {
        self.text = text
        self.book = book
    }
}
