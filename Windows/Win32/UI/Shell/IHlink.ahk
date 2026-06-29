#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IBindCtx.ahk" { IBindCtx }
#Import ".\IHlinkSite.ahk" { IHlinkSite }
#Import "..\..\System\Com\IBindStatusCallback.ahk" { IBindStatusCallback }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\System\Com\IMoniker.ahk" { IMoniker }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IHlinkBrowseContext.ahk" { IHlinkBrowseContext }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IHlink extends IUnknown {
    /**
     * The interface identifier for IHlink
     * @type {Guid}
     */
    static IID := Guid("{79eac9c3-baf9-11ce-8c82-00aa004ba90b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHlink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetHlinkSite        : IntPtr
        GetHlinkSite        : IntPtr
        SetMonikerReference : IntPtr
        GetMonikerReference : IntPtr
        SetStringReference  : IntPtr
        GetStringReference  : IntPtr
        SetFriendlyName     : IntPtr
        GetFriendlyName     : IntPtr
        SetTargetFrameName  : IntPtr
        GetTargetFrameName  : IntPtr
        GetMiscStatus       : IntPtr
        Navigate            : IntPtr
        SetAdditionalParams : IntPtr
        GetAdditionalParams : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHlink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IHlinkSite} pihlSite 
     * @param {Integer} dwSiteData 
     * @returns {HRESULT} 
     */
    SetHlinkSite(pihlSite, dwSiteData) {
        result := ComCall(3, this, "ptr", pihlSite, "uint", dwSiteData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHlinkSite>} ppihlSite 
     * @param {Pointer<Integer>} pdwSiteData 
     * @returns {HRESULT} 
     */
    GetHlinkSite(ppihlSite, pdwSiteData) {
        pdwSiteDataMarshal := pdwSiteData is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, IHlinkSite.Ptr, ppihlSite, pdwSiteDataMarshal, pdwSiteData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} grfHLSETF 
     * @param {IMoniker} pimkTarget 
     * @param {PWSTR} pwzLocation 
     * @returns {HRESULT} 
     */
    SetMonikerReference(grfHLSETF, pimkTarget, pwzLocation) {
        pwzLocation := pwzLocation is String ? StrPtr(pwzLocation) : pwzLocation

        result := ComCall(5, this, "uint", grfHLSETF, "ptr", pimkTarget, "ptr", pwzLocation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwWhichRef 
     * @param {Pointer<IMoniker>} ppimkTarget 
     * @param {Pointer<PWSTR>} ppwzLocation 
     * @returns {HRESULT} 
     */
    GetMonikerReference(dwWhichRef, ppimkTarget, ppwzLocation) {
        ppwzLocationMarshal := ppwzLocation is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "uint", dwWhichRef, IMoniker.Ptr, ppimkTarget, ppwzLocationMarshal, ppwzLocation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} grfHLSETF 
     * @param {PWSTR} pwzTarget 
     * @param {PWSTR} pwzLocation 
     * @returns {HRESULT} 
     */
    SetStringReference(grfHLSETF, pwzTarget, pwzLocation) {
        pwzTarget := pwzTarget is String ? StrPtr(pwzTarget) : pwzTarget
        pwzLocation := pwzLocation is String ? StrPtr(pwzLocation) : pwzLocation

        result := ComCall(7, this, "uint", grfHLSETF, "ptr", pwzTarget, "ptr", pwzLocation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwWhichRef 
     * @param {Pointer<PWSTR>} ppwzTarget 
     * @param {Pointer<PWSTR>} ppwzLocation 
     * @returns {HRESULT} 
     */
    GetStringReference(dwWhichRef, ppwzTarget, ppwzLocation) {
        ppwzTargetMarshal := ppwzTarget is VarRef ? "ptr*" : "ptr"
        ppwzLocationMarshal := ppwzLocation is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, "uint", dwWhichRef, ppwzTargetMarshal, ppwzTarget, ppwzLocationMarshal, ppwzLocation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzFriendlyName 
     * @returns {HRESULT} 
     */
    SetFriendlyName(pwzFriendlyName) {
        pwzFriendlyName := pwzFriendlyName is String ? StrPtr(pwzFriendlyName) : pwzFriendlyName

        result := ComCall(9, this, "ptr", pwzFriendlyName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} grfHLFNAMEF 
     * @returns {PWSTR} 
     */
    GetFriendlyName(grfHLFNAMEF) {
        result := ComCall(10, this, "uint", grfHLFNAMEF, PWSTR.Ptr, &ppwzFriendlyName := 0, "HRESULT")
        return ppwzFriendlyName
    }

    /**
     * 
     * @param {PWSTR} pwzTargetFrameName 
     * @returns {HRESULT} 
     */
    SetTargetFrameName(pwzTargetFrameName) {
        pwzTargetFrameName := pwzTargetFrameName is String ? StrPtr(pwzTargetFrameName) : pwzTargetFrameName

        result := ComCall(11, this, "ptr", pwzTargetFrameName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    GetTargetFrameName() {
        result := ComCall(12, this, PWSTR.Ptr, &ppwzTargetFrameName := 0, "HRESULT")
        return ppwzTargetFrameName
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetMiscStatus() {
        result := ComCall(13, this, "uint*", &pdwStatus := 0, "HRESULT")
        return pdwStatus
    }

    /**
     * Note This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The Navigate element specifies a URL used by calls to External.NavigateTaskPaneURL.
     * @param {Integer} grfHLNF 
     * @param {IBindCtx} pibc 
     * @param {IBindStatusCallback} pibsc 
     * @param {IHlinkBrowseContext} pihlbc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/WMP/navigate-element
     */
    Navigate(grfHLNF, pibc, pibsc, pihlbc) {
        result := ComCall(14, this, "uint", grfHLNF, "ptr", pibc, "ptr", pibsc, "ptr", pihlbc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzAdditionalParams 
     * @returns {HRESULT} 
     */
    SetAdditionalParams(pwzAdditionalParams) {
        pwzAdditionalParams := pwzAdditionalParams is String ? StrPtr(pwzAdditionalParams) : pwzAdditionalParams

        result := ComCall(15, this, "ptr", pwzAdditionalParams, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    GetAdditionalParams() {
        result := ComCall(16, this, PWSTR.Ptr, &ppwzAdditionalParams := 0, "HRESULT")
        return ppwzAdditionalParams
    }

    Query(iid) {
        if (IHlink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetHlinkSite := CallbackCreate(GetMethod(implObj, "SetHlinkSite"), flags, 3)
        this.vtbl.GetHlinkSite := CallbackCreate(GetMethod(implObj, "GetHlinkSite"), flags, 3)
        this.vtbl.SetMonikerReference := CallbackCreate(GetMethod(implObj, "SetMonikerReference"), flags, 4)
        this.vtbl.GetMonikerReference := CallbackCreate(GetMethod(implObj, "GetMonikerReference"), flags, 4)
        this.vtbl.SetStringReference := CallbackCreate(GetMethod(implObj, "SetStringReference"), flags, 4)
        this.vtbl.GetStringReference := CallbackCreate(GetMethod(implObj, "GetStringReference"), flags, 4)
        this.vtbl.SetFriendlyName := CallbackCreate(GetMethod(implObj, "SetFriendlyName"), flags, 2)
        this.vtbl.GetFriendlyName := CallbackCreate(GetMethod(implObj, "GetFriendlyName"), flags, 3)
        this.vtbl.SetTargetFrameName := CallbackCreate(GetMethod(implObj, "SetTargetFrameName"), flags, 2)
        this.vtbl.GetTargetFrameName := CallbackCreate(GetMethod(implObj, "GetTargetFrameName"), flags, 2)
        this.vtbl.GetMiscStatus := CallbackCreate(GetMethod(implObj, "GetMiscStatus"), flags, 2)
        this.vtbl.Navigate := CallbackCreate(GetMethod(implObj, "Navigate"), flags, 5)
        this.vtbl.SetAdditionalParams := CallbackCreate(GetMethod(implObj, "SetAdditionalParams"), flags, 2)
        this.vtbl.GetAdditionalParams := CallbackCreate(GetMethod(implObj, "GetAdditionalParams"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetHlinkSite)
        CallbackFree(this.vtbl.GetHlinkSite)
        CallbackFree(this.vtbl.SetMonikerReference)
        CallbackFree(this.vtbl.GetMonikerReference)
        CallbackFree(this.vtbl.SetStringReference)
        CallbackFree(this.vtbl.GetStringReference)
        CallbackFree(this.vtbl.SetFriendlyName)
        CallbackFree(this.vtbl.GetFriendlyName)
        CallbackFree(this.vtbl.SetTargetFrameName)
        CallbackFree(this.vtbl.GetTargetFrameName)
        CallbackFree(this.vtbl.GetMiscStatus)
        CallbackFree(this.vtbl.Navigate)
        CallbackFree(this.vtbl.SetAdditionalParams)
        CallbackFree(this.vtbl.GetAdditionalParams)
    }
}
