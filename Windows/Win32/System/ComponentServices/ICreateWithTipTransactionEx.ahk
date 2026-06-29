#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Creates an object that is enlisted within a manual transaction using the Transaction Internet Protocol (TIP).
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-icreatewithtiptransactionex
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct ICreateWithTipTransactionEx extends IUnknown {
    /**
     * The interface identifier for ICreateWithTipTransactionEx
     * @type {Guid}
     */
    static IID := Guid("{455acf59-5345-11d2-99cf-00c04f797bc9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICreateWithTipTransactionEx interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateInstance : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICreateWithTipTransactionEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a COM+ object that executes within the scope of the manual transaction specified by a TIP transaction URL.
     * @param {BSTR} bstrTipUrl The Transaction Internet Protocol (TIP) URL of the existing transaction in which you want to create the COM+ object.
     * @param {Pointer<Guid>} rclsid The CLSID of the type of object to be instantiated.
     * @param {Pointer<Guid>} riid The ID of the interface to be returned by the <i>ppvObj</i> parameter.
     * @returns {Pointer<Void>} A reference to a new object of the type specified by the <i>rclsid</i> argument, through the interface specified by the <i>riid</i> argument.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icreatewithtiptransactionex-createinstance
     */
    CreateInstance(bstrTipUrl, rclsid, riid) {
        bstrTipUrl := bstrTipUrl is String ? BSTR.Alloc(bstrTipUrl).Value : bstrTipUrl

        result := ComCall(3, this, BSTR, bstrTipUrl, Guid.Ptr, rclsid, Guid.Ptr, riid, "ptr*", &pObject := 0, "HRESULT")
        return pObject
    }

    Query(iid) {
        if (ICreateWithTipTransactionEx.IID.Equals(iid)) {
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
