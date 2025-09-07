#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IN6_ADDR.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class IPV6_HEADER extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    VersionClassFlow {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Anonymous {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    PayloadLength {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    NextHeader {
        get => NumGet(this, 6, "char")
        set => NumPut("char", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    HopLimit {
        get => NumGet(this, 7, "char")
        set => NumPut("char", value, this, 7)
    }

    /**
     * @type {IN6_ADDR}
     */
    SourceAddress{
        get {
            if(!this.HasProp("__SourceAddress"))
                this.__SourceAddress := IN6_ADDR(this.ptr + 8)
            return this.__SourceAddress
        }
    }

    /**
     * @type {IN6_ADDR}
     */
    DestinationAddress{
        get {
            if(!this.HasProp("__DestinationAddress"))
                this.__DestinationAddress := IN6_ADDR(this.ptr + 24)
            return this.__DestinationAddress
        }
    }
}
