#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies a range of strokes in the InkDisp object.
 * @see https://docs.microsoft.com/windows/win32/api//tpcshrd/ns-tpcshrd-stroke_range
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class STROKE_RANGE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Index of the first stroke in the range, inclusive.
     * @type {Integer}
     */
    iStrokeBegin {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Index of the last stroke in the range, inclusive.
     * @type {Integer}
     */
    iStrokeEnd {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
