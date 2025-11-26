#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods for offloading certain operations to the underlying IWICBitmapSource implementation.
 * @remarks
 * 
 * The <b>IWICBitmapSourceTransform</b> interface is implemented by codecs which can natively scale, flip, rotate, or format convert pixels during decoding. As the transformation is combined with the decoding process, native transformation will generally offer performance advantages over non-native transformations. The inbox <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapscaler">IWICBitmapScaler</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapfliprotator">IWICBitmapFlipRotator</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicformatconverter">IWICFormatConverter</a> implementations all make use of the <a href="https://docs.microsoft.com/windows/desktop/wic/-wic-imp-iwicbitmapsourcetransform">IWICBitmapSourceTransform</a> interface when they are placed immediately after a supported <a href="https://docs.microsoft.com/windows/desktop/wic/-wic-imp-iwicbitmapframedecode">IWICBitmapFrameDecode</a>, so in the typical case an application will automatically receive this performance increase and does not need to directly use this interface. However, when chaining multiple transformations, or when implementing a custom transformation, there may be a performance advantage to using the IWICBitmapSourceTransform interface directly.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/nn-wincodec-iwicbitmapsourcetransform
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICBitmapSourceTransform extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWICBitmapSourceTransform
     * @type {Guid}
     */
    static IID => Guid("{3b16811b-6a43-4ec9-b713-3d5a0c13b940}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CopyPixels", "GetClosestSize", "GetClosestPixelFormat", "DoesSupportTransform"]

    /**
     * Copies pixel data using the supplied input parameters.
     * @param {Pointer<WICRect>} prc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ns-wincodec-wicrect">WICRect</a>*</b>
     * 
     * The rectangle of pixels to copy.
     * @param {Integer} uiWidth Type: <b>UINT</b>
     * 
     * The width to scale the source bitmap. This parameter must equal the value obtainable through <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapsourcetransform-getclosestsize">IWICBitmapSourceTransform::GetClosestSize</a>.
     * @param {Integer} uiHeight Type: <b>UINT</b>
     * 
     * The height to scale the source bitmap. This parameter must equal the value obtainable through <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapsourcetransform-getclosestsize">IWICBitmapSourceTransform::GetClosestSize</a>.
     * @param {Pointer<Guid>} pguidDstFormat Type: <b>WICPixelFormatGUID*</b>
     * 
     * The GUID of desired pixel format in which the pixels should be returned. 
     *                
     * 
     * This GUID must be a format obtained through an <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapsourcetransform-getclosestpixelformat">GetClosestPixelFormat</a> call.
     * @param {Integer} dstTransform Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicbitmaptransformoptions">WICBitmapTransformOptions</a></b>
     * 
     * The desired rotation or flip to perform prior to the pixel copy.
     *                
     * 
     * The transform must be an operation supported by an <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapsourcetransform-doessupporttransform">DoesSupportTransform</a> call.
     * 
     * If a <i>dstTransform</i> is specified, <i>nStride</i> is the <i>transformed stride</i> and is based on the <i>pguidDstFormat</i> pixel format, not the original source's pixel format.
     * @param {Integer} nStride Type: <b>UINT</b>
     * 
     * The <a href="https://docs.microsoft.com/">stride</a> of the destination buffer.
     * @param {Integer} cbBufferSize Type: <b>UINT</b>
     * 
     * The size of the destination buffer.
     * @returns {Integer} Type: <b>BYTE*</b>
     * 
     * The output buffer.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmapsourcetransform-copypixels
     */
    CopyPixels(prc, uiWidth, uiHeight, pguidDstFormat, dstTransform, nStride, cbBufferSize) {
        result := ComCall(3, this, "ptr", prc, "uint", uiWidth, "uint", uiHeight, "ptr", pguidDstFormat, "int", dstTransform, "uint", nStride, "uint", cbBufferSize, "char*", &pbBuffer := 0, "HRESULT")
        return pbBuffer
    }

    /**
     * Returns the closest dimensions the implementation can natively scale to given the desired dimensions.
     * @param {Pointer<Integer>} puiWidth Type: <b>UINT*</b>
     * 
     * The desired width. A pointer that receives the closest supported width.
     * @param {Pointer<Integer>} puiHeight Type: <b>UINT*</b>
     * 
     * The desired height. A pointer that receives the closest supported height.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmapsourcetransform-getclosestsize
     */
    GetClosestSize(puiWidth, puiHeight) {
        puiWidthMarshal := puiWidth is VarRef ? "uint*" : "ptr"
        puiHeightMarshal := puiHeight is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, puiWidthMarshal, puiWidth, puiHeightMarshal, puiHeight, "HRESULT")
        return result
    }

    /**
     * Retrieves the closest pixel format to which the implementation of IWICBitmapSourceTransform can natively copy pixels, given a desired format.
     * @param {Pointer<Guid>} pguidDstFormat Type: <b>WICPixelFormatGUID*</b>
     * 
     * A pointer that receives the GUID of the pixel format that is the closest supported pixel format of the desired format.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmapsourcetransform-getclosestpixelformat
     */
    GetClosestPixelFormat(pguidDstFormat) {
        result := ComCall(5, this, "ptr", pguidDstFormat, "HRESULT")
        return result
    }

    /**
     * Determines whether a specific transform option is supported natively by the implementation of the IWICBitmapSourceTransform interface.
     * @param {Integer} dstTransform Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicbitmaptransformoptions">WICBitmapTransformOptions</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicbitmaptransformoptions">WICBitmapTransformOptions</a> to check if they are supported.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * A pointer that receives a value specifying whether the transform option is supported.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmapsourcetransform-doessupporttransform
     */
    DoesSupportTransform(dstTransform) {
        result := ComCall(6, this, "int", dstTransform, "int*", &pfIsSupported := 0, "HRESULT")
        return pfIsSupported
    }
}
