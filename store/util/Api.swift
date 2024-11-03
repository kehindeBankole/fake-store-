//
//  Api.swift
//  store
//
//  Created by Kehinde Bankole on 02/11/2024.
//

import Foundation


enum ApiError: LocalizedError {
    case badParsing(String)
    case badRequest(String)
    case networkError(Error)
    case invalidHTTPStatusCode(Int)
    case unauthorized
    case noData
    case invalidURL
    case serverError
    
    var errorDescription: String? {
        switch self {
        case .badParsing(let message):
            return "Failed to parse data: \(message)"
        case .badRequest(let message):
            return "Bad request: \(message)"
        case .networkError(let error):
            return "Network error: \(error.localizedDescription)"
        case .invalidHTTPStatusCode(let code):
            return "Server error with status code: \(code)"
        case .unauthorized:
            return "Unauthorized access. Please check your credentials."
        case .noData:
            return "No data received from server"
        case .invalidURL:
            return "Invalid URL provided"
        case .serverError:
            return "Server error"
        }
    }
}
class Api{
    static func makeApiCall<T : Decodable>(url:String) async throws -> T?{
        
        if let url = URL(string: url){
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "GET"
            let (data , response) = try await URLSession.shared.data(for: urlRequest)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw ApiError.invalidHTTPStatusCode(0)
            }
            
            switch httpResponse.statusCode{
            case 200...299 :
                do{
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    return decodedData
                }catch{
                    throw ApiError.badParsing("bad parsing")
                }
            case 400...409:
                throw ApiError.badRequest("Client error with status code: \(httpResponse.statusCode)")
            case 500...599:
                throw ApiError.serverError
            default:
                throw ApiError.invalidHTTPStatusCode(httpResponse.statusCode)
            }
            
        }
        
        return nil
    }
}
