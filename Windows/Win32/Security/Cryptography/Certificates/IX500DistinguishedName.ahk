#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Represents an X.500 distinguished name (DN).
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix500distinguishedname
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX500DistinguishedName extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX500DistinguishedName
     * @type {Guid}
     */
    static IID => Guid("{728ab303-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Decode", "Encode", "get_Name", "get_EncodedName"]

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Initializes the object from a Unicode-encoded distinguished name.
     * @param {BSTR} strEncodedName A <b>BSTR</b> variable that contains the encoded name.
     * @param {Integer} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode encoding applied to  the input string. The default value is <b>XCN_CRYPT_STRING_BASE64</b>.
     * @param {Integer} NameFlags An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-x500nameflags">X500NameFlags</a> enumeration value that specifies the format of the decoded string.
     * 
     * <div class="alert"><b>Note</b>  The following flags are set automatically:<ul>
     * <li>The default value specified in Certenroll.h is <b>XCN_CERT_NAME_STR_NONE</b>.</li>
     * <li>If you do not specify XCN_CERT_NAME_STR_FORWARD_FLAG, then XCN_CERT_NAME_STR_REVERSE_FLAG is automatically applied.</li>
     * <li>If you do not specify XCN_CERT_NAME_STR_DISABLE_UTF8_DIR_STR_FLAG, then XCN_CERT_NAME_STR_FORCE_UTF8_DIR_STR_FLAG is automatically applied.</li>
     * <li>XCN_CERT_NAME_STR_ENABLE_PUNYCODE_FLAG is automatically set regardless of any other flag you specify.</li>
     * </ul>
     * </div>
     * <div> </div>
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Memory could not be allocated for the decoded value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>strEncodedName</i> parameter cannot be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_FILE_NOT_FOUND)</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name could not be decoded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix500distinguishedname-decode
     */
    Decode(strEncodedName, Encoding, NameFlags) {
        strEncodedName := strEncodedName is String ? BSTR.Alloc(strEncodedName).Value : strEncodedName

        result := ComCall(7, this, "ptr", strEncodedName, "int", Encoding, "int", NameFlags, "HRESULT")
        return result
    }

    /**
     * Initializes the object from a string that contains a distinguished name.
     * @param {BSTR} strName A <b>BSTR</b> variable that contains the string to encode.
     * @param {Integer} NameFlags An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-x500nameflags">X500NameFlags</a> enumeration value that specifies the format of the encoded value.
     * 
     * <div class="alert"><b>Note</b>  The following flags are set automatically:<ul>
     * <li>The default value specified in Certenroll.h is <b>XCN_CERT_NAME_STR_NONE</b>.</li>
     * <li>If you do not specify XCN_CERT_NAME_STR_FORWARD_FLAG, then XCN_CERT_NAME_STR_REVERSE_FLAG is automatically applied.</li>
     * <li>If you do not specify XCN_CERT_NAME_STR_DISABLE_UTF8_DIR_STR_FLAG, then XCN_CERT_NAME_STR_FORCE_UTF8_DIR_STR_FLAG is automatically applied.</li>
     * <li>XCN_CERT_NAME_STR_ENABLE_PUNYCODE_FLAG is automatically set regardless of any other flag you specify.</li>
     * </ul>
     * </div>
     * <div> </div>
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Memory could not be allocated for the encoded value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>strName</i> parameter cannot be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_FILENAME_EXCED_RANGE)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The length, in characters of the <i>strName</i> parameter cannot exceed 64 * 1024.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix500distinguishedname-encode
     */
    Encode(strName, NameFlags) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(8, this, "ptr", strName, "int", NameFlags, "HRESULT")
        return result
    }

    /**
     * Retrieves a distinguished name.
     * @remarks
     * 
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix500distinguishedname-encode">Encode</a> method to encode a distinguished name. Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix500distinguishedname-decode">Decode</a> method to decode a distinguished name. Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix500distinguishedname-get_encodedname">EncodedName</a> property to retrieve the name as an encoded string.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix500distinguishedname-get_name
     */
    get_Name() {
        pValue := BSTR()
        result := ComCall(9, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Retrieves a Unicode-encoded distinguished name.
     * @remarks
     * 
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix500distinguishedname-encode">Encode</a> method to encode a distinguished name. Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix500distinguishedname-decode">Decode</a> method to decode a distinguished name.
     * 
     * 
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix500distinguishedname-get_encodedname
     */
    get_EncodedName(Encoding) {
        pValue := BSTR()
        result := ComCall(10, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return pValue
    }
}
