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
    print("성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력예) Mickey Swift A+\n만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.")
    
    if let command = readLine() {
        if isCorrenctInput(command) {
            let command = command.components(separatedBy: .whitespaces)
            
            if command.count == 3 {
                let student = command[0]
                let subject = command[1]
                let score = command[2]
                
                if score != "A+" && score != "A" && score != "B+" && score != "B" && score != "C+" && score != "C" && score != "D+" && score != "D" && score != "F" {
                    print("입력이 잘못되었습니다. 다시 확인해주세요.")
                } else {
                    if let _ = studentDict[student] {
                        studentDict[student]![subject] = score
                        print("\(student) 학생의 \(subject) 과목이 \(score)로 추가(변경) 되었습니다.")
                    } else {
                        print("\(student) 학생을 찾지 못했습니다.")
                    }
                }
            } else {
                print("입력이 잘못되었습니다. 다시 확인해주세요.")
            }
        }
    }
}

// MARK: 성적삭제
func delScore() {
    print("성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력예) Mickey Swift")
    
    if let command = readLine() {
        if isCorrenctInput(command) {
            let command = command.components(separatedBy: .whitespaces)
            
            if command.count == 2 {
                let student = command[0]
                let subject = command[1]
                
                if let _ = studentDict[student] {
                    studentDict[student]!.removeValue(forKey: subject)
                    print("\(student) 학생의 \(subject) 과목의 성적이 삭제되었습니다.")
                } else {
                    print("\(student) 학생을 찾지 못했습니다.")
                }
            } else {
                print("입력이 잘못되었습니다. 다시 확인해주세요.")
            }
        }
    }
}

// MARK: 평점보기
func getAvlScore() {
    print("평점을 알고싶은 학생의 이름을 입력해주세요")
    
    if let student = readLine() {
        if isCorrenctInput(student) {
            if let studentSubjectDict = studentDict[student] {
                var sum: Double = 0
                
                studentSubjectDict.forEach({
                    print("\($0.key): \($0.value)")
                    
                    switch $0.value {
                    case "A+":
                        sum += 4.5
                    case "A":
                        sum += 4
                    case "B+":
                        sum += 3.5
                    case "B":
                        sum += 3
                    case "C+":
                        sum += 2.5
                    case "C":
                        sum += 2
                    case "D+":
                        sum += 1.5
                    case "D":
                        sum += 1
                    default:
                        sum += 0
                    }
                })
                
                print("평점 : ", String(format: "%.2f", sum / Double(studentSubjectDict.count)))
            } else {
                print("\(student) 학생을 찾지 못했습니다.")
            }
        }
    }
}

// MARK: 프로그램 종료
func exitProgram() {
    print("프로그램을 종료합니다...")
    exit(0)
}

// MARK: 올바른 입력인지 확인
func isCorrenctInput(_ input: String) -> Bool {
    if input == "" || input == " " || input == "\n" || Int(input) != nil {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
        return false
    }
    
    return true
}
