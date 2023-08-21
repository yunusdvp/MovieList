//
//  DowloaderService.swift
//  MovieList
//
//  Created by Yunus Emre ÖZŞAHİN on 21.08.2023.
//

import Foundation
//deneme
//ikinci deneme
class DownloaderClient{
    func downloadMovie(search: String, completion: @escaping(Result<[Movie]?,DownloaderError>) -> Void) {
        guard let url = URL(string: "http://www.omdbapi.com/?i=tt3896198&apikey=b5ddf4f0") else {
            return completion(.failure(.noUrl))
        }
    }
}

enum DownloaderError : Error {
    case noUrl
    case noData
    case noDataProcess
}
