#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\MsHtml\IHTMLElement.ahk" { IHTMLElement }
#Import "..\MsHtml\IHTMLWindow2.ahk" { IHTMLWindow2 }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct IDocObjectService extends IUnknown {
    /**
     * The interface identifier for IDocObjectService
     * @type {Guid}
     */
    static IID := Guid("{3050f801-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDocObjectService interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        FireBeforeNavigate2    : IntPtr
        FireNavigateComplete2  : IntPtr
        FireDownloadBegin      : IntPtr
        FireDownloadComplete   : IntPtr
        FireDocumentComplete   : IntPtr
        UpdateDesktopComponent : IntPtr
        GetPendingUrl          : IntPtr
        ActiveElementChanged   : IntPtr
        GetUrlSearchComponent  : IntPtr
        IsErrorUrl             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDocObjectService.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @param {IDispatch} pDispatch 
     * @param {PWSTR} lpszUrl 
     * @param {Integer} dwFlags 
     * @param {PWSTR} lpszFrameName 
     * @param {Pointer<Integer>} pPostData 
     * @param {Integer} cbPostData 
     * @param {PWSTR} lpszHeaders 
     * @param {BOOL} fPlayNavSound 
     * @returns {BOOL} 
     */
    FireBeforeNavigate2(pDispatch, lpszUrl, dwFlags, lpszFrameName, pPostData, cbPostData, lpszHeaders, fPlayNavSound) {
        lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl
        lpszFrameName := lpszFrameName is String ? StrPtr(lpszFrameName) : lpszFrameName
        lpszHeaders := lpszHeaders is String ? StrPtr(lpszHeaders) : lpszHeaders

        pDispatchMarshal := pDispatch == 0 ? IntPtr : "ptr"
        pPostDataMarshal := pPostData is VarRef ? "char*" : IntPtr

        result := ComCall(3, this, pDispatchMarshal, pDispatch, "ptr", lpszUrl, UInt32, dwFlags, "ptr", lpszFrameName, pPostDataMarshal, pPostData, UInt32, cbPostData, "ptr", lpszHeaders, BOOL, fPlayNavSound, BOOL.Ptr, &pfCancel := 0, "HRESULT")
        return pfCancel
    }

    /**
     * @param {IHTMLWindow2} pHTMLWindow2 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    FireNavigateComplete2(pHTMLWindow2, dwFlags) {
        pHTMLWindow2Marshal := pHTMLWindow2 == 0 ? IntPtr : "ptr"

        result := ComCall(4, this, pHTMLWindow2Marshal, pHTMLWindow2, UInt32, dwFlags, "HRESULT")
        return result
    }

    /**
     * @returns {HRESULT} 
     */
    FireDownloadBegin() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * @returns {HRESULT} 
     */
    FireDownloadComplete() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * @param {IHTMLWindow2} pHTMLWindow 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    FireDocumentComplete(pHTMLWindow, dwFlags) {
        pHTMLWindowMarshal := pHTMLWindow == 0 ? IntPtr : "ptr"

        result := ComCall(7, this, pHTMLWindowMarshal, pHTMLWindow, UInt32, dwFlags, "HRESULT")
        return result
    }

    /**
     * @param {IHTMLWindow2} pHTMLWindow 
     * @returns {HRESULT} 
     */
    UpdateDesktopComponent(pHTMLWindow) {
        pHTMLWindowMarshal := pHTMLWindow == 0 ? IntPtr : "ptr"

        result := ComCall(8, this, pHTMLWindowMarshal, pHTMLWindow, "HRESULT")
        return result
    }

    /**
     * @returns {BSTR} 
     */
    GetPendingUrl() {
        pbstrPendingUrl := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pbstrPendingUrl, "HRESULT")
        return pbstrPendingUrl
    }

    /**
     * @param {IHTMLElement} pHTMLElement 
     * @returns {HRESULT} 
     */
    ActiveElementChanged(pHTMLElement) {
        pHTMLElementMarshal := pHTMLElement == 0 ? IntPtr : "ptr"

        result := ComCall(10, this, pHTMLElementMarshal, pHTMLElement, "HRESULT")
        return result
    }

    /**
     * @returns {BSTR} 
     */
    GetUrlSearchComponent() {
        pbstrSearch := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, pbstrSearch, "HRESULT")
        return pbstrSearch
    }

    /**
     * @param {PWSTR} lpszUrl 
     * @returns {BOOL} 
     */
    IsErrorUrl(lpszUrl) {
        lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl

        result := ComCall(12, this, "ptr", lpszUrl, BOOL.Ptr, &pfIsError := 0, "HRESULT")
        return pfIsError
    }

    _Query(iid) {
        if (IDocObjectService.IID.Equals(iid)) {
            return true
        }
        return super._Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.FireBeforeNavigate2 := CallbackCreate(ObjBindMethod(implObj, "FireBeforeNavigate2"), flags, 10)
        this.vtbl.FireNavigateComplete2 := CallbackCreate(ObjBindMethod(implObj, "FireNavigateComplete2"), flags, 3)
        this.vtbl.FireDownloadBegin := CallbackCreate(ObjBindMethod(implObj, "FireDownloadBegin"), flags, 1)
        this.vtbl.FireDownloadComplete := CallbackCreate(ObjBindMethod(implObj, "FireDownloadComplete"), flags, 1)
        this.vtbl.FireDocumentComplete := CallbackCreate(ObjBindMethod(implObj, "FireDocumentComplete"), flags, 3)
        this.vtbl.UpdateDesktopComponent := CallbackCreate(ObjBindMethod(implObj, "UpdateDesktopComponent"), flags, 2)
        this.vtbl.GetPendingUrl := CallbackCreate(ObjBindMethod(implObj, "GetPendingUrl"), flags, 2)
        this.vtbl.ActiveElementChanged := CallbackCreate(ObjBindMethod(implObj, "ActiveElementChanged"), flags, 2)
        this.vtbl.GetUrlSearchComponent := CallbackCreate(ObjBindMethod(implObj, "GetUrlSearchComponent"), flags, 2)
        this.vtbl.IsErrorUrl := CallbackCreate(ObjBindMethod(implObj, "IsErrorUrl"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.FireBeforeNavigate2)
        CallbackFree(this.vtbl.FireNavigateComplete2)
        CallbackFree(this.vtbl.FireDownloadBegin)
        CallbackFree(this.vtbl.FireDownloadComplete)
        CallbackFree(this.vtbl.FireDocumentComplete)
        CallbackFree(this.vtbl.UpdateDesktopComponent)
        CallbackFree(this.vtbl.GetPendingUrl)
        CallbackFree(this.vtbl.ActiveElementChanged)
        CallbackFree(this.vtbl.GetUrlSearchComponent)
        CallbackFree(this.vtbl.IsErrorUrl)
    }
}
