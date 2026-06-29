#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BCRYPT_INTERFACE_VERSION.ahk" { BCRYPT_INTERFACE_VERSION }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCRYPT_CIPHER_FUNCTION_TABLE {
    #StructPack 8

    Version : BCRYPT_INTERFACE_VERSION

    OpenAlgorithmProvider : IntPtr

    GetProperty : IntPtr

    SetProperty : IntPtr

    CloseAlgorithmProvider : IntPtr

    GenerateKey : IntPtr

    Encrypt : IntPtr

    Decrypt : IntPtr

    ImportKey : IntPtr

    ExportKey : IntPtr

    DuplicateKey : IntPtr

    DestroyKey : IntPtr

}
