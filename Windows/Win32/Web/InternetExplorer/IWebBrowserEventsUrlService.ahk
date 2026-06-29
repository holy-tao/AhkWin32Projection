#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct IWebBrowserEventsUrlService extends IUnknown {
    /**
     * The interface identifier for IWebBrowserEventsUrlService
     * @type {Guid}
     */
    static IID := Guid("{87cc5d04-eafa-4833-9820-8f986530cc00}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWebBrowserEventsUrlService interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetUrlForEvents : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWebBrowserEventsUrlService.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetUrlForEvents() {
        pUrl := BSTR.Owned()
        result := ComCall(3, this, BSTR.Ptr, pUrl, "HRESULT")
        return pUrl
    }

    Query(iid) {
        if (IWebBrowserEventsUrlService.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetUrlForEvents := CallbackCreate(GetMethod(implObj, "GetUrlForEvents"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetUrlForEvents)
    }
}
