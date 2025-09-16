#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DL_OUI.ahk
#Include .\DL_EI64.ahk
#Include .\DL_EI48.ahk
#Include .\DL_EUI64.ahk
#Include .\IN_ADDR.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class DL_TEREDO_ADDRESS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Array<Byte>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 0, 6, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }

    /**
     * @type {DL_EUI64}
     */
    Eui64{
        get {
            if(!this.HasProp("__Eui64"))
                this.__Eui64 := DL_EUI64(this.ptr + 8)
            return this.__Eui64
        }
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    MappedPort {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * @type {IN_ADDR}
     */
    MappedAddress{
        get {
            if(!this.HasProp("__MappedAddress"))
                this.__MappedAddress := IN_ADDR(this.ptr + 12)
            return this.__MappedAddress
        }
    }
}
