//
//  DownloaderService.swift
//  MovieList
//
//  Created by Başak on 21.08.2023.
//

import Foundation

class DownloaderClient{
    func downloadMovie(search: String, completion: @escaping(Result<[Movie]?,DownloaderError>) -> Void) {
        guard let url = URL(string: "https://www.omdbapi.com/?s=\(search)&apikey=f5133d7") else {
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
