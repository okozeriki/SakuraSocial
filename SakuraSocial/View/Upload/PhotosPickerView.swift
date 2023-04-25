//
//  PhotosPickerView.swift
//  SakuraSocial
//
//  Created by 本村力希 on 2023/04/26.
//

import SwiftUI
import PhotosUI

struct PhotosPickerView: View {
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    var body: some View {
        PhotosPicker(
                selection: $selectedItem) {
                    Text("Select a photo")
                }
                .onChange(of: selectedItem) { newItem in
                                Task {
                                    // Retrieve selected asset in the form of Data
                                    if let data = try? await newItem?.loadTransferable(type: Data.self) {
                                        selectedImageData = data
                                    }
                                }
                            }
                        
                        if let selectedImageData,
                           let uiImage = UIImage(data: selectedImageData) {
                            VStack{
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFit()
                                .frame(width: 250, height: 250)}
                        }
    }
}

struct PhotosPickerView_Previews: PreviewProvider {
    static var previews: some View {
        PhotosPickerView()
    }
}
