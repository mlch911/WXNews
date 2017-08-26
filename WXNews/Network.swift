//
//  Network.swift
//  WXNews
//
//  Created by 闵罗琛 on 2017/8/1.
//  Copyright © 2017年 闵罗琛. All rights reserved.
//

import Foundation
import Moya

enum Network {
    case category
}

extension Network: TargetType{
    var baseURL: URL{
        let baseurl = "http://localhost:8888/wordpress/api"
        return URL(string: baseurl)!
    }
    
    var path: String{
        switch self {
        case .category:
            return "/get_category_index"
//        default:
//            break
        }
    }
    
    var method: Moya.Method{
        switch self {
        case .category:
            return .get
//        default:
//            break
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .category:
            return nil
//        default:
//            break
        }
    }
    
    var parameterEncoding: ParameterEncoding{
        switch self {
        case .category:
            return URLEncoding.default
//        default:
//            break
        }
    }
    
    var sampleData: Data{
        switch self {
        case .category:
            return "Category test data".utf8Encoded
//        default:
//            break
        }
    }
    
    var task: Task{
        switch self {
        case .category:
            return .request
//        default:
//            break
        }
    }
}

// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return self.data(using: .utf8)!
    }
}
