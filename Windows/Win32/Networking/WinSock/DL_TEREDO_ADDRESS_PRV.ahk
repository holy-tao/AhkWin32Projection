#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DL_OUI.ahk
#Include .\DL_EI64.ahk
#Include .\DL_EI48.ahk
#Include .\DL_EUI64.ahk
#Include .\IN_ADDR.ahk
#Include .\DL_EUI48.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class DL_TEREDO_ADDRESS_PRV extends Win32Struct
{
    static sizeof => 38

    static packingSize => 1

    /**
     * @type {Array<Byte>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }

    /**
     * @type {DL_EUI64}
     */
    Eui64{
        get {
            if(!this.HasProp("__Eui64"))
                this.__Eui64 := DL_EUI64(this.ptr + 6)
            return this.__Eui64
        }
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    MappedPort {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {IN_ADDR}
     */
    MappedAddress{
        get {
            if(!this.HasProp("__MappedAddress"))
                this.__MappedAddress := IN_ADDR(this.ptr + 10)
            return this.__MappedAddress
        }
    }

    /**
     * @type {IN_ADDR}
     */
    LocalAddress{
        get {
            if(!this.HasProp("__LocalAddress"))
                this.__LocalAddress := IN_ADDR(this.ptr + 14)
            return this.__LocalAddress
        }
    }

    /**
     * @type {Integer}
     */
    InterfaceIndex {
        get => NumGet(this, 18, "uint")
        set => NumPut("uint", value, this, 18)
    }

    /**
     * @type {Integer}
     */
    LocalPort {
        get => NumGet(this, 22, "ushort")
        set => NumPut("ushort", value, this, 22)
    }

    /**
     * @type {DL_EUI48}
     */
    DlDestination{
        get {
            if(!this.HasProp("__DlDestination"))
                this.__DlDestination := DL_EUI48(this.ptr + 24)
            return this.__DlDestination
        }
    }
}
