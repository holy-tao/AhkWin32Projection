#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\EncodingType.ahk" { EncodingType }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ICertProperty.ahk" { ICertProperty }

/**
 * Represents a certificate property that contains a SHA-1 hash of the certificate.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/nn-certenroll-icertpropertysha1hash
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct ICertPropertySHA1Hash extends ICertProperty {
    /**
     * The interface identifier for ICertPropertySHA1Hash
     * @type {Guid}
     */
    static IID := Guid("{728ab334-217d-11da-b2a4-000e7bbb2b09}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICertPropertySHA1Hash interfaces
    */
    struct Vtbl extends ICertProperty.Vtbl {
        Initialize   : IntPtr
        get_SHA1Hash : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICertPropertySHA1Hash.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes the object from the SHA-1 hash of a certificate.
     * @remarks
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertproperty-setvalueoncertificate">SetValueOnCertificate</a> method to associate the property with a certificate. Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertpropertysha1hash-get_sha1hash">SHA1Hash</a> property to retrieve the hash value.
     * @param {EncodingType} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode encoding applied to the input string that contains the certificate hash.
     * @param {BSTR} strRenewalValue A <b>BSTR</b> variable that contains the hash.
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
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertpropertysha1hash-initialize
     */
    Initialize(Encoding, strRenewalValue) {
        strRenewalValue := strRenewalValue is String ? BSTR.Alloc(strRenewalValue).Value : strRenewalValue

        result := ComCall(14, this, EncodingType, Encoding, BSTR, strRenewalValue, "HRESULT")
        return result
    }

    /**
     * Retrieves the SHA-1 hash of a certificate.
     * @remarks
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertpropertysha1hash-initialize">Initialize</a> method to specify a value for the <b>SHA1Hash</b> property.
     * @param {EncodingType} Encoding 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertpropertysha1hash-get_sha1hash
     */
    get_SHA1Hash(Encoding) {
        pValue := BSTR.Owned()
        result := ComCall(15, this, EncodingType, Encoding, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    Query(iid) {
        if (ICertPropertySHA1Hash.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 3)
        this.vtbl.get_SHA1Hash := CallbackCreate(GetMethod(implObj, "get_SHA1Hash"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.get_SHA1Hash)
    }
}
