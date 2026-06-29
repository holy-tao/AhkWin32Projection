#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\MF_CROSS_ORIGIN_POLICY.ahk" { MF_CROSS_ORIGIN_POLICY }

/**
 * Implemented by clients that want to enforce a cross origin policy for HTML5 media downloads.
 * @remarks
 * The Media Foundation network code uses these client callbacks to implement and enforce cross origin downloads.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfnetcrossoriginsupport
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFNetCrossOriginSupport extends IUnknown {
    /**
     * The interface identifier for IMFNetCrossOriginSupport
     * @type {Guid}
     */
    static IID := Guid("{bc2b7d44-a72d-49d5-8376-1480dee58b22}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFNetCrossOriginSupport interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCrossOriginPolicy : IntPtr
        GetSourceOrigin      : IntPtr
        IsSameOrigin         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFNetCrossOriginSupport.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns the client's current cross-origin policy to apply to the download session.
     * @returns {MF_CROSS_ORIGIN_POLICY} A value indicating the client's current cross-origin policy to apply to the download session.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfnetcrossoriginsupport-getcrossoriginpolicy
     */
    GetCrossOriginPolicy() {
        result := ComCall(3, this, "int*", &pPolicy := 0, "HRESULT")
        return pPolicy
    }

    /**
     * Returns the W3C origin of the HTML5 media element.
     * @remarks
     * Use <b>CoTaskMemFree</b> to free the string.
     * @returns {PWSTR} The W3C origin of the HTML5 media element.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfnetcrossoriginsupport-getsourceorigin
     */
    GetSourceOrigin() {
        result := ComCall(4, this, PWSTR.Ptr, &wszSourceOrigin := 0, "HRESULT")
        return wszSourceOrigin
    }

    /**
     * 
     * @param {PWSTR} wszURL 
     * @returns {BOOL} 
     */
    IsSameOrigin(wszURL) {
        wszURL := wszURL is String ? StrPtr(wszURL) : wszURL

        result := ComCall(5, this, "ptr", wszURL, BOOL.Ptr, &pfIsSameOrigin := 0, "HRESULT")
        return pfIsSameOrigin
    }

    Query(iid) {
        if (IMFNetCrossOriginSupport.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCrossOriginPolicy := CallbackCreate(GetMethod(implObj, "GetCrossOriginPolicy"), flags, 2)
        this.vtbl.GetSourceOrigin := CallbackCreate(GetMethod(implObj, "GetSourceOrigin"), flags, 2)
        this.vtbl.IsSameOrigin := CallbackCreate(GetMethod(implObj, "IsSameOrigin"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCrossOriginPolicy)
        CallbackFree(this.vtbl.GetSourceOrigin)
        CallbackFree(this.vtbl.IsSameOrigin)
    }
}
