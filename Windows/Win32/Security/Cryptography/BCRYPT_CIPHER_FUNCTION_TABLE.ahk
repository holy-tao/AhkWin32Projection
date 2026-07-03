#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BCRYPT_INTERFACE_VERSION.ahk" { BCRYPT_INTERFACE_VERSION }
#Import ".\BCryptCloseAlgorithmProviderFn.ahk" { BCryptCloseAlgorithmProviderFn }
#Import ".\BCryptDecryptFn.ahk" { BCryptDecryptFn }
#Import ".\BCryptDestroyKeyFn.ahk" { BCryptDestroyKeyFn }
#Import ".\BCryptDuplicateKeyFn.ahk" { BCryptDuplicateKeyFn }
#Import ".\BCryptEncryptFn.ahk" { BCryptEncryptFn }
#Import ".\BCryptExportKeyFn.ahk" { BCryptExportKeyFn }
#Import ".\BCryptGenerateSymmetricKeyFn.ahk" { BCryptGenerateSymmetricKeyFn }
#Import ".\BCryptGetPropertyFn.ahk" { BCryptGetPropertyFn }
#Import ".\BCryptImportKeyFn.ahk" { BCryptImportKeyFn }
#Import ".\BCryptOpenAlgorithmProviderFn.ahk" { BCryptOpenAlgorithmProviderFn }
#Import ".\BCryptSetPropertyFn.ahk" { BCryptSetPropertyFn }

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
