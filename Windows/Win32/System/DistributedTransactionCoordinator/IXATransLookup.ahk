#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\ITransaction.ahk" { ITransaction }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct IXATransLookup extends IUnknown {
    /**
     * The interface identifier for IXATransLookup
     * @type {Guid}
     */
    static IID := Guid("{f3b1f131-eeda-11ce-aed4-00aa0051e2c4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXATransLookup interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Lookup : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXATransLookup.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {ITransaction} 
     */
    Lookup() {
        result := ComCall(3, this, "ptr*", &ppTransaction := 0, "HRESULT")
        return ITransaction(ppTransaction)
    }

    Query(iid) {
        if (IXATransLookup.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Lookup := CallbackCreate(GetMethod(implObj, "Lookup"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Lookup)
    }
}
