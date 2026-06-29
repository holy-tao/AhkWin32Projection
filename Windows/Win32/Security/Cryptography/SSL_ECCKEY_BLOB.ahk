#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct SSL_ECCKEY_BLOB {
    #StructPack 4

    dwCurveType : UInt32

    cbKey : UInt32

}
