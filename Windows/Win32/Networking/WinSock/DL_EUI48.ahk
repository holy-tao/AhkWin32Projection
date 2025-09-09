#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DL_OUI.ahk
#Include .\DL_EI48.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class DL_EUI48 extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Array<Byte>}
     */
    Byte{
        get {
            if(!this.HasProp("__ByteProxyArray"))
                this.__ByteProxyArray := Win32FixedArray(this.ptr + 0, 6, Primitive, "char")
            return this.__ByteProxyArray
        }
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
     * @type {DL_EI48}
     */
    Ei48{
        get {
            if(!this.HasProp("__Ei48"))
                this.__Ei48 := DL_EI48(this.ptr + 6)
            return this.__Ei48
        }
    }
}
