#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * Defines a regions of interest.
 * @see https://docs.microsoft.com/windows/win32/api//mfapi/ns-mfapi-roi_area
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ROI_AREA extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The bounds of the region.
     * @type {RECT}
     */
    rect{
        get {
            if(!this.HasProp("__rect"))
                this.__rect := RECT(0, this)
            return this.__rect
        }
    }

    /**
     * Specifies the  quantization parameter delta for the specified region from the rest of the frame.
     * @type {Integer}
     */
    QPDelta {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
