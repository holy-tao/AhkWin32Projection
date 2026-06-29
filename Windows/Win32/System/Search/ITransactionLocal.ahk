#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\DistributedTransactionCoordinator\ITransactionOptions.ahk" { ITransactionOptions }
#Import "..\DistributedTransactionCoordinator\ITransaction.ahk" { ITransaction }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct ITransactionLocal extends ITransaction {
    /**
     * The interface identifier for ITransactionLocal
     * @type {Guid}
     */
    static IID := Guid("{0c733a5f-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITransactionLocal interfaces
    */
    struct Vtbl extends ITransaction.Vtbl {
        GetOptionsObject : IntPtr
        StartTransaction : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITransactionLocal.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {ITransactionOptions} 
     */
    GetOptionsObject() {
        result := ComCall(6, this, "ptr*", &ppOptions := 0, "HRESULT")
        return ITransactionOptions(ppOptions)
    }

    /**
     * 
     * @param {Integer} isoLevel 
     * @param {Integer} isoFlags 
     * @param {ITransactionOptions} pOtherOptions 
     * @returns {Integer} 
     */
    StartTransaction(isoLevel, isoFlags, pOtherOptions) {
        result := ComCall(7, this, "int", isoLevel, "uint", isoFlags, "ptr", pOtherOptions, "uint*", &pulTransactionLevel := 0, "HRESULT")
        return pulTransactionLevel
    }

    Query(iid) {
        if (ITransactionLocal.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetOptionsObject := CallbackCreate(GetMethod(implObj, "GetOptionsObject"), flags, 2)
        this.vtbl.StartTransaction := CallbackCreate(GetMethod(implObj, "StartTransaction"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetOptionsObject)
        CallbackFree(this.vtbl.StartTransaction)
    }
}
