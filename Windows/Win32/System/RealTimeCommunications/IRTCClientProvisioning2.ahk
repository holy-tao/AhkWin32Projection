#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IRTCClientProvisioning.ahk" { IRTCClientProvisioning }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRTCProfile.ahk" { IRTCProfile }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct IRTCClientProvisioning2 extends IRTCClientProvisioning {
    /**
     * The interface identifier for IRTCClientProvisioning2
     * @type {Guid}
     */
    static IID := Guid("{a70909b5-f40e-4587-bb75-e6bc0845023e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRTCClientProvisioning2 interfaces
    */
    struct Vtbl extends IRTCClientProvisioning.Vtbl {
        EnableProfileEx : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRTCClientProvisioning2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IRTCProfile} pProfile 
     * @param {Integer} lRegisterFlags 
     * @param {Integer} lRoamingFlags 
     * @returns {HRESULT} 
     */
    EnableProfileEx(pProfile, lRegisterFlags, lRoamingFlags) {
        result := ComCall(10, this, "ptr", pProfile, "int", lRegisterFlags, "int", lRoamingFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRTCClientProvisioning2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnableProfileEx := CallbackCreate(GetMethod(implObj, "EnableProfileEx"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnableProfileEx)
    }
}
