#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BCRYPT_INTERFACE_VERSION.ahk" { BCRYPT_INTERFACE_VERSION }
#Import ".\BCryptCloseAlgorithmProviderFn.ahk" { BCryptCloseAlgorithmProviderFn }
#Import ".\BCryptDecryptFn.ahk" { BCryptDecryptFn }
#Import ".\BCryptDestroyKeyFn.ahk" { BCryptDestroyKeyFn }
#Import ".\BCryptEncryptFn.ahk" { BCryptEncryptFn }
#Import ".\BCryptExportKeyFn.ahk" { BCryptExportKeyFn }
#Import ".\BCryptFinalizeKeyPairFn.ahk" { BCryptFinalizeKeyPairFn }
#Import ".\BCryptGenerateKeyPairFn.ahk" { BCryptGenerateKeyPairFn }
#Import ".\BCryptGetPropertyFn.ahk" { BCryptGetPropertyFn }
#Import ".\BCryptImportKeyPairFn.ahk" { BCryptImportKeyPairFn }
#Import ".\BCryptOpenAlgorithmProviderFn.ahk" { BCryptOpenAlgorithmProviderFn }
#Import ".\BCryptSetPropertyFn.ahk" { BCryptSetPropertyFn }
#Import ".\BCryptSignHashFn.ahk" { BCryptSignHashFn }
#Import ".\BCryptVerifySignatureFn.ahk" { BCryptVerifySignatureFn }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCRYPT_ASYMMETRIC_ENCRYPTION_FUNCTION_TABLE {
    #StructPack 8

    Version : BCRYPT_INTERFACE_VERSION

    OpenAlgorithmProvider : BCryptOpenAlgorithmProviderFn

    GetProperty : BCryptGetPropertyFn

    SetProperty : BCryptSetPropertyFn

    CloseAlgorithmProvider : BCryptCloseAlgorithmProviderFn

    GenerateKeyPair : BCryptGenerateKeyPairFn

    FinalizeKeyPair : BCryptFinalizeKeyPairFn

    Encrypt : BCryptEncryptFn

    Decrypt : BCryptDecryptFn

    ImportKeyPair : BCryptImportKeyPairFn

    ExportKey : BCryptExportKeyFn

    DestroyKey : BCryptDestroyKeyFn

    SignHash : BCryptSignHashFn

    VerifySignature : BCryptVerifySignatureFn

}
