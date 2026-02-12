#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ICertProperty.ahk

/**
 * Represents a certificate property that contains a SHA-1 hash of the new certificate created when an existing certificate is renewed.
 * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nn-certenroll-icertpropertyrenewal
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertPropertyRenewal extends ICertProperty{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertPropertyRenewal
     * @type {Guid}
     */
    static IID => Guid("{728ab33a-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "InitializeFromCertificateHash", "get_Renewal"]

    /**
     * Initializes the object from a SHA-1 hash of the new certificate.
     * @remarks
     * Typically this property is initialized during the enrollment process. You can retrieve the certificate used during enrollment by calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollment-get_certificate">Certificate</a> property on the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509enrollment">IX509Enrollment</a> interface.
     * 
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertproperty-setvalueoncertificate">SetValueOnCertificate</a> method to associate the property with a certificate. Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertpropertyrenewal-get_renewal">Renewal</a> property to retrieve the hash.
     * @param {Integer} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode encoding applied to the input string that contains the hash.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-icertpropertyrenewal-initialize
     */
    Initialize(Encoding, strRenewalValue) {
        if(strRenewalValue is String) {
            pin := BSTR.Alloc(strRenewalValue)
            strRenewalValue := pin.Value
        }

        result := ComCall(14, this, "int", Encoding, "ptr", strRenewalValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @param {Integer} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode encoding applied to the input string that contains the DER-encoded certificate.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-icertpropertyrenewal-initializefromcertificatehash
     */
    InitializeFromCertificateHash(MachineContext, Encoding, strCertificate) {
        if(strCertificate is String) {
            pin := BSTR.Alloc(strCertificate)
            strCertificate := pin.Value
        }

        result := ComCall(15, this, "short", MachineContext, "int", Encoding, "ptr", strCertificate, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the SHA-1 hash of the new certificate.
     * @remarks
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertpropertyrenewal-initialize">Initialize</a> method or the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertpropertyrenewal-initializefromcertificatehash">InitializeFromCertificateHash</a> method to specify a value for the <b>Renewal</b> property.
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-icertpropertyrenewal-get_renewal
     */
    get_Renewal(Encoding) {
        pValue := BSTR()
        result := ComCall(16, this, "int", Encoding, "ptr", pValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }
}
