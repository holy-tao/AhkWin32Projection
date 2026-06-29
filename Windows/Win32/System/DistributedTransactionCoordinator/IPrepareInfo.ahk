#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct IPrepareInfo extends IUnknown {
    /**
     * The interface identifier for IPrepareInfo
     * @type {Guid}
     */
    static IID := Guid("{80c7bfd0-87ee-11ce-8081-0080c758527e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrepareInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPrepareInfoSize : IntPtr
        GetPrepareInfo     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrepareInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Integer>} pcbPrepInfo 
     * @returns {HRESULT} 
     */
    GetPrepareInfoSize(pcbPrepInfo) {
        pcbPrepInfoMarshal := pcbPrepInfo is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pcbPrepInfoMarshal, pcbPrepInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pPrepInfo 
     * @returns {HRESULT} 
     */
    GetPrepareInfo(pPrepInfo) {
        pPrepInfoMarshal := pPrepInfo is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, pPrepInfoMarshal, pPrepInfo, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPrepareInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPrepareInfoSize := CallbackCreate(GetMethod(implObj, "GetPrepareInfoSize"), flags, 2)
        this.vtbl.GetPrepareInfo := CallbackCreate(GetMethod(implObj, "GetPrepareInfo"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPrepareInfoSize)
        CallbackFree(this.vtbl.GetPrepareInfo)
    }
}
