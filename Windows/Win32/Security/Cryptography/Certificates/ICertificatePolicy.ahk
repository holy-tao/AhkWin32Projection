#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IObjectId.ahk
#Include .\IPolicyQualifiers.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Can be used to specify a certificate policy that identifies a purpose for which the certificate can be used.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-icertificatepolicy
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertificatePolicy extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertificatePolicy
     * @type {Guid}
     */
    static IID => Guid("{728ab31e-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "get_ObjectId", "get_PolicyQualifiers"]

    /**
     * @type {IObjectId} 
     */
    ObjectId {
        get => this.get_ObjectId()
    }

    /**
     * @type {IPolicyQualifiers} 
     */
    PolicyQualifiers {
        get => this.get_PolicyQualifiers()
    }

    /**
     * Initializes the object from an object identifier (OID).
     * @param {IObjectId} pValue Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectid">IObjectId</a> interface that represents the OID.
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
     * <dt><b><b>CERTSRV_E_PROPERTY_EMPTY</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pointer to the <a href="/windows/desktop/api/certenroll/nn-certenroll-iobjectid">IObjectId</a> interface is <b>NULL</b>.
     * 
     * </td>
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
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icertificatepolicy-initialize
     */
    Initialize(pValue) {
        result := ComCall(7, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * Retrieves an object identifier (OID) for the policy object.
     * @remarks
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectid">IObjectId</a> object stores information about the OID internally in a CryptoAPI <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_oid_info">CRYPT_OID_INFO</a> structure. You cannot use this structure directly from the  Certificate Enrollment API, but you can use the  <b>IObjectId</b> interface to retrieve the display name or dotted decimal name of the OID, or the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-certenroll_objectid">CERTENROLL_OBJECTID</a> value.
     * 
     * 
     * @returns {IObjectId} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icertificatepolicy-get_objectid
     */
    get_ObjectId() {
        result := ComCall(8, this, "ptr*", &ppValue := 0, "HRESULT")
        return IObjectId(ppValue)
    }

    /**
     * Retrieves a collection of optional policy qualifiers that can be applied to a certificate policy.
     * @remarks
     * 
     * An empty <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ipolicyqualifiers">IPolicyQualifiers</a> object is created when you call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertificatepolicy-initialize">Initialize</a> method. You can call the <b>PolicyQualifiers</b> property to retrieve this object and specify qualifying information for the policy. Policy qualifiers only apply if you are creating a <b>CertificatePolicies</b> extension. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509extensioncertificatepolicies">IX509ExtensionCertificatePolicies</a>.
     * 
     * 
     * @returns {IPolicyQualifiers} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icertificatepolicy-get_policyqualifiers
     */
    get_PolicyQualifiers() {
        result := ComCall(9, this, "ptr*", &ppValue := 0, "HRESULT")
        return IPolicyQualifiers(ppValue)
    }
}
