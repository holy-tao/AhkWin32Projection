#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IP6_ADDRESS.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_SVCB_PARAM_IPV6 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cIps {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Array<IP6_ADDRESS>}
     */
    rgIps{
        get {
            if(!this.HasProp("__rgIpsProxyArray"))
                this.__rgIpsProxyArray := Win32FixedArray(this.ptr + 8, 1, IP6_ADDRESS, "")
            return this.__rgIpsProxyArray
        }
    }
}
