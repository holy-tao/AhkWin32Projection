#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ICertProperty.ahk" { ICertProperty }

/**
 * Represents a certificate property that contains the Domain Naming System (DNS) name of the computer on which the request was created.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/nn-certenroll-icertpropertyrequestoriginator
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct ICertPropertyRequestOriginator extends ICertProperty {
    /**
     * The interface identifier for ICertPropertyRequestOriginator
     * @type {Guid}
     */
    static IID := Guid("{728ab333-217d-11da-b2a4-000e7bbb2b09}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICertPropertyRequestOriginator interfaces
    */
    struct Vtbl extends ICertProperty.Vtbl {
        Initialize                           : IntPtr
        InitializeFromLocalRequestOriginator : IntPtr
        get_RequestOriginator                : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICertPropertyRequestOriginator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    RequestOriginator {
        get => this.get_RequestOriginator()
    }

    /**
     * Initializes the object from a string that contains the DNS name of the originating computer.
     * @remarks
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertproperty-setvalueoncertificate">SetValueOnCertificate</a> method to associate the property with a certificate. Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertpropertyrequestoriginator-get_requestoriginator">RequestOriginator</a> property to retrieve the DNS name of the originating computer.
     * @param {BSTR} strRequestOriginator A <b>BSTR</b> variable that contains the name.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>HRESULT_FROM_WIN32(ERROR_ALREADY_INITIALIZED)</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object is already initialized.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertpropertyrequestoriginator-initialize
     */
    Initialize(strRequestOriginator) {
        strRequestOriginator := strRequestOriginator is String ? BSTR.Alloc(strRequestOriginator).Value : strRequestOriginator

        result := ComCall(14, this, BSTR, strRequestOriginator, "HRESULT")
        return result
    }

    /**
     * Initializes the object from the DNS name of the local computer.
     * @remarks
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertproperty-setvalueoncertificate">SetValueOnCertificate</a> method to associate the property with a certificate. Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertpropertyrequestoriginator-get_requestoriginator">RequestOriginator</a> property to retrieve the DNS name of the originating computer.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertpropertyrequestoriginator-initializefromlocalrequestoriginator
     */
    InitializeFromLocalRequestOriginator() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * Retrieves a string that contains the DNS name of the originating computer.
     * @remarks
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertpropertyrequestoriginator-initialize">Initialize</a> method or the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertpropertyrequestoriginator-initializefromlocalrequestoriginator">InitializeFromLocalRequestOriginator</a> method to specify a value for the <b>RequestOriginator</b> property.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertpropertyrequestoriginator-get_requestoriginator
     */
    get_RequestOriginator() {
        pValue := BSTR.Owned()
        result := ComCall(16, this, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    Query(iid) {
        if (ICertPropertyRequestOriginator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 2)
        this.vtbl.InitializeFromLocalRequestOriginator := CallbackCreate(GetMethod(implObj, "InitializeFromLocalRequestOriginator"), flags, 1)
        this.vtbl.get_RequestOriginator := CallbackCreate(GetMethod(implObj, "get_RequestOriginator"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.InitializeFromLocalRequestOriginator)
        CallbackFree(this.vtbl.get_RequestOriginator)
    }
}
