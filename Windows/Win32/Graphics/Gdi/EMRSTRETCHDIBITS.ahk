#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMR.ahk
#Include ..\..\Foundation\RECTL.ahk

/**
 * The EMRSTRETCHDIBITS structure contains members for the StretchDIBits enhanced metafile record.
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-emrstretchdibits
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EMRSTRETCHDIBITS extends Win32Struct
{
    static sizeof => 80

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
     * Logical x-coordinate of the upper-left corner of the source rectangle.
     * @type {Integer}
     */
    xSrc {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * Logical y-coordinate of the upper-left corner of the source rectangle.
     * @type {Integer}
     */
    ySrc {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * Width of the source rectangle, in logical units.
     * @type {Integer}
     */
    cxSrc {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * Height of the source rectangle, in logical units.
     * @type {Integer}
     */
    cySrc {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * Offset to the source <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure.
     * @type {Integer}
     */
    offBmiSrc {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Size of the source <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure.
     * @type {Integer}
     */
    cbBmiSrc {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Offset to source bitmap bits.
     * @type {Integer}
     */
    offBitsSrc {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Size of source bitmap bits.
     * @type {Integer}
     */
    cbBitsSrc {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Value of the <b>bmiColors</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure. The <b>iUsageSrc</b> member can be either the DIB_PAL_COLORS or DIB_RGB_COLORS value.
     * @type {Integer}
     */
    iUsageSrc {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Raster-operation code. These codes define how the color data of the source rectangle is to be combined with the color data of the destination rectangle to achieve the final color.
     * @type {Integer}
     */
    dwRop {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * Logical width of the destination rectangle.
     * @type {Integer}
     */
    cxDest {
        get => NumGet(this, 72, "int")
        set => NumPut("int", value, this, 72)
    }

    /**
     * Logical height of the destination rectangle.
     * @type {Integer}
     */
    cyDest {
        get => NumGet(this, 76, "int")
        set => NumPut("int", value, this, 76)
    }
}
