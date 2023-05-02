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
        exit(1)
    default:
        print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
    }
}

// MARK: 학생추가
func addStudent() {
    print("추가할 학생의 이름을 입력해주세요")
    
    if let student = readLine() {
        // 잘못된 입력 처리
        if isCorrenctInput(student) {
            // 학생 추가
            if studentDict[student] == nil {
                studentDict[student] = [:]
                print("\(student) 학생을 추가했습니다.")
            } else { // 이미 존재하는 학생 처리
                print("\(student)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
            }
        }
    }
}

// MARK: 학생삭제
func delStudent() {
    print("삭제할 학생의 이름을 입력해주세요")
    
    if let student = readLine() {
        // 잘못된 입력 처리
        if isCorrenctInput(student) {
            if studentDict[student] == nil {
                print("\(student) 학생을 찾지 못했습니다.")
            } else {
                studentDict.removeValue(forKey: student)
                print("\(student) 학생을 삭제하였습니다.")
            }
        }
    }
    
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

// MARK: 올바른 입력인지 확인
func isCorrenctInput(_ input: String) -> Bool {
    if input == "" || input == " " || input == "\n" || Int(input) != nil {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
        return false
    }
    
    return true
}
