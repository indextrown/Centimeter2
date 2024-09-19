//
//  CMWritePage.swift
//  Centimeter
//
//  Created by 김동현 on 9/19/24.
//

import SwiftUI
import UIKit

// MARK: - 글작성 페이지
struct CMWritePage: View {
    @Environment(\.dismiss) var dismiss
    @State private var title: String = ""
    @State private var content: String = ""
    
    
    var body: some View {
        
        VStack(spacing: 50) {
            
            TextField("제목을 입력하세요", text: $title)
            .padding() // 내부 여백 추가
            .background(Color.white) // 배경색 설정
            .clipShape(RoundedRectangle(cornerRadius: 10)) // 둥글게 자르기
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1) // 테두리 추가
            )
            .padding(.horizontal, 20)
            .padding(.vertical, -30)
                
                
            
            TextEditor(text: $content)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.gray, lineWidth: 1)
                )
                .padding(.horizontal, 20)
                .frame(height: 200)
            Spacer()



        }
        .contentShape(Rectangle()) // 전체 영역을 감지할 수 있도록 설정
        .onTapGesture {
            self.endTextEditing()
        }
        
        
        // 기본 뒤로가기 버튼 숨기기
        .navigationBarBackButtonHidden(true)
        
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    HStack{
                        Image(systemName: "chevron.left") // 사용자 정의 뒤로가기 아이콘
                            .foregroundColor(.black) // 아이콘 색상을 검은색으로 설정
                        Text("뒤로가기")
                            .foregroundColor(.black)
                    }
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    
                }) {
                    Text("저장")
                        .padding(.horizontal, 20)
                        .foregroundColor(.black)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

//#Preview {
//    CMWritePage()
//}



extension View {
    func endTextEditing() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil, from: nil, for: nil)
    }
}









































//
//
//import SwiftUI
//import UIKit
//
//// MARK: - 글작성 페이지
//struct CMWritePage: View {
//    @Environment(\.dismiss) var dismiss
//    @State private var title: String = ""
//    @State private var content: String = ""
//    
//    
//    var body: some View {
//        
//        VStack(alignment: .leading, spacing: 50) {
//            
//            TextField("제목을 입력하세요", text: $title)
//            .padding() // 내부 여백 추가
//            .background(Color.white) // 배경색 설정
//            .clipShape(RoundedRectangle(cornerRadius: 10)) // 둥글게 자르기
//            .overlay(
//                RoundedRectangle(cornerRadius: 10)
//                    .stroke(Color.gray, lineWidth: 1) // 테두리 추가
//            )
//            .padding(.horizontal, 20)
//            .padding(.vertical, -30)
//                
//                
//            TextEditor(text: $content)
//                .padding()
//                .overlay(
//                    RoundedRectangle(cornerRadius: 10)
//                        .stroke(.gray, lineWidth: 1)
//                )
//                .padding(.horizontal, 20)
//                .frame(height: 200)
//                .onTapGesture {
//                    self.endTextEditing()
//                }
//
//            Spacer()
//
//
//        }
//        // 기본 뒤로가기 버튼 숨기기
//        .navigationBarBackButtonHidden(true)
//        
//        .toolbar {
//            ToolbarItem(placement: .navigationBarLeading) {
//                Button(action: {
//                    dismiss()
//                }) {
//                    HStack{
//                        Image(systemName: "chevron.left") // 사용자 정의 뒤로가기 아이콘
//                            .foregroundColor(.black) // 아이콘 색상을 검은색으로 설정
//                        Text("뒤로가기")
//                            .foregroundColor(.black)
//                    }
//                }
//            }
//            
//            ToolbarItem(placement: .navigationBarTrailing) {
//                Button(action: {
//                    
//                }) {
//                    Text("저장")
//                        .padding(.horizontal, 20)
//                        .foregroundColor(.black)
//                }
//            }
//        }
//    }
//}
//
//#Preview {
//    CMWritePage()
//}
//
//
//
//extension View {
//    func endTextEditing() {
//        UIApplication.shared.sendAction(
//            #selector(UIResponder.resignFirstResponder),
//            to: nil, from: nil, for: nil)
//    }
//}
//
//
//
//
