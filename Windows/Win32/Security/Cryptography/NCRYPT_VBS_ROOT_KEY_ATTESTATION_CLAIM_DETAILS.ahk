#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCRYPT_VBS_ROOT_KEY_ATTESTATION_CLAIM_DETAILS {
    #StructPack 8

    ulKeyFlags : UInt32

    ullTrustletId : Int64

    ulTrustletSecurityVersion : UInt32

    ulTrustletDebuggable : UInt32

}
