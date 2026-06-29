#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\ITransaction.ahk" { ITransaction }
#Import ".\ITransactionOptions.ahk" { ITransactionOptions }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct ITransactionDispenser extends IUnknown {
    /**
     * The interface identifier for ITransactionDispenser
     * @type {Guid}
     */
    static IID := Guid("{3a6ad9e1-23b9-11cf-ad60-00aa00a74ccd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITransactionDispenser interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetOptionsObject : IntPtr
        BeginTransaction : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITransactionDispenser.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {ITransactionOptions} 
     */
    GetOptionsObject() {
        result := ComCall(3, this, "ptr*", &ppOptions := 0, "HRESULT")
        return ITransactionOptions(ppOptions)
    }

    /**
     * 
     * @param {IUnknown} punkOuter 
     * @param {Integer} isoLevel 
     * @param {Integer} isoFlags 
     * @param {ITransactionOptions} pOptions 
     * @returns {ITransaction} 
     */
    BeginTransaction(punkOuter, isoLevel, isoFlags, pOptions) {
        result := ComCall(4, this, "ptr", punkOuter, "int", isoLevel, "uint", isoFlags, "ptr", pOptions, "ptr*", &ppTransaction := 0, "HRESULT")
        return ITransaction(ppTransaction)
    }

    Query(iid) {
        if (ITransactionDispenser.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetOptionsObject := CallbackCreate(GetMethod(implObj, "GetOptionsObject"), flags, 2)
        this.vtbl.BeginTransaction := CallbackCreate(GetMethod(implObj, "BeginTransaction"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetOptionsObject)
        CallbackFree(this.vtbl.BeginTransaction)
    }
}
