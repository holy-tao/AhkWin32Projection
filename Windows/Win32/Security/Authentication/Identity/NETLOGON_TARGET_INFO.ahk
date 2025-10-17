#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\LSA_UNICODE_STRING.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class NETLOGON_TARGET_INFO extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    NbComputerName{
        get {
            if(!this.HasProp("__NbComputerName"))
                this.__NbComputerName := LSA_UNICODE_STRING(8, this)
            return this.__NbComputerName
        }
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    NbDomainName{
        get {
            if(!this.HasProp("__NbDomainName"))
                this.__NbDomainName := LSA_UNICODE_STRING(24, this)
            return this.__NbDomainName
        }
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    DnsComputerName{
        get {
            if(!this.HasProp("__DnsComputerName"))
                this.__DnsComputerName := LSA_UNICODE_STRING(40, this)
            return this.__DnsComputerName
        }
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    DnsDomainName{
        get {
            if(!this.HasProp("__DnsDomainName"))
                this.__DnsDomainName := LSA_UNICODE_STRING(56, this)
            return this.__DnsDomainName
        }
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    DnsTreeName{
        get {
            if(!this.HasProp("__DnsTreeName"))
                this.__DnsTreeName := LSA_UNICODE_STRING(72, this)
            return this.__DnsTreeName
        }
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    TargetName{
        get {
            if(!this.HasProp("__TargetName"))
                this.__TargetName := LSA_UNICODE_STRING(88, this)
            return this.__TargetName
        }
    }
}
