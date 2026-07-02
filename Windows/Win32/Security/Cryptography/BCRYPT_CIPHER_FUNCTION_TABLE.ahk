#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BCryptGenerateSymmetricKeyFn.ahk" { BCryptGenerateSymmetricKeyFn }
#Import ".\BCryptCloseAlgorithmProviderFn.ahk" { BCryptCloseAlgorithmProviderFn }
#Import ".\BCryptExportKeyFn.ahk" { BCryptExportKeyFn }
#Import ".\BCryptImportKeyFn.ahk" { BCryptImportKeyFn }
#Import ".\BCryptEncryptFn.ahk" { BCryptEncryptFn }
#Import ".\BCryptSetPropertyFn.ahk" { BCryptSetPropertyFn }
#Import ".\BCryptGetPropertyFn.ahk" { BCryptGetPropertyFn }
#Import ".\BCryptDuplicateKeyFn.ahk" { BCryptDuplicateKeyFn }
#Import ".\BCryptOpenAlgorithmProviderFn.ahk" { BCryptOpenAlgorithmProviderFn }
#Import ".\BCryptDecryptFn.ahk" { BCryptDecryptFn }
#Import ".\BCryptDestroyKeyFn.ahk" { BCryptDestroyKeyFn }
#Import ".\BCRYPT_INTERFACE_VERSION.ahk" { BCRYPT_INTERFACE_VERSION }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCRYPT_CIPHER_FUNCTION_TABLE {
    #StructPack 8

    Version : BCRYPT_INTERFACE_VERSION

    OpenAlgorithmProvider : BCryptOpenAlgorithmProviderFn

    GetProperty : BCryptGetPropertyFn

    SetProperty : BCryptSetPropertyFn

    CloseAlgorithmProvider : BCryptCloseAlgorithmProviderFn

    GenerateKey : BCryptGenerateSymmetricKeyFn

    Encrypt : BCryptEncryptFn

    Decrypt : BCryptDecryptFn

    ImportKey : BCryptImportKeyFn

    ExportKey : BCryptExportKeyFn

    DuplicateKey : BCryptDuplicateKeyFn

    DestroyKey : BCryptDestroyKeyFn

}
