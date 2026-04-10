#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\Q2931_IE_TYPE.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
class Q2931_IE extends Win32Struct {
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Q2931_IE_TYPE}
     */
    IEType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    IELength {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<Integer>}
     */
    IE {
        get {
            if(!this.HasProp("__IEProxyArray"))
                this.__IEProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__IEProxyArray
        }
    }
}
