#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWICPixelFormatInfo.ahk" { IWICPixelFormatInfo }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\WICPixelFormatNumericRepresentation.ahk" { WICPixelFormatNumericRepresentation }

/**
 * Extends IWICPixelFormatInfo by providing additional information about a pixel format.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/nn-wincodec-iwicpixelformatinfo2
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct IWICPixelFormatInfo2 extends IWICPixelFormatInfo {
    /**
     * The interface identifier for IWICPixelFormatInfo2
     * @type {Guid}
     */
    static IID := Guid("{a9db33a2-af5f-43c7-b679-74f5984b5aa4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWICPixelFormatInfo2 interfaces
    */
    struct Vtbl extends IWICPixelFormatInfo.Vtbl {
        SupportsTransparency     : IntPtr
        GetNumericRepresentation : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWICPixelFormatInfo2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns whether the format supports transparent pixels.
     * @remarks
     * An indexed pixel format will not return <b>TRUE</b> even though it may have some transparency support.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * Returns <b>TRUE</b> if the pixel format supports transparency; otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicpixelformatinfo2-supportstransparency
     */
    SupportsTransparency() {
        result := ComCall(16, this, BOOL.Ptr, &pfSupportsTransparency := 0, "HRESULT")
        return pfSupportsTransparency
    }

    /**
     * TBD (IWICPixelFormatInfo2.GetNumericRepresentation)
     * @returns {WICPixelFormatNumericRepresentation} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicpixelformatnumericrepresentation">WICPixelFormatNumericRepresentation</a>*</b>
     * 
     * The address of a <a href="https://docs.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicpixelformatnumericrepresentation">WICPixelFormatNumericRepresentation</a> variable that you've defined. On successful completion, the function sets your variable to the **WICPixelFormatNumericRepresentation** of the pixel format.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicpixelformatinfo2-getnumericrepresentation
     */
    GetNumericRepresentation() {
        result := ComCall(17, this, "int*", &pNumericRepresentation := 0, "HRESULT")
        return pNumericRepresentation
    }

    Query(iid) {
        if (IWICPixelFormatInfo2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SupportsTransparency := CallbackCreate(GetMethod(implObj, "SupportsTransparency"), flags, 2)
        this.vtbl.GetNumericRepresentation := CallbackCreate(GetMethod(implObj, "GetNumericRepresentation"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SupportsTransparency)
        CallbackFree(this.vtbl.GetNumericRepresentation)
    }
}
