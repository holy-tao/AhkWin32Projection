#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IOpenService.ahk" { IOpenService }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct IOpenServiceManager extends IUnknown {
    /**
     * The interface identifier for IOpenServiceManager
     * @type {Guid}
     */
    static IID := Guid("{5664125f-4e10-4e90-98e4-e4513d955a14}")

    /**
     * The class identifier for OpenServiceManager
     * @type {Guid}
     */
    static CLSID := Guid("{098870b6-39ea-480b-b8b5-dd0167c4db59}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOpenServiceManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        InstallService   : IntPtr
        UninstallService : IntPtr
        GetServiceByID   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOpenServiceManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pwzServiceUrl 
     * @returns {IOpenService} 
     */
    InstallService(pwzServiceUrl) {
        pwzServiceUrl := pwzServiceUrl is String ? StrPtr(pwzServiceUrl) : pwzServiceUrl

        result := ComCall(3, this, "ptr", pwzServiceUrl, "ptr*", &ppService := 0, "HRESULT")
        return IOpenService(ppService)
    }

    /**
     * 
     * @param {IOpenService} pService 
     * @returns {HRESULT} 
     */
    UninstallService(pService) {
        result := ComCall(4, this, "ptr", pService, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzID 
     * @returns {IOpenService} 
     */
    GetServiceByID(pwzID) {
        pwzID := pwzID is String ? StrPtr(pwzID) : pwzID

        result := ComCall(5, this, "ptr", pwzID, "ptr*", &ppService := 0, "HRESULT")
        return IOpenService(ppService)
    }

    Query(iid) {
        if (IOpenServiceManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InstallService := CallbackCreate(GetMethod(implObj, "InstallService"), flags, 3)
        this.vtbl.UninstallService := CallbackCreate(GetMethod(implObj, "UninstallService"), flags, 2)
        this.vtbl.GetServiceByID := CallbackCreate(GetMethod(implObj, "GetServiceByID"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InstallService)
        CallbackFree(this.vtbl.UninstallService)
        CallbackFree(this.vtbl.GetServiceByID)
    }
}
