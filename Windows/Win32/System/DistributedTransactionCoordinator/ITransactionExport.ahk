#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct ITransactionExport extends IUnknown {
    /**
     * The interface identifier for ITransactionExport
     * @type {Guid}
     */
    static IID := Guid("{0141fda5-8fc0-11ce-bd18-204c4f4f5020}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITransactionExport interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Export               : IntPtr
        GetTransactionCookie : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITransactionExport.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IUnknown} punkTransaction 
     * @returns {Integer} 
     */
    Export(punkTransaction) {
        result := ComCall(3, this, "ptr", punkTransaction, "uint*", &pcbTransactionCookie := 0, "HRESULT")
        return pcbTransactionCookie
    }

    /**
     * 
     * @param {IUnknown} punkTransaction 
     * @param {Integer} cbTransactionCookie 
     * @param {Pointer<Integer>} rgbTransactionCookie 
     * @param {Pointer<Integer>} pcbUsed 
     * @returns {HRESULT} 
     */
    GetTransactionCookie(punkTransaction, cbTransactionCookie, rgbTransactionCookie, pcbUsed) {
        rgbTransactionCookieMarshal := rgbTransactionCookie is VarRef ? "char*" : "ptr"
        pcbUsedMarshal := pcbUsed is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", punkTransaction, "uint", cbTransactionCookie, rgbTransactionCookieMarshal, rgbTransactionCookie, pcbUsedMarshal, pcbUsed, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITransactionExport.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Export := CallbackCreate(GetMethod(implObj, "Export"), flags, 3)
        this.vtbl.GetTransactionCookie := CallbackCreate(GetMethod(implObj, "GetTransactionCookie"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Export)
        CallbackFree(this.vtbl.GetTransactionCookie)
    }
}
