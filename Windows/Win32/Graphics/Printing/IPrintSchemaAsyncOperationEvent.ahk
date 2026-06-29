#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPrintSchemaTicket.ahk" { IPrintSchemaTicket }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrintSchemaAsyncOperationEvent extends IDispatch {
    /**
     * The interface identifier for IPrintSchemaAsyncOperationEvent
     * @type {Guid}
     */
    static IID := Guid("{23adbb16-0133-4906-b29a-1dce1d026379}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintSchemaAsyncOperationEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Completed : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintSchemaAsyncOperationEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IPrintSchemaTicket} pTicket 
     * @param {HRESULT} hrOperation 
     * @returns {HRESULT} 
     */
    Completed(pTicket, hrOperation) {
        result := ComCall(7, this, "ptr", pTicket, "int", hrOperation, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPrintSchemaAsyncOperationEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Completed := CallbackCreate(GetMethod(implObj, "Completed"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Completed)
    }
}
