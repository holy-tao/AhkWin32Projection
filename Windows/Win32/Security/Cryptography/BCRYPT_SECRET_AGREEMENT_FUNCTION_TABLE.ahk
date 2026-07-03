#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BCRYPT_INTERFACE_VERSION.ahk" { BCRYPT_INTERFACE_VERSION }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCRYPT_SECRET_AGREEMENT_FUNCTION_TABLE {
    #StructPack 8

    Version : BCRYPT_INTERFACE_VERSION

    OpenAlgorithmProvider : IntPtr

    GetProperty : IntPtr

    SetProperty : IntPtr

    CloseAlgorithmProvider : IntPtr

    SecretAgreement : IntPtr

    DeriveKey : IntPtr

    DestroySecret : IntPtr

    GenerateKeyPair : IntPtr

    FinalizeKeyPair : IntPtr

    ImportKeyPair : IntPtr

    ExportKey : IntPtr

    DestroyKey : IntPtr

}
