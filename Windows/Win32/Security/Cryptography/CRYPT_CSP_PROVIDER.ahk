#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\CRYPT_BIT_BLOB.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_CSP_PROVIDER extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwKeySpec {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    pwszProviderName{
        get {
            if(!this.HasProp("__pwszProviderName"))
                this.__pwszProviderName := PWSTR(this.ptr + 8)
            return this.__pwszProviderName
        }
    }

    /**
     * @type {CRYPT_BIT_BLOB}
     */
    Signature{
        get {
            if(!this.HasProp("__Signature"))
                this.__Signature := CRYPT_BIT_BLOB(this.ptr + 16)
            return this.__Signature
        }
    }
}
