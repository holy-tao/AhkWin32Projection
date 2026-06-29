#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Notifies the application when a byte stream requests a URL, and enables the application to block URL redirection.
 * @remarks
 * To set the callback interface:
 * 
 * <ol>
 * <li>Query the byte stream object for the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfattributes-setunknown">IMFAttributes::SetUnknown</a> to set the <a href="https://docs.microsoft.com/windows/desktop/medfound/mfnetsource-resource-filter">MFNETSOURCE_RESOURCE_FILTER</a> attribute.</li>
 * </ol>
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfnetresourcefilter
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFNetResourceFilter extends IUnknown {
    /**
     * The interface identifier for IMFNetResourceFilter
     * @type {Guid}
     */
    static IID := Guid("{091878a3-bf11-4a5c-bc9f-33995b06ef2d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFNetResourceFilter interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnRedirect       : IntPtr
        OnSendingRequest : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFNetResourceFilter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called when the byte stream redirects to a URL.
     * @param {PWSTR} pszUrl The URL to which the connection has been redirected.
     * @returns {VARIANT_BOOL} To cancel the redirection, set this parameter to <b>VARIANT_TRUE</b>. To allow the redirection, set this parameter to <b>VARIANT_FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfnetresourcefilter-onredirect
     */
    OnRedirect(pszUrl) {
        pszUrl := pszUrl is String ? StrPtr(pszUrl) : pszUrl

        result := ComCall(3, this, "ptr", pszUrl, VARIANT_BOOL.Ptr, &pvbCancel := 0, "HRESULT")
        return pvbCancel
    }

    /**
     * Called when the byte stream requests a URL.
     * @param {PWSTR} pszUrl The URL that the byte stream is requesting.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfnetresourcefilter-onsendingrequest
     */
    OnSendingRequest(pszUrl) {
        pszUrl := pszUrl is String ? StrPtr(pszUrl) : pszUrl

        result := ComCall(4, this, "ptr", pszUrl, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFNetResourceFilter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnRedirect := CallbackCreate(GetMethod(implObj, "OnRedirect"), flags, 3)
        this.vtbl.OnSendingRequest := CallbackCreate(GetMethod(implObj, "OnSendingRequest"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnRedirect)
        CallbackFree(this.vtbl.OnSendingRequest)
    }
}
