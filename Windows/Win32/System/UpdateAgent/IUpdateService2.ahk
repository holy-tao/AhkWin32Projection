#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IUpdateService.ahk" { IUpdateService }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Contains information about a service that is registered with Windows Update Agent (WUA) or with Automatic Updates. (IUpdateService2)
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-iupdateservice2
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IUpdateService2 extends IUpdateService {
    /**
     * The interface identifier for IUpdateService2
     * @type {Guid}
     */
    static IID := Guid("{1518b460-6518-4172-940f-c75883b24ceb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUpdateService2 interfaces
    */
    struct Vtbl extends IUpdateService.Vtbl {
        get_IsDefaultAUService : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUpdateService2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsDefaultAUService {
        get => this.get_IsDefaultAUService()
    }

    /**
     * Gets a Boolean value that indicates whether the service is registered with Automatic Updates and whether the service is currently used by Automatic Updates as the default service.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateservice2-get_isdefaultauservice
     */
    get_IsDefaultAUService() {
        result := ComCall(20, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    Query(iid) {
        if (IUpdateService2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_IsDefaultAUService := CallbackCreate(GetMethod(implObj, "get_IsDefaultAUService"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_IsDefaultAUService)
    }
}
