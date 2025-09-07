#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EXTLOGPEN32 extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * @type {Integer}
     */
    elpPenStyle {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    elpWidth {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    elpBrushStyle {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    elpColor {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    elpHatch {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    elpNumEntries {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Array<UInt32>}
     */
    elpStyleEntry{
        get {
            if(!this.HasProp("__elpStyleEntryProxyArray"))
                this.__elpStyleEntryProxyArray := Win32FixedArray(this.ptr + 24, 4, Primitive, "uint")
            return this.__elpStyleEntryProxyArray
        }
    }
}
