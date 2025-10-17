#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IP_ADDRESS_STRING.ahk
#Include .\IP_ADDR_STRING.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class FIXED_INFO_W2KSP1 extends Win32Struct
{
    static sizeof => 1152

    static packingSize => 8

    /**
     * @type {String}
     */
    HostName {
        get => StrGet(this.ptr + 0, 131, "UTF-16")
        set => StrPut(value, this.ptr + 0, 131, "UTF-16")
    }

    /**
     * @type {String}
     */
    DomainName {
        get => StrGet(this.ptr + 264, 131, "UTF-16")
        set => StrPut(value, this.ptr + 264, 131, "UTF-16")
    }

    /**
     * @type {Pointer<IP_ADDR_STRING>}
     */
    CurrentDnsServer {
        get => NumGet(this, 528, "ptr")
        set => NumPut("ptr", value, this, 528)
    }

    /**
     * @type {IP_ADDR_STRING}
     */
    DnsServerList{
        get {
            if(!this.HasProp("__DnsServerList"))
                this.__DnsServerList := IP_ADDR_STRING(536, this)
            return this.__DnsServerList
        }
    }

    /**
     * @type {Integer}
     */
    NodeType {
        get => NumGet(this, 616, "uint")
        set => NumPut("uint", value, this, 616)
    }

    /**
     * @type {String}
     */
    ScopeId {
        get => StrGet(this.ptr + 620, 259, "UTF-16")
        set => StrPut(value, this.ptr + 620, 259, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    EnableRouting {
        get => NumGet(this, 1140, "uint")
        set => NumPut("uint", value, this, 1140)
    }

    /**
     * @type {Integer}
     */
    EnableProxy {
        get => NumGet(this, 1144, "uint")
        set => NumPut("uint", value, this, 1144)
    }

    /**
     * @type {Integer}
     */
    EnableDns {
        get => NumGet(this, 1148, "uint")
        set => NumPut("uint", value, this, 1148)
    }
}
