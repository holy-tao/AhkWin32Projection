#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_RC4_KEY_STATE {
    #StructPack 1

    Key : Int8[16]

    SBox : Int8[256]

    i : Int8

    j : Int8

}
