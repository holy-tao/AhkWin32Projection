#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMSMQTransaction2.ahk" { IMSMQTransaction2 }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.System.MessageQueuing
 */
export default struct IMSMQTransaction3 extends IMSMQTransaction2 {
    /**
     * The interface identifier for IMSMQTransaction3
     * @type {Guid}
     */
    static IID := Guid("{eba96b13-2168-11d3-898c-00e02c074f6b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSMQTransaction3 interfaces
    */
    struct Vtbl extends IMSMQTransaction2.Vtbl {
        get_ITransaction : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSMQTransaction3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT} 
     */
    ITransaction {
        get => this.get_ITransaction()
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ITransaction() {
        pvarITransaction := VARIANT()
        result := ComCall(12, this, VARIANT.Ptr, pvarITransaction, "HRESULT")
        return pvarITransaction
    }

    Query(iid) {
        if (IMSMQTransaction3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ITransaction := CallbackCreate(GetMethod(implObj, "get_ITransaction"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ITransaction)
    }
}
