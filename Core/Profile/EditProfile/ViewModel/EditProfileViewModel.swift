//
//  EditProfileViewModel.swift
//  Threads Clone
//
//  Created by Garrett Hanberg on 9/5/23.
//

import SwiftUI
import PhotosUI

class EditProfileViewModel: ObservableObject {
    @Published var selectedItem: PhotosPickerItem? {
        didSet { Task {await loadImage() } }
    }
    @Published var profileImage: Image?
    private var uiImage: UIImage?
    
    func updateUserData() async throws {
        try await updateProfileImage()
    }
    
    @MainActor
    private func loadImage() async {
        guard let item = selectedItem else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    private func updateProfileImage() async throws {
        guard let image = self.uiImage else { return }
        guard let imageUrl = try? await ImageUploader.uploadImage(image) else { return }
        try await UserService.shared.updateUserProfileImage(withImageUrl: imageUrl)
    }
}
