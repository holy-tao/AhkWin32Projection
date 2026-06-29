#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IGetServiceIds extends IUnknown {
    /**
     * The interface identifier for IGetServiceIds
     * @type {Guid}
     */
    static IID := Guid("{4a073526-6103-4e21-b7bc-f519d1524e5d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGetServiceIds interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetServiceIds : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGetServiceIds.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Integer>} serviceIdCount 
     * @param {Pointer<Pointer<Guid>>} serviceIds 
     * @returns {HRESULT} 
     */
    GetServiceIds(serviceIdCount, serviceIds) {
        serviceIdCountMarshal := serviceIdCount is VarRef ? "uint*" : "ptr"
        serviceIdsMarshal := serviceIds is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, serviceIdCountMarshal, serviceIdCount, serviceIdsMarshal, serviceIds, "HRESULT")
        return result
    }

    Query(iid) {
        if (IGetServiceIds.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetServiceIds := CallbackCreate(GetMethod(implObj, "GetServiceIds"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetServiceIds)
    }
}
