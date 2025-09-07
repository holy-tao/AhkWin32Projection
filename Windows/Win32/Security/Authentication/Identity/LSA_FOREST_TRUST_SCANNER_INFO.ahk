#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\PSID.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
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
     * @type {PSID}
     */
    DomainSid{
        get {
            if(!this.HasProp("__DomainSid"))
                this.__DomainSid := PSID(this.ptr + 0)
            return this.__DomainSid
        }
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
