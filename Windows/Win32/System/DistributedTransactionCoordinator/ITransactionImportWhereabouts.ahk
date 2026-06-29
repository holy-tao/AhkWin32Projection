#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct ITransactionImportWhereabouts extends IUnknown {
    /**
     * The interface identifier for ITransactionImportWhereabouts
     * @type {Guid}
     */
    static IID := Guid("{0141fda4-8fc0-11ce-bd18-204c4f4f5020}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITransactionImportWhereabouts interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetWhereaboutsSize : IntPtr
        GetWhereabouts     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITransactionImportWhereabouts.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetWhereaboutsSize() {
        result := ComCall(3, this, "uint*", &pcbWhereabouts := 0, "HRESULT")
        return pcbWhereabouts
    }

    /**
     * 
     * @param {Integer} cbWhereabouts 
     * @param {Pointer<Integer>} rgbWhereabouts 
     * @param {Pointer<Integer>} pcbUsed 
     * @returns {HRESULT} 
     */
    GetWhereabouts(cbWhereabouts, rgbWhereabouts, pcbUsed) {
        rgbWhereaboutsMarshal := rgbWhereabouts is VarRef ? "char*" : "ptr"
        pcbUsedMarshal := pcbUsed is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", cbWhereabouts, rgbWhereaboutsMarshal, rgbWhereabouts, pcbUsedMarshal, pcbUsed, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITransactionImportWhereabouts.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetWhereaboutsSize := CallbackCreate(GetMethod(implObj, "GetWhereaboutsSize"), flags, 2)
        this.vtbl.GetWhereabouts := CallbackCreate(GetMethod(implObj, "GetWhereabouts"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetWhereaboutsSize)
        CallbackFree(this.vtbl.GetWhereabouts)
    }
}
