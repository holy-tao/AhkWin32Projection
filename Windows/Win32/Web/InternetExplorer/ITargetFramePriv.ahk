#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IBindStatusCallback.ahk" { IBindStatusCallback }
#Import "..\..\System\Com\IBindCtx.ahk" { IBindCtx }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct ITargetFramePriv extends IUnknown {
    /**
     * The interface identifier for ITargetFramePriv
     * @type {Guid}
     */
    static IID := Guid("{9216e421-2bf5-11d0-82b4-00a0c90c29c5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITargetFramePriv interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        FindFrameDownwards     : IntPtr
        FindFrameInContext     : IntPtr
        OnChildFrameActivate   : IntPtr
        OnChildFrameDeactivate : IntPtr
        NavigateHack           : IntPtr
        FindBrowserByIndex     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITargetFramePriv.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pszTargetName 
     * @param {Integer} dwFlags 
     * @returns {IUnknown} 
     */
    FindFrameDownwards(pszTargetName, dwFlags) {
        pszTargetName := pszTargetName is String ? StrPtr(pszTargetName) : pszTargetName

        result := ComCall(3, this, "ptr", pszTargetName, "uint", dwFlags, "ptr*", &ppunkTargetFrame := 0, "HRESULT")
        return IUnknown(ppunkTargetFrame)
    }

    /**
     * 
     * @param {PWSTR} pszTargetName 
     * @param {IUnknown} punkContextFrame 
     * @param {Integer} dwFlags 
     * @returns {IUnknown} 
     */
    FindFrameInContext(pszTargetName, punkContextFrame, dwFlags) {
        pszTargetName := pszTargetName is String ? StrPtr(pszTargetName) : pszTargetName

        result := ComCall(4, this, "ptr", pszTargetName, "ptr", punkContextFrame, "uint", dwFlags, "ptr*", &ppunkTargetFrame := 0, "HRESULT")
        return IUnknown(ppunkTargetFrame)
    }

    /**
     * 
     * @param {IUnknown} pUnkChildFrame 
     * @returns {HRESULT} 
     */
    OnChildFrameActivate(pUnkChildFrame) {
        result := ComCall(5, this, "ptr", pUnkChildFrame, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pUnkChildFrame 
     * @returns {HRESULT} 
     */
    OnChildFrameDeactivate(pUnkChildFrame) {
        result := ComCall(6, this, "ptr", pUnkChildFrame, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} grfHLNF 
     * @param {IBindCtx} pbc 
     * @param {IBindStatusCallback} pibsc 
     * @param {PWSTR} pszTargetName 
     * @param {PWSTR} pszUrl 
     * @param {PWSTR} pszLocation 
     * @returns {HRESULT} 
     */
    NavigateHack(grfHLNF, pbc, pibsc, pszTargetName, pszUrl, pszLocation) {
        pszTargetName := pszTargetName is String ? StrPtr(pszTargetName) : pszTargetName
        pszUrl := pszUrl is String ? StrPtr(pszUrl) : pszUrl
        pszLocation := pszLocation is String ? StrPtr(pszLocation) : pszLocation

        result := ComCall(7, this, "uint", grfHLNF, "ptr", pbc, "ptr", pibsc, "ptr", pszTargetName, "ptr", pszUrl, "ptr", pszLocation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwID 
     * @returns {IUnknown} 
     */
    FindBrowserByIndex(dwID) {
        result := ComCall(8, this, "uint", dwID, "ptr*", &ppunkBrowser := 0, "HRESULT")
        return IUnknown(ppunkBrowser)
    }

    Query(iid) {
        if (ITargetFramePriv.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.FindFrameDownwards := CallbackCreate(GetMethod(implObj, "FindFrameDownwards"), flags, 4)
        this.vtbl.FindFrameInContext := CallbackCreate(GetMethod(implObj, "FindFrameInContext"), flags, 5)
        this.vtbl.OnChildFrameActivate := CallbackCreate(GetMethod(implObj, "OnChildFrameActivate"), flags, 2)
        this.vtbl.OnChildFrameDeactivate := CallbackCreate(GetMethod(implObj, "OnChildFrameDeactivate"), flags, 2)
        this.vtbl.NavigateHack := CallbackCreate(GetMethod(implObj, "NavigateHack"), flags, 7)
        this.vtbl.FindBrowserByIndex := CallbackCreate(GetMethod(implObj, "FindBrowserByIndex"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.FindFrameDownwards)
        CallbackFree(this.vtbl.FindFrameInContext)
        CallbackFree(this.vtbl.OnChildFrameActivate)
        CallbackFree(this.vtbl.OnChildFrameDeactivate)
        CallbackFree(this.vtbl.NavigateHack)
        CallbackFree(this.vtbl.FindBrowserByIndex)
    }
}
