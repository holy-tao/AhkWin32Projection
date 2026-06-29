#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDtcNetworkAccessConfig2.ahk" { IDtcNetworkAccessConfig2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct IDtcNetworkAccessConfig3 extends IDtcNetworkAccessConfig2 {
    /**
     * The interface identifier for IDtcNetworkAccessConfig3
     * @type {Guid}
     */
    static IID := Guid("{76e4b4f3-2ca5-466b-89d5-fd218ee75b49}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDtcNetworkAccessConfig3 interfaces
    */
    struct Vtbl extends IDtcNetworkAccessConfig2.Vtbl {
        GetLUAccess : IntPtr
        SetLUAccess : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDtcNetworkAccessConfig3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {BOOL} 
     */
    GetLUAccess() {
        result := ComCall(22, this, BOOL.Ptr, &pbLUAccess := 0, "HRESULT")
        return pbLUAccess
    }

    /**
     * 
     * @param {BOOL} bLUAccess 
     * @returns {HRESULT} 
     */
    SetLUAccess(bLUAccess) {
        result := ComCall(23, this, BOOL, bLUAccess, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDtcNetworkAccessConfig3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetLUAccess := CallbackCreate(GetMethod(implObj, "GetLUAccess"), flags, 2)
        this.vtbl.SetLUAccess := CallbackCreate(GetMethod(implObj, "SetLUAccess"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetLUAccess)
        CallbackFree(this.vtbl.SetLUAccess)
    }
}
