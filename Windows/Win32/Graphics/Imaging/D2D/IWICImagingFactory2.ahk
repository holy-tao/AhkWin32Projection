#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\IWICImagingFactory.ahk" { IWICImagingFactory }
#Import "..\..\Direct2D\ID2D1Device.ahk" { ID2D1Device }
#Import ".\IWICImageEncoder.ahk" { IWICImageEncoder }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * An extension of the WIC factory interface that includes the ability to create an IWICImageEncoder.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/nn-wincodec-iwicimagingfactory2
 * @namespace Windows.Win32.Graphics.Imaging.D2D
 */
export default struct IWICImagingFactory2 extends IWICImagingFactory {
    /**
     * The interface identifier for IWICImagingFactory2
     * @type {Guid}
     */
    static IID := Guid("{7b816b45-1996-4476-b132-de9e247c8af0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWICImagingFactory2 interfaces
    */
    struct Vtbl extends IWICImagingFactory.Vtbl {
        CreateImageEncoder : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWICImagingFactory2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a new image encoder object.
     * @remarks
     * You must create images to pass to the image encoder  on the same <a href="https://docs.microsoft.com/windows/desktop/Direct2D/direct2d-portal">Direct2D</a> device that you pass to this method.
     * 
     * 
     * 
     * You are responsible for setting up the bitmap encoder itself through the existing <a href="https://docs.microsoft.com/windows/desktop/wic/-wic-imp-iwicbitmapencoder">IWICBitmapEncoder</a> APIs. The <b>IWICBitmapEncoder</b> or the <a href="https://docs.microsoft.com/windows/desktop/wic/-wic-imp-iwicbitmapframeencode">IWICBitmapFrameEncode</a> object is passed to each of the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicimageencoder">IWICImageEncoder</a> methods: <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicimageencoder-writethumbnail">WriteThumbnail</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicimageencoder-writeframe">WriteFrame</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicimageencoder-writeframethumbnail">WriteFrameThumbnail</a>.
     * @param {ID2D1Device} pD2DDevice The <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1device">ID2D1Device</a> object on which the corresponding image encoder is created.
     * @returns {IWICImageEncoder} A pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicimageencoder">IWICImageEncoder</a> interface for the encoder object that you can use to encode <a href="https://docs.microsoft.com/windows/desktop/Direct2D/direct2d-portal">Direct2D</a> images.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory2-createimageencoder
     */
    CreateImageEncoder(pD2DDevice) {
        result := ComCall(28, this, "ptr", pD2DDevice, "ptr*", &ppWICImageEncoder := 0, "HRESULT")
        return IWICImageEncoder(ppWICImageEncoder)
    }

    Query(iid) {
        if (IWICImagingFactory2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateImageEncoder := CallbackCreate(GetMethod(implObj, "CreateImageEncoder"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateImageEncoder)
    }
}
