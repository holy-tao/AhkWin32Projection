#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class LIGATURE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    culSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pwsz {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    chglyph {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Array<UInt32>}
     */
    ahglyph{
        get {
            if(!this.HasProp("__ahglyphProxyArray"))
                this.__ahglyphProxyArray := Win32FixedArray(this.ptr + 20, 1, Primitive, "uint")
            return this.__ahglyphProxyArray
        }
    }
}
