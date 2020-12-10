//  Models.swift
//  JSONParsingWithCodableOfOneOfTheMostComplexJSONDataFromLocal
//  Created by Ranjeet Raushan on 12/11/20.
//  Copyright © 2020 Ranjeet Raushan. All rights reserved.

import Foundation
   import  UIKit  
   
   struct Result : Codable {
       let success : Bool?
       let total_count : Int?
       let message : String?
       let data : Datas?
       
       enum CodingKeys: String, CodingKey {
           
           case success = "success"
           case total_count = "total_count"
           case message = "message"
           case data = "data"
       }
       
       init(from decoder: Decoder) throws {
           let values = try decoder.container(keyedBy: CodingKeys.self)
           success = try values.decodeIfPresent(Bool.self, forKey: .success)
           total_count = try values.decodeIfPresent(Int.self, forKey: .total_count)
           message = try values.decodeIfPresent(String.self, forKey: .message)
           data = try values.decodeIfPresent(Datas.self, forKey: .data)
       }
    
    struct Datas : Codable {
          let connections : [Connections]?
          let totalCount : Int?
          
          enum CodingKeys: String, CodingKey {
              
              case connections = "connections"
              case totalCount = "totalCount"
          }
          
          init(from decoder: Decoder) throws {
              let values = try decoder.container(keyedBy: CodingKeys.self)
              connections = try values.decodeIfPresent([Connections].self, forKey: .connections)
              totalCount = try values.decodeIfPresent(Int.self, forKey: .totalCount)
          }
          
        struct Connections : Codable {
            let connectionId : Int?
            let inviteeProvider : InviteeProvider?
            
            enum CodingKeys: String, CodingKey {
                
                case connectionId = "connectionId"
                case inviteeProvider = "inviteeProvider"
            }
            
            init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                connectionId = try values.decodeIfPresent(Int.self, forKey: .connectionId)
                inviteeProvider = try values.decodeIfPresent(InviteeProvider.self, forKey: .inviteeProvider)
            }
            struct InviteeProvider : Codable {
                let providerid : Int?
                let offices : [Offices]?
                let user : User?
                
                enum CodingKeys: String, CodingKey {
                    
                    case providerid = "providerid"
                    case offices = "offices"
                    case user = "user"
                }
                
                init(from decoder: Decoder) throws {
                    let values = try decoder.container(keyedBy: CodingKeys.self)
                    providerid = try values.decodeIfPresent(Int.self, forKey: .providerid)
                    offices = try values.decodeIfPresent([Offices].self, forKey: .offices)
                    user = try values.decodeIfPresent(User.self, forKey: .user)
                }
                
            }
            
        }
      }
    
       
   }
   
  
   
   
   
   struct Offices : Codable {
       let oid : Int?
       let pgId : Int?
      
       let fullAddress : String? // ye chahiye
    
       
       enum CodingKeys: String, CodingKey {
           
           case oid = "oid"
           case pgId = "pgId"
          
           case fullAddress = "fullAddress"
          
       }
       
       init(from decoder: Decoder) throws {
           let values = try decoder.container(keyedBy: CodingKeys.self)
           oid = try values.decodeIfPresent(Int.self, forKey: .oid)
           pgId = try values.decodeIfPresent(Int.self, forKey: .pgId)
          
           fullAddress = try values.decodeIfPresent(String.self, forKey: .fullAddress)
         
       }
       
   }
   struct User : Codable {
       let id : Int? //
       let email : String? // ye chahiye
      
       
       enum CodingKeys: String, CodingKey {
           
           case id = "id"
           case email = "email"
           
       }
       
       init(from decoder: Decoder) throws {
           let values = try decoder.container(keyedBy: CodingKeys.self)
           id = try values.decodeIfPresent(Int.self, forKey: .id)
           email = try values.decodeIfPresent(String.self, forKey: .email)
          
       }
       
   }
   
