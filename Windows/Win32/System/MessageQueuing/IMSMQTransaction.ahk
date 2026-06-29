#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.System.MessageQueuing
 */
export default struct IMSMQTransaction extends IDispatch {
    /**
     * The interface identifier for IMSMQTransaction
     * @type {Guid}
     */
    static IID := Guid("{d7d6e07f-dccd-11d0-aa4b-0060970debae}")

    /**
     * The class identifier for MSMQTransaction
     * @type {Guid}
     */
    static CLSID := Guid("{d7d6e080-dccd-11d0-aa4b-0060970debae}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSMQTransaction interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Transaction : IntPtr
        Commit          : IntPtr
        Abort           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSMQTransaction.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Transaction {
        get => this.get_Transaction()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Transaction() {
        result := ComCall(7, this, "int*", &plTransaction := 0, "HRESULT")
        return plTransaction
    }

    /**
     * 
     * @param {Pointer<VARIANT>} fRetaining 
     * @param {Pointer<VARIANT>} grfTC 
     * @param {Pointer<VARIANT>} grfRM 
     * @returns {HRESULT} 
     */
    Commit(fRetaining, grfTC, grfRM) {
        result := ComCall(8, this, VARIANT.Ptr, fRetaining, VARIANT.Ptr, grfTC, VARIANT.Ptr, grfRM, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} fRetaining 
     * @param {Pointer<VARIANT>} fAsync 
     * @returns {HRESULT} 
     */
    Abort(fRetaining, fAsync) {
        result := ComCall(9, this, VARIANT.Ptr, fRetaining, VARIANT.Ptr, fAsync, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMSMQTransaction.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Transaction := CallbackCreate(GetMethod(implObj, "get_Transaction"), flags, 2)
        this.vtbl.Commit := CallbackCreate(GetMethod(implObj, "Commit"), flags, 4)
        this.vtbl.Abort := CallbackCreate(GetMethod(implObj, "Abort"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Transaction)
        CallbackFree(this.vtbl.Commit)
        CallbackFree(this.vtbl.Abort)
    }
}
