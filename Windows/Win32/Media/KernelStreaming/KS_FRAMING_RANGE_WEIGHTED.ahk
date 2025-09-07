#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KS_FRAMING_RANGE.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KS_FRAMING_RANGE_WEIGHTED extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {KS_FRAMING_RANGE}
     */
    Range{
        get {
            if(!this.HasProp("__Range"))
                this.__Range := KS_FRAMING_RANGE(this.ptr + 0)
            return this.__Range
        }
    }

    /**
     * @type {Integer}
     */
    InPlaceWeight {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    NotInPlaceWeight {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
