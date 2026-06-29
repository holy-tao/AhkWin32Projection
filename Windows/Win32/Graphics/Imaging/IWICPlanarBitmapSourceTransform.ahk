#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WICBitmapPlaneDescription.ahk" { WICBitmapPlaneDescription }
#Import ".\WICRect.ahk" { WICRect }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WICBitmapPlane.ahk" { WICBitmapPlane }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\WICPlanarOptions.ahk" { WICPlanarOptions }
#Import ".\WICBitmapTransformOptions.ahk" { WICBitmapTransformOptions }

/**
 * Provides access to planar Y’CbCr pixel formats where pixel components are stored in separate component planes.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/nn-wincodec-iwicplanarbitmapsourcetransform
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct IWICPlanarBitmapSourceTransform extends IUnknown {
    /**
     * The interface identifier for IWICPlanarBitmapSourceTransform
     * @type {Guid}
     */
    static IID := Guid("{3aff9cce-be95-4303-b927-e7d16ff4a613}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWICPlanarBitmapSourceTransform interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        DoesSupportTransform : IntPtr
        CopyPixels           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWICPlanarBitmapSourceTransform.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Use this method to determine if a desired planar output is supported and allow the caller to choose an optimized code path if it is.
     * @param {Pointer<Integer>} puiWidth Type: <b>UINT*</b>
     * 
     * On input, the desired width.  On output, the closest supported width to the desired width; this is the same size or larger than the desired width.
     * @param {Pointer<Integer>} puiHeight Type: <b>UINT*</b>
     * 
     * On input, the desired height.  On output, the closest supported height to the desired height; this is the same size or larger than the desired width.
     * @param {WICBitmapTransformOptions} dstTransform Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicbitmaptransformoptions">WICBitmapTransformOptions</a></b>
     * 
     * The desired rotation or flip operation.  Multiple  <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicbitmaptransformoptions">WICBitmapTransformOptions</a> can be combined in this flag parameter, see <b>WICBitmapTransformOptions</b>.
     * @param {WICPlanarOptions} dstPlanarOptions Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicplanaroptions">WICPlanarOptions</a></b>
     * 
     * Used to specify additional configuration options for the transform.  See <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicplanaroptions">WICPlanarOptions</a> for more detail.
     * 
     * 
     * 
     * WIC JPEG Decoder:
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicplanaroptions">WICPlanarOptionsPreserveSubsampling</a> can be specified to retain the subsampling ratios when downscaling.  By default, the JPEG decoder attempts to preserve quality by downscaling only the Y plane in some cases, changing the image to 4:4:4 chroma subsampling.
     * @param {Pointer<Guid>} pguidDstFormats Type: <b>const WICPixelFormatGUID*</b>
     * 
     * The requested pixel formats of the respective planes.
     * @param {Pointer<WICBitmapPlaneDescription>} pPlaneDescriptions Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ns-wincodec-wicbitmapplanedescription">WICBitmapPlaneDescription</a>*</b>
     * 
     * When *<i>pfIsSupported</i> == TRUE, the array of plane descriptions contains the size and format of each of the planes.
     * 
     * 
     * 
     * WIC JPEG Decoder: The Cb and Cr planes can be a different size from the values returned by <i>puiWidth</i> and <i>puiHeight</i> due to chroma subsampling.
     * @param {Integer} cPlanes Type: <b>UINT</b>
     * 
     * The number of component planes requested.
     * @param {Pointer<BOOL>} pfIsSupported Type: <b>BOOL*</b>
     * 
     * Set to TRUE if the requested transforms are natively supported.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Check the value of <i>pfIsSupported</i> to determine if the transform is supported via <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicplanarbitmapsourcetransform-copypixels">IWICPlanarBitmapSourceTransform::CopyPixels</a>.  If this method fails, the output parameters for width, height, and plane descriptions are zero initialized.
     * Other return values indicate failure.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicplanarbitmapsourcetransform-doessupporttransform
     */
    DoesSupportTransform(puiWidth, puiHeight, dstTransform, dstPlanarOptions, pguidDstFormats, pPlaneDescriptions, cPlanes, pfIsSupported) {
        puiWidthMarshal := puiWidth is VarRef ? "uint*" : "ptr"
        puiHeightMarshal := puiHeight is VarRef ? "uint*" : "ptr"
        pfIsSupportedMarshal := pfIsSupported is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, puiWidthMarshal, puiWidth, puiHeightMarshal, puiHeight, WICBitmapTransformOptions, dstTransform, WICPlanarOptions, dstPlanarOptions, Guid.Ptr, pguidDstFormats, WICBitmapPlaneDescription.Ptr, pPlaneDescriptions, "uint", cPlanes, pfIsSupportedMarshal, pfIsSupported, "HRESULT")
        return result
    }

    /**
     * Copies pixels into the destination planes. Configured by the supplied input parameters.
     * @remarks
     * WIC JPEG Decoder:
     * Depending on the configured chroma subsampling of the image, the source rectangle has the following restrictions:
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
     * <td>lumaHeight</td>
     * </tr>
     * <tr>
     * <td>4:4:4</td>
     * <td>Any</td>
     * <td>Any</td>
     * <td>llumaWidth</td>
     * <td>llumaHeight</td>
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
     * The <i>pDstPlanes</i> parameter supports the following pixel formats.
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
     * @param {Pointer<WICRect>} prcSource Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ns-wincodec-wicrect">WICRect</a>*</b>
     * 
     * The source rectangle of pixels to copy.
     * @param {Integer} uiWidth Type: <b>UINT</b>
     * 
     * The width to scale the source bitmap.  This parameter must be equal to a value obtainable through <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicplanarbitmapsourcetransform-doessupporttransform">IWICPlanarBitmapSourceTransform:: DoesSupportTransform</a>.
     * @param {Integer} uiHeight Type: <b>UINT</b>
     * 
     * The height to scale the source bitmap.  This parameter must be equal to a value obtainable through <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicplanarbitmapsourcetransform-doessupporttransform">IWICPlanarBitmapSourceTransform:: DoesSupportTransform</a>.
     * @param {WICBitmapTransformOptions} dstTransform Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicbitmaptransformoptions">WICBitmapTransformOptions</a></b>
     * 
     * The desired rotation or flip to perform prior to the pixel copy.  A rotate can be combined with a flip horizontal or a flip vertical, see <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicbitmaptransformoptions">WICBitmapTransformOptions</a>.
     * @param {WICPlanarOptions} dstPlanarOptions Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicplanaroptions">WICPlanarOptions</a></b>
     * 
     * Used to specify additional configuration options for the transform.  See <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicplanaroptions">WICPlanarOptions</a> for more detail.
     * 
     * WIC JPEG Decoder:
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicplanaroptions">WICPlanarOptionsPreserveSubsampling</a> can be specified to retain the subsampling ratios when downscaling.  By default, the JPEG decoder attempts to preserve quality by downscaling only the Y plane in some cases, changing the image to 4:4:4 chroma subsampling.
     * @param {Pointer<WICBitmapPlane>} pDstPlanes Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ns-wincodec-wicbitmapplane">WICBitmapPlane</a></b>
     * 
     * Specifies the pixel format and output buffer for each component plane.  The number of planes and pixel format of each plane must match values obtainable through  <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicplanarbitmapsourcetransform-doessupporttransform">IWICPlanarBitmapSourceTransform::DoesSupportTransform</a>.
     * @param {Integer} cPlanes Type: <b>UINT</b>
     * 
     * The number of component planes specified by the <i>pDstPlanes</i> parameter.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the specified scale, flip/rotate, and planar format configuration is not supported this method fails with <b>WINCODEC_ERR_INVALIDPARAMETER</b>.  You can check if a transform is supported by calling <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicplanarbitmapsourcetransform-doessupporttransform">IWICPlanarBitmapSourceTransform::DoesSupportTransform</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicplanarbitmapsourcetransform-copypixels
     */
    CopyPixels(prcSource, uiWidth, uiHeight, dstTransform, dstPlanarOptions, pDstPlanes, cPlanes) {
        result := ComCall(4, this, WICRect.Ptr, prcSource, "uint", uiWidth, "uint", uiHeight, WICBitmapTransformOptions, dstTransform, WICPlanarOptions, dstPlanarOptions, WICBitmapPlane.Ptr, pDstPlanes, "uint", cPlanes, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWICPlanarBitmapSourceTransform.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DoesSupportTransform := CallbackCreate(GetMethod(implObj, "DoesSupportTransform"), flags, 9)
        this.vtbl.CopyPixels := CallbackCreate(GetMethod(implObj, "CopyPixels"), flags, 8)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DoesSupportTransform)
        CallbackFree(this.vtbl.CopyPixels)
    }
}
