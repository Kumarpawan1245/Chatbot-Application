//
//  ModelData.swift
//  ChatApplication
//
//  Created by neosoft on 28/03/24.
//

import Foundation

struct ChatAppUser
{
    let firstName : String
    let lastName : String
    let emailAdress : String
}


struct ReplyModel {
    let question: String
    let reply: String
}

// Function to fetch replies using the model
func fetchReplyData() -> [ReplyModel] {
    let replyData = [
        ReplyModel(question: "hellow", reply: "How are you?"),
        ReplyModel(question: "and you", reply: "All good"),
        ReplyModel(question: "office?", reply: "Available in office"),
        ReplyModel(question: "Working?", reply: "yes"),
        ReplyModel(question: "good night", reply: "good night"),
        ReplyModel(question: "Fine", reply: "And you"),
        ReplyModel(question: "thanks", reply: "welcome"),
        ReplyModel(question: "sir come?", reply: "yes"),
        ReplyModel(question: "project done?", reply: "Rightnow working"),
        ReplyModel(question: "I love India", reply: "I also"),
        ReplyModel(question: "what's up", reply: "Nothing special"),
        ReplyModel(question: "hyy", reply: "Hellow"),
        ReplyModel(question: "nyc to meet you", reply: "thansk my pleasure"),
        ReplyModel(question: "good", reply: "thansk my pleasure")
        
    ]
    return replyData
}

