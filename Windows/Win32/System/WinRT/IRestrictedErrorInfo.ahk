#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents the details of an error, including restricted error information.
 * @see https://learn.microsoft.com/windows/win32/api/restrictederrorinfo/nn-restrictederrorinfo-irestrictederrorinfo
 * @namespace Windows.Win32.System.WinRT
 */
export default struct IRestrictedErrorInfo extends IUnknown {
    /**
     * The interface identifier for IRestrictedErrorInfo
     * @type {Guid}
     */
    static IID := Guid("{82ba7092-4c88-427d-a7bc-16dd93feb67e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRestrictedErrorInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetErrorDetails : IntPtr
        GetReference    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRestrictedErrorInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns information about an error, including the restricted error description.
     * @param {Pointer<BSTR>} description Type: <b>BSTR*</b>
     * 
     * The error description.
     * @param {Pointer<HRESULT>} _error Type: <b>HRESULT*</b>
     * 
     * The error code associated with the error condition.
     * @param {Pointer<BSTR>} restrictedDescription Type: <b>BSTR*</b>
     * 
     * The restricted error description.
     * @param {Pointer<BSTR>} capabilitySid TBD
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/restrictederrorinfo/nf-restrictederrorinfo-irestrictederrorinfo-geterrordetails
     */
    GetErrorDetails(description, _error, restrictedDescription, capabilitySid) {
        _errorMarshal := _error is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, BSTR.Ptr, description, _errorMarshal, _error, BSTR.Ptr, restrictedDescription, BSTR.Ptr, capabilitySid, "HRESULT")
        return result
    }

    /**
     * Returns a reference to restricted error information.
     * @returns {BSTR} Type: <b>BSTR*</b>
     * 
     * A reference to the error information.
     * @see https://learn.microsoft.com/windows/win32/api/restrictederrorinfo/nf-restrictederrorinfo-irestrictederrorinfo-getreference
     */
    GetReference() {
        _reference := BSTR.Owned()
        result := ComCall(4, this, BSTR.Ptr, _reference, "HRESULT")
        return _reference
    }

    Query(iid) {
        if (IRestrictedErrorInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetErrorDetails := CallbackCreate(GetMethod(implObj, "GetErrorDetails"), flags, 5)
        this.vtbl.GetReference := CallbackCreate(GetMethod(implObj, "GetReference"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetErrorDetails)
        CallbackFree(this.vtbl.GetReference)
    }
}
