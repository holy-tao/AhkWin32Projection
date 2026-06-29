#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Represents a generic name-value pair.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/nn-certenroll-ix509namevaluepair
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct IX509NameValuePair extends IDispatch {
    /**
     * The interface identifier for IX509NameValuePair
     * @type {Guid}
     */
    static IID := Guid("{728ab33f-217d-11da-b2a4-000e7bbb2b09}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IX509NameValuePair interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Initialize : IntPtr
        get_Value  : IntPtr
        get_Name   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IX509NameValuePair.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Value {
        get => this.get_Value()
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Initializes the object from strings that contain the name and associated value.
     * @remarks
     * You can call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509namevaluepair-get_name">Name</a> and <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509namevaluepair-get_value">Value</a> properties to retrieve the values initialized by calling this method.
     * @param {BSTR} strName A <b>BSTR</b> variable that contains the name.
     * @param {BSTR} strValue A <b>BSTR</b> variable that contains the value.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509namevaluepair-initialize
     */
    Initialize(strName, strValue) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName
        strValue := strValue is String ? BSTR.Alloc(strValue).Value : strValue

        result := ComCall(7, this, BSTR, strName, BSTR, strValue, "HRESULT")
        return result
    }

    /**
     * Retrieves the value portion of the name-value pair.
     * @remarks
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509namevaluepair-initialize">Initialize</a> method before calling this property.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509namevaluepair-get_value
     */
    get_Value() {
        pValue := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    /**
     * Retrieves the name portion of the name-value pair.
     * @remarks
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509namevaluepair-initialize">Initialize</a> method before calling this property.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509namevaluepair-get_name
     */
    get_Name() {
        pValue := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    Query(iid) {
        if (IX509NameValuePair.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 3)
        this.vtbl.get_Value := CallbackCreate(GetMethod(implObj, "get_Value"), flags, 2)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.get_Value)
        CallbackFree(this.vtbl.get_Name)
    }
}
