#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Can be used to associate an external property with a certificate.
 * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nn-certenroll-icertproperty
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertProperty extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertProperty
     * @type {Guid}
     */
    static IID => Guid("{728ab32e-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeFromCertificate", "InitializeDecode", "get_PropertyId", "put_PropertyId", "get_RawData", "RemoveFromCertificate", "SetValueOnCertificate"]

    /**
     * @type {Integer} 
     */
    PropertyId {
        get => this.get_PropertyId()
        set => this.put_PropertyId(value)
    }

    /**
     * Initializes the object by using a property value associated with an existing certificate.
     * @remarks
     * Specify the property to initialize by calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertproperty-get_propertyid">PropertyId</a> property. You can call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertproperty-get_rawdata">RawData</a> property to retrieve an encoded string that contains the property.
     * @param {VARIANT_BOOL} MachineContext A <b>VARIANT_BOOL</b> value that indicates  whether the certificate store is for the local computer or the current user. Specify <b>VARIANT_TRUE</b> for the computer and <b>VARIANT_FALSE</b> for the user.
     * @param {Integer} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode encoding applied to  the certificate contained in the <i>strCertificate</i> parameter.
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
     * <dt><b><b>CRYPT_E_NOT_FOUND</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The certificate could not be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>CRYPT_E_UNEXPECTED_MSG_TYPE</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The certificate was found but the private key could not be loaded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-icertproperty-initializefromcertificate
     */
    InitializeFromCertificate(MachineContext, Encoding, strCertificate) {
        if(strCertificate is String) {
            pin := BSTR.Alloc(strCertificate)
            strCertificate := pin.Value
        }

        result := ComCall(7, this, "short", MachineContext, "int", Encoding, "ptr", strCertificate, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes the object from a byte array that contains the property value.
     * @remarks
     * Specify the property to initialize by calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertproperty-get_propertyid">PropertyId</a> property. You can call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertproperty-get_rawdata">RawData</a> property to retrieve the encoded property value. Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertproperty-setvalueoncertificate">SetValueOnCertificate</a> method to associate the property value with a certificate.
     * 
     * If the <b>InitializeDecode</b> method fails, the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icertproperty">ICertProperty</a> object is not initialized and the input property value is not saved. However, the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertproperty-get_propertyid">PropertyId</a> property retains the specified identifier.
     * 
     * The <b>InitializeDecode</b> method is provided to enable you to initialize custom properties and properties identified in the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-certenroll_propertyid">CERTENROLL_PROPERTYID</a> enumeration for which there exist no specific interface. Each of the supported values in that enumeration contains information about the type of data, usually a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_INTEGER_BLOB</a>, that you must supply to the <b>InitializeDecode</b> method. You can use the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ibinaryconverter">IBinaryConverter</a> interface to convert a byte array to a string.
     * 
     * The following interfaces simplify creation of the most common properties:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icertpropertyarchived">ICertPropertyArchived</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icertpropertyarchivedkeyhash">ICertPropertyArchivedKeyHash</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icertpropertyautoenroll">ICertPropertyAutoEnroll</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icertpropertybackedup">ICertPropertyBackedUp</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icertpropertydescription">ICertPropertyDescription</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icertpropertyenrollment">ICertPropertyEnrollment</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icertpropertyfriendlyname">ICertPropertyFriendlyName</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icertpropertykeyprovinfo">ICertPropertyKeyProvInfo</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icertpropertyrenewal">ICertPropertyRenewal</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icertpropertyrequestoriginator">ICertPropertyRequestOriginator</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icertpropertysha1hash">ICertPropertySHA1Hash</a>
     * </li>
     * </ul>
     * @param {Integer} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode encoding applied to the input string.
     * @param {BSTR} strEncodedData A <b>BSTR</b> variable that contains the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">Distinguished Encoding Rules</a> (DER) encoded property value.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-icertproperty-initializedecode
     */
    InitializeDecode(Encoding, strEncodedData) {
        if(strEncodedData is String) {
            pin := BSTR.Alloc(strEncodedData)
            strEncodedData := pin.Value
        }

        result := ComCall(8, this, "int", Encoding, "ptr", strEncodedData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Specifies or retrieves a value of the CERTENROLL_PROPERTYID enumeration that identifies an external certificate property. (Get)
     * @remarks
     * Call the <b>PropertyId</b> property before trying to initialize the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icertproperty">ICertProperty</a> object. Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertproperty-initializedecode">InitializeDecode</a> method or the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertproperty-initializefromcertificate">InitializeFromCertificate</a> method to create a value for the certificate property. Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertproperty-get_rawdata">RawData</a> property to retrieve the property value.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-icertproperty-get_propertyid
     */
    get_PropertyId() {
        result := ComCall(9, this, "int*", &pValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Specifies or retrieves a value of the CERTENROLL_PROPERTYID enumeration that identifies an external certificate property. (Put)
     * @remarks
     * Call the <b>PropertyId</b> property before trying to initialize the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icertproperty">ICertProperty</a> object. Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertproperty-initializedecode">InitializeDecode</a> method or the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertproperty-initializefromcertificate">InitializeFromCertificate</a> method to create a value for the certificate property. Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertproperty-get_rawdata">RawData</a> property to retrieve the property value.
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-icertproperty-put_propertyid
     */
    put_PropertyId(Value) {
        result := ComCall(10, this, "int", Value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the value of the certificate property.
     * @remarks
     * Call <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertproperty-get_propertyid">PropertyId</a> to identify the property to retrieve before calling the <b>RawData</b> property.
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-icertproperty-get_rawdata
     */
    get_RawData(Encoding) {
        pValue := BSTR()
        result := ComCall(11, this, "int", Encoding, "ptr", pValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Disassociates a property from a certificate.
     * @param {VARIANT_BOOL} MachineContext A <b>VARIANT_BOOL</b> value that indicates  whether the certificate store is located on the local computer. Specify <b>VARIANT_TRUE</b> if the store is local.
     * @param {Integer} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of encoding applied to  the certificate string identified by the <i>strCertificate</i> parameter.
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
     * <dt><b><b>CRYPT_E_NOT_FOUND</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The certificate could not be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>CRYPT_E_UNEXPECTED_MSG_TYPE</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The certificate was found but the private key could not be loaded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-icertproperty-removefromcertificate
     */
    RemoveFromCertificate(MachineContext, Encoding, strCertificate) {
        if(strCertificate is String) {
            pin := BSTR.Alloc(strCertificate)
            strCertificate := pin.Value
        }

        result := ComCall(12, this, "short", MachineContext, "int", Encoding, "ptr", strCertificate, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Associates a property value with an existing certificate.
     * @remarks
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertproperty-initializedecode">InitializeDecode</a> method or the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertproperty-initializefromcertificate">InitializeFromCertificate</a> method to create a property value. Before calling either method, you must first set the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertproperty-get_propertyid">PropertyId</a> property to specify which property value to initialize.
     * @param {VARIANT_BOOL} MachineContext A <b>VARIANT_BOOL</b> value that indicates  whether the certificate store is for the local computer or the current user. Specify <b>VARIANT_TRUE</b> for the computer and <b>VARIANT_FALSE</b> for the user.
     * @param {Integer} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode encoding applied to  the certificate string identified by the <i>strCertificate</i> parameter.
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
     * <dt><b><b>CRYPT_E_NOT_FOUND</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The certificate could not be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>CRYPT_E_UNEXPECTED_MSG_TYPE</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The certificate was found but the private key could not be loaded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-icertproperty-setvalueoncertificate
     */
    SetValueOnCertificate(MachineContext, Encoding, strCertificate) {
        if(strCertificate is String) {
            pin := BSTR.Alloc(strCertificate)
            strCertificate := pin.Value
        }

        result := ComCall(13, this, "short", MachineContext, "int", Encoding, "ptr", strCertificate, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
