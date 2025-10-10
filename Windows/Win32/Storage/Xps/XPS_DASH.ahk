#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * This structure describes a dash element of a path.
 * @remarks
 * 
  * The length must be non-negative and is measured in multiples of the path's stroke thickness.
  * 
  *  Values of <b>length</b> do not include the end caps of the visible segments.
  * 
  * The shape of the end caps of the visible segments is determined by the <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_dash_cap">XPS_DASH_CAP</a> value.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/ns-xpsobjectmodel-xps_dash
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class XPS_DASH extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Length of the visible segment of the dash element.
     * @type {Float}
     */
    length {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * Length of the space between the visible segments of the dash sequence.
     * @type {Float}
     */
    gap {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }
}
