#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Direct2D\Common\D2D_SIZE_U.ahk" { D2D_SIZE_U }
#Import "..\..\Foundation\POINT.ahk" { POINT }

/**
 * Data for a single glyph from GetGlyphImageData.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/ns-dwrite_3-dwrite_glyph_image_data
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct DWRITE_GLYPH_IMAGE_DATA {
    #StructPack 8

    /**
     * Pointer to the glyph data.
     */
    imageData : IntPtr

    /**
     * Size of glyph data in bytes.
     */
    imageDataSize : UInt32

    /**
     * Unique identifier for the glyph data. Clients may use this to cache a parsed/decompressed version and tell whether a repeated call to the same font returns the same data.
     */
    uniqueDataId : UInt32

    /**
     * Pixels per em of the returned data. For non-scalable raster data (PNG/TIFF/JPG), this can be larger or smaller than requested from GetGlyphImageData when there isn't an exact match.
     *           For scaling intermediate sizes, use: desired pixels per em * font em size / actual pixels per em.
     */
    pixelsPerEm : UInt32

    /**
     * Size of image when the format is pixel data.
     */
    pixelSize : D2D_SIZE_U

    /**
     * Left origin along the horizontal Roman baseline.
     */
    horizontalLeftOrigin : POINT

    /**
     * Right origin along the horizontal Roman baseline.
     */
    horizontalRightOrigin : POINT

    /**
     * Top origin along the vertical central baseline.
     */
    verticalTopOrigin : POINT

    /**
     * Bottom origin along vertical central baseline.
     */
    verticalBottomOrigin : POINT

}
