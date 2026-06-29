#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\EncodingType.ahk" { EncodingType }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IObjectIds.ahk" { IObjectIds }
#Import ".\IX509Extension.ahk" { IX509Extension }

/**
 * Can be used to define a collection of object identifiers (OIDs) that identify the intended uses of the public key contained in the certificate.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/nn-certenroll-ix509extensionenhancedkeyusage
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct IX509ExtensionEnhancedKeyUsage extends IX509Extension {
    /**
     * The interface identifier for IX509ExtensionEnhancedKeyUsage
     * @type {Guid}
     */
    static IID := Guid("{728ab310-217d-11da-b2a4-000e7bbb2b09}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IX509ExtensionEnhancedKeyUsage interfaces
    */
    struct Vtbl extends IX509Extension.Vtbl {
        InitializeEncode     : IntPtr
        InitializeDecode     : IntPtr
        get_EnhancedKeyUsage : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IX509ExtensionEnhancedKeyUsage.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IObjectIds} 
     */
    EnhancedKeyUsage {
        get => this.get_EnhancedKeyUsage()
    }

    /**
     * Initializes the extension from a collection of IObjectId object identifiers (OIDs) that specify the intended uses of the public key.
     * @remarks
     * You must call either <b>InitializeEncode</b> or <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extensionenhancedkeyusage-initializedecode">InitializeDecode</a> before you can use an  <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509extensionenhancedkeyusage">IX509ExtensionEnhancedKeyUsage</a> object. The two methods complement each other. The <b>InitializeEncode</b> method enables you to construct a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">Distinguished Encoding Rules</a> (DER) encoded <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Abstract Syntax Notation One</a> (ASN.1) extension object from raw data, and the <b>InitializeDecode</b> method enables you to initialize the raw data from an encoded object.
     * 
     * You can retrieve the following properties for this extension:<ul>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extension-get_critical">Critical</a> property identifies whether the extension is critical. You can also specify this property.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extension-get_objectid">ObjectId</a> property retrieves the extension <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID).</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extensionenhancedkeyusage-get_enhancedkeyusage">EnhancedKeyUsage</a> property retrieves the collection of OIDs that identify the intended uses of the public key (the raw extension data).</li>
     * </ul>
     * @param {IObjectIds} pValue Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectids">IObjectIds</a> interface.
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
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509extensionenhancedkeyusage-initializeencode
     */
    InitializeEncode(pValue) {
        result := ComCall(12, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * Initializes the extension from a Distinguished Encoding Rules (DER) encoded byte array that contains the extension value. (IX509ExtensionEnhancedKeyUsage.InitializeDecode)
     * @remarks
     * You can use this method if you have a DER-encoded <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Abstract Syntax Notation One</a> (ASN.1) object that contains an <b>EnhancedKeyUsage</b> extension. You must supply the DER-encoded object in a Unicode encoded string. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ibinaryconverter">IBinaryConverter</a> interface.
     * 
     * You must call either <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extensionenhancedkeyusage-initializeencode">InitializeEncode</a> or <b>InitializeDecode</b> before you can use an  <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509extensionenhancedkeyusage">IX509ExtensionEnhancedKeyUsage</a> object. The two methods complement each other. The <b>InitializeEncode</b> method enables you to construct a DER-encoded ASN.1 extension object from raw data, and the <b>InitializeDecode</b> method enables you to initialize the raw data from an encoded object.
     * 
     * You can retrieve the following properties for this extension:<ul>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extension-get_critical">Critical</a> property identifies whether the extension is critical. You can also specify this property.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extension-get_objectid">ObjectId</a> property retrieves the extension <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID).</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extensionenhancedkeyusage-get_enhancedkeyusage">EnhancedKeyUsage</a> property retrieves the collection of OIDs that identify the intended uses of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">public key</a> (the raw extension data).</li>
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
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509extensionenhancedkeyusage-initializedecode
     */
    InitializeDecode(Encoding, strEncodedData) {
        strEncodedData := strEncodedData is String ? BSTR.Alloc(strEncodedData).Value : strEncodedData

        result := ComCall(13, this, EncodingType, Encoding, BSTR, strEncodedData, "HRESULT")
        return result
    }

    /**
     * Retrieves a collection of key usage object identifiers (OIDs).
     * @remarks
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extensionenhancedkeyusage-initializeencode">InitializeEncode</a> method or the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extensionenhancedkeyusage-initializedecode">InitializeDecode</a> method to initialize the collection.  You can also call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extension-get_critical">Critical</a> property to specify and retrieve a Boolean value that identifies whether the extension is critical, and you can call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extension-get_objectid">ObjectId</a> property to retrieve the OID associated with the extension.
     * @returns {IObjectIds} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509extensionenhancedkeyusage-get_enhancedkeyusage
     */
    get_EnhancedKeyUsage() {
        result := ComCall(14, this, "ptr*", &ppValue := 0, "HRESULT")
        return IObjectIds(ppValue)
    }

    Query(iid) {
        if (IX509ExtensionEnhancedKeyUsage.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InitializeEncode := CallbackCreate(GetMethod(implObj, "InitializeEncode"), flags, 2)
        this.vtbl.InitializeDecode := CallbackCreate(GetMethod(implObj, "InitializeDecode"), flags, 3)
        this.vtbl.get_EnhancedKeyUsage := CallbackCreate(GetMethod(implObj, "get_EnhancedKeyUsage"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InitializeEncode)
        CallbackFree(this.vtbl.InitializeDecode)
        CallbackFree(this.vtbl.get_EnhancedKeyUsage)
    }
}
