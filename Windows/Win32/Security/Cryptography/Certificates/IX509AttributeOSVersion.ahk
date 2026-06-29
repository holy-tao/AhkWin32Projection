#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\EncodingType.ahk" { EncodingType }
#Import ".\IX509Attribute.ahk" { IX509Attribute }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Represents an attribute that contains version information about the client operating system on which the certificate request was generated.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/nn-certenroll-ix509attributeosversion
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct IX509AttributeOSVersion extends IX509Attribute {
    /**
     * The interface identifier for IX509AttributeOSVersion
     * @type {Guid}
     */
    static IID := Guid("{728ab32a-217d-11da-b2a4-000e7bbb2b09}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IX509AttributeOSVersion interfaces
    */
    struct Vtbl extends IX509Attribute.Vtbl {
        InitializeEncode : IntPtr
        InitializeDecode : IntPtr
        get_OSVersion    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IX509AttributeOSVersion.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    OSVersion {
        get => this.get_OSVersion()
    }

    /**
     * Initializes the attribute from operating system version information.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) for this attribute is <b>XCN_OID_OS_VERSION</b> (1.3.6.1.4.1.311.13.2.3). For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-certenroll_objectid">CERTENROLL_OBJECTID</a>.
     * 
     * You must call either <b>InitializeEncode</b> or <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributeosversion-initializedecode">InitializeDecode</a> before you can use an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509attributeosversion">IX509AttributeOSVersion</a> object. The two methods complement each other. The <b>InitializeEncode</b> method enables you to construct an encoded <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Abstract Syntax Notation One</a> (ASN.1) structure from raw data, and the <b>InitializeDecode</b> method enables you to initialize raw data from an encoded ASN.1 structure. You can call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributeosversion-get_osversion">OSVersion</a> property to retrieve the raw data.
     * @param {BSTR} strOSVersion A <b>BSTR</b> variable that contains the version information. The format of the string is <i>major.minor.build.platform</i>. This parameter is optional. If you do not specify a string, this method calls the <b>GetVersionEx</b> function.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509attributeosversion-initializeencode
     */
    InitializeEncode(strOSVersion) {
        strOSVersion := strOSVersion is String ? BSTR.Alloc(strOSVersion).Value : strOSVersion

        result := ComCall(10, this, BSTR, strOSVersion, "HRESULT")
        return result
    }

    /**
     * Initializes the object from a Distinguished Encoding Rules (DER) encoded byte array that contains the operating system version information.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) for this attribute is <b>XCN_OID_OS_VERSION</b> (1.3.6.1.4.1.311.13.2.3). For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-certenroll_objectid">CERTENROLL_OBJECTID</a>.
     * 
     * You can use this method if you have a DER-encoded <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Abstract Syntax Notation One</a> (ASN.1) object that contains the attribute value. You must supply the DER-encoded object in a Unicode encoded string. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ibinaryconverter">IBinaryConverter</a> interface.
     * 
     * You must call either <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributeosversion-initializeencode">InitializeEncode</a> or <b>InitializeDecode</b> before you can use an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509attributeosversion">IX509AttributeOSVersion</a> object. The two methods complement each other. The <b>InitializeEncode</b> method enables you to construct an encoded ASN.1 structure from raw data, and the <b>InitializeDecode</b> method enables you to initialize raw data from an encoded ASN.1 structure. You can call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributeosversion-get_osversion">OSVersion</a> property to retrieve the raw data.
     * @param {EncodingType} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode encoding applied to the input string.
     * @param {BSTR} strEncodedData A <b>BSTR</b> variable that contains the DER-encoded attribute.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509attributeosversion-initializedecode
     */
    InitializeDecode(Encoding, strEncodedData) {
        strEncodedData := strEncodedData is String ? BSTR.Alloc(strEncodedData).Value : strEncodedData

        result := ComCall(11, this, EncodingType, Encoding, BSTR, strEncodedData, "HRESULT")
        return result
    }

    /**
     * Retrieves the client operating system version information.
     * @remarks
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributeosversion-initializeencode">InitializeEncode</a> method or the  <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributeosversion-initializedecode">InitializeDecode</a> method to initialize the <b>OSVersion</b> property.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509attributeosversion-get_osversion
     */
    get_OSVersion() {
        pValue := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    Query(iid) {
        if (IX509AttributeOSVersion.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InitializeEncode := CallbackCreate(GetMethod(implObj, "InitializeEncode"), flags, 2)
        this.vtbl.InitializeDecode := CallbackCreate(GetMethod(implObj, "InitializeDecode"), flags, 3)
        this.vtbl.get_OSVersion := CallbackCreate(GetMethod(implObj, "get_OSVersion"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InitializeEncode)
        CallbackFree(this.vtbl.InitializeDecode)
        CallbackFree(this.vtbl.get_OSVersion)
    }
}
