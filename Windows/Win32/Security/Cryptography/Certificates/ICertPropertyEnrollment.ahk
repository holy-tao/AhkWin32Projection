#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ICertProperty.ahk

/**
 * Represents a certificate property that contains certificate and certification authority (CA) information created when the client calls the Enroll method on the IX509Enrollment interface.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-icertpropertyenrollment
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertPropertyEnrollment extends ICertProperty{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertPropertyEnrollment
     * @type {Guid}
     */
    static IID => Guid("{728ab339-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "get_RequestId", "get_CADnsName", "get_CAName", "get_FriendlyName"]

    /**
     * @type {Integer} 
     */
    RequestId {
        get => this.get_RequestId()
    }

    /**
     * @type {BSTR} 
     */
    CADnsName {
        get => this.get_CADnsName()
    }

    /**
     * @type {BSTR} 
     */
    CAName {
        get => this.get_CAName()
    }

    /**
     * @type {BSTR} 
     */
    FriendlyName {
        get => this.get_FriendlyName()
    }

    /**
     * Initializes the property from the certificate request ID, the certification authority (CA) configuration string, and an optional certificate display name.
     * @param {Integer} RequestId A <b>LONG</b> variable that contains the certificate request ID. A request ID is created by the enrollment process. You can retrieve this value by calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollment-get_requestid">RequestId</a> property on the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509enrollment">IX509Enrollment</a> interface.
     * @param {BSTR} strCADnsName A <b>BSTR</b> variable that contains the Domain Name System (DNS) name of the CA. This is the first name in the <i>CADnsName\CAName</i> CA configuration string. The configuration string is typically set during the enrollment process. The DNS name can be retrieved by calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollment-get_caconfigstring">CAConfigString</a> property and separating the  string into its constituent parts.
     * @param {BSTR} strCAName A <b>BSTR</b> variable that contains the subject common name (CN) of the CA. This is the second name in the <i>CADnsName\CAName</i> CA configuration string. The configuration string is typically set during the enrollment process. The CN name can be retrieved by calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollment-get_caconfigstring">CAConfigString</a> property and separating the  string into its constituent parts.
     * @param {BSTR} strFriendlyName A <b>BSTR</b> variable that contains an optional display name for the certificate. The default value is <b>NULL</b>. This value is typically set during the enrollment process. You can retrieve it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollment-get_certificatefriendlyname">CertificateFriendlyName</a> property.
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
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icertpropertyenrollment-initialize
     */
    Initialize(RequestId, strCADnsName, strCAName, strFriendlyName) {
        strCADnsName := strCADnsName is String ? BSTR.Alloc(strCADnsName).Value : strCADnsName
        strCAName := strCAName is String ? BSTR.Alloc(strCAName).Value : strCAName
        strFriendlyName := strFriendlyName is String ? BSTR.Alloc(strFriendlyName).Value : strFriendlyName

        result := ComCall(14, this, "int", RequestId, "ptr", strCADnsName, "ptr", strCAName, "ptr", strFriendlyName, "HRESULT")
        return result
    }

    /**
     * Retrieves a unique certificate request identifier.
     * @remarks
     * 
     * Set the  <b>RequestId</b> property by calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertpropertyenrollment-initialize">Initialize</a> method. The request ID is created during the enrollment process. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollment-get_requestid">RequestId</a> property on the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509enrollment">IX509Enrollment</a> interface.
     * 
     * The ID can be used during subsequent communication between the client and the CA. For example, if a CA marks a request as pending when initially submitted, the client can use the request ID and the configuration string when it again contacts the CA and attempts to retrieve the certificate response.
     * 
     * You can also call the following properties to retrieve the other values specified during initialization:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertpropertyenrollment-get_cadnsname">CADnsName</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertpropertyenrollment-get_caname">CAName</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertpropertyenrollment-get_friendlyname">FriendlyName</a>
     * </li>
     * </ul>
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icertpropertyenrollment-get_requestid
     */
    get_RequestId() {
        result := ComCall(15, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Retrieves the Domain Naming System (DNS) name of the certification authority (CA).
     * @remarks
     * 
     * Set the  <b>CADnsName</b> property by calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertpropertyenrollment-initialize">Initialize</a> method. The DNS name is returned to the client during the enrollment process and is part of the CA  configuration string. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollment-get_caconfigstring">CAConfigString</a> property on the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509enrollment">IX509Enrollment</a> interface.
     * 
     * You can also call the following properties to retrieve the other values specified during initialization:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertpropertyenrollment-get_caname">CAName</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertpropertyenrollment-get_friendlyname">FriendlyName</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertpropertyenrollment-get_requestid">RequestId</a>
     * </li>
     * </ul>
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icertpropertyenrollment-get_cadnsname
     */
    get_CADnsName() {
        pValue := BSTR()
        result := ComCall(16, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Retrieves the common name (CN) of the certification authority (CA).
     * @remarks
     * 
     * Set the  <b>CAName</b> property by calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertpropertyenrollment-initialize">Initialize</a> method. The common name is returned to the client during the enrollment process and is part of the certification authority  configuration string. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollment-get_caconfigstring">CAConfigString</a> property on the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509enrollment">IX509Enrollment</a> interface.
     * 
     * You can also call the following properties to retrieve the other values specified during initialization:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertpropertyenrollment-get_cadnsname">CADnsName</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertpropertyenrollment-get_friendlyname">FriendlyName</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertpropertyenrollment-get_requestid">RequestId</a>
     * </li>
     * </ul>
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icertpropertyenrollment-get_caname
     */
    get_CAName() {
        pValue := BSTR()
        result := ComCall(17, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Retrieves the display name of the certificate.
     * @remarks
     * 
     * Set the  <b>FriendlyName</b> property by calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertpropertyenrollment-initialize">Initialize</a> method. The display name is specified during the enrollment process. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollment-get_certificatefriendlyname">CertificateFriendlyName</a> property on the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509enrollment">IX509Enrollment</a> interface.
     * 
     * You can also call the following properties to retrieve the other values specified during initialization:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertpropertyenrollment-get_cadnsname">CADnsName</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertpropertyenrollment-get_caname">CAName</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertpropertyenrollment-get_requestid">RequestId</a>
     * </li>
     * </ul>
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icertpropertyenrollment-get_friendlyname
     */
    get_FriendlyName() {
        pValue := BSTR()
        result := ComCall(18, this, "ptr", pValue, "HRESULT")
        return pValue
    }
}
