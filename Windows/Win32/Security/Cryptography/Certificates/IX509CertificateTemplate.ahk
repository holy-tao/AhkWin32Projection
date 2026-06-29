#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\EnrollmentTemplateProperty.ahk" { EnrollmentTemplateProperty }
#Import "..\..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The IX509CertificateTemplate interface represents a certificate request template. It can be used to initialize an IX509CertificateTemplateWritable interface.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/nn-certenroll-ix509certificatetemplate
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct IX509CertificateTemplate extends IDispatch {
    /**
     * The interface identifier for IX509CertificateTemplate
     * @type {Guid}
     */
    static IID := Guid("{54244a13-555a-4e22-896d-1b0e52f76406}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IX509CertificateTemplate interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Property : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IX509CertificateTemplate.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a template property value.
     * @param {EnrollmentTemplateProperty} _property 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificatetemplate-get_property
     */
    get_Property(_property) {
        pValue := VARIANT()
        result := ComCall(7, this, EnrollmentTemplateProperty, _property, VARIANT.Ptr, pValue, "HRESULT")
        return pValue
    }

    Query(iid) {
        if (IX509CertificateTemplate.IID.Equals(iid)) {
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
