#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Networking\WinSock\IN_ADDR.ahk
#Include ..\..\Networking\WinSock\IN6_ADDR.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class VPN_TS_IP_ADDRESS extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {IN_ADDR}
     */
    v4{
        get {
            if(!this.HasProp("__v4"))
                this.__v4 := IN_ADDR(4, this)
            return this.__v4
        }
    }

    /**
     * @type {IN6_ADDR}
     */
    v6{
        get {
            if(!this.HasProp("__v6"))
                this.__v6 := IN6_ADDR(4, this)
            return this.__v6
        }
    }
}
