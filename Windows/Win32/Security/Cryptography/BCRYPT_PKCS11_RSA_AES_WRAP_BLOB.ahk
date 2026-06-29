#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCRYPT_PKCS11_RSA_AES_WRAP_BLOB {
    #StructPack 4

    dwMagic : UInt32

    cbKey : UInt32

    cbPaddingAlgId : UInt32

    cbPaddingLabel : UInt32

}
