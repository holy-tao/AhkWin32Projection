#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WICBitmapPaletteType.ahk" { WICBitmapPaletteType }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IWICBitmapSource.ahk" { IWICBitmapSource }
#Import ".\IWICPalette.ahk" { IWICPalette }
#Import ".\WICBitmapDitherType.ahk" { WICBitmapDitherType }

/**
 * Allows a format converter to be initialized with a planar source.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/nn-wincodec-iwicplanarformatconverter
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct IWICPlanarFormatConverter extends IWICBitmapSource {
    /**
     * The interface identifier for IWICPlanarFormatConverter
     * @type {Guid}
     */
    static IID := Guid("{bebee9cb-83b0-4dcc-8132-b0aaa55eac96}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWICPlanarFormatConverter interfaces
    */
    struct Vtbl extends IWICBitmapSource.Vtbl {
        Initialize : IntPtr
        CanConvert : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWICPlanarFormatConverter.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @param {WICBitmapDitherType} dither Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicbitmapdithertype">WICBitmapDitherType</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicbitmapdithertype">WICBitmapDitherType</a> used for conversion.
     * @param {IWICPalette} pIPalette Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicpalette">IWICPalette</a>*</b>
     * 
     * The palette to use for conversion.
     * @param {Float} alphaThresholdPercent Type: <b>double</b>
     * 
     * The alpha threshold to use for conversion.
     * @param {WICBitmapPaletteType} paletteTranslate Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicbitmappalettetype">WICBitmapPaletteType</a></b>
     * 
     * The palette translation type to use for conversion.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicplanarformatconverter-initialize
     */
    Initialize(ppPlanes, cPlanes, dstFormat, dither, pIPalette, alphaThresholdPercent, paletteTranslate) {
        result := ComCall(8, this, IWICBitmapSource.Ptr, ppPlanes, "uint", cPlanes, Guid.Ptr, dstFormat, WICBitmapDitherType, dither, "ptr", pIPalette, "double", alphaThresholdPercent, WICBitmapPaletteType, paletteTranslate, "HRESULT")
        return result
    }

    /**
     * Query if the format converter can convert from one format to another.
     * @remarks
     * To specify an interleaved input pixel format, provide a length 1 array to <i>pSrcPixelFormats</i>.
     * @param {Pointer<Guid>} pSrcPixelFormats An array of WIC pixel formats that represents source image planes.
     * @param {Integer} cSrcPlanes The number of source pixel formats specified by the <i>pSrcFormats</i> parameter.
     * @param {Pointer<Guid>} dstPixelFormat The destination interleaved pixel format.
     * @returns {BOOL} True if the conversion is supported.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicplanarformatconverter-canconvert
     */
    CanConvert(pSrcPixelFormats, cSrcPlanes, dstPixelFormat) {
        result := ComCall(9, this, Guid.Ptr, pSrcPixelFormats, "uint", cSrcPlanes, Guid.Ptr, dstPixelFormat, BOOL.Ptr, &pfCanConvert := 0, "HRESULT")
        return pfCanConvert
    }

    Query(iid) {
        if (IWICPlanarFormatConverter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 8)
        this.vtbl.CanConvert := CallbackCreate(GetMethod(implObj, "CanConvert"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.CanConvert)
    }
}
