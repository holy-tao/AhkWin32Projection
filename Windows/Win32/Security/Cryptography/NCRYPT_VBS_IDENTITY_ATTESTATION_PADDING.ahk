#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCRYPT_VBS_IDENTITY_ATTESTATION_PADDING {
    #StructPack 4

    Version : UInt32

    ulPaddingScheme : UInt32

    cbHashAlg : UInt32

    ulSalt : UInt32

}
