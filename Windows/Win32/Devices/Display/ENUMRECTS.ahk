#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECTL.ahk

/**
 * The ENUMRECTS structure is used by the CLIPOBJ_cEnumStart function to provide information about rectangles in a clip region for the CLIPOBJ_bEnum function.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-enumrects
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class ENUMRECTS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies the number of RECTL structures in the <b>arcl</b> array.
     * @type {Integer}
     */
    c {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Is an array of <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rectl">RECTL</a> structures that specify the coordinates of rectangles in the clip region.
     * @type {Array<RECTL>}
     */
    arcl{
        get {
            if(!this.HasProp("__arclProxyArray"))
                this.__arclProxyArray := Win32FixedArray(this.ptr + 8, 1, RECTL, "")
            return this.__arclProxyArray
        }
    }
}
