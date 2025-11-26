#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWICBitmapSource.ahk

/**
 * Exposes methods that transforms an IWICBitmapSource from one color context to another.
 * @remarks
 * 
 * A <b>IWICColorTransform</b> is an imaging pipeline component that knows how to pull pixels obtained from a given <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a> through a color transform. The color transform is defined by mapping colors from the source color context to the destination color context in a given output pixel format.
 * 
 * Once initialized, a color transform cannot be reinitialized. Because of this, a color transform cannot be used with multiple sources or varying parameters.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/nn-wincodec-iwiccolortransform
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICColorTransform extends IWICBitmapSource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWICColorTransform
     * @type {Guid}
     */
    static IID => Guid("{b66f034f-d0e2-40ab-b436-6de39e321a94}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize"]

    /**
     * Initializes an IWICColorTransform with a IWICBitmapSource and transforms it from one IWICColorContext to another.
     * @param {IWICBitmapSource} pIBitmapSource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a>*</b>
     * 
     * The bitmap source used to initialize the color transform.
     * @param {IWICColorContext} pIContextSource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwiccolorcontext">IWICColorContext</a>*</b>
     * 
     * The color context source.
     * @param {IWICColorContext} pIContextDest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwiccolorcontext">IWICColorContext</a>*</b>
     * 
     * The color context destination.
     * @param {Pointer<Guid>} pixelFmtDest Type: <b>REFWICPixelFormatGUID</b>
     * 
     * The GUID of the desired pixel format.
     * 
     * This parameter is limited to a subset of the native WIC pixel formats, see Remarks for a list.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwiccolortransform-initialize
     */
    Initialize(pIBitmapSource, pIContextSource, pIContextDest, pixelFmtDest) {
        result := ComCall(8, this, "ptr", pIBitmapSource, "ptr", pIContextSource, "ptr", pIContextDest, "ptr", pixelFmtDest, "HRESULT")
        return result
    }
}
