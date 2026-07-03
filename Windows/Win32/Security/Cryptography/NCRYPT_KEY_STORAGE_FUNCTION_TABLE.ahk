#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BCRYPT_INTERFACE_VERSION.ahk" { BCRYPT_INTERFACE_VERSION }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCRYPT_KEY_STORAGE_FUNCTION_TABLE {
    #StructPack 8

    Version : BCRYPT_INTERFACE_VERSION

    OpenProvider : IntPtr

    OpenKey : IntPtr

    CreatePersistedKey : IntPtr

    GetProviderProperty : IntPtr

    GetKeyProperty : IntPtr

    SetProviderProperty : IntPtr

    SetKeyProperty : IntPtr

    FinalizeKey : IntPtr

    DeleteKey : IntPtr

    FreeProvider : IntPtr

    FreeKey : IntPtr

    FreeBuffer : IntPtr

    Encrypt : IntPtr

    Decrypt : IntPtr

    IsAlgSupported : IntPtr

    EnumAlgorithms : IntPtr

    EnumKeys : IntPtr

    ImportKey : IntPtr

    ExportKey : IntPtr

    SignHash : IntPtr

    VerifySignature : IntPtr

    PromptUser : IntPtr

    NotifyChangeKey : IntPtr

    SecretAgreement : IntPtr

    DeriveKey : IntPtr

    FreeSecret : IntPtr

    KeyDerivation : IntPtr

    CreateClaim : IntPtr

    VerifyClaim : IntPtr

}
