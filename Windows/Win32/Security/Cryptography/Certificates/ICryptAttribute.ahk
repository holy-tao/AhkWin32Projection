#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IObjectId.ahk
#Include .\IX509Attributes.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The ICryptAttribute interface represents a cryptographic attribute in a certificate request. A collection of these attributes is contained in the CertificateRequestInfo structure of a PKCS
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-icryptattribute
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICryptAttribute extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICryptAttribute
     * @type {Guid}
     */
    static IID => Guid("{728ab32c-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeFromObjectId", "InitializeFromValues", "get_ObjectId", "get_Values"]

    /**
     * @type {IObjectId} 
     */
    ObjectId {
        get => this.get_ObjectId()
    }

    /**
     * @type {IX509Attributes} 
     */
    Values {
        get => this.get_Values()
    }

    /**
     * Initializes a cryptographic attribute by using an object identifier.
     * @param {IObjectId} pObjectId Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectid">IObjectId</a> interface that contains the object identifier of the attribute.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icryptattribute-initializefromobjectid
     */
    InitializeFromObjectId(pObjectId) {
        result := ComCall(7, this, "ptr", pObjectId, "HRESULT")
        return result
    }

    /**
     * Initializes a cryptographic attribute by using an IX509Attributes object.
     * @param {IX509Attributes} pAttributes Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509attributes">IX509Attributes</a> interface that contains the attribute collection.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icryptattribute-initializefromvalues
     */
    InitializeFromValues(pAttributes) {
        result := ComCall(8, this, "ptr", pAttributes, "HRESULT")
        return result
    }

    /**
     * Retrieves the object identifier (OID) for the attribute.
     * @remarks
     * 
     *  You can initialize an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectid">IObjectId</a> object by calling <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-iobjectid-initializefromname">InitializeFromName</a>. This method initializes the object by using a value from the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-certenroll_objectid">CERTENROLL_OBJECTID</a> enumeration. The enumeration value is associated with an ASN.1 object identifier. For example, the value <b>XCN_OID_COUNTRY_NAME</b> is associated with a string containing 2.5.4.6. This is the dotted decimal representation of the joint-iso-itu-t(2)ds(5)attributeType(4)countryName(6) object identifier.
     * 
     * 
     * @returns {IObjectId} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icryptattribute-get_objectid
     */
    get_ObjectId() {
        result := ComCall(9, this, "ptr*", &ppValue := 0, "HRESULT")
        return IObjectId(ppValue)
    }

    /**
     * Retrieves an IX509Attributes object that contains a collection of attributes.
     * @returns {IX509Attributes} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icryptattribute-get_values
     */
    get_Values() {
        result := ComCall(10, this, "ptr*", &ppValue := 0, "HRESULT")
        return IX509Attributes(ppValue)
    }
}
