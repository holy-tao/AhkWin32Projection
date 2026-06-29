#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WICRect.ahk" { WICRect }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\WICBitmapTransformOptions.ahk" { WICBitmapTransformOptions }

/**
 * Exposes methods for offloading certain operations to the underlying IWICBitmapSource implementation.
 * @remarks
 * The <b>IWICBitmapSourceTransform</b> interface is implemented by codecs which can natively scale, flip, rotate, or format convert pixels during decoding. As the transformation is combined with the decoding process, native transformation will generally offer performance advantages over non-native transformations. The inbox <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapscaler">IWICBitmapScaler</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapfliprotator">IWICBitmapFlipRotator</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicformatconverter">IWICFormatConverter</a> implementations all make use of the <a href="https://docs.microsoft.com/windows/desktop/wic/-wic-imp-iwicbitmapsourcetransform">IWICBitmapSourceTransform</a> interface when they are placed immediately after a supported <a href="https://docs.microsoft.com/windows/desktop/wic/-wic-imp-iwicbitmapframedecode">IWICBitmapFrameDecode</a>, so in the typical case an application will automatically receive this performance increase and does not need to directly use this interface. However, when chaining multiple transformations, or when implementing a custom transformation, there may be a performance advantage to using the IWICBitmapSourceTransform interface directly.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/nn-wincodec-iwicbitmapsourcetransform
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct IWICBitmapSourceTransform extends IUnknown {
    /**
     * The interface identifier for IWICBitmapSourceTransform
     * @type {Guid}
     */
    static IID := Guid("{3b16811b-6a43-4ec9-b713-3d5a0c13b940}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWICBitmapSourceTransform interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CopyPixels            : IntPtr
        GetClosestSize        : IntPtr
        GetClosestPixelFormat : IntPtr
        DoesSupportTransform  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWICBitmapSourceTransform.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Copies pixel data using the supplied input parameters.
     * @remarks
     * <h3><a id="Codec_Developer_Remarks"></a><a id="codec_developer_remarks"></a><a id="CODEC_DEVELOPER_REMARKS"></a>Codec Developer Remarks</h3>
     * If NULL is passed in for <i>prc</i>, the entire image is copied.
     * 
     * For codec developer implementation details for this method, see <a href="https://docs.microsoft.com/windows/win32/wic/-wic-imp-iwicbitmapsourcetransform">Implementing IWICBitmapSourceTransform</a>.
     * 
     * When multiple transform operations are requested, the result is dependent on the order in which the operations are performed.
     *                To ensure predictability and consistency across CODECs, it's important that all CODECs perform these operations in the same order.
     *                The recommended order of these operations is:
     *                <ol>
     * <li>Scale</li>
     * <li>Crop</li>
     * <li>Flip/Rotate</li>
     * </ol>
     * 
     * 
     * Pixel format conversion can be performed at any time, since it has no effect on the other transforms.
     *             
     * 
     * The first parameter, <i>prc</i> is used to specify the region of interest for clipping the image.
     *                By convention, scaling is performed before clipping so, if the image is to be scaled as well as clipped, the region of interest should be determined after the image has been scaled.
     *             
     * 
     * If a <i>dstTransform</i> is specified, the stride is the transformed stride, and is based on the pixelFormat specified in the <b>CopyPixels</b> call, not the original frame's pixel format.
     * @param {Pointer<WICRect>} prc Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/wincodec/ns-wincodec-wicrect">WICRect</a>*</b>
     * 
     * The rectangle of pixels to copy.
     * @param {Integer} uiWidth Type: <b>UINT</b>
     * 
     * The width to scale the source bitmap. This parameter must equal the value obtainable through <a href="https://docs.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapsourcetransform-getclosestsize">IWICBitmapSourceTransform::GetClosestSize</a>.
     * @param {Integer} uiHeight Type: <b>UINT</b>
     * 
     * The height to scale the source bitmap. This parameter must equal the value obtainable through <a href="https://docs.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapsourcetransform-getclosestsize">IWICBitmapSourceTransform::GetClosestSize</a>.
     * @param {Pointer<Guid>} pguidDstFormat Type: <b>WICPixelFormatGUID*</b>
     * 
     * The GUID of desired pixel format in which the pixels should be returned. 
     *                
     * 
     * This GUID must be a format obtained through an <a href="https://docs.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapsourcetransform-getclosestpixelformat">GetClosestPixelFormat</a> call.
     * @param {WICBitmapTransformOptions} dstTransform Type: <b><a href="https://docs.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicbitmaptransformoptions">WICBitmapTransformOptions</a></b>
     * 
     * The desired rotation or flip to perform prior to the pixel copy.
     *                
     * 
     * The transform must be an operation supported by an <a href="https://docs.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapsourcetransform-doessupporttransform">DoesSupportTransform</a> call.
     * 
     * If a <i>dstTransform</i> is specified, <i>nStride</i> is the <i>transformed stride</i> and is based on the <i>pguidDstFormat</i> pixel format, not the original source's pixel format.
     * @param {Integer} nStride Type: <b>UINT</b>
     * 
     * The stride of the destination buffer.
     * @param {Integer} cbBufferSize Type: <b>UINT</b>
     * 
     * The size of the destination buffer.
     * @returns {Integer} Type: <b>BYTE*</b>
     * 
     * The output buffer.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapsourcetransform-copypixels
     */
    CopyPixels(prc, uiWidth, uiHeight, pguidDstFormat, dstTransform, nStride, cbBufferSize) {
        result := ComCall(3, this, WICRect.Ptr, prc, "uint", uiWidth, "uint", uiHeight, Guid.Ptr, pguidDstFormat, WICBitmapTransformOptions, dstTransform, "uint", nStride, "uint", cbBufferSize, "char*", &pbBuffer := 0, "HRESULT")
        return pbBuffer
    }

    /**
     * Returns the closest dimensions the implementation can natively scale to given the desired dimensions.
     * @remarks
     * The Windows provided codecs provide the following support for native scaling:
     * 
     * 
     * <ul>
     * <li>BMP, ICO, GIF, TIFF: No implementation of <a href="https://docs.microsoft.com/windows/desktop/wic/-wic-imp-iwicbitmapsourcetransform">IWICBitmapSourceTransform</a>.</li>
     * <li>PNG: No scaling support.</li>
     * <li>JPEG: Native down-scaling by a factor of 8, 4, or 2.</li>
     * <li>JPEG-XR:  Native scaling of the original image by powers of 2.
     * </li>
     * </ul>
     * @param {Pointer<Integer>} puiWidth Type: <b>UINT*</b>
     * 
     * The desired width. A pointer that receives the closest supported width.
     * @param {Pointer<Integer>} puiHeight Type: <b>UINT*</b>
     * 
     * The desired height. A pointer that receives the closest supported height.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapsourcetransform-getclosestsize
     */
    GetClosestSize(puiWidth, puiHeight) {
        puiWidthMarshal := puiWidth is VarRef ? "uint*" : "ptr"
        puiHeightMarshal := puiHeight is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, puiWidthMarshal, puiWidth, puiHeightMarshal, puiHeight, "HRESULT")
        return result
    }

    /**
     * Retrieves the closest pixel format to which the implementation of IWICBitmapSourceTransform can natively copy pixels, given a desired format.
     * @remarks
     * The Windows provided codecs provide the following support:
     * 
     * <ul>
     * <li>BMP, ICO, GIF, TIFF: No implementation of <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsourcetransform">IWICBitmapSourceTransform</a>.</li>
     * <li>JPEG, PNG, JPEG-XR: Trivial support (always returns the same value as <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapsource-getpixelformat">IWICBitmapFrameDecode::GetPixelFormat</a>).</li>
     * </ul>
     * @param {Pointer<Guid>} pguidDstFormat Type: <b>WICPixelFormatGUID*</b>
     * 
     * A pointer that receives the GUID of the pixel format that is the closest supported pixel format of the desired format.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapsourcetransform-getclosestpixelformat
     */
    GetClosestPixelFormat(pguidDstFormat) {
        result := ComCall(5, this, Guid.Ptr, pguidDstFormat, "HRESULT")
        return result
    }

    /**
     * Determines whether a specific transform option is supported natively by the implementation of the IWICBitmapSourceTransform interface.
     * @remarks
     * The Windows provided codecs provide the following level of support:
     * 
     * <ul>
     * <li>BMP, ICO, GIF, TIFF: No implementation of <a href="https://docs.microsoft.com/windows/desktop/wic/-wic-imp-iwicbitmapsourcetransform">IWICBitmapSourceTransform</a>.</li>
     * <li>JPEG, PNG: Trivial support (WICBitmapTransformRotate0 only).</li>
     * <li>JPEG-XR: Support for all transformation/rotations.
     * </li>
     * </ul>
     * @param {WICBitmapTransformOptions} dstTransform Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicbitmaptransformoptions">WICBitmapTransformOptions</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicbitmaptransformoptions">WICBitmapTransformOptions</a> to check if they are supported.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * A pointer that receives a value specifying whether the transform option is supported.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapsourcetransform-doessupporttransform
     */
    DoesSupportTransform(dstTransform) {
        result := ComCall(6, this, WICBitmapTransformOptions, dstTransform, BOOL.Ptr, &pfIsSupported := 0, "HRESULT")
        return pfIsSupported
    }

    Query(iid) {
        if (IWICBitmapSourceTransform.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CopyPixels := CallbackCreate(GetMethod(implObj, "CopyPixels"), flags, 9)
        this.vtbl.GetClosestSize := CallbackCreate(GetMethod(implObj, "GetClosestSize"), flags, 3)
        this.vtbl.GetClosestPixelFormat := CallbackCreate(GetMethod(implObj, "GetClosestPixelFormat"), flags, 2)
        this.vtbl.DoesSupportTransform := CallbackCreate(GetMethod(implObj, "DoesSupportTransform"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CopyPixels)
        CallbackFree(this.vtbl.GetClosestSize)
        CallbackFree(this.vtbl.GetClosestPixelFormat)
        CallbackFree(this.vtbl.DoesSupportTransform)
    }
}
