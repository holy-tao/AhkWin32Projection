#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\EnrollmentCAProperty.ahk" { EnrollmentCAProperty }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The ICertificationAuthority interface represents a single certification authority. A collection of certification authorities is represented by the ICertificationAuthorities interface.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/nn-certenroll-icertificationauthority
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct ICertificationAuthority extends IDispatch {
    /**
     * The interface identifier for ICertificationAuthority
     * @type {Guid}
     */
    static IID := Guid("{835d1f61-1e95-4bc8-b4d3-976c42b968f7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICertificationAuthority interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Property : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICertificationAuthority.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a certification authority property value.
     * @param {EnrollmentCAProperty} _property 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertificationauthority-get_property
     */
    get_Property(_property) {
        pValue := VARIANT()
        result := ComCall(7, this, EnrollmentCAProperty, _property, VARIANT.Ptr, pValue, "HRESULT")
        return pValue
    }

    Query(iid) {
        if (ICertificationAuthority.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Property := CallbackCreate(GetMethod(implObj, "get_Property"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Property)
    }
}
