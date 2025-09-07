#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Networking\WinSock\IN_ADDR.ahk
#Include ..\..\Networking\WinSock\IN6_ADDR.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class RASTUNNELENDPOINT extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {IN_ADDR}
     */
    ipv4{
        get {
            if(!this.HasProp("__ipv4"))
                this.__ipv4 := IN_ADDR(this.ptr + 4)
            return this.__ipv4
        }
    }

    /**
     * @type {IN6_ADDR}
     */
    ipv6{
        get {
            if(!this.HasProp("__ipv6"))
                this.__ipv6 := IN6_ADDR(this.ptr + 4)
            return this.__ipv6
        }
    }
}
