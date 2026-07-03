#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Creates a COM+ object that executes within the scope of the specified local transaction. (ICreateWithLocalTransaction)
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-icreatewithlocaltransaction
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct ICreateWithLocalTransaction extends IUnknown {
    /**
     * The interface identifier for ICreateWithLocalTransaction
     * @type {Guid}
     */
    static IID := Guid("{227ac7a8-8423-42ce-b7cf-03061ec9aaa3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICreateWithLocalTransaction interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateInstanceWithSysTx : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICreateWithLocalTransaction.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a COM+ object that executes within the scope of the specified local transaction. (ICreateWithLocalTransaction.CreateInstanceWithSysTx)
     * @param {IUnknown} pTransaction The transaction in which the requested object participates.
     * @param {Pointer<Guid>} rclsid The CLSID of the class from which to create the requested object.
     * @param {Pointer<Guid>} riid A reference to the interface identifier (IID) of the interface that is used to communicate with the request object.
     * @param {Pointer<Pointer<Void>>} pObject The address of the pointer variable that receives the interface pointer specified with <i>riid</i>.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icreatewithlocaltransaction-createinstancewithsystx
     */
    CreateInstanceWithSysTx(pTransaction, rclsid, riid, pObject) {
        pObjectMarshal := pObject is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", pTransaction, Guid.Ptr, rclsid, Guid.Ptr, riid, pObjectMarshal, pObject, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICreateWithLocalTransaction.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateInstanceWithSysTx := CallbackCreate(GetMethod(implObj, "CreateInstanceWithSysTx"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateInstanceWithSysTx)
    }
}
