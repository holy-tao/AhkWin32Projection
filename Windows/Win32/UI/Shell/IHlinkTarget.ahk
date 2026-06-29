#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IMoniker.ahk" { IMoniker }
#Import ".\IHlinkBrowseContext.ahk" { IHlinkBrowseContext }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IHlinkTarget extends IUnknown {
    /**
     * The interface identifier for IHlinkTarget
     * @type {Guid}
     */
    static IID := Guid("{79eac9c4-baf9-11ce-8c82-00aa004ba90b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHlinkTarget interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetBrowseContext : IntPtr
        GetBrowseContext : IntPtr
        Navigate         : IntPtr
        GetMoniker       : IntPtr
        GetFriendlyName  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHlinkTarget.Vtbl()
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
     * @param {PWSTR} pwzJumpLocation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/WMP/navigate-element
     */
    Navigate(grfHLNF, pwzJumpLocation) {
        pwzJumpLocation := pwzJumpLocation is String ? StrPtr(pwzJumpLocation) : pwzJumpLocation

        result := ComCall(5, this, "uint", grfHLNF, "ptr", pwzJumpLocation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzLocation 
     * @param {Integer} dwAssign 
     * @returns {IMoniker} 
     */
    GetMoniker(pwzLocation, dwAssign) {
        pwzLocation := pwzLocation is String ? StrPtr(pwzLocation) : pwzLocation

        result := ComCall(6, this, "ptr", pwzLocation, "uint", dwAssign, "ptr*", &ppimkLocation := 0, "HRESULT")
        return IMoniker(ppimkLocation)
    }

    /**
     * 
     * @param {PWSTR} pwzLocation 
     * @returns {PWSTR} 
     */
    GetFriendlyName(pwzLocation) {
        pwzLocation := pwzLocation is String ? StrPtr(pwzLocation) : pwzLocation

        result := ComCall(7, this, "ptr", pwzLocation, PWSTR.Ptr, &ppwzFriendlyName := 0, "HRESULT")
        return ppwzFriendlyName
    }

    Query(iid) {
        if (IHlinkTarget.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetBrowseContext := CallbackCreate(GetMethod(implObj, "SetBrowseContext"), flags, 2)
        this.vtbl.GetBrowseContext := CallbackCreate(GetMethod(implObj, "GetBrowseContext"), flags, 2)
        this.vtbl.Navigate := CallbackCreate(GetMethod(implObj, "Navigate"), flags, 3)
        this.vtbl.GetMoniker := CallbackCreate(GetMethod(implObj, "GetMoniker"), flags, 4)
        this.vtbl.GetFriendlyName := CallbackCreate(GetMethod(implObj, "GetFriendlyName"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetBrowseContext)
        CallbackFree(this.vtbl.GetBrowseContext)
        CallbackFree(this.vtbl.Navigate)
        CallbackFree(this.vtbl.GetMoniker)
        CallbackFree(this.vtbl.GetFriendlyName)
    }
}
