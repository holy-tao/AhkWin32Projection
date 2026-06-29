#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\ICertProperty.ahk" { ICertProperty }

/**
 * Represents a certificate property that identifies whether a certificate has been archived.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/nn-certenroll-icertpropertyarchived
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct ICertPropertyArchived extends ICertProperty {
    /**
     * The interface identifier for ICertPropertyArchived
     * @type {Guid}
     */
    static IID := Guid("{728ab337-217d-11da-b2a4-000e7bbb2b09}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICertPropertyArchived interfaces
    */
    struct Vtbl extends ICertProperty.Vtbl {
        Initialize   : IntPtr
        get_Archived : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICertPropertyArchived.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Archived {
        get => this.get_Archived()
    }

    /**
     * Initializes the object from a Boolean value that specifies whether the certificate has been archived.
     * @remarks
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertproperty-setvalueoncertificate">SetValueOnCertificate</a> method to associate the property with a certificate. Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertpropertyarchived-get_archived">Archived</a> property to retrieve the Boolean value.
     * @param {VARIANT_BOOL} ArchivedValue A <b>VARIANT_BOOL</b> variable that identifies whether the certificate has been archived.
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
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertpropertyarchived-initialize
     */
    Initialize(ArchivedValue) {
        result := ComCall(14, this, VARIANT_BOOL, ArchivedValue, "HRESULT")
        return result
    }

    /**
     * Retrieves a Boolean value that specifies whether the certificate has been archived.
     * @remarks
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertpropertyarchived-initialize">Initialize</a> method to specify the Boolean value.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertpropertyarchived-get_archived
     */
    get_Archived() {
        result := ComCall(15, this, VARIANT_BOOL.Ptr, &pValue := 0, "HRESULT")
        return pValue
    }

    Query(iid) {
        if (ICertPropertyArchived.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 2)
        this.vtbl.get_Archived := CallbackCreate(GetMethod(implObj, "get_Archived"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.get_Archived)
    }
}
