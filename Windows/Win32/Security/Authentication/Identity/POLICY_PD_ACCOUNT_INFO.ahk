#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\LSA_UNICODE_STRING.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class POLICY_PD_ACCOUNT_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {LSA_UNICODE_STRING}
     */
    Name{
        get {
            if(!this.HasProp("__Name"))
                this.__Name := LSA_UNICODE_STRING(0, this)
            return this.__Name
        }
    }
}
