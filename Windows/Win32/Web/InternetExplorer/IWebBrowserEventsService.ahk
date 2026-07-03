#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct IWebBrowserEventsService extends IUnknown {
    /**
     * The interface identifier for IWebBrowserEventsService
     * @type {Guid}
     */
    static IID := Guid("{54a8f188-9ebd-4795-ad16-9b4945119636}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWebBrowserEventsService interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        FireBeforeNavigate2Event   : IntPtr
        FireNavigateComplete2Event : IntPtr
        FireDownloadBeginEvent     : IntPtr
        FireDownloadCompleteEvent  : IntPtr
        FireDocumentCompleteEvent  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWebBrowserEventsService.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    FireBeforeNavigate2Event() {
        result := ComCall(3, this, VARIANT_BOOL.Ptr, &pfCancel := 0, "HRESULT")
        return pfCancel
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    FireNavigateComplete2Event() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    FireDownloadBeginEvent() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    FireDownloadCompleteEvent() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    FireDocumentCompleteEvent() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWebBrowserEventsService.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.FireBeforeNavigate2Event := CallbackCreate(GetMethod(implObj, "FireBeforeNavigate2Event"), flags, 2)
        this.vtbl.FireNavigateComplete2Event := CallbackCreate(GetMethod(implObj, "FireNavigateComplete2Event"), flags, 1)
        this.vtbl.FireDownloadBeginEvent := CallbackCreate(GetMethod(implObj, "FireDownloadBeginEvent"), flags, 1)
        this.vtbl.FireDownloadCompleteEvent := CallbackCreate(GetMethod(implObj, "FireDownloadCompleteEvent"), flags, 1)
        this.vtbl.FireDocumentCompleteEvent := CallbackCreate(GetMethod(implObj, "FireDocumentCompleteEvent"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.FireBeforeNavigate2Event)
        CallbackFree(this.vtbl.FireNavigateComplete2Event)
        CallbackFree(this.vtbl.FireDownloadBeginEvent)
        CallbackFree(this.vtbl.FireDownloadCompleteEvent)
        CallbackFree(this.vtbl.FireDocumentCompleteEvent)
    }
}
