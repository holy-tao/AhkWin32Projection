#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMR.ahk
#Include ..\..\Foundation\RECTL.ahk
#Include .\XFORM.ahk
#Include ..\..\Foundation\COLORREF.ahk

/**
 * The EMRMASKBLT structure contains members for the MaskBlt enhanced metafile record. Note that graphics device interface (GDI) converts the device-dependent bitmap into a device-independent bitmap (DIB) before storing it in the metafile record.
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-emrmaskblt
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EMRMASKBLT extends Win32Struct
{
    static sizeof => 136

    static packingSize => 8

    /**
     * The base structure for all record types.
     * @type {EMR}
     */
    emr{
        get {
            if(!this.HasProp("__emr"))
                this.__emr := EMR(this.ptr + 0)
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
                this.__rclBounds := RECTL(this.ptr + 8)
            return this.__rclBounds
        }
    }

    /**
     * Logical x-coordinate of the upper-left corner of the destination rectangle.
     * @type {Integer}
     */
    xDest {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Logical y-coordinate of the upper-left corner of the destination rectangle.
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
     * Raster-operation code. These codes define how the color data of the source rectangle is to be combined with the color data of the destination rectangle to achieve the final color.
     * @type {Integer}
     */
    dwRop {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Logical x-coordinate of the upper-left corner of the source rectangle.
     * @type {Integer}
     */
    xSrc {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * Logical y-coordinate of the upper-left corner of the source rectangle.
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
                this.__xformSrc := XFORM(this.ptr + 56)
            return this.__xformSrc
        }
    }

    /**
     * Background color (the RGB value) of the source device context. To make a <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> value, use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-rgb">RGB</a> macro.
     * @type {COLORREF}
     */
    crBkColorSrc{
        get {
            if(!this.HasProp("__crBkColorSrc"))
                this.__crBkColorSrc := COLORREF(this.ptr + 80)
            return this.__crBkColorSrc
        }
    }

    /**
     * Value of the <b>bmiColors</b> member of the source <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure. The <b>iUsageSrc</b> member can be either the DIB_PAL_COLORS or DIB_RGB_COLORS value.
     * @type {Integer}
     */
    iUsageSrc {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * Offset to source <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure.
     * @type {Integer}
     */
    offBmiSrc {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * Size of source <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure.
     * @type {Integer}
     */
    cbBmiSrc {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * Offset to source bitmap bits.
     * @type {Integer}
     */
    offBitsSrc {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * Size of source bitmap bits.
     * @type {Integer}
     */
    cbBitsSrc {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * Horizontal pixel offset into mask bitmap.
     * @type {Integer}
     */
    xMask {
        get => NumGet(this, 104, "int")
        set => NumPut("int", value, this, 104)
    }

    /**
     * Vertical pixel offset into mask bitmap.
     * @type {Integer}
     */
    yMask {
        get => NumGet(this, 108, "int")
        set => NumPut("int", value, this, 108)
    }

    /**
     * Value of the <b>bmiColors</b> member of the mask <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure.
     * @type {Integer}
     */
    iUsageMask {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * Offset to mask <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure.
     * @type {Integer}
     */
    offBmiMask {
        get => NumGet(this, 116, "uint")
        set => NumPut("uint", value, this, 116)
    }

    /**
     * Size of mask <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure.
     * @type {Integer}
     */
    cbBmiMask {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * Offset to mask bitmap bits.
     * @type {Integer}
     */
    offBitsMask {
        get => NumGet(this, 124, "uint")
        set => NumPut("uint", value, this, 124)
    }

    /**
     * Size of mask bitmap bits.
     * @type {Integer}
     */
    cbBitsMask {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }
}
