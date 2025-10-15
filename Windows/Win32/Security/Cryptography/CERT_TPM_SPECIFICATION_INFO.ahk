#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_TPM_SPECIFICATION_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pwszFamily{
        get {
            if(!this.HasProp("__pwszFamily"))
                this.__pwszFamily := PWSTR(this.ptr + 0)
            return this.__pwszFamily
        }
    }

    /**
     * @type {Integer}
     */
    dwLevel {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwRevision {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
