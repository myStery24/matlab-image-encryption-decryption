# Image Encryption & Decryption
A MATLAB program that encrypts and decrypts an image using XOR (One Time Pad) operation. XOR operation encrypts the plaintext and decrypts its ciphertext using the same key which makes the ciphertext hard to crack by brute force (Wagner, 2020). This program presents a graphical user interface (GUI) to users that let them choose between uploading, encrypting or decrypting an image. The accepted image formats are Joint Photographic Experts Group (.jpg), Tag Image File Format (.tiff) and Portable Graphics Format (.png) in either true-colour (RGB) or grayscale images. An encryption key is generated automatically to scramble and rearrange the information that represents the input image. The output will be saved in the images folder.

### Features
- Encryption: Encrypt images with an auto generated key.
- Decryption: Decrypt images with the encrypted key.

### Files
| Name             | Description                                                               |
|------------------|---------------------------------------------------------------------------|
| results  | A folder to store/save the encrypted (Encoded.jpg) and decrypted (Decoded.jpg) images. |
| FSKTM_Image.png   | A PNG image for encryption. |
| imageEncryptionGui.fig | Edit this file if you want to make changes to the user interface of the program.                        |
| imageEncryptionGui.m        | Run this file to begin with the encryption and decryption operation.              |
| imageProcess.m    |  Encrypt and decrypt using XOR. |
| keyGen.m   | Generate a key. |
| license.txt   | A license document. |

### References
| No. | Website                                                                                                                                                                                                                                                  |
|-----|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 1.  | [Image Encryption by busy](https://www.mathworks.com/matlabcentral/fileexchange/27698-image-encryption)                                                                                                                             |
| 2.  | [Why is Exclusive Or (XOR) Important in Cryptography?](https://blog.boot.dev/cryptography/why-xor-in-cryptography/)                                                                                                                              |
