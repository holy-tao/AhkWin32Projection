#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Cryptography\CERT_STRONG_SIGN_PARA.ahk" { CERT_STRONG_SIGN_PARA }
#Import ".\WINTRUST_SIGNATURE_SETTINGS_FLAGS.ahk" { WINTRUST_SIGNATURE_SETTINGS_FLAGS }

/**
 * Can be used to specify the signatures on a file.
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/ns-wintrust-wintrust_signature_settings
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct WINTRUST_SIGNATURE_SETTINGS {
    #StructPack 8

    /**
     * Size, in bytes, of this structure.
     */
    cbStruct : UInt32

    /**
     * Contains the index of the signature to be validated if the <b>dwFlags</b> member is set to <b>WSS_VERIFY_SPECIFIC</b>.
     */
    dwIndex : UInt32

    dwFlags : WINTRUST_SIGNATURE_SETTINGS_FLAGS

    /**
     * Contains the number of secondary signatures found if the <b>dwFlags</b> member is set to <b>WSS_GET_SECONDARY_SIG_COUNT</b>.
     */
    cSecondarySigs : UInt32

    /**
     * The index used for verification. This member is set on return from Wintrust.
     */
    dwVerifiedSigIndex : UInt32

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_strong_sign_para">CERT_STRONG_SIGN_PARA</a> structure that contains the policy that a signature must pass to be considered valid.
     */
    pCryptoPolicy : CERT_STRONG_SIGN_PARA.Ptr

}
