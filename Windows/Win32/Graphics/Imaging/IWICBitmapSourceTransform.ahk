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
     * 
     * @param {Pointer<WICRect>} prc 
     * @param {Integer} uiWidth 
     * @param {Integer} uiHeight 
     * @param {Pointer<Guid>} pguidDstFormat 
     * @param {Integer} dstTransform 
     * @param {Integer} nStride 
     * @param {Integer} cbBufferSize 
     * @param {Pointer<Integer>} pbBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapsourcetransform-copypixels
     */
    CopyPixels(prc, uiWidth, uiHeight, pguidDstFormat, dstTransform, nStride, cbBufferSize, pbBuffer) {
        result := ComCall(3, this, "ptr", prc, "uint", uiWidth, "uint", uiHeight, "ptr", pguidDstFormat, "int", dstTransform, "uint", nStride, "uint", cbBufferSize, "char*", pbBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} puiWidth 
     * @param {Pointer<Integer>} puiHeight 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapsourcetransform-getclosestsize
     */
    GetClosestSize(puiWidth, puiHeight) {
        result := ComCall(4, this, "uint*", puiWidth, "uint*", puiHeight, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidDstFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapsourcetransform-getclosestpixelformat
     */
    GetClosestPixelFormat(pguidDstFormat) {
        result := ComCall(5, this, "ptr", pguidDstFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dstTransform 
     * @param {Pointer<BOOL>} pfIsSupported 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapsourcetransform-doessupporttransform
     */
    DoesSupportTransform(dstTransform, pfIsSupported) {
        result := ComCall(6, this, "int", dstTransform, "ptr", pfIsSupported, "HRESULT")
        return result
    }
}
