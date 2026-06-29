#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IMoniker.ahk" { IMoniker }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IHlinkSite extends IUnknown {
    /**
     * The interface identifier for IHlinkSite
     * @type {Guid}
     */
    static IID := Guid("{79eac9c2-baf9-11ce-8c82-00aa004ba90b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHlinkSite interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        QueryService         : IntPtr
        GetMoniker           : IntPtr
        ReadyToNavigate      : IntPtr
        OnNavigationComplete : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHlinkSite.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dwSiteData 
     * @param {Pointer<Guid>} guidService 
     * @param {Pointer<Guid>} riid 
     * @returns {IUnknown} 
     */
    QueryService(dwSiteData, guidService, riid) {
        result := ComCall(3, this, "uint", dwSiteData, Guid.Ptr, guidService, Guid.Ptr, riid, "ptr*", &ppiunk := 0, "HRESULT")
        return IUnknown(ppiunk)
    }

    /**
     * 
     * @param {Integer} dwSiteData 
     * @param {Integer} dwAssign 
     * @param {Integer} dwWhich 
     * @returns {IMoniker} 
     */
    GetMoniker(dwSiteData, dwAssign, dwWhich) {
        result := ComCall(4, this, "uint", dwSiteData, "uint", dwAssign, "uint", dwWhich, "ptr*", &ppimk := 0, "HRESULT")
        return IMoniker(ppimk)
    }

    /**
     * 
     * @param {Integer} dwSiteData 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    ReadyToNavigate(dwSiteData, dwReserved) {
        result := ComCall(5, this, "uint", dwSiteData, "uint", dwReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwSiteData 
     * @param {Integer} dwreserved 
     * @param {HRESULT} hrError 
     * @param {PWSTR} pwzError 
     * @returns {HRESULT} 
     */
    OnNavigationComplete(dwSiteData, dwreserved, hrError, pwzError) {
        pwzError := pwzError is String ? StrPtr(pwzError) : pwzError

        result := ComCall(6, this, "uint", dwSiteData, "uint", dwreserved, "int", hrError, "ptr", pwzError, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHlinkSite.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.QueryService := CallbackCreate(GetMethod(implObj, "QueryService"), flags, 5)
        this.vtbl.GetMoniker := CallbackCreate(GetMethod(implObj, "GetMoniker"), flags, 5)
        this.vtbl.ReadyToNavigate := CallbackCreate(GetMethod(implObj, "ReadyToNavigate"), flags, 3)
        this.vtbl.OnNavigationComplete := CallbackCreate(GetMethod(implObj, "OnNavigationComplete"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.QueryService)
        CallbackFree(this.vtbl.GetMoniker)
        CallbackFree(this.vtbl.ReadyToNavigate)
        CallbackFree(this.vtbl.OnNavigationComplete)
    }
}
