#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\EncodingType.ahk" { EncodingType }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\X500NameFlags.ahk" { X500NameFlags }

/**
 * Represents an X.500 distinguished name (DN).
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/nn-certenroll-ix500distinguishedname
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct IX500DistinguishedName extends IDispatch {
    /**
     * The interface identifier for IX500DistinguishedName
     * @type {Guid}
     */
    static IID := Guid("{728ab303-217d-11da-b2a4-000e7bbb2b09}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IX500DistinguishedName interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Decode          : IntPtr
        Encode          : IntPtr
        get_Name        : IntPtr
        get_EncodedName : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IX500DistinguishedName.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Initializes the object from a Unicode-encoded distinguished name.
     * @remarks
     * This method internally calls the CryptoAPI <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certnametostra">CertNameToStr</a> function. Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix500distinguishedname-get_name">Name</a> property to retrieve the name as a null-terminated character string. Call the  <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix500distinguishedname-get_encodedname">EncodedName</a> property to retrieve a string containing an encoded name.
     * @param {BSTR} strEncodedName A <b>BSTR</b> variable that contains the encoded name.
     * @param {EncodingType} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode encoding applied to  the input string. The default value is <b>XCN_CRYPT_STRING_BASE64</b>.
     * @param {X500NameFlags} NameFlags An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-x500nameflags">X500NameFlags</a> enumeration value that specifies the format of the decoded string.
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
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix500distinguishedname-decode
     */
    Decode(strEncodedName, Encoding, NameFlags) {
        strEncodedName := strEncodedName is String ? BSTR.Alloc(strEncodedName).Value : strEncodedName

        result := ComCall(7, this, BSTR, strEncodedName, EncodingType, Encoding, X500NameFlags, NameFlags, "HRESULT")
        return result
    }

    /**
     * Initializes the object from a string that contains a distinguished name.
     * @remarks
     * This method internally calls the CryptoAPI <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certstrtonamea">CertStrToName</a> function. Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix500distinguishedname-get_name">Name</a> property to retrieve the name as a null-terminated character string. Call the  <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix500distinguishedname-get_encodedname">EncodedName</a> property to retrieve a string containing an encoded name.
     * @param {BSTR} strName A <b>BSTR</b> variable that contains the string to encode.
     * @param {X500NameFlags} NameFlags An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-x500nameflags">X500NameFlags</a> enumeration value that specifies the format of the encoded value.
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
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix500distinguishedname-encode
     */
    Encode(strName, NameFlags) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(8, this, BSTR, strName, X500NameFlags, NameFlags, "HRESULT")
        return result
    }

    /**
     * Retrieves a distinguished name.
     * @remarks
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix500distinguishedname-encode">Encode</a> method to encode a distinguished name. Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix500distinguishedname-decode">Decode</a> method to decode a distinguished name. Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix500distinguishedname-get_encodedname">EncodedName</a> property to retrieve the name as an encoded string.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix500distinguishedname-get_name
     */
    get_Name() {
        pValue := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    /**
     * Retrieves a Unicode-encoded distinguished name.
     * @remarks
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix500distinguishedname-encode">Encode</a> method to encode a distinguished name. Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix500distinguishedname-decode">Decode</a> method to decode a distinguished name.
     * @param {EncodingType} Encoding 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix500distinguishedname-get_encodedname
     */
    get_EncodedName(Encoding) {
        pValue := BSTR.Owned()
        result := ComCall(10, this, EncodingType, Encoding, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    Query(iid) {
        if (IX500DistinguishedName.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Decode := CallbackCreate(GetMethod(implObj, "Decode"), flags, 4)
        this.vtbl.Encode := CallbackCreate(GetMethod(implObj, "Encode"), flags, 3)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.get_EncodedName := CallbackCreate(GetMethod(implObj, "get_EncodedName"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Decode)
        CallbackFree(this.vtbl.Encode)
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.get_EncodedName)
    }
}
