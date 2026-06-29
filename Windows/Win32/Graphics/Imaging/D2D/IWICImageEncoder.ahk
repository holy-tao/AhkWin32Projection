#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Direct2D\ID2D1Image.ahk" { ID2D1Image }
#Import "..\IWICBitmapFrameEncode.ahk" { IWICBitmapFrameEncode }
#Import "..\IWICBitmapEncoder.ahk" { IWICBitmapEncoder }
#Import "..\WICImageParameters.ahk" { WICImageParameters }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Encodes ID2D1Image interfaces to an IWICBitmapEncoder.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/nn-wincodec-iwicimageencoder
 * @namespace Windows.Win32.Graphics.Imaging.D2D
 */
export default struct IWICImageEncoder extends IUnknown {
    /**
     * The interface identifier for IWICImageEncoder
     * @type {Guid}
     */
    static IID := Guid("{04c75bf8-3ce1-473b-acc5-3cc4f5e94999}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWICImageEncoder interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        WriteFrame          : IntPtr
        WriteFrameThumbnail : IntPtr
        WriteThumbnail      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWICImageEncoder.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimageencoder-writeframe
     */
    WriteFrame(pImage, pFrameEncode, pImageParameters) {
        result := ComCall(3, this, "ptr", pImage, "ptr", pFrameEncode, WICImageParameters.Ptr, pImageParameters, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimageencoder-writeframethumbnail
     */
    WriteFrameThumbnail(pImage, pFrameEncode, pImageParameters) {
        result := ComCall(4, this, "ptr", pImage, "ptr", pFrameEncode, WICImageParameters.Ptr, pImageParameters, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimageencoder-writethumbnail
     */
    WriteThumbnail(pImage, pEncoder, pImageParameters) {
        result := ComCall(5, this, "ptr", pImage, "ptr", pEncoder, WICImageParameters.Ptr, pImageParameters, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWICImageEncoder.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.WriteFrame := CallbackCreate(GetMethod(implObj, "WriteFrame"), flags, 4)
        this.vtbl.WriteFrameThumbnail := CallbackCreate(GetMethod(implObj, "WriteFrameThumbnail"), flags, 4)
        this.vtbl.WriteThumbnail := CallbackCreate(GetMethod(implObj, "WriteThumbnail"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.WriteFrame)
        CallbackFree(this.vtbl.WriteFrameThumbnail)
        CallbackFree(this.vtbl.WriteThumbnail)
    }
}
