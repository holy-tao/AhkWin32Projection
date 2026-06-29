#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IRTCPortManager.ahk" { IRTCPortManager }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct IRTCSessionPortManagement extends IUnknown {
    /**
     * The interface identifier for IRTCSessionPortManagement
     * @type {Guid}
     */
    static IID := Guid("{a072f1d6-0286-4e1f-85f2-17a2948456ec}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRTCSessionPortManagement interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetPortManager : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRTCSessionPortManagement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IRTCPortManager} pPortManager 
     * @returns {HRESULT} 
     */
    SetPortManager(pPortManager) {
        result := ComCall(3, this, "ptr", pPortManager, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRTCSessionPortManagement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetPortManager := CallbackCreate(GetMethod(implObj, "SetPortManager"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetPortManager)
    }
}
