#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class DVD_ATR extends Win32Struct {
    static sizeof => 772

    static packingSize => 4

    /**
     * @type {Integer}
     */
    ulCAT {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<Integer>}
     */
    pbATRI {
        get {
            if(!this.HasProp("__pbATRIProxyArray"))
                this.__pbATRIProxyArray := Win32FixedArray(this.ptr + 4, 768, Primitive, "char")
            return this.__pbATRIProxyArray
        }
    }
}
