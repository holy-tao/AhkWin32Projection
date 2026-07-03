#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BCRYPT_INTERFACE_VERSION.ahk" { BCRYPT_INTERFACE_VERSION }
#Import ".\BCryptCloseAlgorithmProviderFn.ahk" { BCryptCloseAlgorithmProviderFn }
#Import ".\BCryptDeriveKeyFn.ahk" { BCryptDeriveKeyFn }
#Import ".\BCryptDestroyKeyFn.ahk" { BCryptDestroyKeyFn }
#Import ".\BCryptDestroySecretFn.ahk" { BCryptDestroySecretFn }
#Import ".\BCryptExportKeyFn.ahk" { BCryptExportKeyFn }
#Import ".\BCryptFinalizeKeyPairFn.ahk" { BCryptFinalizeKeyPairFn }
#Import ".\BCryptGenerateKeyPairFn.ahk" { BCryptGenerateKeyPairFn }
#Import ".\BCryptGetPropertyFn.ahk" { BCryptGetPropertyFn }
#Import ".\BCryptImportKeyPairFn.ahk" { BCryptImportKeyPairFn }
#Import ".\BCryptOpenAlgorithmProviderFn.ahk" { BCryptOpenAlgorithmProviderFn }
#Import ".\BCryptSecretAgreementFn.ahk" { BCryptSecretAgreementFn }
#Import ".\BCryptSetPropertyFn.ahk" { BCryptSetPropertyFn }

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
