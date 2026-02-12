#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IObjectId.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Is used by an IX509ExtensionAlternativeNames object to represent an instance of an AlternativeNames extension.
 * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nn-certenroll-ialternativename
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IAlternativeName extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAlternativeName
     * @type {Guid}
     */
    static IID => Guid("{728ab313-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeFromString", "InitializeFromRawData", "InitializeFromOtherName", "get_Type", "get_StrValue", "get_ObjectId", "get_RawData"]

    /**
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * @type {BSTR} 
     */
    StrValue {
        get => this.get_StrValue()
    }

    /**
     * @type {IObjectId} 
     */
    ObjectId {
        get => this.get_ObjectId()
    }

    /**
     * Initializes the object from a string that contains an email address, a Domain Name System (DNS) name, a URL, a registered object identifier (OID), or a user principal name (UPN).
     * @remarks
     * If you use this method to specify a UPN, the UPN is associated with the XCN_OID_NT_PRINCIPAL_NAME (1.3.6.1.4.1.311.20.2.3) OID and is <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">Distinguished Encoding Rules</a> (DER) encoded. You can call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ialternativename-get_rawdata">RawData</a> property to retrieve the encoded byte array. You can retrieve the OID by calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ialternativename-get_objectid">ObjectId</a> property.
     * 
     * If you use this method to specify any of the following name types, the method returns <b>E_INVALIDARG</b>.<table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>XCN_CERT_ALT_NAME_UNKNOWN</td>
     * <td>The name type is not identified.</td>
     * </tr>
     * <tr>
     * <td>XCN_CERT_ALT_NAME_OTHER_NAME</td>
     * <td>The name consists of an OID and a byte array.</td>
     * </tr>
     * <tr>
     * <td>XCN_CERT_ALT_NAME_DIRECTORY_NAME</td>
     * <td>The name is an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/x-gly">X.500</a> directory name.</td>
     * </tr>
     * <tr>
     * <td>XCN_CERT_ALT_NAME_IP_ADDRESS</td>
     * <td>The name is an IP address.</td>
     * </tr>
     * <tr>
     * <td>XCN_CERT_ALT_NAME_GUID</td>
     * <td>The name is a GUID.</td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * You can use the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ialternativename-initializefromothername">InitializeFromOtherName</a> method to specify an OID and a corresponding name string, and you can use the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ialternativename-initializefromrawdata">InitializeFromRawData</a> method to specify a GUID, IP address, or X.500 directory name.
     * @param {Integer} Type 
     * @param {BSTR} strValue A <b>BSTR</b> variable that contains the name.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ialternativename-initializefromstring
     */
    InitializeFromString(Type, strValue) {
        if(strValue is String) {
            pin := BSTR.Alloc(strValue)
            strValue := pin.Value
        }

        result := ComCall(7, this, "int", Type, "ptr", strValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes the object from a Digital Signature Algorithm (DSA) GUID, an X.500 directory name, or an Internet Protocol (IP) address contained in a Distinguished Encoding Rules (DER) encoded byte array.
     * @remarks
     * The raw data is a byte array that has been encoded by using <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">Distinguished Encoding Rules</a> (DER). You must specify the  byte array as a Unicode encoded string.
     * 
     * If you use this method to specify a DSA GUID (XCN_CERT_ALT_NAME_GUID), the GUID is associated with the XCN_OID_NTDS_REPLICATION (1.3.6.1.4.1.311.25.1) <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) and encoded as an octet string (byte array). You can retrieve the OID by calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ialternativename-get_objectid">ObjectId</a> property. You can call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ialternativename-get_rawdata">RawData</a> property to retrieve the encoded byte array.
     * 
     * If you use this method to specify any of the following name types, the method returns <b>E_INVALIDARG</b>.<table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>XCN_CERT_ALT_NAME_UNKNOWN</td>
     * <td>The name type is not identified.</td>
     * </tr>
     * <tr>
     * <td>XCN_CERT_ALT_NAME_RFC822_NAME</td>
     * <td>The name is an email address.</td>
     * </tr>
     * <tr>
     * <td>XCN_CERT_ALT_NAME_DNS_NAME</td>
     * <td>The name is a DNS name.</td>
     * </tr>
     * <tr>
     * <td>XCN_CERT_ALT_NAME_URL</td>
     * <td>The name is a URL.</td>
     * </tr>
     * <tr>
     * <td>XCN_CERT_ALT_NAME_REGISTERED_ID</td>
     * <td>The name is a registered OID.</td>
     * </tr>
     * <tr>
     * <td>XCN_CERT_ALT_NAME_USER_PRINCIPLE_NAME</td>
     * <td>The name is a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">user principal name</a> (UPN).</td>
     * </tr>
     * <tr>
     * <td>XCN_CERT_ALT_NAME_OTHER_NAME</td>
     * <td>The name consists of an OID and a byte array.</td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * You can use the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ialternativename-initializefromothername">InitializeFromOtherName</a> method to specify an OID and a corresponding name string, and you can use the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ialternativename-initializefromstring">InitializeFromString</a> method to specify an email address, a DNS name, a URL, a registered OID, or a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">user principal name</a> (UPN).
     * @param {Integer} Type 
     * @param {Integer} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that identifies the type of Unicode encoding applied to the <i>strRawData</i> parameter.
     * @param {BSTR} strRawData A <b>BSTR</b> variable that contains the DER-encoded data.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ialternativename-initializefromrawdata
     */
    InitializeFromRawData(Type, Encoding, strRawData) {
        if(strRawData is String) {
            pin := BSTR.Alloc(strRawData)
            strRawData := pin.Value
        }

        result := ComCall(8, this, "int", Type, "int", Encoding, "ptr", strRawData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes the object from an object identifier (OID) and the associated raw data (byte array).
     * @remarks
     * You can use this function to initialize an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ialternativename">IAlternativeName</a> object from an OID and an associated string value. The string is Unicode encoded. If you specify true for the <i>ToBeWrapped</i> parameter, the string is encoded by using <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">Distinguished Encoding Rules</a> (DER). You can retrieve the OID by calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ialternativename-get_objectid">ObjectId</a> property. You can retrieve the encoded string or, if <i>ToBeWrapped</i> is true, the DER-encoded byte array by calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ialternativename-get_rawdata">RawData</a> property to retrieve the encoded byte array.
     * @param {IObjectId} pObjectId Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectid">IObjectId</a> interface that represents an OID.
     * @param {Integer} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that identifies the type of Unicode encoding applied to the <i>strRawData</i> parameter.
     * @param {BSTR} strRawData A <b>BSTR</b> variable that contains the name associated with the OID.
     * @param {VARIANT_BOOL} ToBeWrapped A <b>VARIANT_BOOL</b> variable that identifies whether the input string contained in the <i>strRawData</i> parameter is encoded and saved as an octet string (byte array).
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ialternativename-initializefromothername
     */
    InitializeFromOtherName(pObjectId, Encoding, strRawData, ToBeWrapped) {
        if(strRawData is String) {
            pin := BSTR.Alloc(strRawData)
            strRawData := pin.Value
        }

        result := ComCall(9, this, "ptr", pObjectId, "int", Encoding, "ptr", strRawData, "short", ToBeWrapped, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the alternative name type.
     * @remarks
     * The following values from the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-alternativenametype">AlternativeNameType</a> enumeration can be returned. The  <b>XCN_CERT_ALT_NAME_UNKNOWN</b> value is never returned.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>XCN_CERT_ALT_NAME_OTHER_NAME</b></td>
     * <td>The name consists of an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) and a byte array.</td>
     * </tr>
     * <tr>
     * <td><b>XCN_CERT_ALT_NAME_RFC822_NAME</b></td>
     * <td>The name is an email address.</td>
     * </tr>
     * <tr>
     * <td><b>XCN_CERT_ALT_NAME_DNS_NAME</b></td>
     * <td>The name is a DNS name.</td>
     * </tr>
     * <tr>
     * <td><b>XCN_CERT_ALT_NAME_DIRECTORY_NAME</b></td>
     * <td>The name is an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/x-gly">X.500</a> directory name.</td>
     * </tr>
     * <tr>
     * <td><b>XCN_CERT_ALT_NAME_URL</b></td>
     * <td>The name is a URL.</td>
     * </tr>
     * <tr>
     * <td><b>XCN_CERT_ALT_NAME_IP_ADDRESS</b></td>
     * <td>The name is an IP address.</td>
     * </tr>
     * <tr>
     * <td><b>XCN_CERT_ALT_NAME_REGISTERED_ID</b></td>
     * <td>The name is a registered OID.</td>
     * </tr>
     * <tr>
     * <td><b>XCN_CERT_ALT_NAME_GUID</b></td>
     * <td>The name is a GUID.</td>
     * </tr>
     * <tr>
     * <td><b>XCN_CERT_ALT_NAME_USER_PRINCIPLE_NAME</b></td>
     * <td>The name is a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">user principal name</a> (UPN).</td>
     * </tr>
     * </table>
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ialternativename-get_type
     */
    get_Type() {
        result := ComCall(10, this, "int*", &pValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Retrieves a string that contains an email address, a Domain Name System (DNS) name, a URL, a registered object identifier (OID), or a user principal name (UPN).
     * @remarks
     * You can call this property to retrieve a string if you initialized the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ialternativename">IAlternativeName</a> object by calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ialternativename-initializefromstring">InitializeFromString</a> method and specifying one of the following <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-alternativenametype">AlternativeNameType</a> values.<table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>XCN_CERT_ALT_NAME_RFC822_NAME</td>
     * <td>The name is an email address.</td>
     * </tr>
     * <tr>
     * <td>XCN_CERT_ALT_NAME_DNS_NAME</td>
     * <td>The name is a DNS name.</td>
     * </tr>
     * <tr>
     * <td>XCN_CERT_ALT_NAME_URL</td>
     * <td>The name is a URL.</td>
     * </tr>
     * <tr>
     * <td>XCN_CERT_ALT_NAME_REGISTERED_ID</td>
     * <td>The name is a registered OID.</td>
     * </tr>
     * <tr>
     * <td>XCN_CERT_ALT_NAME_USER_PRINCIPLE_NAME</td>
     * <td>The name is a UPN.</td>
     * </tr>
     * </table>
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ialternativename-get_strvalue
     */
    get_StrValue() {
        pValue := BSTR()
        result := ComCall(11, this, "ptr", pValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Retrieves the object identifier (OID), if any, associated with the name.
     * @remarks
     * You can retrieve a value for this property if you initialized the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ialternativename">IAlternativeName</a> object in any of the following ways:
     * 
     * <ul>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ialternativename-initializefromothername">InitializeFromOtherName</a> and supply an OID.</li>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ialternativename-initializefromrawdata">InitializeFromRawData</a> and specify the XCN_CERT_ALT_NAME_GUID type.</li>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ialternativename-initializefromstring">InitializeFromString</a> and specify the XCN_CERT_ALT_NAME_USER_PRINCIPLE_NAME type.</li>
     * </ul>
     * @returns {IObjectId} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ialternativename-get_objectid
     */
    get_ObjectId() {
        result := ComCall(12, this, "ptr*", &ppValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IObjectId(ppValue)
    }

    /**
     * Retrieves the Distinguished Encoding Rules (DER) encoded byte array that contains the name.
     * @remarks
     * You can retrieve a value for this property if you initialized the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ialternativename">IAlternativeName</a> object in any of the following ways:
     * 
     * <ul>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ialternativename-initializefromothername">InitializeFromOtherName</a> and supply an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID).</li>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ialternativename-initializefromrawdata">InitializeFromRawData</a> and specify the XCN_CERT_ALT_NAME_GUID,  XCN_CERT_ALT_NAME_DIRECTORY_NAME, or XCN_CERT_ALT_NAME_IP_ADDRESS types.</li>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ialternativename-initializefromstring">InitializeFromString</a> and specify the XCN_CERT_ALT_NAME_USER_PRINCIPLE_NAME type.</li>
     * </ul>
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ialternativename-get_rawdata
     */
    get_RawData(Encoding) {
        pValue := BSTR()
        result := ComCall(13, this, "int", Encoding, "ptr", pValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }
}
