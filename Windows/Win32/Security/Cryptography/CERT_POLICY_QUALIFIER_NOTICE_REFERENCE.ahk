#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_POLICY_QUALIFIER_NOTICE_REFERENCE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {PSTR}
     */
    pszOrganization{
        get {
            if(!this.HasProp("__pszOrganization"))
                this.__pszOrganization := PSTR(this.ptr + 0)
            return this.__pszOrganization
        }
    }

    /**
     * @type {Integer}
     */
    cNoticeNumbers {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Pointer<Int32>}
     */
    rgNoticeNumbers {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
