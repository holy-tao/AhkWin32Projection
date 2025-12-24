#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWICBitmapSource.ahk

/**
 * Allows a format converter to be initialized with a planar source.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/nn-wincodec-iwicplanarformatconverter
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICPlanarFormatConverter extends IWICBitmapSource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWICPlanarFormatConverter
     * @type {Guid}
     */
    static IID => Guid("{bebee9cb-83b0-4dcc-8132-b0aaa55eac96}")

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
     * Initializes a format converter with a planar source, and specifies the interleaved output pixel format.
     * @param {Pointer<IWICBitmapSource>} ppPlanes Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a>**</b>
     * 
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a> that represents image planes.
     * @param {Integer} cPlanes Type: <b>UINT</b>
     * 
     * The number of component planes specified by the planes parameter.
     * @param {Pointer<Guid>} dstFormat Type: <b>REFWICPixelFormatGUID </b>
     * 
     * The destination interleaved pixel format.
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
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicplanarformatconverter-initialize
     */
    Initialize(ppPlanes, cPlanes, dstFormat, dither, pIPalette, alphaThresholdPercent, paletteTranslate) {
        result := ComCall(8, this, "ptr*", ppPlanes, "uint", cPlanes, "ptr", dstFormat, "int", dither, "ptr", pIPalette, "double", alphaThresholdPercent, "int", paletteTranslate, "HRESULT")
        return result
    }

    /**
     * Query if the format converter can convert from one format to another.
     * @param {Pointer<Guid>} pSrcPixelFormats An array of WIC pixel formats that represents source image planes.
     * @param {Integer} cSrcPlanes The number of source pixel formats specified by the <i>pSrcFormats</i> parameter.
     * @param {Pointer<Guid>} dstPixelFormat The destination interleaved pixel format.
     * @returns {BOOL} True if the conversion is supported.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicplanarformatconverter-canconvert
     */
    CanConvert(pSrcPixelFormats, cSrcPlanes, dstPixelFormat) {
        result := ComCall(9, this, "ptr", pSrcPixelFormats, "uint", cSrcPlanes, "ptr", dstPixelFormat, "int*", &pfCanConvert := 0, "HRESULT")
        return pfCanConvert
    }
}
