#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IObjectId.ahk" { IObjectId }
#Import ".\EncodingType.ahk" { EncodingType }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IX509Extension.ahk" { IX509Extension }

/**
 * Defines methods and properties that can be used to initialize or retrieve a CertificateTemplate extension.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/nn-certenroll-ix509extensiontemplate
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct IX509ExtensionTemplate extends IX509Extension {
    /**
     * The interface identifier for IX509ExtensionTemplate
     * @type {Guid}
     */
    static IID := Guid("{728ab312-217d-11da-b2a4-000e7bbb2b09}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IX509ExtensionTemplate interfaces
    */
    struct Vtbl extends IX509Extension.Vtbl {
        InitializeEncode : IntPtr
        InitializeDecode : IntPtr
        get_TemplateOid  : IntPtr
        get_MajorVersion : IntPtr
        get_MinorVersion : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IX509ExtensionTemplate.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IObjectId} 
     */
    TemplateOid {
        get => this.get_TemplateOid()
    }

    /**
     * @type {Integer} 
     */
    MajorVersion {
        get => this.get_MajorVersion()
    }

    /**
     * @type {Integer} 
     */
    MinorVersion {
        get => this.get_MinorVersion()
    }

    /**
     * Initializes the extension from a template object identifier (OID) and from major and minor version numbers.
     * @remarks
     * You must call either <b>InitializeEncode</b> or <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extensiontemplate-initializedecode">InitializeDecode</a> before you can use an  <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509extensiontemplate">IX509ExtensionTemplate</a> object. The two methods complement each other. The <b>InitializeEncode</b> method enables you to construct a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">Distinguished Encoding Rules</a> (DER) encoded <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Abstract Syntax Notation One</a> (ASN.1) extension object from raw data, and the <b>InitializeDecode</b> method enables you to initialize the raw data from an encoded object.
     * 
     * You can retrieve the following properties for this extension:<ul>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extension-get_critical">Critical</a> property identifies whether the extension is critical. You can also specify this property.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extension-get_objectid">ObjectId</a> property retrieves the OID.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extensiontemplate-get_majorversion">MajorVersion</a> and <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extensiontemplate-get_minorversion">MinorVersion</a> properties retrieve the version information.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extensiontemplate-get_templateoid">TemplateOid</a> property retrieves the OID of the template.</li>
     * </ul>
     * 
     * 
     * You must call either <b>InitializeEncode</b> or <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extensiontemplate-initializedecode">InitializeDecode</a> before you can use an  <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509extensionbasicconstraints">IX509ExtensionBasicConstraints</a> object. The two methods complement each other. The <b>InitializeEncode</b> method enables you to construct an encoded ASN.1 structure from raw data, and the <b>InitializeDecode</b> method enables you to initialize the raw data from an encoded ASN.1 structure. You can retrieve the raw data for the extension by calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extensiontemplate-get_majorversion">MajorVersion</a>, <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extensiontemplate-get_minorversion">MinorVersion</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extensiontemplate-get_templateoid">TemplateOid</a> properties.
     * @param {IObjectId} pTemplateOid Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectid">IObjectId</a> interface that represents the template OID.
     * @param {Integer} MajorVersion A <b>LONG</b> variable that contains the major version number of the template. The default value is zero (0).
     * @param {Integer} MinorVersion A <b>LONG</b> variable that contains the minor version number of the template. The default value is zero (0).
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
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509extensiontemplate-initializeencode
     */
    InitializeEncode(pTemplateOid, MajorVersion, MinorVersion) {
        result := ComCall(12, this, "ptr", pTemplateOid, "int", MajorVersion, "int", MinorVersion, "HRESULT")
        return result
    }

    /**
     * Initializes the extension from a DER-encoded byte array that contains the extension value.
     * @remarks
     * You can use this method if you have a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">Distinguished Encoding Rules</a> (DER) encoded <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Abstract Syntax Notation One</a> (ASN.1) object that contains a <b>CertificateTemplate</b> extension.  You must supply the DER-encoded object in a Unicode encoded string. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ibinaryconverter">IBinaryConverter</a> interface.
     * 
     * You must call either <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extensiontemplate-initializeencode">InitializeEncode</a> or <b>InitializeDecode</b> before you can use an  <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509extensiontemplate">IX509ExtensionTemplate</a> object. The two methods complement each other. The <b>InitializeEncode</b> method enables you to construct a DER-encoded ASN.1 extension object from raw data, and the <b>InitializeDecode</b> method enables you to initialize the raw data from an encoded object.
     * 
     * You can retrieve the following properties for this extension:<ul>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extension-get_critical">Critical</a> property identifies whether the extension is critical. You can also specify this property.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extension-get_objectid">ObjectId</a> property retrieves the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID).</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extensiontemplate-get_majorversion">MajorVersion</a> and <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extensiontemplate-get_minorversion">MinorVersion</a> properties retrieve the version information.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extensiontemplate-get_templateoid">TemplateOid</a> property retrieves the OID of the template.</li>
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
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509extensiontemplate-initializedecode
     */
    InitializeDecode(Encoding, strEncodedData) {
        strEncodedData := strEncodedData is String ? BSTR.Alloc(strEncodedData).Value : strEncodedData

        result := ComCall(13, this, EncodingType, Encoding, BSTR, strEncodedData, "HRESULT")
        return result
    }

    /**
     * Retrieves the template object identifier (OID).
     * @remarks
     * You must call either <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extensiontemplate-initializeencode">InitializeEncode</a> or <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extensiontemplate-initializedecode">InitializeDecode</a> before you can use an  <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509extensiontemplate">IX509ExtensionTemplate</a> object. You can retrieve the following additional properties for this extension:<ul>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extension-get_critical">Critical</a> property identifies whether the extension is critical. You can also specify this property.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extension-get_objectid">ObjectId</a> property retrieves the OID.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extensiontemplate-get_majorversion">MajorVersion</a> and <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extensiontemplate-get_minorversion">MinorVersion</a> properties retrieve the version information.</li>
     * </ul>
     * @returns {IObjectId} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509extensiontemplate-get_templateoid
     */
    get_TemplateOid() {
        result := ComCall(14, this, "ptr*", &ppValue := 0, "HRESULT")
        return IObjectId(ppValue)
    }

    /**
     * Retrieves the minimum major version number of the certificate template.
     * @remarks
     * You must call either <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extensiontemplate-initializeencode">InitializeEncode</a> or <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extensiontemplate-initializedecode">InitializeDecode</a> before you can use an  <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509extensiontemplate">IX509ExtensionTemplate</a> object. You can retrieve the following additional properties for this extension:<ul>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extension-get_critical">Critical</a> property identifies whether the extension is critical. You can also specify this property.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extension-get_objectid">ObjectId</a> property retrieves the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID).</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extensiontemplate-get_minorversion">MinorVersion</a> property retrieves version information.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extensiontemplate-get_templateoid">TemplateOid</a> property retrieves the OID of the template.</li>
     * </ul>
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509extensiontemplate-get_majorversion
     */
    get_MajorVersion() {
        result := ComCall(15, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Retrieves the minimum minor version number of the certificate template.
     * @remarks
     * You must call either <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extensiontemplate-initializeencode">InitializeEncode</a> or <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extensiontemplate-initializedecode">InitializeDecode</a> before you can use an  <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509extensiontemplate">IX509ExtensionTemplate</a> object. You can retrieve the following additional properties for this extension:<ul>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extension-get_critical">Critical</a> property identifies whether the extension is critical. You can also specify this property.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extension-get_objectid">ObjectId</a> property retrieves the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID).</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extensiontemplate-get_majorversion">MajorVersion</a> property retrieves version information.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509extensiontemplate-get_templateoid">TemplateOid</a> property retrieves the OID of the template.</li>
     * </ul>
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509extensiontemplate-get_minorversion
     */
    get_MinorVersion() {
        result := ComCall(16, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    Query(iid) {
        if (IX509ExtensionTemplate.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InitializeEncode := CallbackCreate(GetMethod(implObj, "InitializeEncode"), flags, 4)
        this.vtbl.InitializeDecode := CallbackCreate(GetMethod(implObj, "InitializeDecode"), flags, 3)
        this.vtbl.get_TemplateOid := CallbackCreate(GetMethod(implObj, "get_TemplateOid"), flags, 2)
        this.vtbl.get_MajorVersion := CallbackCreate(GetMethod(implObj, "get_MajorVersion"), flags, 2)
        this.vtbl.get_MinorVersion := CallbackCreate(GetMethod(implObj, "get_MinorVersion"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InitializeEncode)
        CallbackFree(this.vtbl.InitializeDecode)
        CallbackFree(this.vtbl.get_TemplateOid)
        CallbackFree(this.vtbl.get_MajorVersion)
        CallbackFree(this.vtbl.get_MinorVersion)
    }
}
