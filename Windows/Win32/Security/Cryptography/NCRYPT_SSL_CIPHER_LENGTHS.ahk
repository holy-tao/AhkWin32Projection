#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCRYPT_SSL_CIPHER_LENGTHS {
    #StructPack 4

    cbLength : UInt32

    dwHeaderLen : UInt32

    dwFixedTrailerLen : UInt32

    dwMaxVariableTrailerLen : UInt32

    dwFlags : UInt32

}
