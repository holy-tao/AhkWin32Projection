#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWICBitmapSource.ahk

/**
 * Represents an IWICBitmapSource that converts the image data from one pixel format to another, handling dithering and halftoning to indexed formats, palette translation and alpha thresholding.
 * @see https://learn.microsoft.com/windows/win32/api//content/wincodec/nn-wincodec-iwicformatconverter
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICFormatConverter extends IWICBitmapSource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWICFormatConverter
     * @type {Guid}
     */
    static IID => Guid("{00000301-a8f2-4877-ba0a-fd2b6645fb94}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "CanConvert"]

    /**
     * Initializes the format converter.
     * @remarks
     * If you do not have a predefined palette, you must first create one. Use <a href="https://docs.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicpalette-initializefrombitmap">InitializeFromBitmap</a> to create the palette object, then pass it in along with your other parameters.
     * 
     * 
     * <i>dither</i>, <i>pIPalette</i>, <i>alphaThresholdPercent</i>, and <i>paletteTranslate</i> are used to mitigate color loss when converting to a reduced bit-depth format. For conversions that do not need these settings, the following parameters values should be used: <i>dither</i> set to <b>WICBitmapDitherTypeNone</b>, <i>pIPalette</i> set to <b>NULL</b>, <i>alphaThresholdPercent</i> set to <b>0.0f</b>, and <i>paletteTranslate</i> set to <b>WICBitmapPaletteTypeCustom</b>.  
     * 
     * 
     * The basic algorithm involved when using an ordered dither requires a fixed palette, found in the <a href="https://docs.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicbitmappalettetype">WICBitmapPaletteType</a> enumeration, in a specific order.
     * 
     * Often, the actual palette provided for the output may have a different ordering or some slight variation in the actual colors. This is the case when using the Microsoft Windows palette which has slight differences among versions of Windows.To provide for this, a palette and a palette translation are given to the format converter. The <i>pIPalette</i> is the actual destination palette to be used and the <i>paletteTranslate</i> is a fixed palette. Once the conversion is complete, the colors are mapped from the fixed palette to the actual colors in <i>pIPalette</i> using a nearest color matching algorithm.
     * 
     *  If colors in <i>pIPalette</i> do not closely match those in <i>paletteTranslate</i>, the mapping may produce undesirable results.
     * 
     * <b>WICBitmapDitherTypeOrdered4x4</b> can be useful in format conversions from 8-bit formats to 5- or 6-bit formats as there is no way to accurately convert color data.
     * 
     * <b>WICBitmapDitherTypeErrorDiffusion</b> selects the error diffusion algorithm and may be used with any palette. If an arbitrary palette is provided, <b>WICBitmapPaletteCustom</b> should be passed in as the <i>paletteTranslate</i>. Error diffusion often provides superior results compared to the ordered dithering algorithms especially when combined with the optimized palette generation functionality on the <a href="https://docs.microsoft.com/windows/win32/api/wincodec/nn-wincodec-iwicpalette">IWICPalette</a>.
     * 
     *  When converting a bitmap which has an alpha channel, such as a Portable Network Graphics (PNG), to 8bpp, the alpha channel is normally ignored. Any pixels which were transparent in the original bitmap show up as black in the final output because both transparent and black have pixel values of zero in the respective formats.
     * 
     * Some 8bpp content can contains an alpha color; for instance, the Graphics Interchange Format (GIF) format allows for a single palette entry to be used as a transparent color.
     * For this type of content, <i>alphaThresholdPercent</i>  specifies what percentage of transparency should map to the transparent color. Because the alpha value is directly proportional to the opacity (not transparency) of a pixel, the <i>alphaThresholdPercent</i> indicates what level of opacity is mapped to the fully transparent color. 
     * 
     * For instance, 9.8% implies that any pixel with an alpha value of less than 25 will be mapped to the transparent color. A value of 100% maps all pixels which are not fully opaque to the transparent color. Note that the palette should provide a transparent color. If it does not, the 'transparent' color will be the one closest to zero - often black.
     * @param {IWICBitmapSource} pISource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a>*</b>
     * 
     * The input bitmap to convert
     * @param {Pointer<Guid>} dstFormat Type: <b>REFWICPixelFormatGUID</b>
     * 
     * The destination pixel format GUID.
     * @param {Integer} dither Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicbitmapdithertype">WICBitmapDitherType</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicbitmapdithertype">WICBitmapDitherType</a> used for conversion.
     * @param {IWICPalette} pIPalette Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicpalette">IWICPalette</a>*</b>
     * 
     * The palette to use for conversion.
     * @param {Float} alphaThresholdPercent Type: <b>double</b>
     * 
     * The alpha threshold to use for conversion.
     * @param {Integer} paletteTranslate Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicbitmappalettetype">WICBitmapPaletteType</a></b>
     * 
     * The palette translation type to use for conversion.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/wincodec/nf-wincodec-iwicformatconverter-initialize
     */
    Initialize(pISource, dstFormat, dither, pIPalette, alphaThresholdPercent, paletteTranslate) {
        result := ComCall(8, this, "ptr", pISource, "ptr", dstFormat, "int", dither, "ptr", pIPalette, "double", alphaThresholdPercent, "int", paletteTranslate, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Determines if the source pixel format can be converted to the destination pixel format.
     * @param {Pointer<Guid>} srcPixelFormat Type: <b>REFWICPixelFormatGUID</b>
     * 
     * The source pixel format.
     * @param {Pointer<Guid>} dstPixelFormat Type: <b>REFWICPixelFormatGUID</b>
     * 
     * The destination pixel format.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * A pointer that receives a value indicating whether the source pixel format can be converted to the destination pixel format.
     * @see https://learn.microsoft.com/windows/win32/api//content/wincodec/nf-wincodec-iwicformatconverter-canconvert
     */
    CanConvert(srcPixelFormat, dstPixelFormat) {
        result := ComCall(9, this, "ptr", srcPixelFormat, "ptr", dstPixelFormat, "int*", &pfCanConvert := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfCanConvert
    }
}
