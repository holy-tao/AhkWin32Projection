#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMR.ahk
#Include ..\..\Foundation\RECTL.ahk
#Include ..\..\Foundation\POINTL.ahk
#Include .\XFORM.ahk

/**
 * The EMRPLGBLT structure contains members for the PlgBlt enhanced metafile record. Note that graphics device interface (GDI) converts the device-dependent bitmap into a device-independent bitmap (DIB) before storing it in the metafile record.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrplgblt
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EMRPLGBLT extends Win32Struct
{
    static sizeof => 144

    static packingSize => 8

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
     * Array of three points in logical space that identify three corners of the destination parallelogram. The upper-left corner of the source rectangle is mapped to the first point in this array, the upper-right corner to the second point in this array, and the lower-left corner to the third point. The lower-right corner of the source rectangle is mapped to the implicit fourth point in the parallelogram.
     * @type {Array<POINTL>}
     */
    aptlDest{
        get {
            if(!this.HasProp("__aptlDestProxyArray"))
                this.__aptlDestProxyArray := Win32FixedArray(this.ptr + 24, 3, POINTL, "")
            return this.__aptlDestProxyArray
        }
    }

    /**
     * Logical x-coordinate of the upper-left corner of the source rectangle.
     * @type {Integer}
     */
    xSrc {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * Logical y-coordinate of the upper-left corner of the source rectangle.
     * @type {Integer}
     */
    ySrc {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }

    /**
     * Logical width of the source.
     * @type {Integer}
     */
    cxSrc {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * Logical height of the source.
     * @type {Integer}
     */
    cySrc {
        get => NumGet(this, 60, "int")
        set => NumPut("int", value, this, 60)
    }

    /**
     * World-space to page-space transformation of the source device context.
     * @type {XFORM}
     */
    xformSrc{
        get {
            if(!this.HasProp("__xformSrc"))
                this.__xformSrc := XFORM(64, this)
            return this.__xformSrc
        }
    }

    /**
     * Background color (the RGB value) of the source device context. To make a <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> value, use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-rgb">RGB</a> macro.
     * @type {COLORREF}
     */
    crBkColorSrc {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * Value of the <b>bmiColors</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure. The <b>iUsageSrc</b> member can be either the DIB_PAL_COLORS or DIB_RGB_COLORS value.
     * @type {Integer}
     */
    iUsageSrc {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * Offset to source <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure.
     * @type {Integer}
     */
    offBmiSrc {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * Size of source <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure.
     * @type {Integer}
     */
    cbBmiSrc {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * Offset to source bitmap bits.
     * @type {Integer}
     */
    offBitsSrc {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * Size of source bitmap bits.
     * @type {Integer}
     */
    cbBitsSrc {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * Horizontal pixel offset into mask bitmap.
     * @type {Integer}
     */
    xMask {
        get => NumGet(this, 112, "int")
        set => NumPut("int", value, this, 112)
    }

    /**
     * Vertical pixel offset into mask bitmap.
     * @type {Integer}
     */
    yMask {
        get => NumGet(this, 116, "int")
        set => NumPut("int", value, this, 116)
    }

    /**
     * Value of the <b>bmiColors</b> member of the mask <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure.
     * @type {Integer}
     */
    iUsageMask {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * Offset to mask <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure.
     * @type {Integer}
     */
    offBmiMask {
        get => NumGet(this, 124, "uint")
        set => NumPut("uint", value, this, 124)
    }

    /**
     * Size of mask <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure.
     * @type {Integer}
     */
    cbBmiMask {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * Offset to mask bitmap bits.
     * @type {Integer}
     */
    offBitsMask {
        get => NumGet(this, 132, "uint")
        set => NumPut("uint", value, this, 132)
    }

    /**
     * Size of mask bitmap bits.
     * @type {Integer}
     */
    cbBitsMask {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }
}
