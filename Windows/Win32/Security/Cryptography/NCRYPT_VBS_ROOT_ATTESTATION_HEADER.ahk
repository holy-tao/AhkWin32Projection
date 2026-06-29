#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCRYPT_VBS_ROOT_ATTESTATION_HEADER {
    #StructPack 4

    Magic : UInt32

    Version : UInt32

    cbAttributes : UInt32

    cbNonce : UInt32

    cbReport : UInt32

    cbSignature : UInt32

}
