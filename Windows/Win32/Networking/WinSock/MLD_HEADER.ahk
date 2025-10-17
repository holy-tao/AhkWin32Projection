#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ICMP_HEADER.ahk
#Include .\IN6_ADDR.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class MLD_HEADER extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {ICMP_HEADER}
     */
    IcmpHeader{
        get {
            if(!this.HasProp("__IcmpHeader"))
                this.__IcmpHeader := ICMP_HEADER(0, this)
            return this.__IcmpHeader
        }
    }

    /**
     * @type {Integer}
     */
    MaxRespTime {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * @type {IN6_ADDR}
     */
    MulticastAddress{
        get {
            if(!this.HasProp("__MulticastAddress"))
                this.__MulticastAddress := IN6_ADDR(8, this)
            return this.__MulticastAddress
        }
    }
}
