#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class NCRYPT_VBS_IDENTITY_KEY_ATTESTATION_CLAIM_DETAILS extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ulKeyFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    pszSignatureHashAlg{
        get {
            if(!this.HasProp("__pszSignatureHashAlg"))
                this.__pszSignatureHashAlg := PWSTR(this.ptr + 8)
            return this.__pszSignatureHashAlg
        }
    }

    /**
     * @type {Integer}
     */
    ulPaddingScheme {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {PWSTR}
     */
    pszPaddingHashAlg{
        get {
            if(!this.HasProp("__pszPaddingHashAlg"))
                this.__pszPaddingHashAlg := PWSTR(this.ptr + 24)
            return this.__pszPaddingHashAlg
        }
    }

    /**
     * @type {Integer}
     */
    ulPaddingSalt {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
