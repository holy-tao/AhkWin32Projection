#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IX509Extensions.ahk
#Include .\IX509Attribute.ahk

/**
 * Defines methods and properties that initialize and retrieve certificate extensions in a certificate request.
 * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nn-certenroll-ix509attributeextensions
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509AttributeExtensions extends IX509Attribute{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509AttributeExtensions
     * @type {Guid}
     */
    static IID => Guid("{728ab324-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeEncode", "InitializeDecode", "get_X509Extensions"]

    /**
     * @type {IX509Extensions} 
     */
    X509Extensions {
        get => this.get_X509Extensions()
    }

    /**
     * Initializes the object from an IX509Extensions collection.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> for this attribute is <b>XCN_OID_RSA_certExtensions</b> (1.2.840.113549.1.9.14). For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-certenroll_objectid">CERTENROLL_OBJECTID</a>.
     * 
     * You must call either <b>InitializeEncode</b> or <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributeextensions-initializedecode">InitializeDecode</a> before you can use an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509attributeextensions">IX509AttributeExtensions</a> object. The two methods complement each other. The <b>InitializeEncode</b> method enables you to construct an encoded <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Abstract Syntax Notation One</a> (ASN.1) structure from raw data, and the <b>InitializeDecode</b> method enables you to initialize raw data from an encoded ASN.1 structure that contains the certificate extensions. You can call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributeextensions-get_x509extensions">X509Extensions</a> property to retrieve the extensions.
     * @param {IX509Extensions} pExtensions Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509extensions">IX509Extensions</a> interface that contains the collection.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509attributeextensions-initializeencode
     */
    InitializeEncode(pExtensions) {
        result := ComCall(10, this, "ptr", pExtensions, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes the object from a Distinguished Encoding Rules (DER) encoded byte array that contains the attribute value. (IX509AttributeExtensions.InitializeDecode)
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) for this attribute is <b>XCN_OID_RSA_certExtensions</b> (1.2.840.113549.1.9.14). For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-certenroll_objectid">CERTENROLL_OBJECTID</a>.
     * 
     * You can use this method if you have a DER-encoded ASN.1 object that contains an attribute value. You must supply the DER-encoded object in a Unicode encoded string. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ibinaryconverter">IBinaryConverter</a> interface.
     * 
     * You must call either <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributeextensions-initializeencode">InitializeEncode</a> or <b>InitializeDecode</b> before you can use an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509attributeextensions">IX509AttributeExtensions</a> object. The two methods complement each other. The <b>InitializeEncode</b> method enables you to construct an encoded <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Abstract Syntax Notation One</a> (ASN.1) structure from raw data, and the <b>InitializeDecode</b> method enables you to initialize raw data from an encoded ASN.1 structure that contains the certificate extensions. You can call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributeextensions-get_x509extensions">X509Extensions</a> property to retrieve the extensions.
     * @param {Integer} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode encoding applied to  the input string.
     * @param {BSTR} strEncodedData A <b>BSTR</b> variable that contains the encoded extensions.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509attributeextensions-initializedecode
     */
    InitializeDecode(Encoding, strEncodedData) {
        if(strEncodedData is String) {
            pin := BSTR.Alloc(strEncodedData)
            strEncodedData := pin.Value
        }

        result := ComCall(11, this, "int", Encoding, "ptr", strEncodedData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the certificate extensions.
     * @remarks
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributeextensions-initializeencode">InitializeEncode</a> method or the  <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributeextensions-initializedecode">InitializeDecode</a> method to initialize the <b>X509Extensions</b> property.
     * @returns {IX509Extensions} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509attributeextensions-get_x509extensions
     */
    get_X509Extensions() {
        result := ComCall(12, this, "ptr*", &ppValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IX509Extensions(ppValue)
    }
}
