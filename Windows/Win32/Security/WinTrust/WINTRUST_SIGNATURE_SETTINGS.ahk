#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Can be used to specify the signatures on a file.
 * @see https://docs.microsoft.com/windows/win32/api//wintrust/ns-wintrust-wintrust_signature_settings
 * @namespace Windows.Win32.Security.WinTrust
 * @version v4.0.30319
 */
class WINTRUST_SIGNATURE_SETTINGS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Size, in bytes, of this structure.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Contains the index of the signature to be validated if the <b>dwFlags</b> member is set to <b>WSS_VERIFY_SPECIFIC</b>.
     * @type {Integer}
     */
    dwIndex {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * 
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Contains the number of secondary signatures found if the <b>dwFlags</b> member is set to <b>WSS_GET_SECONDARY_SIG_COUNT</b>.
     * @type {Integer}
     */
    cSecondarySigs {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The index used for verification. This member is set on return from Wintrust.
     * @type {Integer}
     */
    dwVerifiedSigIndex {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_strong_sign_para">CERT_STRONG_SIGN_PARA</a> structure that contains the policy that a signature must pass to be considered valid.
     * @type {Pointer<CERT_STRONG_SIGN_PARA>}
     */
    pCryptoPolicy {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
