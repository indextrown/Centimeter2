//
//  testView.swift
//  Centimeter
//
//  Created by 김동현 on 9/19/24.
//


import SwiftUI

struct TesttView: View {
    // 메모를 저장할 배열
    @State private var memoList: [String] = []
    @State private var newMemo: String = ""
    
    var body: some View {
        VStack {
            // 고정된 상단 줄자 헤더
            Text("센치(CM)")
                .font(.largeTitle)
                .padding()
            
            // 줄자와 메모가 표시되는 스크롤 뷰
            ScrollView {
                VStack(alignment: .leading) {
                    // 각 메모가 추가될 때마다 줄자가 길어짐
                    ForEach(memoList.indices, id: \.self) { index in
                        MemoRow(memo: memoList[index], index: index)
                    }
                }
                .padding(.leading, 16)
            }
            
            // 메모 입력창과 추가 버튼
            HStack {
                TextField("메모 입력", text: $newMemo)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(minWidth: 0, maxWidth: .infinity)
                
                Button(action: {
                    if !newMemo.isEmpty {
                        memoList.append(newMemo)
                        newMemo = ""
                    }
                }) {
                    Text("추가")
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
        }
    }
}

// 줄자 줄과 메모를 나타내는 Row
struct MemoRow: View {
    let memo: String
    let index: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // 줄자 표시 (1cm 단위)
            HStack {
                Text("\(index * 10)cm")
                    .font(.caption)
                    .foregroundColor(.gray)
                Rectangle()
                    .frame(width: 100, height: 1)
                    .foregroundColor(.gray)
            }
            
            // 메모 내용
            Text(memo)
                .padding()
                .background(Color.yellow.opacity(0.2))
                .cornerRadius(8)
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    TesttView()
}
