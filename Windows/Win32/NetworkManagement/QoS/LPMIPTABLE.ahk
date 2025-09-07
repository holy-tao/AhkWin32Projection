#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Networking\WinSock\IN_ADDR.ahk

/**
 * The LPMIPTABLE structure contains IP information, including the SNMP index, IP address, and subnet mask for each interface. The LPMIPTABLE structure is supplied as an argument for the Lpm_IpAddressTable function.
 * @see https://learn.microsoft.com/windows/win32/api/lpmapi/ns-lpmapi-lpmiptable
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class LPMIPTABLE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * SNMP index for the interface.
     * @type {Integer}
     */
    ulIfIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Media type of the interface.
     * @type {Integer}
     */
    MediaType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * IP address for the interface.
     * @type {IN_ADDR}
     */
    IfIpAddr{
        get {
            if(!this.HasProp("__IfIpAddr"))
                this.__IfIpAddr := IN_ADDR(this.ptr + 8)
            return this.__IfIpAddr
        }
    }

    /**
     * IP subnet mask for the interface.
     * @type {IN_ADDR}
     */
    IfNetMask{
        get {
            if(!this.HasProp("__IfNetMask"))
                this.__IfNetMask := IN_ADDR(this.ptr + 12)
            return this.__IfNetMask
        }
    }
}
