//
//  main.swift
//  MyCreditManager
//
//  Created by hwangJi on 2023/05/02.
//

import Foundation

var studentDict: [String: [String : String]] = [:]

while true {
    print("원하는 기능을 입력해주세요")
    print("1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")
    let command = readLine()!
    
    switch command {
    case "1":
        addStudent()
    case "2":
        delStudent()
    case "3":
        addScore()
    case "4":
        delScore()
    case "5":
        getAvlScore()
    case "X", "x":
        break
    default:
        print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
    }
}

// MARK: 학생추가
func addStudent() {
}

// MARK: 학생삭제
func delStudent() {
}

// MARK: 성적추가(변경)
func addScore() {
}

// MARK: 성적삭제
func delScore() {
}

// MARK: 평점보기
func getAvlScore() {
}

// MARK: 종료
func exitProgram() {
    
}
