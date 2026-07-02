#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BCryptSecretAgreementFn.ahk" { BCryptSecretAgreementFn }
#Import ".\BCryptCloseAlgorithmProviderFn.ahk" { BCryptCloseAlgorithmProviderFn }
#Import ".\BCryptImportKeyPairFn.ahk" { BCryptImportKeyPairFn }
#Import ".\BCryptExportKeyFn.ahk" { BCryptExportKeyFn }
#Import ".\BCryptDestroySecretFn.ahk" { BCryptDestroySecretFn }
#Import ".\BCryptFinalizeKeyPairFn.ahk" { BCryptFinalizeKeyPairFn }
#Import ".\BCryptSetPropertyFn.ahk" { BCryptSetPropertyFn }
#Import ".\BCryptDeriveKeyFn.ahk" { BCryptDeriveKeyFn }
#Import ".\BCryptGenerateKeyPairFn.ahk" { BCryptGenerateKeyPairFn }
#Import ".\BCryptGetPropertyFn.ahk" { BCryptGetPropertyFn }
#Import ".\BCryptOpenAlgorithmProviderFn.ahk" { BCryptOpenAlgorithmProviderFn }
#Import ".\BCryptDestroyKeyFn.ahk" { BCryptDestroyKeyFn }
#Import ".\BCRYPT_INTERFACE_VERSION.ahk" { BCRYPT_INTERFACE_VERSION }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCRYPT_SECRET_AGREEMENT_FUNCTION_TABLE {
    #StructPack 8

    Version : BCRYPT_INTERFACE_VERSION

    OpenAlgorithmProvider : BCryptOpenAlgorithmProviderFn

    GetProperty : BCryptGetPropertyFn

    SetProperty : BCryptSetPropertyFn

    CloseAlgorithmProvider : BCryptCloseAlgorithmProviderFn

    SecretAgreement : BCryptSecretAgreementFn

    DeriveKey : BCryptDeriveKeyFn

    DestroySecret : BCryptDestroySecretFn

    GenerateKeyPair : BCryptGenerateKeyPairFn

    FinalizeKeyPair : BCryptFinalizeKeyPairFn

    ImportKeyPair : BCryptImportKeyPairFn

    ExportKey : BCryptExportKeyFn

    DestroyKey : BCryptDestroyKeyFn

}
