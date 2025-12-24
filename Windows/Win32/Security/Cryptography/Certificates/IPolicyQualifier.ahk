#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IObjectId.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Represents a qualifier that can be associated with a certificate policy.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ipolicyqualifier
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IPolicyQualifier extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPolicyQualifier
     * @type {Guid}
     */
    static IID => Guid("{728ab31c-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeEncode", "get_ObjectId", "get_Qualifier", "get_Type", "get_RawData"]

    /**
     * @type {IObjectId} 
     */
    ObjectId {
        get => this.get_ObjectId()
    }

    /**
     * @type {BSTR} 
     */
    Qualifier {
        get => this.get_Qualifier()
    }

    /**
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * Initializes the object from a string and a value that identifies the qualifier type.
     * @param {BSTR} strQualifier A <b>BSTR</b> variable that contains the qualifier.
     * @param {Integer} Type 
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_ALREADY_INITIALIZED)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object is already initialized.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ipolicyqualifier-initializeencode
     */
    InitializeEncode(strQualifier, Type) {
        strQualifier := strQualifier is String ? BSTR.Alloc(strQualifier).Value : strQualifier

        result := ComCall(7, this, "ptr", strQualifier, "int", Type, "HRESULT")
        return result
    }

    /**
     * Retrieves the object identifier (OID) for the qualifier.
     * @remarks
     * 
     * If you specified <b>PolicyQualifierTypeUrl</b> in the <i>Type</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ipolicyqualifier-initializeencode">InitializeEncode</a> method,  <b>XCN_OID_PKIX_POLICY_QUALIFIER_CPS</b> (1.3.6.1.5.5.7.2.1)  is returned. If you specified <b>PolicyQualifierTypeUserNotice</b>,  <b>XCN_OID_PKIX_POLICY_QUALIFIER_USERNOTICE</b> (1.3.6.1.5.5.7.2.2)  is returned.
     * 
     * You must call  <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ipolicyqualifier-initializeencode">InitializeEncode</a> to initialize the qualifier object before you can retrieve this property. You can also retrieve the following properties for this object:<ul>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ipolicyqualifier-get_qualifier">Qualifier</a> property retrieves the string specified for the <i>strQualifier</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ipolicyqualifier-initializeencode">InitializeEncode</a> method.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ipolicyqualifier-get_rawdata">RawData</a> property retrieves the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">Distinguished Encoding Rules</a> (DER) encoded qualifier.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ipolicyqualifier-get_type">Type</a> property retrieves a value of the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-policyqualifiertype">PolicyQualifierType</a> enumeration that specifies the qualifier type.</li>
     * </ul>
     * 
     * 
     * @returns {IObjectId} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ipolicyqualifier-get_objectid
     */
    get_ObjectId() {
        result := ComCall(8, this, "ptr*", &ppValue := 0, "HRESULT")
        return IObjectId(ppValue)
    }

    /**
     * Retrieves a string that contains the qualifier used to initialize the object.
     * @remarks
     * 
     * You must call  <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ipolicyqualifier-initializeencode">InitializeEncode</a> to initialize the qualifier object before you can retrieve this property. The value retrieved is the string entered in the <i>strQualifier</i> parameter of that method. You can also retrieve the following properties for this object:<ul>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ipolicyqualifier-get_objectid">ObjectId</a> property retrieves an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) that identifies whether the qualifier is a CPS or a user notice.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ipolicyqualifier-get_rawdata">RawData</a> property retrieves the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">Distinguished Encoding Rules</a> (DER) encoded qualifier.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ipolicyqualifier-get_type">Type</a> property retrieves a value of the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-policyqualifiertype">PolicyQualifierType</a> enumeration that specifies the qualifier type.</li>
     * </ul>
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ipolicyqualifier-get_qualifier
     */
    get_Qualifier() {
        pValue := BSTR()
        result := ComCall(9, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Retrieves the qualifier type.
     * @remarks
     * 
     * You must call  <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ipolicyqualifier-initializeencode">InitializeEncode</a> to initialize the qualifier object before you can retrieve this property. The value retrieved is one of the following  values of the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-policyqualifiertype">PolicyQualifierType</a> enumeration.<table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>PolicyQualifierTypeUrl</b></td>
     * <td>The qualifier is a URL that points to a Certification Practice Statement (CPS).</td>
     * </tr>
     * <tr>
     * <td><b>PolicyQualifierTypeUserNotice</b></td>
     * <td>The qualifier is a string to be displayed to users who rely on the certificate.</td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * You can also retrieve the following properties for this object:<ul>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ipolicyqualifier-get_objectid">ObjectId</a> property retrieves an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) that identifies whether the qualifier is a CPS or a user notice.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ipolicyqualifier-get_qualifier">Qualifier</a> property retrieves the string specified for the <i>strQualifier</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ipolicyqualifier-initializeencode">InitializeEncode</a> method.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ipolicyqualifier-get_rawdata">RawData</a> property retrieves the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">Distinguished Encoding Rules</a> (DER) encoded qualifier.</li>
     * </ul>
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ipolicyqualifier-get_type
     */
    get_Type() {
        result := ComCall(10, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Retrieves the Distinguished Encoding Rules (DER) encoded qualifier object.
     * @remarks
     * 
     * You must call  <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ipolicyqualifier-initializeencode">InitializeEncode</a> to initialize the qualifier object before you can retrieve this property. The value retrieved is the DER-encoded byte array that contains the qualifier. The byte array is represented as a string. You can use the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration to apply Unicode encoding to the string.
     * 
     * You can also retrieve the following properties for this object:<ul>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ipolicyqualifier-get_objectid">ObjectId</a> property retrieves an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) that identifies whether the qualifier is a CPS or a user notice.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ipolicyqualifier-get_qualifier">Qualifier</a> property retrieves the string specified for the <i>strQualifier</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ipolicyqualifier-initializeencode">InitializeEncode</a> method.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ipolicyqualifier-get_type">Type</a> property retrieves a value of the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-policyqualifiertype">PolicyQualifierType</a> enumeration that specifies the qualifier type.</li>
     * </ul>
     * 
     * 
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ipolicyqualifier-get_rawdata
     */
    get_RawData(Encoding) {
        pValue := BSTR()
        result := ComCall(11, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return pValue
    }
}
