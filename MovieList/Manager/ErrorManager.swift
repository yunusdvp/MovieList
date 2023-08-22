//
//  ErrorManager.swift
//  MovieList
//
//  Created by Yunus Emre ÖZŞAHİN on 22.08.2023.
//

import Foundation

enum DownloaderError : Error {
    case noUrl
    case noData
    case noDataProcess
}
