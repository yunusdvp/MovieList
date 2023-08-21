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
        guard let url = URL(string: "http://www.omdbapi.com/?s=\(search)apikey=b5ddf4f0") else {
            return completion(.failure(.noUrl))
        }
        URLSession.shared.dataTask(with: url){ (data,response,error) in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
                
            }
            guard let MovieResponse = try? JSONDecoder().decode(MoviesResults.self, from: data) else{
                    return completion(.failure(.noDataProcess))
                }
            completion(.success(MovieResponse.movies))
        }.resume()
        }
    }

    
    enum DownloaderError : Error {
        case noUrl
        case noData
        case noDataProcess
    }

