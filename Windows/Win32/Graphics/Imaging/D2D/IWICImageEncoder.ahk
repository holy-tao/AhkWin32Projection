#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Encodes ID2D1Image interfaces to an IWICBitmapEncoder.
 * @see https://learn.microsoft.com/windows/win32/api//content/wincodec/nn-wincodec-iwicimageencoder
 * @namespace Windows.Win32.Graphics.Imaging.D2D
 * @version v4.0.30319
 */
class IWICImageEncoder extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWICImageEncoder
     * @type {Guid}
     */
    static IID => Guid("{04c75bf8-3ce1-473b-acc5-3cc4f5e94999}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["WriteFrame", "WriteFrameThumbnail", "WriteThumbnail"]

    /**
     * Encodes the image to the frame given by the IWICBitmapFrameEncode.
     * @remarks
     * The image passed in must be created on the same device as in <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicimagingfactory2-createimageencoder">IWICImagingFactory2::CreateImageEncoder</a>. If the <i>pImageParameters</i> are not specified, a set of useful defaults will be assumed, see <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ns-wincodec-wicimageparameters">WICImageParameters</a> for more info.
     * 
     * 
     * 
     * You must correctly and independently have set up the <a href="https://docs.microsoft.com/windows/desktop/wic/-wic-imp-iwicbitmapframeencode">IWICBitmapFrameEncode</a> before calling this API.
     * @param {ID2D1Image} pImage Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1image">ID2D1Image</a>*</b>
     * 
     * The Direct2D image that will be encoded.
     * @param {IWICBitmapFrameEncode} pFrameEncode Type: <b><a href="https://docs.microsoft.com/windows/desktop/wic/-wic-imp-iwicbitmapframeencode">IWICBitmapFrameEncode</a>*</b>
     * 
     * The frame encoder to which the image is written.
     * @param {Pointer<WICImageParameters>} pImageParameters Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ns-wincodec-wicimageparameters">WICImageParameters</a>*</b>
     * 
     * Additional parameters to control encoding.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/wincodec/nf-wincodec-iwicimageencoder-writeframe
     */
    WriteFrame(pImage, pFrameEncode, pImageParameters) {
        result := ComCall(3, this, "ptr", pImage, "ptr", pFrameEncode, "ptr", pImageParameters, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Encodes the image as a thumbnail to the frame given by the IWICBitmapFrameEncode.
     * @remarks
     * The image passed in must be created on the same device as in <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicimagingfactory2-createimageencoder">IWICImagingFactory2::CreateImageEncoder</a>. If the <i>pImageParameters</i> are not specified, a set of useful defaults will be assumed, see <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ns-wincodec-wicimageparameters">WICImageParameters</a> for more info.
     * 
     * 
     * 
     * You must correctly and independently have set up the <a href="https://docs.microsoft.com/windows/desktop/wic/-wic-imp-iwicbitmapframeencode">IWICBitmapFrameEncode</a> before calling this API.
     * @param {ID2D1Image} pImage Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1image">ID2D1Image</a>*</b>
     * 
     * The Direct2D image that will be encoded.
     * @param {IWICBitmapFrameEncode} pFrameEncode Type: <b><a href="https://docs.microsoft.com/windows/desktop/wic/-wic-imp-iwicbitmapframeencode">IWICBitmapFrameEncode</a>*</b>
     * 
     * The frame encoder on which the thumbnail is set.
     * @param {Pointer<WICImageParameters>} pImageParameters Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ns-wincodec-wicimageparameters">WICImageParameters</a>*</b>
     * 
     * Additional parameters to control encoding.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/wincodec/nf-wincodec-iwicimageencoder-writeframethumbnail
     */
    WriteFrameThumbnail(pImage, pFrameEncode, pImageParameters) {
        result := ComCall(4, this, "ptr", pImage, "ptr", pFrameEncode, "ptr", pImageParameters, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Encodes the given image as the thumbnail to the given WIC bitmap encoder.
     * @remarks
     * You must create the image that you pass in on the same device as in <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicimagingfactory2-createimageencoder">IWICImagingFactory2::CreateImageEncoder</a>. If you don't specify additional parameters in the variable that <i>pImageParameters</i> points to, the encoder uses a set of useful defaults. For info about these defaults, see <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ns-wincodec-wicimageparameters">WICImageParameters</a>. 
     * 
     * Before you call <b>WriteThumbnail</b>, you must set up the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapencoder">IWICBitmapEncoder</a> interface for the encoder on which you want to set the thumbnail. 
     * 
     * If <b>WriteThumbnail</b> fails, it might return E_OUTOFMEMORY, D2DERR_WRONG_RESOURCE_DOMAIN, or other error codes from the encoder.
     * @param {ID2D1Image} pImage Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1image">ID2D1Image</a>*</b>
     * 
     * The Direct2D image that will be encoded.
     * @param {IWICBitmapEncoder} pEncoder Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapencoder">IWICBitmapEncoder</a>*</b>
     * 
     * The encoder on which the thumbnail is set.
     * @param {Pointer<WICImageParameters>} pImageParameters Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ns-wincodec-wicimageparameters">WICImageParameters</a>*</b>
     * 
     * Additional parameters to control encoding.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/wincodec/nf-wincodec-iwicimageencoder-writethumbnail
     */
    WriteThumbnail(pImage, pEncoder, pImageParameters) {
        result := ComCall(5, this, "ptr", pImage, "ptr", pEncoder, "ptr", pImageParameters, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
