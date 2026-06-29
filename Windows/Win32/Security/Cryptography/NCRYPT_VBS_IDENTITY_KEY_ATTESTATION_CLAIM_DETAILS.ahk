#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCRYPT_VBS_IDENTITY_KEY_ATTESTATION_CLAIM_DETAILS {
    #StructPack 8

    ulKeyFlags : UInt32

    pszSignatureHashAlg : PWSTR

    ulPaddingScheme : UInt32

    pszPaddingHashAlg : PWSTR

    ulPaddingSalt : UInt32

}
