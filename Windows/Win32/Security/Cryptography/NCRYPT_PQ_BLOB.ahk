#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCRYPT_PQ_BLOB {
    #StructPack 4

    dwMagic : UInt32

    cbBCryptType : UInt32

    cbBCryptBlob : UInt32

}
