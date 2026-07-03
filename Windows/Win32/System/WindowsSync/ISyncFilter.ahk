#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct ISyncFilter extends IUnknown {
    /**
     * The interface identifier for ISyncFilter
     * @type {Guid}
     */
    static IID := Guid("{087a3f15-0fcb-44c1-9639-53c14e2b5506}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISyncFilter interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        IsIdentical : IntPtr
        Serialize   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISyncFilter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {ISyncFilter} pSyncFilter 
     * @returns {HRESULT} 
     */
    IsIdentical(pSyncFilter) {
        result := ComCall(3, this, "ptr", pSyncFilter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbSyncFilter 
     * @param {Pointer<Integer>} pcbSyncFilter 
     * @returns {HRESULT} 
     */
    Serialize(pbSyncFilter, pcbSyncFilter) {
        pbSyncFilterMarshal := pbSyncFilter is VarRef ? "char*" : "ptr"
        pcbSyncFilterMarshal := pcbSyncFilter is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pbSyncFilterMarshal, pbSyncFilter, pcbSyncFilterMarshal, pcbSyncFilter, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISyncFilter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsIdentical := CallbackCreate(GetMethod(implObj, "IsIdentical"), flags, 2)
        this.vtbl.Serialize := CallbackCreate(GetMethod(implObj, "Serialize"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsIdentical)
        CallbackFree(this.vtbl.Serialize)
    }
}
