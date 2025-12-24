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
    static sizeof => 60

    static packingSize => 4

    /**
     * @type {DL_EUI48}
     */
    MACAddress{
        get {
            if(!this.HasProp("__MACAddress"))
                this.__MACAddress := DL_EUI48(0, this)
            return this.__MACAddress
        }
    }

    /**
     * @type {Integer}
     */
    CAFamily {
        get => NumGet(this, 14, "ushort")
        set => NumPut("ushort", value, this, 14)
    }

    /**
     * @type {WNV_IP_ADDRESS}
     */
    CA{
        get {
            if(!this.HasProp("__CA"))
                this.__CA := WNV_IP_ADDRESS(16, this)
            return this.__CA
        }
    }

    /**
     * @type {Integer}
     */
    VirtualSubnetId {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    PAFamily {
        get => NumGet(this, 36, "ushort")
        set => NumPut("ushort", value, this, 36)
    }

    /**
     * @type {WNV_IP_ADDRESS}
     */
    PA{
        get {
            if(!this.HasProp("__PA"))
                this.__PA := WNV_IP_ADDRESS(40, this)
            return this.__PA
        }
    }

    /**
     * @type {Integer}
     */
    NotificationReason {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }
}
