#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMR.ahk
#Include ..\..\Foundation\RECTL.ahk
#Include .\XFORM.ahk

/**
 * The EMRALPHABLEND structure contains members for the AlphaBlend enhanced metafile record.
 * @remarks
 * This structure is to be used during metafile playback.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emralphablend
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EMRALPHABLEND extends Win32Struct
{
    static sizeof => 108

    static packingSize => 4

    /**
     * The base structure for all record types.
     * @type {EMR}
     */
    emr{
        get {
            if(!this.HasProp("__emr"))
                this.__emr := EMR(0, this)
            return this.__emr
        }
    }

    /**
     * Bounding rectangle, in device units.
     * @type {RECTL}
     */
    rclBounds{
        get {
            if(!this.HasProp("__rclBounds"))
                this.__rclBounds := RECTL(8, this)
            return this.__rclBounds
        }
    }

    /**
     * The x coordinate, in logical units, of the upper-left corner of the destination rectangle.
     * @type {Integer}
     */
    xDest {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * The y coordinate, in logical units, of the upper-left corner of the destination rectangle.
     * @type {Integer}
     */
    yDest {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * Logical width of the destination rectangle.
     * @type {Integer}
     */
    cxDest {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * Logical height of the destination rectangle.
     * @type {Integer}
     */
    cyDest {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * Stores the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-blendfunction">BLENDFUNCTION</a> structure.
     * @type {Integer}
     */
    dwRop {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Logical x coordinate of the upper-left corner of the source rectangle.
     * @type {Integer}
     */
    xSrc {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * Logical y coordinate of the upper-left corner of the source rectangle.
     * @type {Integer}
     */
    ySrc {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * World-space to page-space transformation of the source device context.
     * @type {XFORM}
     */
    xformSrc{
        get {
            if(!this.HasProp("__xformSrc"))
                this.__xformSrc := XFORM(52, this)
            return this.__xformSrc
        }
    }

    /**
     * Background color (the RGB value) of the source device context. To make a <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> value, use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-rgb">RGB</a> macro.
     * @type {COLORREF}
     */
    crBkColorSrc {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * Source bitmap information color table usage (DIB_RGB_COLORS).
     * @type {Integer}
     */
    iUsageSrc {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Offset to the source <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure.
     * @type {Integer}
     */
    offBmiSrc {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * Size of the source <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure.
     * @type {Integer}
     */
    cbBmiSrc {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * Offset to the source bitmap bits.
     * @type {Integer}
     */
    offBitsSrc {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * Size of the source bitmap bits.
     * @type {Integer}
     */
    cbBitsSrc {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * Width of source rectangle in logical units.
     * @type {Integer}
     */
    cxSrc {
        get => NumGet(this, 100, "int")
        set => NumPut("int", value, this, 100)
    }

    /**
     * Height of the source rectangle in logical units.
     * @type {Integer}
     */
    cySrc {
        get => NumGet(this, 104, "int")
        set => NumPut("int", value, this, 104)
    }
}
