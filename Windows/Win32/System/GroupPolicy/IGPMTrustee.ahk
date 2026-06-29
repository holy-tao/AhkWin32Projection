#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IGPMTrustee interface contains methods to retrieve information about a given trustee when using the Group Policy Management Console (GPMC).
 * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nn-gpmgmt-igpmtrustee
 * @namespace Windows.Win32.System.GroupPolicy
 */
export default struct IGPMTrustee extends IDispatch {
    /**
     * The interface identifier for IGPMTrustee
     * @type {Guid}
     */
    static IID := Guid("{3b466da8-c1a4-4b2a-999a-befcdd56cefb}")

    /**
     * The class identifier for GPMTrustee
     * @type {Guid}
     */
    static CLSID := Guid("{c54a700d-19b6-4211-bcb0-e8e2475e471e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGPMTrustee interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_TrusteeSid    : IntPtr
        get_TrusteeName   : IntPtr
        get_TrusteeDomain : IntPtr
        get_TrusteeDSPath : IntPtr
        get_TrusteeType   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGPMTrustee.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    TrusteeSid {
        get => this.get_TrusteeSid()
    }

    /**
     * @type {BSTR} 
     */
    TrusteeName {
        get => this.get_TrusteeName()
    }

    /**
     * @type {BSTR} 
     */
    TrusteeDomain {
        get => this.get_TrusteeDomain()
    }

    /**
     * @type {BSTR} 
     */
    TrusteeDSPath {
        get => this.get_TrusteeDSPath()
    }

    /**
     * @type {Integer} 
     */
    TrusteeType {
        get => this.get_TrusteeType()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_TrusteeSid() {
        bstrVal := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, bstrVal, "HRESULT")
        return bstrVal
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_TrusteeName() {
        bstrVal := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, bstrVal, "HRESULT")
        return bstrVal
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_TrusteeDomain() {
        bstrVal := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, bstrVal, "HRESULT")
        return bstrVal
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_TrusteeDSPath() {
        pVal := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TrusteeType() {
        result := ComCall(11, this, "int*", &lVal := 0, "HRESULT")
        return lVal
    }

    Query(iid) {
        if (IGPMTrustee.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_TrusteeSid := CallbackCreate(GetMethod(implObj, "get_TrusteeSid"), flags, 2)
        this.vtbl.get_TrusteeName := CallbackCreate(GetMethod(implObj, "get_TrusteeName"), flags, 2)
        this.vtbl.get_TrusteeDomain := CallbackCreate(GetMethod(implObj, "get_TrusteeDomain"), flags, 2)
        this.vtbl.get_TrusteeDSPath := CallbackCreate(GetMethod(implObj, "get_TrusteeDSPath"), flags, 2)
        this.vtbl.get_TrusteeType := CallbackCreate(GetMethod(implObj, "get_TrusteeType"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_TrusteeSid)
        CallbackFree(this.vtbl.get_TrusteeName)
        CallbackFree(this.vtbl.get_TrusteeDomain)
        CallbackFree(this.vtbl.get_TrusteeDSPath)
        CallbackFree(this.vtbl.get_TrusteeType)
    }
}
