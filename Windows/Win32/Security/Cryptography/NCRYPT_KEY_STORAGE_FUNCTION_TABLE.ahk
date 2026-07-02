#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NCryptFreeProviderFn.ahk" { NCryptFreeProviderFn }
#Import ".\NCryptSetProviderPropertyFn.ahk" { NCryptSetProviderPropertyFn }
#Import ".\NCryptFreeKeyFn.ahk" { NCryptFreeKeyFn }
#Import ".\NCryptNotifyChangeKeyFn.ahk" { NCryptNotifyChangeKeyFn }
#Import ".\NCryptDecryptFn.ahk" { NCryptDecryptFn }
#Import ".\NCryptImportKeyFn.ahk" { NCryptImportKeyFn }
#Import ".\NCryptSecretAgreementFn.ahk" { NCryptSecretAgreementFn }
#Import ".\NCryptOpenStorageProviderFn.ahk" { NCryptOpenStorageProviderFn }
#Import ".\NCryptOpenKeyFn.ahk" { NCryptOpenKeyFn }
#Import ".\NCryptSetKeyPropertyFn.ahk" { NCryptSetKeyPropertyFn }
#Import ".\NCryptVerifySignatureFn.ahk" { NCryptVerifySignatureFn }
#Import ".\NCryptCreatePersistedKeyFn.ahk" { NCryptCreatePersistedKeyFn }
#Import ".\NCryptGetProviderPropertyFn.ahk" { NCryptGetProviderPropertyFn }
#Import ".\NCryptDeleteKeyFn.ahk" { NCryptDeleteKeyFn }
#Import ".\NCryptEncryptFn.ahk" { NCryptEncryptFn }
#Import ".\BCRYPT_INTERFACE_VERSION.ahk" { BCRYPT_INTERFACE_VERSION }
#Import ".\NCryptFreeBufferFn.ahk" { NCryptFreeBufferFn }
#Import ".\NCryptCreateClaimFn.ahk" { NCryptCreateClaimFn }
#Import ".\NCryptIsAlgSupportedFn.ahk" { NCryptIsAlgSupportedFn }
#Import ".\NCryptKeyDerivationFn.ahk" { NCryptKeyDerivationFn }
#Import ".\NCryptVerifyClaimFn.ahk" { NCryptVerifyClaimFn }
#Import ".\NCryptFinalizeKeyFn.ahk" { NCryptFinalizeKeyFn }
#Import ".\NCryptGetKeyPropertyFn.ahk" { NCryptGetKeyPropertyFn }
#Import ".\NCryptEnumKeysFn.ahk" { NCryptEnumKeysFn }
#Import ".\NCryptFreeSecretFn.ahk" { NCryptFreeSecretFn }
#Import ".\NCryptDeriveKeyFn.ahk" { NCryptDeriveKeyFn }
#Import ".\NCryptSignHashFn.ahk" { NCryptSignHashFn }
#Import ".\NCryptEnumAlgorithmsFn.ahk" { NCryptEnumAlgorithmsFn }
#Import ".\NCryptExportKeyFn.ahk" { NCryptExportKeyFn }
#Import ".\NCryptPromptUserFn.ahk" { NCryptPromptUserFn }

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
