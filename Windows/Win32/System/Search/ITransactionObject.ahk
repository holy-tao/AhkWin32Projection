#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\DistributedTransactionCoordinator\ITransaction.ahk" { ITransaction }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct ITransactionObject extends IUnknown {
    /**
     * The interface identifier for ITransactionObject
     * @type {Guid}
     */
    static IID := Guid("{0c733a60-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITransactionObject interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTransactionObject : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITransactionObject.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} ulTransactionLevel 
     * @returns {ITransaction} 
     */
    GetTransactionObject(ulTransactionLevel) {
        result := ComCall(3, this, "uint", ulTransactionLevel, "ptr*", &ppTransactionObject := 0, "HRESULT")
        return ITransaction(ppTransactionObject)
    }

    Query(iid) {
        if (ITransactionObject.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTransactionObject := CallbackCreate(GetMethod(implObj, "GetTransactionObject"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTransactionObject)
    }
}
