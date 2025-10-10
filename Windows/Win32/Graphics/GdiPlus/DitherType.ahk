#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DitherType enumeration identifies the available algorithms for dithering when a bitmap is converted.
 * @remarks
 * 
  * If you pass any of the ordered or spiral dither types (except <b>DitherTypeOrdered4x4</b>) to the <i>dithertype</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusheaders/nf-gdiplusheaders-bitmap-convertformat">Bitmap::ConvertFormat</a> method, you must pass one of the following fixed palette types to the <i>palettetype</i> parameter.
  * 
  * <ul>
  * <li><b>PaletteTypeFixedBW</b></li>
  * <li><b>PaletteTypeFixedHalftone8</b></li>
  * <li><b>PaletteTypeFixedHalftone27</b></li>
  * <li><b>PaletteTypeFixedHalftone64</b></li>
  * <li><b>PaletteTypeFixedHalftone125</b></li>
  * <li><b>PaletteTypeFixedHalftone216</b></li>
  * <li><b>PaletteTypeFixedHalftone252</b></li>
  * <li><b>PaletteTypeFixedHalftone256</b></li>
  * </ul>
  * The <b>DitherTypeOrdered4x4</b> algorithm is a special case. You can use it with the fixed palette types shown in the preceding list or you can use it to convert a bitmap to a 16-bits-per-pixel format.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//gdipluspixelformats/ne-gdipluspixelformats-dithertype
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class DitherType{

    /**
     * No dithering is performed. Pixels in the source bitmap are mapped to the nearest color in the palette specified by the <i>palette</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusheaders/nf-gdiplusheaders-bitmap-convertformat">Bitmap::ConvertFormat</a> method. This algorithm can be used with any palette. If the palette specified by the <i>palette</i> parameter does not have one of the standard fixed formats listed in the <a href="https://docs.microsoft.com/windows/desktop/api/gdipluspixelformats/ne-gdipluspixelformats-palettetype">PaletteType</a> enumeration, pass <b>PaletteTypeCustom</b> to the <i>palettetype</i> parameter.
     * @type {Integer (Int32)}
     */
    static DitherTypeNone => 0

    /**
     * No dithering is performed. Pixels in the source bitmap are mapped to the nearest color in the palette specified by the <i>palette</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusheaders/nf-gdiplusheaders-bitmap-convertformat">Bitmap::ConvertFormat</a> method. This algorithm can be used with any palette. If the palette specified by the <i>palette</i> parameter does not have one of the standard fixed formats listed in the <a href="https://docs.microsoft.com/windows/desktop/api/gdipluspixelformats/ne-gdipluspixelformats-palettetype">PaletteType</a> enumeration, pass <b>PaletteTypeCustom</b> to the <i>palettetype</i> parameter.
     * @type {Integer (Int32)}
     */
    static DitherTypeSolid => 1

    /**
     * You can use this algorithm to perform dithering based on the colors in one of the standard fixed palettes. You can also use this algorithm to convert a bitmap to a 16-bits-per-pixel format that has no palette.
     * @type {Integer (Int32)}
     */
    static DitherTypeOrdered4x4 => 2

    /**
     * Dithering is performed using the colors in one of the standard fixed palettes.
     * @type {Integer (Int32)}
     */
    static DitherTypeOrdered8x8 => 3

    /**
     * Dithering is performed using the colors in one of the standard fixed palettes.
     * @type {Integer (Int32)}
     */
    static DitherTypeOrdered16x16 => 4

    /**
     * Dithering is performed using the colors in one of the standard fixed palettes.
     * @type {Integer (Int32)}
     */
    static DitherTypeSpiral4x4 => 5

    /**
     * Dithering is performed using the colors in one of the standard fixed palettes.
     * @type {Integer (Int32)}
     */
    static DitherTypeSpiral8x8 => 6

    /**
     * Dithering is performed using the colors in one of the standard fixed palettes.
     * @type {Integer (Int32)}
     */
    static DitherTypeDualSpiral4x4 => 7

    /**
     * Dithering is performed using the colors in one of the standard fixed palettes.
     * @type {Integer (Int32)}
     */
    static DitherTypeDualSpiral8x8 => 8

    /**
     * Dithering is performed based on the palette specified by the <i>palette</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusheaders/nf-gdiplusheaders-bitmap-convertformat">Bitmap::ConvertFormat</a> method. This algorithm can be used with any palette. If the palette specified by the <i>palette</i> parameter does not have one of the standard fixed formats listed in the <a href="https://docs.microsoft.com/windows/desktop/api/gdipluspixelformats/ne-gdipluspixelformats-palettetype">PaletteType</a> enumeration, pass <b>PaletteTypeCustom</b> to the <i>palettetype</i> parameter.
     * @type {Integer (Int32)}
     */
    static DitherTypeErrorDiffusion => 9

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static DitherTypeMax => 10
}
