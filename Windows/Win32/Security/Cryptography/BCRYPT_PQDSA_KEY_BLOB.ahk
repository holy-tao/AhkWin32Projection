#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCRYPT_PQDSA_KEY_BLOB {
    #StructPack 4

    dwMagic : UInt32

    cbParameterSet : UInt32

    cbKey : UInt32

}
