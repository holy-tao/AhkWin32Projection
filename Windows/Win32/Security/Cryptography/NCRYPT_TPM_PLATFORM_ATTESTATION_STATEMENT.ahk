#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCRYPT_TPM_PLATFORM_ATTESTATION_STATEMENT {
    #StructPack 4

    Magic : UInt32

    Version : UInt32

    pcrAlg : UInt32

    cbSignature : UInt32

    cbQuote : UInt32

    cbPcrs : UInt32

}
