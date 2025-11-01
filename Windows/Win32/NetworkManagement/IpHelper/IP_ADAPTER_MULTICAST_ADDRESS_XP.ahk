#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Networking\WinSock\SOCKET_ADDRESS.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/iptypes/ns-iptypes-ip_adapter_multicast_address_xp
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class IP_ADAPTER_MULTICAST_ADDRESS_XP extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Alignment {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer<IP_ADAPTER_MULTICAST_ADDRESS_XP>}
     */
    Next {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {SOCKET_ADDRESS}
     */
    Address{
        get {
            if(!this.HasProp("__Address"))
                this.__Address := SOCKET_ADDRESS(16, this)
            return this.__Address
        }
    }
}
