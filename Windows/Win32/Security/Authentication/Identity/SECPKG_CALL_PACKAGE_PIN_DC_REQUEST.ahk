#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\LSA_UNICODE_STRING.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SECPKG_CALL_PACKAGE_PIN_DC_REQUEST extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Integer}
     */
    MessageType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    DomainName{
        get {
            if(!this.HasProp("__DomainName"))
                this.__DomainName := LSA_UNICODE_STRING(this.ptr + 8)
            return this.__DomainName
        }
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    DcName{
        get {
            if(!this.HasProp("__DcName"))
                this.__DcName := LSA_UNICODE_STRING(this.ptr + 24)
            return this.__DcName
        }
    }

    /**
     * @type {Integer}
     */
    DcFlags {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
