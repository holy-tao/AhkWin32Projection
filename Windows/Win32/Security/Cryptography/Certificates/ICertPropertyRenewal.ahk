#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\EncodingType.ahk" { EncodingType }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\ICertProperty.ahk" { ICertProperty }

/**
 * Represents a certificate property that contains a SHA-1 hash of the new certificate created when an existing certificate is renewed.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/nn-certenroll-icertpropertyrenewal
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct ICertPropertyRenewal extends ICertProperty {
    /**
     * The interface identifier for ICertPropertyRenewal
     * @type {Guid}
     */
    static IID := Guid("{728ab33a-217d-11da-b2a4-000e7bbb2b09}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICertPropertyRenewal interfaces
    */
    struct Vtbl extends ICertProperty.Vtbl {
        Initialize                    : IntPtr
        InitializeFromCertificateHash : IntPtr
        get_Renewal                   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICertPropertyRenewal.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes the object from a SHA-1 hash of the new certificate.
     * @remarks
     * Typically this property is initialized during the enrollment process. You can retrieve the certificate used during enrollment by calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollment-get_certificate">Certificate</a> property on the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509enrollment">IX509Enrollment</a> interface.
     * 
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertproperty-setvalueoncertificate">SetValueOnCertificate</a> method to associate the property with a certificate. Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertpropertyrenewal-get_renewal">Renewal</a> property to retrieve the hash.
     * @param {EncodingType} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode encoding applied to the input string that contains the hash.
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
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertpropertyrenewal-initialize
     */
    Initialize(Encoding, strRenewalValue) {
        strRenewalValue := strRenewalValue is String ? BSTR.Alloc(strRenewalValue).Value : strRenewalValue

        result := ComCall(14, this, EncodingType, Encoding, BSTR, strRenewalValue, "HRESULT")
        return result
    }

    /**
     * Initializes the object from the new certificate.
     * @remarks
     * This method creates a SHA-1 hash by using the specified certificate. The certificate must be encoded by using <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">Distinguished Encoding Rules</a> (DER) as defined by the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Abstract Syntax Notation One</a> (ASN.1) standard. You must also specify the type of Unicode encoding applied to the string that contains the DER-encoded certificate.
     * 
     * Typically the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icertpropertyrenewal">ICertPropertyRenewal</a> object is initialized during the enrollment process. You can retrieve the certificate used during enrollment by calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollment-get_certificate">Certificate</a> property on the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509enrollment">IX509Enrollment</a> interface.
     * 
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertproperty-setvalueoncertificate">SetValueOnCertificate</a> method to associate the property with a certificate. Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertpropertyrenewal-get_renewal">Renewal</a> property to retrieve the hash.
     * @param {VARIANT_BOOL} MachineContext A <b>VARIANT_BOOL</b> value that indicates  whether the certificate store is for the local computer or the current user. Specify <b>VARIANT_TRUE</b> for the computer and <b>VARIANT_FALSE</b> for the user.
     * @param {EncodingType} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode encoding applied to the input string that contains the DER-encoded certificate.
     * @param {BSTR} strCertificate A <b>BSTR</b> variable that contains the DER-encoded certificate.
     * 
     * Beginning with Windows 7 and Windows Server 2008 R2, you can specify a certificate thumb print or serial number rather than an encoded certificate. Doing so causes the function to search the appropriate local stores for the matching certificate. Keep in mind the following points:
     * 
     * <ul>
     * <li>The <b>BSTR</b> must be an even number of hexadecimal digits.</li>
     * <li>Whitespace between hexadecimal pairs is ignored.</li>
     * <li>The <i>Encoding</i> parameter must be set to <b>XCN_CRYPT_STRING_HEXRAW</b>.</li>
     * <li>The <i>MachineContext</i> parameter determines whether the user or computer stores or both are searched.</li>
     * <li>If a private key is needed, only the personal and request stores are searched.</li>
     * <li>If a private key is not needed, the root and intermediate CA stores are also searched.</li>
     * </ul>
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
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertpropertyrenewal-initializefromcertificatehash
     */
    InitializeFromCertificateHash(MachineContext, Encoding, strCertificate) {
        strCertificate := strCertificate is String ? BSTR.Alloc(strCertificate).Value : strCertificate

        result := ComCall(15, this, VARIANT_BOOL, MachineContext, EncodingType, Encoding, BSTR, strCertificate, "HRESULT")
        return result
    }

    /**
     * Retrieves the SHA-1 hash of the new certificate.
     * @remarks
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertpropertyrenewal-initialize">Initialize</a> method or the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertpropertyrenewal-initializefromcertificatehash">InitializeFromCertificateHash</a> method to specify a value for the <b>Renewal</b> property.
     * @param {EncodingType} Encoding 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertpropertyrenewal-get_renewal
     */
    get_Renewal(Encoding) {
        pValue := BSTR.Owned()
        result := ComCall(16, this, EncodingType, Encoding, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    Query(iid) {
        if (ICertPropertyRenewal.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 3)
        this.vtbl.InitializeFromCertificateHash := CallbackCreate(GetMethod(implObj, "InitializeFromCertificateHash"), flags, 4)
        this.vtbl.get_Renewal := CallbackCreate(GetMethod(implObj, "get_Renewal"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.InitializeFromCertificateHash)
        CallbackFree(this.vtbl.get_Renewal)
    }
}
