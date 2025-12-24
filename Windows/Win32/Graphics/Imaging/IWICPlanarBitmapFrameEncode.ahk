#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Allows planar component image pixels to be written to an encoder.
 * @remarks
 * 
 * Encoding YCbCr data using <b>IWICPlanarBitmapFrameEncode</b> is similar but not identical to encoding interleaved data using <a href="https://docs.microsoft.com/windows/desktop/wic/-wic-imp-iwicbitmapframeencode">IWICBitmapFrameEncode</a>. The planar interface only exposes the ability to write planar frame image data, and you should continue to use the frame encode interface to set metadata or a thumbnail and to commit at the end of the operation.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/nn-wincodec-iwicplanarbitmapframeencode
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICPlanarBitmapFrameEncode extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWICPlanarBitmapFrameEncode
     * @type {Guid}
     */
    static IID => Guid("{f928b7b8-2221-40c1-b72e-7e82f1974d1a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["WritePixels", "WriteSource"]

    /**
     * Writes lines from the source planes to the encoded format.
     * @param {Integer} lineCount Type: <b>UINT</b>
     * 
     * The number of lines to encode.  See the Remarks section for WIC Jpeg specific line count restrictions.
     * @param {Pointer<WICBitmapPlane>} pPlanes Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ns-wincodec-wicbitmapplane">WICBitmapPlane</a>*</b>
     * 
     * Specifies the source buffers for each component plane encoded.
     * @param {Integer} cPlanes Type: <b>UINT</b>
     * 
     * The number of component planes specified by the <i>pPlanes</i> parameter.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the planes and source rectangle do not meet the requirements, this method fails with <b>WINCODEC_ERR_IMAGESIZEOUTOFRANGE</b>.
     * 
     * If the <a href="/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a> format does not meet the encoder requirements, this method fails with <b>WINCODEC_ERR_UNSUPPORTEDPIXELFORMAT</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicplanarbitmapframeencode-writepixels
     */
    WritePixels(lineCount, pPlanes, cPlanes) {
        result := ComCall(3, this, "uint", lineCount, "ptr", pPlanes, "uint", cPlanes, "HRESULT")
        return result
    }

    /**
     * Writes lines from the source planes to the encoded format.
     * @param {Pointer<IWICBitmapSource>} ppPlanes Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a>**</b>
     * 
     * Specifies an array of <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a> that represent image planes.
     * @param {Integer} cPlanes Type: <b>UINT</b>
     * 
     * The number of component planes specified by the planes parameter.
     * @param {Pointer<WICRect>} prcSource Type: <b>WICRect*</b>
     * 
     * The source rectangle of pixels to encode from the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a> planes.  Null indicates the entire source.  The source rect width must match the width set through <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapframeencode-setsize">SetSize</a>. Repeated <b>WriteSource</b> calls can be made as long as the total accumulated source rect height is the same as set through <b>SetSize</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the planes and source rectangle do not meet the requirements, this method fails with <b>WINCODEC_ERR_IMAGESIZEOUTOFRANGE</b>.
     * 
     * 
     * 
     * If the <a href="/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a> format does not meet the encoder requirements, this method fails with <b>WINCODEC_ERR_UNSUPPORTEDPIXELFORMAT</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicplanarbitmapframeencode-writesource
     */
    WriteSource(ppPlanes, cPlanes, prcSource) {
        result := ComCall(4, this, "ptr*", ppPlanes, "uint", cPlanes, "ptr", prcSource, "HRESULT")
        return result
    }
}
