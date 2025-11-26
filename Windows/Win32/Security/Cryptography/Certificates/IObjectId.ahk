#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Represents an object identifier (OID).
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-iobjectid
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IObjectId extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IObjectId
     * @type {Guid}
     */
    static IID => Guid("{728ab300-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeFromName", "InitializeFromValue", "InitializeFromAlgorithmName", "get_Name", "get_FriendlyName", "put_FriendlyName", "get_Value", "GetAlgorithmName"]

    /**
     * @type {Integer} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {BSTR} 
     */
    FriendlyName {
        get => this.get_FriendlyName()
        set => this.put_FriendlyName(value)
    }

    /**
     * @type {BSTR} 
     */
    Value {
        get => this.get_Value()
    }

    /**
     * Initializes the object from a CERTENROLL_OBJECTID enumeration value.
     * @param {Integer} Name A <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-certenroll_objectid">CERTENROLL_OBJECTID</a> enumeration value.
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
     * The OID information could not be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>CRYPT_E_UNKNOWN_ALGO</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The algorithm name is not recognized.
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
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-iobjectid-initializefromname
     */
    InitializeFromName(Name) {
        result := ComCall(7, this, "int", Name, "HRESULT")
        return result
    }

    /**
     * Initializes the object from a string that contains a dotted decimal object identifier (OID).
     * @param {BSTR} strValue A <b>BSTR</b> variable that contains the dotted decimal representation of the ASN.1 object identifier. For example, the value 1.2.840.10045.4.1. represents the iso(1)member-body(2)us(840)10045 signatures(4)sha1(1) object identifier.
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
     * The OID information could not be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>CRYPT_E_UNKNOWN_ALGO</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The algorithm name is not recognized.
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
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-iobjectid-initializefromvalue
     */
    InitializeFromValue(strValue) {
        strValue := strValue is String ? BSTR.Alloc(strValue).Value : strValue

        result := ComCall(8, this, "ptr", strValue, "HRESULT")
        return result
    }

    /**
     * Initializes the object from an algorithm name or an object identifier.
     * @param {Integer} GroupId An  <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-objectidgroupid">ObjectIdGroupId</a> enumeration value that specifies the OID group to search. This can be any of the following algorithm groups:<ul>
     * <li><b>XCN_CRYPT_HASH_ALG_OID_GROUP_ID</b></li>
     * <li><b>XCN_CRYPT_ENCRYPT_ALG_OID_GROUP_ID</b></li>
     * <li><b>XCN_CRYPT_PUBKEY_ALG_OID_GROUP_ID</b></li>
     * <li><b>XCN_CRYPT_SIGN_ALG_OID_GROUP_ID</b></li>
     * </ul>In addition, you can also specify groups that do not contain cryptographic algorithms:<ul>
     * <li><b>XCN_CRYPT_RDN_ATTR_OID_GROUP_ID</b></li>
     * <li><b>XCN_CRYPT_EXT_OR_ATTR_OID_GROUP_ID</b></li>
     * <li><b>XCN_CRYPT_ENHKEY_USAGE_OID_GROUP_ID</b></li>
     * <li><b>XCN_CRYPT_POLICY_OID_GROUP_ID</b></li>
     * <li><b>XCN_CRYPT_TEMPLATE_OID_GROUP_ID</b></li>
     * </ul>
     * @param {Integer} KeyFlags 
     * @param {Integer} AlgFlags 
     * @param {BSTR} strAlgorithmName A <b>BSTR</b> variable that contains the name. You can specify a name, or an OID in dotted decimal format.  The method verifies that the format is consistent with the ASN.1 X.208 standard. For more information about CNG algorithm names, see <a href="https://docs.microsoft.com/windows/desktop/SecCNG/cng-algorithm-identifiers">CNG Algorithm Identifiers</a>.
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
     * The OID information could not be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>CRYPT_E_UNKNOWN_ALGO</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The algorithm name is not recognized.
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
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-iobjectid-initializefromalgorithmname
     */
    InitializeFromAlgorithmName(GroupId, KeyFlags, AlgFlags, strAlgorithmName) {
        strAlgorithmName := strAlgorithmName is String ? BSTR.Alloc(strAlgorithmName).Value : strAlgorithmName

        result := ComCall(9, this, "int", GroupId, "int", KeyFlags, "int", AlgFlags, "ptr", strAlgorithmName, "HRESULT")
        return result
    }

    /**
     * Retrieves a CERTENROLL_OBJECTID value that contains an object identifier.
     * @remarks
     * 
     * You must call any of the following methods before you can retrieve this property value:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-iobjectid-initializefromalgorithmname">InitializeFromAlgorithmName</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-iobjectid-initializefromname">InitializeFromName</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-iobjectid-initializefromvalue">InitializeFromValue</a>
     * </li>
     * </ul>
     * 
     * 
     * You can also retrieve the following property values:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-iobjectid-get_friendlyname">FriendlyName</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-iobjectid-get_value">Value</a>
     * </li>
     * </ul>
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-iobjectid-get_name
     */
    get_Name() {
        result := ComCall(10, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies and retrieves a display name for the object identifier.
     * @remarks
     * 
     * You must call any of the following methods before you can retrieve this property value:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-iobjectid-initializefromalgorithmname">InitializeFromAlgorithmName</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-iobjectid-initializefromname">InitializeFromName</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-iobjectid-initializefromvalue">InitializeFromValue</a>
     * </li>
     * </ul>
     * 
     * 
     * You can also retrieve the following property values:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-iobjectid-get_name">Name</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-iobjectid-get_value">Value</a>
     * </li>
     * </ul>
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-iobjectid-get_friendlyname
     */
    get_FriendlyName() {
        pValue := BSTR()
        result := ComCall(11, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Specifies and retrieves a display name for the object identifier.
     * @remarks
     * 
     * You must call any of the following methods before you can retrieve this property value:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-iobjectid-initializefromalgorithmname">InitializeFromAlgorithmName</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-iobjectid-initializefromname">InitializeFromName</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-iobjectid-initializefromvalue">InitializeFromValue</a>
     * </li>
     * </ul>
     * 
     * 
     * You can also retrieve the following property values:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-iobjectid-get_name">Name</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-iobjectid-get_value">Value</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-iobjectid-put_friendlyname
     */
    put_FriendlyName(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(12, this, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * Retrieves a string that contains the dotted decimal object identifier (OID).
     * @remarks
     * 
     * The dotted decimal format is discussed in the ASN.1 X.208 specification. For example, the string 1.2.840.10045.4.1. represents the iso(1)member-body(2)us(840)10045 signatures(4)sha1(1) object identifier.
     * 
     * You must call any of the following methods before you can retrieve this property value:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-iobjectid-initializefromalgorithmname">InitializeFromAlgorithmName</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-iobjectid-initializefromname">InitializeFromName</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-iobjectid-initializefromvalue">InitializeFromValue</a>
     * </li>
     * </ul>
     * 
     * 
     * You can also retrieve the following property values:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-iobjectid-get_friendlyname">FriendlyName</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-iobjectid-get_name">Name</a>
     * </li>
     * </ul>
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-iobjectid-get_value
     */
    get_Value() {
        pValue := BSTR()
        result := ComCall(13, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Retrieves the display name associated with an algorithm object identifier (OID).
     * @param {Integer} GroupId An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-objectidgroupid">ObjectIdGroupId</a> enumeration value that specifies the OID group to search. This can be any of the following algorithm groups:
     * 
     * <ul>
     * <li><b>XCN_CRYPT_HASH_ALG_OID_GROUP_ID</b></li>
     * <li><b>XCN_CRYPT_ENCRYPT_ALG_OID_GROUP_ID</b></li>
     * <li><b>XCN_CRYPT_PUBKEY_ALG_OID_GROUP_ID</b></li>
     * <li><b>XCN_CRYPT_SIGN_ALG_OID_GROUP_ID</b></li>
     * </ul>
     * In addition, you can also specify groups that do not contain cryptographic algorithms:
     * 
     * <ul>
     * <li><b>XCN_CRYPT_RDN_ATTR_OID_GROUP_ID</b></li>
     * <li><b>XCN_CRYPT_EXT_OR_ATTR_OID_GROUP_ID</b></li>
     * <li><b>XCN_CRYPT_ENHKEY_USAGE_OID_GROUP_ID</b></li>
     * <li><b>XCN_CRYPT_POLICY_OID_GROUP_ID</b></li>
     * <li><b>XCN_CRYPT_TEMPLATE_OID_GROUP_ID</b></li>
     * </ul>
     * @param {Integer} KeyFlags 
     * @returns {BSTR} Pointer to a <b>BSTR</b> variable that contains the name.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-iobjectid-getalgorithmname
     */
    GetAlgorithmName(GroupId, KeyFlags) {
        pstrAlgorithmName := BSTR()
        result := ComCall(14, this, "int", GroupId, "int", KeyFlags, "ptr", pstrAlgorithmName, "HRESULT")
        return pstrAlgorithmName
    }
}
