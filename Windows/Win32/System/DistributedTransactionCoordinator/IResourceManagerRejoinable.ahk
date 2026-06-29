#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IResourceManager2.ahk" { IResourceManager2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\XACTSTAT.ahk" { XACTSTAT }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct IResourceManagerRejoinable extends IResourceManager2 {
    /**
     * The interface identifier for IResourceManagerRejoinable
     * @type {Guid}
     */
    static IID := Guid("{6f6de620-b5df-4f3e-9cfa-c8aebd05172b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IResourceManagerRejoinable interfaces
    */
    struct Vtbl extends IResourceManager2.Vtbl {
        Rejoin : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IResourceManagerRejoinable.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Integer>} pPrepInfo 
     * @param {Integer} cbPrepInfo 
     * @param {Integer} lTimeout 
     * @returns {XACTSTAT} 
     */
    Rejoin(pPrepInfo, cbPrepInfo, lTimeout) {
        pPrepInfoMarshal := pPrepInfo is VarRef ? "char*" : "ptr"

        result := ComCall(9, this, pPrepInfoMarshal, pPrepInfo, "uint", cbPrepInfo, "uint", lTimeout, "int*", &pXactStat := 0, "HRESULT")
        return pXactStat
    }

    Query(iid) {
        if (IResourceManagerRejoinable.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Rejoin := CallbackCreate(GetMethod(implObj, "Rejoin"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Rejoin)
    }
}
