#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\COLORSPACE_TRANSFORM_DATA_CAP.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class COLORSPACE_TRANSFORM_1DLUT_CAP extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    NumberOfLUTEntries {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {COLORSPACE_TRANSFORM_DATA_CAP}
     */
    DataCap{
        get {
            if(!this.HasProp("__DataCap"))
                this.__DataCap := COLORSPACE_TRANSFORM_DATA_CAP(this.ptr + 8)
            return this.__DataCap
        }
    }
}
