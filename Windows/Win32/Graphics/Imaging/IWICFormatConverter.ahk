#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWICBitmapSource.ahk

/**
 * Represents an IWICBitmapSource that converts the image data from one pixel format to another, handling dithering and halftoning to indexed formats, palette translation and alpha thresholding.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/nn-wincodec-iwicformatconverter
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicformatconverter-initialize
     */
    Initialize(pISource, dstFormat, dither, pIPalette, alphaThresholdPercent, paletteTranslate) {
        result := ComCall(8, this, "ptr", pISource, "ptr", dstFormat, "int", dither, "ptr", pIPalette, "double", alphaThresholdPercent, "int", paletteTranslate, "HRESULT")
        return result
    }

    /**
     * Determines if the source pixel format can be converted to the destination pixel format.
     * @param {Pointer<Guid>} srcPixelFormat Type: <b>REFWICPixelFormatGUID</b>
     * 
     * The source pixel format.
     * @param {Pointer<Guid>} dstPixelFormat Type: <b>REFWICPixelFormatGUID</b>
     * 
     * The destionation pixel format.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * A pointer that receives a value indicating whether the source pixel format can be converted to the destination pixel format.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicformatconverter-canconvert
     */
    CanConvert(srcPixelFormat, dstPixelFormat) {
        result := ComCall(9, this, "ptr", srcPixelFormat, "ptr", dstPixelFormat, "int*", &pfCanConvert := 0, "HRESULT")
        return pfCanConvert
    }
}
