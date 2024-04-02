//
//  ViewModel.swift
//  ChatApplication
//
//  Created by neosoft on 02/04/24.
import Foundation
class Chatviewmodel {
    var replies = fetchReplyData()
    func getReply(for question: String) -> String? {
        for replyModel in replies {
            if replyModel.question.lowercased() == question.lowercased() {
                return replyModel.reply
            }
        }
        return nil // Return nil if no reply found for the question
    }
}
