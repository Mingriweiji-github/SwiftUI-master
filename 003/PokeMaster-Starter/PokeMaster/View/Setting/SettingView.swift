//
//  SettingView.swift
//  PokeMaster
//
//  Created by longhuadmin on 2020/7/15.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import SwiftUI
struct SettingView: View {
    @ObservedObject var settings = Settings()
    var body: some View {
        Form {
            accountSection
            optionalSection
            actionSection
        }
    }
    
    var accountSection: some View {
        Section(header: Text("账户")) {
            //1
            Picker(
                selection: $settings.accountBehavior,
                label: Text("")) {
                    ForEach(Settings.AccountBehavior.allCases, id: \.self) {
                        Text($0.text)
                    }
            }// Picker
            
            // 2
            .pickerStyle(SegmentedPickerStyle())
            // 3
            TextField("电子邮箱", text: $settings.email)
            SecureField("密码", text: $settings.password)
            
            //4
            if settings.accountBehavior == .register {
                SecureField("确认密码", text: $settings.verifyPassword)
            }
            
            // 5
            Button(settings.accountBehavior.text) {
                print("登录/注册")
            }
        }
    }
    
    var optionalSection: some View {
        Section(header: Text("选项")) {
            HStack(alignment: .center) {
                //1
                Toggle(isOn: $settings.showEnName) {
                    Text("显示英文名")
                }
                // 2
                Picker(selection: $settings.sorting, label: Text("排序方式")) {
            
                    ForEach(Settings.Sorting.allCases, id: \.self) {
                        Text($0.text)
                    }
                    
                }
                // 3
                Toggle(isOn: $settings.showFavoriteOnly) {
                    Text("只显示收藏")
                }
            }
            
        }
    }
    
    var actionSection: some View {
        Section {
            Button(action: {
                print("清空缓存")
            }) {
                Text("清空缓存")
                    .font(.system(size: 15))
                    .foregroundColor(.red)
                
            }
        }
    }
    
}
class Settings: ObservableObject {
    enum AccountBehavior: CaseIterable {
        case register,login
    }
    
    enum Sorting: CaseIterable {
        case id, name, color, favorite
    }
    
    @Published var accountBehavior = AccountBehavior.login
    @Published var email = ""
    @Published var password = ""
    @Published var verifyPassword = ""
    
    @Published var showEnName = true
    @Published var sorting = Sorting.id
    @Published var showFavoriteOnly = false
}
extension Settings.AccountBehavior {
    var text: String {
        switch self {
        case .register:
            return "注册"
        case .login:
            return "登录"
        }
    }
}
extension Settings.Sorting {
    var text: String {
        switch self {
        case .id: return "ID"
        case .name: return "名字"
        case .color: return "颜色"
        case .favorite: return "最爱"
        }
    }
}
