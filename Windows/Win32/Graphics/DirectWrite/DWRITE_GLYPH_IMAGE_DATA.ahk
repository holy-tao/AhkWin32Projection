#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Direct2D\Common\D2D_SIZE_U.ahk
#Include ..\..\Foundation\POINT.ahk

/**
 * Data for a single glyph from GetGlyphImageData.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/ns-dwrite_3-dwrite_glyph_image_data
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_GLYPH_IMAGE_DATA extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Pointer to the glyph data.
     * @type {Pointer<Void>}
     */
    imageData {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Size of glyph data in bytes.
     * @type {Integer}
     */
    imageDataSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Unique identifier for the glyph data. Clients may use this to cache a parsed/decompressed version and tell whether a repeated call to the same font returns the same data.
     * @type {Integer}
     */
    uniqueDataId {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Pixels per em of the returned data. For non-scalable raster data (PNG/TIFF/JPG), this can be larger or smaller than requested from GetGlyphImageData when there isn't an exact match.
     *           For scaling intermediate sizes, use: desired pixels per em * font em size / actual pixels per em.
     * @type {Integer}
     */
    pixelsPerEm {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Size of image when the format is pixel data.
     * @type {D2D_SIZE_U}
     */
    pixelSize{
        get {
            if(!this.HasProp("__pixelSize"))
                this.__pixelSize := D2D_SIZE_U(this.ptr + 24)
            return this.__pixelSize
        }
    }

    /**
     * Left origin along the horizontal Roman baseline.
     * @type {POINT}
     */
    horizontalLeftOrigin{
        get {
            if(!this.HasProp("__horizontalLeftOrigin"))
                this.__horizontalLeftOrigin := POINT(this.ptr + 32)
            return this.__horizontalLeftOrigin
        }
    }

    /**
     * Right origin along the horizontal Roman baseline.
     * @type {POINT}
     */
    horizontalRightOrigin{
        get {
            if(!this.HasProp("__horizontalRightOrigin"))
                this.__horizontalRightOrigin := POINT(this.ptr + 40)
            return this.__horizontalRightOrigin
        }
    }

    /**
     * Top origin along the vertical central baseline.
     * @type {POINT}
     */
    verticalTopOrigin{
        get {
            if(!this.HasProp("__verticalTopOrigin"))
                this.__verticalTopOrigin := POINT(this.ptr + 48)
            return this.__verticalTopOrigin
        }
    }

    /**
     * Bottom origin along vertical central baseline.
     * @type {POINT}
     */
    verticalBottomOrigin{
        get {
            if(!this.HasProp("__verticalBottomOrigin"))
                this.__verticalBottomOrigin := POINT(this.ptr + 56)
            return this.__verticalBottomOrigin
        }
    }
}
