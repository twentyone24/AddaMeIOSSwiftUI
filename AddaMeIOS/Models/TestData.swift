//
//  Data.swift
//  AddaMeIOS
//
//  Created by Saroar Khandoker on 26.08.2020.
//

import UIKit
import SwiftUI
import CoreLocation

struct EventStaticData: Codable {
    let items: [Item]
    let metadata: Metadata
    
    // MARK: - Item
    struct Item: Codable, Identifiable {
        let categories: String
        let id, ownerId, name: String
        let conversationsId, imageURL: String?
        let duration: Int
        let createdAt: String
        let updatedAt: String
        let deletedAt: String?
    }

    // MARK: - Metadata
    struct Metadata: Codable {
        let per, total, page: Int
    }

}



let eventData: EventResponse = load("eventResponseData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

//
//final class ImageStore {
//    typealias _ImageDictionary = [String: CGImage]
//    fileprivate var images: _ImageDictionary = [:]
//
//    fileprivate static var scale = 2
//    
//    static var shared = ImageStore()
//    
//    func image(name: String) -> Image {
//        let index = _guaranteeImage(name: name)
//        
//        return Image(images.values[index], scale: CGFloat(ImageStore.scale), label: Text(name))
//    }
//
//    static func loadImage(name: String) -> CGImage {
//        guard
//            let url = Bundle.main.url(forResource: name, withExtension: "jpg"),
//            let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
//            let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
//        else {
//            fatalError("Couldn't load image \(name).jpg from main bundle.")
//        }
//        return image
//    }
//    
//    fileprivate func _guaranteeImage(name: String) -> _ImageDictionary.Index {
//        if let index = images.index(forKey: name) { return index }
//        
//        images[name] = ImageStore.loadImage(name: name)
//        return images.index(forKey: name)!
//    }
//}
//
