#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\LSA_UNICODE_STRING.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class LSA_FOREST_TRUST_SCANNER_INFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Pointer<Void>}
     */
    DomainSid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    DnsName{
        get {
            if(!this.HasProp("__DnsName"))
                this.__DnsName := LSA_UNICODE_STRING(this.ptr + 8)
            return this.__DnsName
        }
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    NetbiosName{
        get {
            if(!this.HasProp("__NetbiosName"))
                this.__NetbiosName := LSA_UNICODE_STRING(this.ptr + 24)
            return this.__NetbiosName
        }
    }
}
