#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWICColorContext.ahk" { IWICColorContext }
#Import ".\IWICComponentInfo.ahk" { IWICComponentInfo }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Exposes methods that provide information about a pixel format.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/nn-wincodec-iwicpixelformatinfo
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct IWICPixelFormatInfo extends IWICComponentInfo {
    /**
     * The interface identifier for IWICPixelFormatInfo
     * @type {Guid}
     */
    static IID := Guid("{e8eda601-3d48-431a-ab44-69059be88bbe}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWICPixelFormatInfo interfaces
    */
    struct Vtbl extends IWICComponentInfo.Vtbl {
        GetFormatGUID   : IntPtr
        GetColorContext : IntPtr
        GetBitsPerPixel : IntPtr
        GetChannelCount : IntPtr
        GetChannelMask  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWICPixelFormatInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the pixel format GUID.
     * @returns {Guid} Type: <b>GUID*</b>
     * 
     * Pointer that receives the pixel format GUID.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicpixelformatinfo-getformatguid
     */
    GetFormatGUID() {
        pFormat := Guid()
        result := ComCall(11, this, Guid.Ptr, pFormat, "HRESULT")
        return pFormat
    }

    /**
     * Gets the pixel format's IWICColorContext.
     * @remarks
     * The returned color context is the default color space for the pixel format. However, if an <a href="https://docs.microsoft.com/windows/desktop/wic/-wic-imp-iwicbitmapsource">IWICBitmapSource</a> specifies its own color context, the source's context should be preferred over the pixel format's default.
     * @returns {IWICColorContext} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwiccolorcontext">IWICColorContext</a>**</b>
     * 
     * Pointer that receives the pixel format's color context.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicpixelformatinfo-getcolorcontext
     */
    GetColorContext() {
        result := ComCall(12, this, "ptr*", &ppIColorContext := 0, "HRESULT")
        return IWICColorContext(ppIColorContext)
    }

    /**
     * Gets the bits per pixel (BPP) of the pixel format.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * Pointer that receives the BPP of the pixel format.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicpixelformatinfo-getbitsperpixel
     */
    GetBitsPerPixel() {
        result := ComCall(13, this, "uint*", &puiBitsPerPixel := 0, "HRESULT")
        return puiBitsPerPixel
    }

    /**
     * Gets the number of channels the pixel format contains.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * Pointer that receives the channel count.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicpixelformatinfo-getchannelcount
     */
    GetChannelCount() {
        result := ComCall(14, this, "uint*", &puiChannelCount := 0, "HRESULT")
        return puiChannelCount
    }

    /**
     * Gets the pixel format's channel mask.
     * @remarks
     * If 0 and NULL are passed in for <i>cbMaskBuffer</i> and <i>pbMaskBuffer</i>, respectively, the required buffer size will be returned through <i>pcbActual</i>.
     * @param {Integer} uiChannelIndex Type: <b>UINT</b>
     * 
     * The index to the channel mask to retrieve.
     * @param {Integer} cbMaskBuffer Type: <b>UINT</b>
     * 
     * The size of the <i>pbMaskBuffer</i> buffer.
     * @param {Pointer<Integer>} pbMaskBuffer Type: <b>BYTE*</b>
     * 
     * Pointer to the mask buffer.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * The actual buffer size needed to obtain the channel mask.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicpixelformatinfo-getchannelmask
     */
    GetChannelMask(uiChannelIndex, cbMaskBuffer, pbMaskBuffer) {
        pbMaskBufferMarshal := pbMaskBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(15, this, "uint", uiChannelIndex, "uint", cbMaskBuffer, pbMaskBufferMarshal, pbMaskBuffer, "uint*", &pcbActual := 0, "HRESULT")
        return pcbActual
    }

    Query(iid) {
        if (IWICPixelFormatInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFormatGUID := CallbackCreate(GetMethod(implObj, "GetFormatGUID"), flags, 2)
        this.vtbl.GetColorContext := CallbackCreate(GetMethod(implObj, "GetColorContext"), flags, 2)
        this.vtbl.GetBitsPerPixel := CallbackCreate(GetMethod(implObj, "GetBitsPerPixel"), flags, 2)
        this.vtbl.GetChannelCount := CallbackCreate(GetMethod(implObj, "GetChannelCount"), flags, 2)
        this.vtbl.GetChannelMask := CallbackCreate(GetMethod(implObj, "GetChannelMask"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFormatGUID)
        CallbackFree(this.vtbl.GetColorContext)
        CallbackFree(this.vtbl.GetBitsPerPixel)
        CallbackFree(this.vtbl.GetChannelCount)
        CallbackFree(this.vtbl.GetChannelMask)
    }
}
