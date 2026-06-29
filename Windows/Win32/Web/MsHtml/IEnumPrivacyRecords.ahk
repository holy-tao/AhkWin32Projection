#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IEnumPrivacyRecords extends IUnknown {
    /**
     * The interface identifier for IEnumPrivacyRecords
     * @type {Guid}
     */
    static IID := Guid("{3050f844-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumPrivacyRecords interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Reset              : IntPtr
        GetSize            : IntPtr
        GetPrivacyImpacted : IntPtr
        Next               : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumPrivacyRecords.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetSize() {
        result := ComCall(4, this, "uint*", &pSize := 0, "HRESULT")
        return pSize
    }

    /**
     * 
     * @returns {BOOL} 
     */
    GetPrivacyImpacted() {
        result := ComCall(5, this, BOOL.Ptr, &pState := 0, "HRESULT")
        return pState
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrUrl 
     * @param {Pointer<BSTR>} pbstrPolicyRef 
     * @param {Pointer<Integer>} pdwReserved 
     * @param {Pointer<Integer>} pdwPrivacyFlags 
     * @returns {HRESULT} 
     */
    Next(pbstrUrl, pbstrPolicyRef, pdwReserved, pdwPrivacyFlags) {
        pdwReservedMarshal := pdwReserved is VarRef ? "int*" : "ptr"
        pdwPrivacyFlagsMarshal := pdwPrivacyFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, BSTR.Ptr, pbstrUrl, BSTR.Ptr, pbstrPolicyRef, pdwReservedMarshal, pdwReserved, pdwPrivacyFlagsMarshal, pdwPrivacyFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (IEnumPrivacyRecords.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
        this.vtbl.GetSize := CallbackCreate(GetMethod(implObj, "GetSize"), flags, 2)
        this.vtbl.GetPrivacyImpacted := CallbackCreate(GetMethod(implObj, "GetPrivacyImpacted"), flags, 2)
        this.vtbl.Next := CallbackCreate(GetMethod(implObj, "Next"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Reset)
        CallbackFree(this.vtbl.GetSize)
        CallbackFree(this.vtbl.GetPrivacyImpacted)
        CallbackFree(this.vtbl.Next)
    }
}
