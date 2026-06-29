#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_DES_KEY_STATE {
    #StructPack 1

    Key : Int8[8]

    IV : Int8[8]

    Feedback : Int8[8]

}
