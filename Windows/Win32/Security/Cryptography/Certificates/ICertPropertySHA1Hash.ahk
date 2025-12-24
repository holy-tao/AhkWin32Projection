#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ICertProperty.ahk

/**
 * Represents a certificate property that contains a SHA-1 hash of the certificate.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-icertpropertysha1hash
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertPropertySHA1Hash extends ICertProperty{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertPropertySHA1Hash
     * @type {Guid}
     */
    static IID => Guid("{728ab334-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "get_SHA1Hash"]

    /**
     * Initializes the object from the SHA-1 hash of a certificate.
     * @param {Integer} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode encoding applied to the input string that contains the certificate hash.
     * @param {BSTR} strRenewalValue A <b>BSTR</b> variable that contains the hash.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icertpropertysha1hash-initialize
     */
    Initialize(Encoding, strRenewalValue) {
        strRenewalValue := strRenewalValue is String ? BSTR.Alloc(strRenewalValue).Value : strRenewalValue

        result := ComCall(14, this, "int", Encoding, "ptr", strRenewalValue, "HRESULT")
        return result
    }

    /**
     * Retrieves the SHA-1 hash of a certificate.
     * @remarks
     * 
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertpropertysha1hash-initialize">Initialize</a> method to specify a value for the <b>SHA1Hash</b> property.
     * 
     * 
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icertpropertysha1hash-get_sha1hash
     */
    get_SHA1Hash(Encoding) {
        pValue := BSTR()
        result := ComCall(15, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return pValue
    }
}
