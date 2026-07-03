#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\DistributedTransactionCoordinator\ITransaction.ahk" { ITransaction }

/**
 * Creates an object that is enlisted within a manual transaction.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-icreatewithtransactionex
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct ICreateWithTransactionEx extends IUnknown {
    /**
     * The interface identifier for ICreateWithTransactionEx
     * @type {Guid}
     */
    static IID := Guid("{455acf57-5345-11d2-99cf-00c04f797bc9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICreateWithTransactionEx interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateInstance : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICreateWithTransactionEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a COM+ object that executes within the scope of a manual transaction specified with a reference to an ITransaction interface.
     * @param {ITransaction} pTransaction An <b>ITransaction</b> interface pointer indicating the transaction in which you want to create the COM+ object.
     * @param {Pointer<Guid>} rclsid The CLSID of the type of object to instantiate.
     * @param {Pointer<Guid>} riid The ID of the interface to be returned by the <i>ppvObj</i> parameter.
     * @returns {Pointer<Void>} A new object of the type specified by the <i>rclsid</i> argument through the interface specified by the <i>riid</i> argument.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icreatewithtransactionex-createinstance
     */
    CreateInstance(pTransaction, rclsid, riid) {
        result := ComCall(3, this, "ptr", pTransaction, Guid.Ptr, rclsid, Guid.Ptr, riid, "ptr*", &pObject := 0, "HRESULT")
        return pObject
    }

    Query(iid) {
        if (ICreateWithTransactionEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateInstance := CallbackCreate(GetMethod(implObj, "CreateInstance"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateInstance)
    }
}
