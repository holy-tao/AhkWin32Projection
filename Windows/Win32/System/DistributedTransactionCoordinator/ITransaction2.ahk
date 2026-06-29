#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\XACTTRANSINFO.ahk" { XACTTRANSINFO }
#Import ".\ITransactionCloner.ahk" { ITransactionCloner }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct ITransaction2 extends ITransactionCloner {
    /**
     * The interface identifier for ITransaction2
     * @type {Guid}
     */
    static IID := Guid("{34021548-0065-11d3-bac1-00c04f797be2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITransaction2 interfaces
    */
    struct Vtbl extends ITransactionCloner.Vtbl {
        GetTransactionInfo2 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITransaction2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {XACTTRANSINFO} 
     */
    GetTransactionInfo2() {
        pinfo := XACTTRANSINFO()
        result := ComCall(7, this, XACTTRANSINFO.Ptr, pinfo, "HRESULT")
        return pinfo
    }

    Query(iid) {
        if (ITransaction2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTransactionInfo2 := CallbackCreate(GetMethod(implObj, "GetTransactionInfo2"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTransactionInfo2)
    }
}
