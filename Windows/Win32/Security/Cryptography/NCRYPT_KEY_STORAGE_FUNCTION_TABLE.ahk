#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BCRYPT_INTERFACE_VERSION.ahk" { BCRYPT_INTERFACE_VERSION }
#Import ".\NCryptCreateClaimFn.ahk" { NCryptCreateClaimFn }
#Import ".\NCryptCreatePersistedKeyFn.ahk" { NCryptCreatePersistedKeyFn }
#Import ".\NCryptDecryptFn.ahk" { NCryptDecryptFn }
#Import ".\NCryptDeleteKeyFn.ahk" { NCryptDeleteKeyFn }
#Import ".\NCryptDeriveKeyFn.ahk" { NCryptDeriveKeyFn }
#Import ".\NCryptEncryptFn.ahk" { NCryptEncryptFn }
#Import ".\NCryptEnumAlgorithmsFn.ahk" { NCryptEnumAlgorithmsFn }
#Import ".\NCryptEnumKeysFn.ahk" { NCryptEnumKeysFn }
#Import ".\NCryptExportKeyFn.ahk" { NCryptExportKeyFn }
#Import ".\NCryptFinalizeKeyFn.ahk" { NCryptFinalizeKeyFn }
#Import ".\NCryptFreeBufferFn.ahk" { NCryptFreeBufferFn }
#Import ".\NCryptFreeKeyFn.ahk" { NCryptFreeKeyFn }
#Import ".\NCryptFreeProviderFn.ahk" { NCryptFreeProviderFn }
#Import ".\NCryptFreeSecretFn.ahk" { NCryptFreeSecretFn }
#Import ".\NCryptGetKeyPropertyFn.ahk" { NCryptGetKeyPropertyFn }
#Import ".\NCryptGetProviderPropertyFn.ahk" { NCryptGetProviderPropertyFn }
#Import ".\NCryptImportKeyFn.ahk" { NCryptImportKeyFn }
#Import ".\NCryptIsAlgSupportedFn.ahk" { NCryptIsAlgSupportedFn }
#Import ".\NCryptKeyDerivationFn.ahk" { NCryptKeyDerivationFn }
#Import ".\NCryptNotifyChangeKeyFn.ahk" { NCryptNotifyChangeKeyFn }
#Import ".\NCryptOpenKeyFn.ahk" { NCryptOpenKeyFn }
#Import ".\NCryptOpenStorageProviderFn.ahk" { NCryptOpenStorageProviderFn }
#Import ".\NCryptPromptUserFn.ahk" { NCryptPromptUserFn }
#Import ".\NCryptSecretAgreementFn.ahk" { NCryptSecretAgreementFn }
#Import ".\NCryptSetKeyPropertyFn.ahk" { NCryptSetKeyPropertyFn }
#Import ".\NCryptSetProviderPropertyFn.ahk" { NCryptSetProviderPropertyFn }
#Import ".\NCryptSignHashFn.ahk" { NCryptSignHashFn }
#Import ".\NCryptVerifyClaimFn.ahk" { NCryptVerifyClaimFn }
#Import ".\NCryptVerifySignatureFn.ahk" { NCryptVerifySignatureFn }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCRYPT_KEY_STORAGE_FUNCTION_TABLE {
    #StructPack 8

    Version : BCRYPT_INTERFACE_VERSION

    OpenProvider : NCryptOpenStorageProviderFn

    OpenKey : NCryptOpenKeyFn

    CreatePersistedKey : NCryptCreatePersistedKeyFn

    GetProviderProperty : NCryptGetProviderPropertyFn

    GetKeyProperty : NCryptGetKeyPropertyFn

    SetProviderProperty : NCryptSetProviderPropertyFn

    SetKeyProperty : NCryptSetKeyPropertyFn

    FinalizeKey : NCryptFinalizeKeyFn

    DeleteKey : NCryptDeleteKeyFn

    FreeProvider : NCryptFreeProviderFn

    FreeKey : NCryptFreeKeyFn

    FreeBuffer : NCryptFreeBufferFn

    Encrypt : NCryptEncryptFn

    Decrypt : NCryptDecryptFn

    IsAlgSupported : NCryptIsAlgSupportedFn

    EnumAlgorithms : NCryptEnumAlgorithmsFn

    EnumKeys : NCryptEnumKeysFn

    ImportKey : NCryptImportKeyFn

    ExportKey : NCryptExportKeyFn

    SignHash : NCryptSignHashFn

    VerifySignature : NCryptVerifySignatureFn

    PromptUser : NCryptPromptUserFn

    NotifyChangeKey : NCryptNotifyChangeKeyFn

    SecretAgreement : NCryptSecretAgreementFn

    DeriveKey : NCryptDeriveKeyFn

    FreeSecret : NCryptFreeSecretFn

    KeyDerivation : NCryptKeyDerivationFn

    CreateClaim : NCryptCreateClaimFn

    VerifyClaim : NCryptVerifyClaimFn

}
