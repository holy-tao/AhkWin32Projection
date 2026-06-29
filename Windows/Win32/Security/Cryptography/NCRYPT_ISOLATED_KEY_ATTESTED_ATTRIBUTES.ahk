#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCRYPT_ISOLATED_KEY_ATTESTED_ATTRIBUTES {
    #StructPack 4

    Version : UInt32

    Flags : UInt32

    cbPublicKeyBlob : UInt32

}
