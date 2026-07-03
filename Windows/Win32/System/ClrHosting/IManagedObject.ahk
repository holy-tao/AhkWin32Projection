#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct IManagedObject extends IUnknown {
    /**
     * The interface identifier for IManagedObject
     * @type {Guid}
     */
    static IID := Guid("{c3fcc19e-a970-11d2-8b5a-00a0c9b7c9c4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IManagedObject interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetSerializedBuffer : IntPtr
        GetObjectIdentity   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IManagedObject.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetSerializedBuffer() {
        pBSTR := BSTR.Owned()
        result := ComCall(3, this, BSTR.Ptr, pBSTR, "HRESULT")
        return pBSTR
    }

    /**
     * 
     * @param {Pointer<BSTR>} pBSTRGUID 
     * @param {Pointer<Integer>} AppDomainID 
     * @param {Pointer<Integer>} pCCW 
     * @returns {HRESULT} 
     */
    GetObjectIdentity(pBSTRGUID, AppDomainID, pCCW) {
        AppDomainIDMarshal := AppDomainID is VarRef ? "int*" : "ptr"
        pCCWMarshal := pCCW is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, BSTR.Ptr, pBSTRGUID, AppDomainIDMarshal, AppDomainID, pCCWMarshal, pCCW, "HRESULT")
        return result
    }

    Query(iid) {
        if (IManagedObject.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSerializedBuffer := CallbackCreate(GetMethod(implObj, "GetSerializedBuffer"), flags, 2)
        this.vtbl.GetObjectIdentity := CallbackCreate(GetMethod(implObj, "GetObjectIdentity"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSerializedBuffer)
        CallbackFree(this.vtbl.GetObjectIdentity)
    }
}
