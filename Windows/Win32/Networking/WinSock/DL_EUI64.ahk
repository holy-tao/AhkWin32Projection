#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DL_OUI.ahk
#Include .\DL_EI64.ahk
#Include .\DL_EI48.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class DL_EUI64 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Array<Byte>}
     */
    Byte{
        get {
            if(!this.HasProp("__ByteProxyArray"))
                this.__ByteProxyArray := Win32FixedArray(this.ptr + 0, 8, Primitive, "char")
            return this.__ByteProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    Value {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {DL_OUI}
     */
    Oui{
        get {
            if(!this.HasProp("__Oui"))
                this.__Oui := DL_OUI(this.ptr + 0)
            return this.__Oui
        }
    }

    /**
     * @type {DL_EI64}
     */
    Ei64{
        get {
            if(!this.HasProp("__Ei64"))
                this.__Ei64 := DL_EI64(this.ptr + 5)
            return this.__Ei64
        }
    }

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 5, "char")
        set => NumPut("char", value, this, 5)
    }

    /**
     * @type {Integer}
     */
    Tse {
        get => NumGet(this, 6, "char")
        set => NumPut("char", value, this, 6)
    }

    /**
     * @type {DL_EI48}
     */
    Ei48{
        get {
            if(!this.HasProp("__Ei48"))
                this.__Ei48 := DL_EI48(this.ptr + 8)
            return this.__Ei48
        }
    }
}
