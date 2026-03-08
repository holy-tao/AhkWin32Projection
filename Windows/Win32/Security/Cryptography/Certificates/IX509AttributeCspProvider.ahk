#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IX509Attribute.ahk

/**
 * Represents an attribute that identifies the cryptographic provider used by the entity requesting the certificate.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/nn-certenroll-ix509attributecspprovider
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509AttributeCspProvider extends IX509Attribute{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509AttributeCspProvider
     * @type {Guid}
     */
    static IID => Guid("{728ab32b-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeEncode", "InitializeDecode", "get_KeySpec", "get_ProviderName", "get_Signature"]

    /**
     * @type {Integer} 
     */
    KeySpec {
        get => this.get_KeySpec()
    }

    /**
     * @type {BSTR} 
     */
    ProviderName {
        get => this.get_ProviderName()
    }

    /**
     * Initializes the attribute from information about the provider.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) for this attribute is <b>XCN_OID_ENROLLMENT_CSP_PROVIDER</b> (1.3.6.1.4.1.311.13.2.2). For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-certenroll_objectid">CERTENROLL_OBJECTID</a>.
     * 
     * You must call either <b>InitializeEncode</b> or <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributecspprovider-initializedecode">InitializeDecode</a> before you can use an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509attributecspprovider">IX509AttributeCspProvider</a> object. The two methods complement each other. The <b>InitializeEncode</b> method enables you to construct an encoded <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Abstract Syntax Notation One</a> (ASN.1) structure from raw data, and the <b>InitializeDecode</b> method enables you to initialize raw data from an encoded ASN.1 structure. You can call the following properties to retrieve the raw data:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributecspprovider-get_keyspec">KeySpec</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributecspprovider-get_providername">ProviderName</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributecspprovider-get_signature">Signature</a>
     * </li>
     * </ul>
     * @param {Integer} KeySpec An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-x509keyspec">X509KeySpec</a> enumeration value that identifies whether the key pair is used for encryption or for signing.
     * @param {BSTR} strProviderName A <b>BSTR</b> variable that contains the provider name.
     * @param {Integer} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode encoding applied to the signature contained in the <i>strSignature</i> parameter.
     * @param {BSTR} strSignature A <b>BSTR</b> variable that contains the provider signature.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509attributecspprovider-initializeencode
     */
    InitializeEncode(KeySpec, strProviderName, Encoding, strSignature) {
        strProviderName := strProviderName is String ? BSTR.Alloc(strProviderName).Value : strProviderName
        strSignature := strSignature is String ? BSTR.Alloc(strSignature).Value : strSignature

        result := ComCall(10, this, "int", KeySpec, "ptr", strProviderName, "int", Encoding, "ptr", strSignature, "HRESULT")
        return result
    }

    /**
     * Initializes the object from a Distinguished Encoding Rules (DER) encoded byte array that contains information about the provider.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) for this attribute is <b>XCN_OID_ENROLLMENT_CSP_PROVIDER</b> (1.3.6.1.4.1.311.13.2.2). For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-certenroll_objectid">CERTENROLL_OBJECTID</a>.
     * 
     * You can use this method if you have a DER-encoded <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Abstract Syntax Notation One</a> (ASN.1) object that contains the attribute value. You must supply the DER-encoded object in a Unicode encoded string. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ibinaryconverter">IBinaryConverter</a> interface.
     * 
     * You must call either <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributecspprovider-initializeencode">InitializeEncode</a> or <b>InitializeDecode</b> before you can use an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509attributecspprovider">IX509AttributeCspProvider</a> object. The two methods complement each other. The <b>InitializeEncode</b> method enables you to construct an encoded ASN.1 structure from raw data, and the <b>InitializeDecode</b> method enables you to initialize raw data from an encoded ASN.1 structure. You can call the following properties to retrieve the raw data:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributecspprovider-get_keyspec">KeySpec</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributecspprovider-get_providername">ProviderName</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributecspprovider-get_signature">Signature</a>
     * </li>
     * </ul>
     * @param {Integer} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode encoding applied to the input string.
     * @param {BSTR} strEncodedData A <b>BSTR</b> variable that contains the DER-encoded attribute.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509attributecspprovider-initializedecode
     */
    InitializeDecode(Encoding, strEncodedData) {
        strEncodedData := strEncodedData is String ? BSTR.Alloc(strEncodedData).Value : strEncodedData

        result := ComCall(11, this, "int", Encoding, "ptr", strEncodedData, "HRESULT")
        return result
    }

    /**
     * Retrieves a value that identifies whether the key pair stored by the provider or key container is used for encryption or for signing content.
     * @remarks
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributecspprovider-initializeencode">InitializeEncode</a> method or the  <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributecspprovider-initializedecode">InitializeDecode</a> method to initialize the <b>KeySpec</b> property. You can also call the following properties to retrieve raw data:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributecspprovider-get_providername">ProviderName</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributecspprovider-get_signature">Signature</a>
     * </li>
     * </ul>
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509attributecspprovider-get_keyspec
     */
    get_KeySpec() {
        result := ComCall(12, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Retrieves the provider name.
     * @remarks
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributecspprovider-initializeencode">InitializeEncode</a> method or the  <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributecspprovider-initializedecode">InitializeDecode</a> method to initialize the <b>ProviderName</b> property. You can also call the following properties to retrieve raw data:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributecspprovider-get_keyspec">KeySpec</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributecspprovider-get_signature">Signature</a>
     * </li>
     * </ul>
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509attributecspprovider-get_providername
     */
    get_ProviderName() {
        pValue := BSTR()
        result := ComCall(13, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Retrieves the digital signature on the provider.
     * @remarks
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributecspprovider-initializeencode">InitializeEncode</a> method or the  <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributecspprovider-initializedecode">InitializeDecode</a> method to initialize the <b>Signature</b> property. You can call the following properties to retrieve the raw data:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributecspprovider-get_keyspec">KeySpec</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributecspprovider-get_providername">ProviderName</a>
     * </li>
     * </ul>
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509attributecspprovider-get_signature
     */
    get_Signature(Encoding) {
        pValue := BSTR()
        result := ComCall(14, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return pValue
    }
}
