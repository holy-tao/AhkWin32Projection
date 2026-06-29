#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRMHelper.ahk" { IRMHelper }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct IXAObtainRMInfo extends IUnknown {
    /**
     * The interface identifier for IXAObtainRMInfo
     * @type {Guid}
     */
    static IID := Guid("{e793f6d2-f53d-11cf-a60d-00a0c905416e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXAObtainRMInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ObtainRMInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXAObtainRMInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IRMHelper} pIRMHelper 
     * @returns {HRESULT} 
     */
    ObtainRMInfo(pIRMHelper) {
        result := ComCall(3, this, "ptr", pIRMHelper, "HRESULT")
        return result
    }

    Query(iid) {
        if (IXAObtainRMInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ObtainRMInfo := CallbackCreate(GetMethod(implObj, "ObtainRMInfo"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ObtainRMInfo)
    }
}
