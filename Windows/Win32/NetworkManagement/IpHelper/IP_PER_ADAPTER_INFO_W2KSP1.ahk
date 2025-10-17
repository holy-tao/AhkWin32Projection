#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IP_ADDRESS_STRING.ahk
#Include .\IP_ADDR_STRING.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class IP_PER_ADAPTER_INFO_W2KSP1 extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * @type {Integer}
     */
    AutoconfigEnabled {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    AutoconfigActive {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer<IP_ADDR_STRING>}
     */
    CurrentDnsServer {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {IP_ADDR_STRING}
     */
    DnsServerList{
        get {
            if(!this.HasProp("__DnsServerList"))
                this.__DnsServerList := IP_ADDR_STRING(16, this)
            return this.__DnsServerList
        }
    }
}
