#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Networking\WinSock\IN_ADDR.ahk
#Include ..\..\Networking\WinSock\IN6_ADDR.ahk
#Include .\VPN_TS_IP_ADDRESS.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class MPR_VPN_TRAFFIC_SELECTOR extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    protocolId {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    portStart {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    portEnd {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    tsPayloadId {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * @type {VPN_TS_IP_ADDRESS}
     */
    addrStart{
        get {
            if(!this.HasProp("__addrStart"))
                this.__addrStart := VPN_TS_IP_ADDRESS(this.ptr + 16)
            return this.__addrStart
        }
    }

    /**
     * @type {VPN_TS_IP_ADDRESS}
     */
    addrEnd{
        get {
            if(!this.HasProp("__addrEnd"))
                this.__addrEnd := VPN_TS_IP_ADDRESS(this.ptr + 24)
            return this.__addrEnd
        }
    }
}
