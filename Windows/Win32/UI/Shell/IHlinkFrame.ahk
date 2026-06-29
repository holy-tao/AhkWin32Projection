#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IBindStatusCallback.ahk" { IBindStatusCallback }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\System\Com\IBindCtx.ahk" { IBindCtx }
#Import ".\IHlink.ahk" { IHlink }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IMoniker.ahk" { IMoniker }
#Import ".\IHlinkBrowseContext.ahk" { IHlinkBrowseContext }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IHlinkFrame extends IUnknown {
    /**
     * The interface identifier for IHlinkFrame
     * @type {Guid}
     */
    static IID := Guid("{79eac9c5-baf9-11ce-8c82-00aa004ba90b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHlinkFrame interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetBrowseContext : IntPtr
        GetBrowseContext : IntPtr
        Navigate         : IntPtr
        OnNavigate       : IntPtr
        UpdateHlink      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHlinkFrame.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IHlinkBrowseContext} pihlbc 
     * @returns {HRESULT} 
     */
    SetBrowseContext(pihlbc) {
        result := ComCall(3, this, "ptr", pihlbc, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IHlinkBrowseContext} 
     */
    GetBrowseContext() {
        result := ComCall(4, this, "ptr*", &ppihlbc := 0, "HRESULT")
        return IHlinkBrowseContext(ppihlbc)
    }

    /**
     * Note This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The Navigate element specifies a URL used by calls to External.NavigateTaskPaneURL.
     * @param {Integer} grfHLNF 
     * @param {IBindCtx} pbc 
     * @param {IBindStatusCallback} pibsc 
     * @param {IHlink} pihlNavigate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/WMP/navigate-element
     */
    Navigate(grfHLNF, pbc, pibsc, pihlNavigate) {
        result := ComCall(5, this, "uint", grfHLNF, "ptr", pbc, "ptr", pibsc, "ptr", pihlNavigate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} grfHLNF 
     * @param {IMoniker} pimkTarget 
     * @param {PWSTR} pwzLocation 
     * @param {PWSTR} pwzFriendlyName 
     * @param {Integer} dwreserved 
     * @returns {HRESULT} 
     */
    OnNavigate(grfHLNF, pimkTarget, pwzLocation, pwzFriendlyName, dwreserved) {
        pwzLocation := pwzLocation is String ? StrPtr(pwzLocation) : pwzLocation
        pwzFriendlyName := pwzFriendlyName is String ? StrPtr(pwzFriendlyName) : pwzFriendlyName

        result := ComCall(6, this, "uint", grfHLNF, "ptr", pimkTarget, "ptr", pwzLocation, "ptr", pwzFriendlyName, "uint", dwreserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uHLID 
     * @param {IMoniker} pimkTarget 
     * @param {PWSTR} pwzLocation 
     * @param {PWSTR} pwzFriendlyName 
     * @returns {HRESULT} 
     */
    UpdateHlink(uHLID, pimkTarget, pwzLocation, pwzFriendlyName) {
        pwzLocation := pwzLocation is String ? StrPtr(pwzLocation) : pwzLocation
        pwzFriendlyName := pwzFriendlyName is String ? StrPtr(pwzFriendlyName) : pwzFriendlyName

        result := ComCall(7, this, "uint", uHLID, "ptr", pimkTarget, "ptr", pwzLocation, "ptr", pwzFriendlyName, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHlinkFrame.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetBrowseContext := CallbackCreate(GetMethod(implObj, "SetBrowseContext"), flags, 2)
        this.vtbl.GetBrowseContext := CallbackCreate(GetMethod(implObj, "GetBrowseContext"), flags, 2)
        this.vtbl.Navigate := CallbackCreate(GetMethod(implObj, "Navigate"), flags, 5)
        this.vtbl.OnNavigate := CallbackCreate(GetMethod(implObj, "OnNavigate"), flags, 6)
        this.vtbl.UpdateHlink := CallbackCreate(GetMethod(implObj, "UpdateHlink"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetBrowseContext)
        CallbackFree(this.vtbl.GetBrowseContext)
        CallbackFree(this.vtbl.Navigate)
        CallbackFree(this.vtbl.OnNavigate)
        CallbackFree(this.vtbl.UpdateHlink)
    }
}
