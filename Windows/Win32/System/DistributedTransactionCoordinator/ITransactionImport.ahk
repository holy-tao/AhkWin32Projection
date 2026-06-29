#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct ITransactionImport extends IUnknown {
    /**
     * The interface identifier for ITransactionImport
     * @type {Guid}
     */
    static IID := Guid("{e1cf9b5a-8745-11ce-a9ba-00aa006c3706}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITransactionImport interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Import : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITransactionImport.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} cbTransactionCookie 
     * @param {Pointer<Integer>} rgbTransactionCookie 
     * @param {Pointer<Guid>} piid 
     * @returns {Pointer<Void>} 
     */
    Import(cbTransactionCookie, rgbTransactionCookie, piid) {
        rgbTransactionCookieMarshal := rgbTransactionCookie is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "uint", cbTransactionCookie, rgbTransactionCookieMarshal, rgbTransactionCookie, Guid.Ptr, piid, "ptr*", &ppvTransaction := 0, "HRESULT")
        return ppvTransaction
    }

    Query(iid) {
        if (ITransactionImport.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Import := CallbackCreate(GetMethod(implObj, "Import"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Import)
    }
}
