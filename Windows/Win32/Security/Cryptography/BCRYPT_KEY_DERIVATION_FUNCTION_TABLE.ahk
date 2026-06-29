#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BCRYPT_INTERFACE_VERSION.ahk" { BCRYPT_INTERFACE_VERSION }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCRYPT_KEY_DERIVATION_FUNCTION_TABLE {
    #StructPack 8

    Version : BCRYPT_INTERFACE_VERSION

    OpenAlgorithmProvider : IntPtr

    GetProperty : IntPtr

    SetProperty : IntPtr

    CloseAlgorithmProvider : IntPtr

    GenerateKey : IntPtr

    DestroyKey : IntPtr

    KeyDerivation : IntPtr

    ExportKey : IntPtr

    ImportKey : IntPtr

    DuplicateKey : IntPtr

}
