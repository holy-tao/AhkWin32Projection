#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BCryptCloseAlgorithmProviderFn.ahk" { BCryptCloseAlgorithmProviderFn }
#Import ".\BCryptDestroyKeyFn.ahk" { BCryptDestroyKeyFn }
#Import ".\BCryptSetPropertyFn.ahk" { BCryptSetPropertyFn }
#Import ".\BCryptGetPropertyFn.ahk" { BCryptGetPropertyFn }
#Import ".\BCryptSignHashFn.ahk" { BCryptSignHashFn }
#Import ".\BCryptImportKeyPairFn.ahk" { BCryptImportKeyPairFn }
#Import ".\BCryptOpenAlgorithmProviderFn.ahk" { BCryptOpenAlgorithmProviderFn }
#Import ".\BCRYPT_INTERFACE_VERSION.ahk" { BCRYPT_INTERFACE_VERSION }
#Import ".\BCryptGenerateKeyPairFn.ahk" { BCryptGenerateKeyPairFn }
#Import ".\BCryptFinalizeKeyPairFn.ahk" { BCryptFinalizeKeyPairFn }
#Import ".\BCryptExportKeyFn.ahk" { BCryptExportKeyFn }
#Import ".\BCryptVerifySignatureFn.ahk" { BCryptVerifySignatureFn }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCRYPT_SIGNATURE_FUNCTION_TABLE {
    #StructPack 8

    Version : BCRYPT_INTERFACE_VERSION

    OpenAlgorithmProvider : BCryptOpenAlgorithmProviderFn

    GetProperty : BCryptGetPropertyFn

    SetProperty : BCryptSetPropertyFn

    CloseAlgorithmProvider : BCryptCloseAlgorithmProviderFn

    GenerateKeyPair : BCryptGenerateKeyPairFn

    FinalizeKeyPair : BCryptFinalizeKeyPairFn

    SignHash : BCryptSignHashFn

    VerifySignature : BCryptVerifySignatureFn

    ImportKeyPair : BCryptImportKeyPairFn

    ExportKey : BCryptExportKeyFn

    DestroyKey : BCryptDestroyKeyFn

}
