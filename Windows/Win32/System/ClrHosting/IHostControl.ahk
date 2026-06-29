#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct IHostControl extends IUnknown {
    /**
     * The interface identifier for IHostControl
     * @type {Guid}
     */
    static IID := Guid("{02ca073c-7079-4860-880a-c2f7a449c991}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHostControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetHostManager      : IntPtr
        SetAppDomainManager : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHostControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetHostManager(riid) {
        result := ComCall(3, this, Guid.Ptr, riid, "ptr*", &ppObject := 0, "HRESULT")
        return ppObject
    }

    /**
     * 
     * @param {Integer} dwAppDomainID 
     * @param {IUnknown} pUnkAppDomainManager 
     * @returns {HRESULT} 
     */
    SetAppDomainManager(dwAppDomainID, pUnkAppDomainManager) {
        result := ComCall(4, this, "uint", dwAppDomainID, "ptr", pUnkAppDomainManager, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHostControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetHostManager := CallbackCreate(GetMethod(implObj, "GetHostManager"), flags, 3)
        this.vtbl.SetAppDomainManager := CallbackCreate(GetMethod(implObj, "SetAppDomainManager"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetHostManager)
        CallbackFree(this.vtbl.SetAppDomainManager)
    }
}
