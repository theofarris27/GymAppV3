//
//  ContentView.swift
//  SwiftUICamera
//

import SwiftUI
import FirebaseStorage
import FirebaseFirestore

struct cameraView: View {
    
    func uploadPhoto() {
        let storageRef = Storage.storage().reference()
        let imageData = image?.jpegData(compressionQuality: 0.8)
        guard imageData != nil else {
            return
        }
        let fileRef = storageRef.child("images/\(UUID().uuidString).jpg")
        fileRef.putData(imageData!, metadata: nil)
    }
    
    
    @State private var showSheet: Bool = false
    @State private var showImagePicker: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    
    @State private var image: UIImage?
    
    var body: some View {
        
        NavigationView {
            
            VStack {

                Image(uiImage: image ?? UIImage(named: "hyunjun")!)
                    .resizable()
                    .frame(width: 600, height: 450)
                Button {
                    uploadPhoto()
                } label: {
                     Text("upload chosen photo")
                }
                Button("Choose Picture") {
                    self.showSheet = true
                }.padding()
                    .actionSheet(isPresented: $showSheet) {
                        ActionSheet(title: Text("Select Photo"), message: Text("Choose"), buttons: [
                            .default(Text("Photo Library")) {
                                self.showImagePicker = true
                                self.sourceType = .photoLibrary
                            },
                            .default(Text("Camera")) {
                                self.showImagePicker = true
                                self.sourceType = .camera
                            },
                            .cancel()
                        ])
                }
                
               
                
            }
                
                
            .navigationBarTitle("Choose Photo")
            
        }.sheet(isPresented: $showImagePicker) {
            ImagePicker(image: self.$image, isShown: self.$showImagePicker, sourceType: self.sourceType)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
