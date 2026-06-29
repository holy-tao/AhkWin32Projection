#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Ole\IOleWindow.ahk" { IOleWindow }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IDeskBarClient extends IOleWindow {
    /**
     * The interface identifier for IDeskBarClient
     * @type {Guid}
     */
    static IID := Guid("{eb0fe175-1a3a-11d0-89b3-00a0c90a90ac}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDeskBarClient interfaces
    */
    struct Vtbl extends IOleWindow.Vtbl {
        SetDeskBarSite : IntPtr
        SetModeDBC     : IntPtr
        UIActivateDBC  : IntPtr
        GetSize        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDeskBarClient.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IUnknown} punkSite 
     * @returns {HRESULT} 
     */
    SetDeskBarSite(punkSite) {
        result := ComCall(5, this, "ptr", punkSite, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwMode 
     * @returns {HRESULT} 
     */
    SetModeDBC(dwMode) {
        result := ComCall(6, this, "uint", dwMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwState 
     * @returns {HRESULT} 
     */
    UIActivateDBC(dwState) {
        result := ComCall(7, this, "uint", dwState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwWhich 
     * @returns {RECT} 
     */
    GetSize(dwWhich) {
        prc := RECT()
        result := ComCall(8, this, "uint", dwWhich, RECT.Ptr, prc, "HRESULT")
        return prc
    }

    Query(iid) {
        if (IDeskBarClient.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetDeskBarSite := CallbackCreate(GetMethod(implObj, "SetDeskBarSite"), flags, 2)
        this.vtbl.SetModeDBC := CallbackCreate(GetMethod(implObj, "SetModeDBC"), flags, 2)
        this.vtbl.UIActivateDBC := CallbackCreate(GetMethod(implObj, "UIActivateDBC"), flags, 2)
        this.vtbl.GetSize := CallbackCreate(GetMethod(implObj, "GetSize"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetDeskBarSite)
        CallbackFree(this.vtbl.SetModeDBC)
        CallbackFree(this.vtbl.UIActivateDBC)
        CallbackFree(this.vtbl.GetSize)
    }
}
