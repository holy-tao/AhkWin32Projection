#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WICRect.ahk" { WICRect }
#Import ".\IWICBitmapSource.ahk" { IWICBitmapSource }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WICBitmapPlane.ahk" { WICBitmapPlane }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Allows planar component image pixels to be written to an encoder.
 * @remarks
 * Encoding YCbCr data using <b>IWICPlanarBitmapFrameEncode</b> is similar but not identical to encoding interleaved data using <a href="https://docs.microsoft.com/windows/desktop/wic/-wic-imp-iwicbitmapframeencode">IWICBitmapFrameEncode</a>. The planar interface only exposes the ability to write planar frame image data, and you should continue to use the frame encode interface to set metadata or a thumbnail and to commit at the end of the operation.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/nn-wincodec-iwicplanarbitmapframeencode
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct IWICPlanarBitmapFrameEncode extends IUnknown {
    /**
     * The interface identifier for IWICPlanarBitmapFrameEncode
     * @type {Guid}
     */
    static IID := Guid("{f928b7b8-2221-40c1-b72e-7e82f1974d1a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWICPlanarBitmapFrameEncode interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        WritePixels : IntPtr
        WriteSource : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWICPlanarBitmapFrameEncode.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Writes lines from the source planes to the encoded format. (IWICPlanarBitmapFrameEncode.WritePixels)
     * @remarks
     * Successive <b>WritePixels</b> calls are assumed sequentially add scanlines to the output image.  <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicplanarformatconverter-initialize">IWICBitmapFrameEncode::Initialize</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapframeencode-setsize">IWICBitmapFrameEncode::SetSize</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapframeencode-setpixelformat">IWICBitmapFrameEncode::SetPixelFormat</a> must be called before this method or it will fail.
     * 
     * The interleaved pixel format set via <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapframeencode-setpixelformat">IWICBitmapFrameEncode::SetPixelFormat</a> and the codec specific encode parameters determine the supported planar formats.
     * 
     * 
     * WIC JPEG Encoder:
     * QueryInterface can be used to obtain this interface from the WIC JPEG <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapframeencode">IWICBitmapFrameEncode</a> implementation.  When using this method to encode Y’CbCr data with the WIC JPEG encoder, chroma subsampling can be configured with encoder options during frame creation.  See the <a href="https://docs.microsoft.com/windows/desktop/wic/-wic-creating-encoder">Encoding Overview</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapencoder-createnewframe">IWICBitmapEncoder::CreateNewFrame</a> for more details.  
     *  
     * 
     * 
     * Depending upon the configured chroma subsampling, the lineCount parameter has the following restrictions:
     * 
     * 
     * <table>
     * <tr>
     * <th>Chroma Subsampling</th>
     * <th>Line Count Restriction</th>
     * <th>Chroma Plane Width</th>
     * <th>Chroma  Plane Height</th>
     * </tr>
     * <tr>
     * <td>4:2:0</td>
     * <td>Multiple of 2, unless the call covers the last scanline of the image</td>
     * <td>lumaWidth / 2 Rounded up to the nearest integer.</td>
     * <td>lumaHeight / 2 Rounded up to the nearest integer.</td>
     * </tr>
     * <tr>
     * <td>4:2:2</td>
     * <td>Any</td>
     * <td>lumaWidth / 2 Rounded up to the nearest integer.</td>
     * <td>Any</td>
     * </tr>
     * <tr>
     * <td>4:4:4</td>
     * <td>Any</td>
     * <td>Any</td>
     * <td>Any</td>
     * </tr>
     * <tr>
     * <td>4:4:0</td>
     * <td>Multiple of 2, unless the call covers the last scanline of the image</td>
     * <td>Any</td>
     * <td>llumaHeight / 2 Rounded up to the nearest integer.</td>
     * </tr>
     * </table>
     *  
     * 
     * The full scanline width must be encoded, and the width of the bitmap sources must match their planar configuration.
     * 
     * Additionally, if a pixel format is set via <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapframeencode-setpixelformat">IWICBitmapFrameEncode::SetPixelFormat</a>, it must be GUID_WICPixelFormat24bppBGR.  
     * 
     * 
     * 
     * The supported pixel formats of the bitmap sources passed into this method are as follows:
     * 
     * 
     * <table>
     * <tr>
     * <th>Plane Count</th>
     * <th>Plane 1</th>
     * <th>Plane 2</th>
     * <th>Plane 3</th>
     * </tr>
     * <tr>
     * <td>3</td>
     * <td>GUID_WICPixelFormat8bppY</td>
     * <td>GUID_WICPixelFormat8bppCb</td>
     * <td>GUID_WICPixelFormat8bppCr</td>
     * </tr>
     * <tr>
     * <td>2</td>
     * <td>GUID_WICPixelFormat8bppY</td>
     * <td>GUID_WICPixelFormat16bppCbCr</td>
     * <td>N/A</td>
     * </tr>
     * </table>
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
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a> format does not meet the encoder requirements, this method fails with <b>WINCODEC_ERR_UNSUPPORTEDPIXELFORMAT</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicplanarbitmapframeencode-writepixels
     */
    WritePixels(lineCount, pPlanes, cPlanes) {
        result := ComCall(3, this, "uint", lineCount, WICBitmapPlane.Ptr, pPlanes, "uint", cPlanes, "HRESULT")
        return result
    }

    /**
     * Writes lines from the source planes to the encoded format. (IWICPlanarBitmapFrameEncode.WriteSource)
     * @remarks
     * Successive <b>WriteSource</b> calls are assumed sequentially add scanlines to the output image.  <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicplanarformatconverter-initialize">IWICBitmapFrameEncode::Initialize</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapframeencode-setsize">IWICBitmapFrameEncode::SetSize</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapframeencode-setpixelformat">IWICBitmapFrameEncode::SetPixelFormat</a> must be called before this method or it will fail.
     * 
     * The interleaved pixel format set via <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapframeencode-setpixelformat">IWICBitmapFrameEncode::SetPixelFormat</a> and the codec specific encode parameters determine the supported planar formats.
     * 
     * 
     * WIC JPEG Encoder:
     * QueryInterface can be used to obtain this interface from the WIC JPEG <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapframeencode">IWICBitmapFrameEncode</a> implementation.  When using this method to encode Y’CbCr data with the WIC JPEG encoder, chroma subsampling can be configured with encoder options during frame creation.  See the <a href="https://docs.microsoft.com/windows/desktop/wic/-wic-creating-encoder">Encoding Overview</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapencoder-createnewframe">IWICBitmapEncoder::CreateNewFrame</a> for more details.  
     *  
     * 
     * 
     * Depending upon the configured chroma subsampling, the lineCount parameter has the following restrictions:
     * 
     * 
     * <table>
     * <tr>
     * <th>Chroma Subsampling</th>
     * <th>X Coordinate</th>
     * <th>Y Coordinate</th>
     * <th>Chroma Width</th>
     * <th>Chroma Height</th>
     * </tr>
     * <tr>
     * <td>4:2:0</td>
     * <td>Multiple of 2</td>
     * <td>Multiple of 2</td>
     * <td>lumaWidth / 2 Rounded up to the nearest integer.</td>
     * <td>lumaHeight / 2 Rounded up to the nearest integer.</td>
     * </tr>
     * <tr>
     * <td>4:2:2</td>
     * <td>Multiple of 2</td>
     * <td>Any</td>
     * <td>lumaWidth / 2 Rounded up to the nearest integer.</td>
     * <td>Any</td>
     * </tr>
     * <tr>
     * <td>4:4:4</td>
     * <td>Any</td>
     * <td>Any</td>
     * <td>Any</td>
     * <td>Any</td>
     * </tr>
     * <tr>
     * <td>4:4:0</td>
     * <td>Any</td>
     * <td>Multiple of 2</td>
     * <td>lumaWidth</td>
     * <td>llumaHeight / 2 Rounded up to the nearest integer.</td>
     * </tr>
     * </table>
     *  
     * 
     * The full scanline width must be encoded, and the width of the bitmap sources must match their planar configuration.
     * 
     * Additionally, if a pixel format is set via <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapframeencode-setpixelformat">IWICBitmapFrameEncode::SetPixelFormat</a>, it must be GUID_WICPixelFormat24bppBGR.  
     * 
     * 
     * 
     * The supported pixel formats of the bitmap sources passed into this method are as follows:
     * 
     * 
     * <table>
     * <tr>
     * <th>Plane Count</th>
     * <th>Plane 1</th>
     * <th>Plane 2</th>
     * <th>Plane 3</th>
     * </tr>
     * <tr>
     * <td>3</td>
     * <td>GUID_WICPixelFormat8bppY</td>
     * <td>GUID_WICPixelFormat8bppCb</td>
     * <td>GUID_WICPixelFormat8bppCr</td>
     * </tr>
     * <tr>
     * <td>2</td>
     * <td>GUID_WICPixelFormat8bppY</td>
     * <td>GUID_WICPixelFormat16bppCbCr</td>
     * <td>N/A</td>
     * </tr>
     * </table>
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
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a> format does not meet the encoder requirements, this method fails with <b>WINCODEC_ERR_UNSUPPORTEDPIXELFORMAT</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicplanarbitmapframeencode-writesource
     */
    WriteSource(ppPlanes, cPlanes, prcSource) {
        result := ComCall(4, this, IWICBitmapSource.Ptr, ppPlanes, "uint", cPlanes, WICRect.Ptr, prcSource, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWICPlanarBitmapFrameEncode.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.WritePixels := CallbackCreate(GetMethod(implObj, "WritePixels"), flags, 4)
        this.vtbl.WriteSource := CallbackCreate(GetMethod(implObj, "WriteSource"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.WritePixels)
        CallbackFree(this.vtbl.WriteSource)
    }
}
