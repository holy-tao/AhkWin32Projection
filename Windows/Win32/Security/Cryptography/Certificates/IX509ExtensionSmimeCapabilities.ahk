#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\EncodingType.ahk" { EncodingType }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISmimeCapabilities.ahk" { ISmimeCapabilities }
#Import ".\IX509Extension.ahk" { IX509Extension }

/**
 * Can be used to report the decryption capabilities of an email recipient to an email sender so that the sender can choose the most secure algorithm supported by both parties.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/nn-certenroll-ix509extensionsmimecapabilities
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct IX509ExtensionSmimeCapabilities extends IX509Extension {
    /**
     * The interface identifier for IX509ExtensionSmimeCapabilities
     * @type {Guid}
     */
    static IID := Guid("{728ab31b-217d-11da-b2a4-000e7bbb2b09}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IX509ExtensionSmimeCapabilities interfaces
    */
    struct Vtbl extends IX509Extension.Vtbl {
        InitializeEncode      : IntPtr
        InitializeDecode      : IntPtr
        get_SmimeCapabilities : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IX509ExtensionSmimeCapabilities.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ISmimeCapabilities} 
     */
    SmimeCapabilities {
        get => this.get_SmimeCapabilities()
    }

    /**
     * Initializes the extension from an ISmimeCapabilities collection.
     * @remarks
     * You must call either <b>InitializeEncode</b> or <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extensionsmimecapabilities-initializedecode">InitializeDecode</a> before you can use an  <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509extensionsmimecapabilities">IX509ExtensionSmimeCapabilities</a> object. The two methods complement each other. The <b>InitializeEncode</b> method enables you to construct a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">Distinguished Encoding Rules</a> (DER) encoded ASN.1 extension object from raw data, and the <b>InitializeDecode</b> method enables you to initialize the raw data from an encoded object.
     * 
     * You can retrieve the following properties for this extension:<ul>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extension-get_critical">Critical</a> property identifies whether the extension is critical. You can also specify this property.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extension-get_objectid">ObjectId</a> property retrieves the extension OID.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extensionsmimecapabilities-get_smimecapabilities">SmimeCapabilities</a> property retrieves the collection of capabilities (the raw extension data).</li>
     * </ul>
     * @param {ISmimeCapabilities} pValue Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ismimecapabilities">ISmimeCapabilities</a> interface.
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
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509extensionsmimecapabilities-initializeencode
     */
    InitializeEncode(pValue) {
        result := ComCall(12, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * Initializes the extension from a Distinguished Encoding Rules (DER) encoded byte array that contains the extension value. (IX509ExtensionSmimeCapabilities.InitializeDecode)
     * @remarks
     * You can use this method if you have a DER-encoded ASN.1 object that contains a <b>SmimeCapabilities</b> extension. You must supply the DER-encoded object in a Unicode encoded string. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ibinaryconverter">IBinaryConverter</a> interface.
     * 
     * You must call either <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extensionsmimecapabilities-initializeencode">InitializeEncode</a> or <b>InitializeDecode</b> before you can use an  <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509extensionsmimecapabilities">IX509ExtensionSmimeCapabilities</a> object. The two methods complement each other. The <b>InitializeEncode</b> method enables you to construct a DER-encoded ASN.1 extension object from raw data, and the <b>InitializeDecode</b> method enables you to initialize the raw data from an encoded object.
     * 
     * You can retrieve the following properties for this extension:<ul>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extension-get_critical">Critical</a> property identifies whether the extension is critical. You can also specify this property.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extension-get_objectid">ObjectId</a> property retrieves the extension OID.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extensionsmimecapabilities-get_smimecapabilities">SmimeCapabilities</a> property retrieves the collection of capabilities (the raw extension data).</li>
     * </ul>
     * @param {EncodingType} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode encoding applied to  the <i>strEncodedData</i> parameter.
     * @param {BSTR} strEncodedData A <b>BSTR</b> variable that contains the DER-encoded extension.
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
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509extensionsmimecapabilities-initializedecode
     */
    InitializeDecode(Encoding, strEncodedData) {
        strEncodedData := strEncodedData is String ? BSTR.Alloc(strEncodedData).Value : strEncodedData

        result := ComCall(13, this, EncodingType, Encoding, BSTR, strEncodedData, "HRESULT")
        return result
    }

    /**
     * Retrieves a collection of ISmimeCapability objects.
     * @remarks
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extensionsmimecapabilities-initializeencode">InitializeEncode</a> method or the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extensionsmimecapabilities-initializedecode">InitializeDecode</a> method to initialize the <b>SMIMECapabilities</b> extension.  You can also call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extension-get_critical">Critical</a> property to specify and retrieve a Boolean value that identifies whether the extension is critical, and you can call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extension-get_objectid">ObjectId</a> property to retrieve the OID associated with the extension.
     * @returns {ISmimeCapabilities} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509extensionsmimecapabilities-get_smimecapabilities
     */
    get_SmimeCapabilities() {
        result := ComCall(14, this, "ptr*", &ppValue := 0, "HRESULT")
        return ISmimeCapabilities(ppValue)
    }

    Query(iid) {
        if (IX509ExtensionSmimeCapabilities.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InitializeEncode := CallbackCreate(GetMethod(implObj, "InitializeEncode"), flags, 2)
        this.vtbl.InitializeDecode := CallbackCreate(GetMethod(implObj, "InitializeDecode"), flags, 3)
        this.vtbl.get_SmimeCapabilities := CallbackCreate(GetMethod(implObj, "get_SmimeCapabilities"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InitializeEncode)
        CallbackFree(this.vtbl.InitializeDecode)
        CallbackFree(this.vtbl.get_SmimeCapabilities)
    }
}
