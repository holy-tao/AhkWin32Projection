#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Networking\WinSock\DL_OUI.ahk
#Include ..\..\Networking\WinSock\DL_EI48.ahk
#Include ..\..\Networking\WinSock\DL_EUI48.ahk
#Include ..\..\Networking\WinSock\IN_ADDR.ahk
#Include ..\..\Networking\WinSock\IN6_ADDR.ahk
#Include .\WNV_IP_ADDRESS.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsNetworkVirtualization
 * @version v4.0.30319
 */
class WNV_CUSTOMER_ADDRESS_CHANGE_PARAM extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {DL_EUI48}
     */
    MACAddress{
        get {
            if(!this.HasProp("__MACAddress"))
                this.__MACAddress := DL_EUI48(this.ptr + 0)
            return this.__MACAddress
        }
    }

    /**
     * @type {Integer}
     */
    CAFamily {
        get => NumGet(this, 24, "ushort")
        set => NumPut("ushort", value, this, 24)
    }

    /**
     * @type {WNV_IP_ADDRESS}
     */
    CA{
        get {
            if(!this.HasProp("__CA"))
                this.__CA := WNV_IP_ADDRESS(this.ptr + 32)
            return this.__CA
        }
    }

    /**
     * @type {Integer}
     */
    VirtualSubnetId {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    PAFamily {
        get => NumGet(this, 52, "ushort")
        set => NumPut("ushort", value, this, 52)
    }

    /**
     * @type {WNV_IP_ADDRESS}
     */
    PA{
        get {
            if(!this.HasProp("__PA"))
                this.__PA := WNV_IP_ADDRESS(this.ptr + 56)
            return this.__PA
        }
    }

    /**
     * @type {Integer}
     */
    NotificationReason {
        get => NumGet(this, 72, "int")
        set => NumPut("int", value, this, 72)
    }
}
