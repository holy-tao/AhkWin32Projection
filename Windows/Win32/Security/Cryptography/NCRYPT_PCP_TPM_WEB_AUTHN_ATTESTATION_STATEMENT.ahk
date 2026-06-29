#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCRYPT_PCP_TPM_WEB_AUTHN_ATTESTATION_STATEMENT {
    #StructPack 4

    Magic : UInt32

    Version : UInt32

    HeaderSize : UInt32

    cbCertifyInfo : UInt32

    cbSignature : UInt32

    cbTpmPublic : UInt32

}
