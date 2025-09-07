#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\SIZE.ahk

/**
 * The PERBANDINFO structure is used as input to a printer graphics DLL's DrvQueryPerBandInfo function.
 * @remarks
 * If the result of <b>ulHorzRes</b> divided by <b>ulVertRes</b> is smaller than the result obtained by dividing the same members of the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-gdiinfo">GDIINFO</a> structure, the band is rendered smaller by the graphics engine. If the values are the same, no scaling is done. The resultant scale factor obtained from this structure cannot be larger than the one stored in GDIINFO.
  * 
  * When the band is scaled, the graphics engine anchors the smaller band to the upper-left corner of the original band.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-perbandinfo
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class PERBANDINFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * If <b>TRUE</b>, GDI redraws the previous band. If <b>FALSE</b>, GDI draws the next band.
     * @type {Integer}
     */
    bRepeatThisBand {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Specifies a SIZEL structure that contains the width and height, in pixels, of the rectangle in which GDI can draw the band. A SIZEL structure is identical to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-size">SIZE</a> structure.
     * @type {SIZE}
     */
    szlBand{
        get {
            if(!this.HasProp("__szlBand"))
                this.__szlBand := SIZE(this.ptr + 8)
            return this.__szlBand
        }
    }

    /**
     * Specifies the horizontal resolution GDI should use when scaling the band.
     * @type {Integer}
     */
    ulHorzRes {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Specifies the vertical resolution GDI should use when scaling the band.
     * @type {Integer}
     */
    ulVertRes {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
