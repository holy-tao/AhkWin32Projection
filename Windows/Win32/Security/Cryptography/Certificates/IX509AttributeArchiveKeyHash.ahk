#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IX509Attribute.ahk

/**
 * Represents an attribute that contains a SHA-1 hash of the encrypted private key to be archived by a certification authority.
 * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nn-certenroll-ix509attributearchivekeyhash
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509AttributeArchiveKeyHash extends IX509Attribute{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509AttributeArchiveKeyHash
     * @type {Guid}
     */
    static IID => Guid("{728ab328-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeEncodeFromEncryptedKeyBlob", "InitializeDecode", "get_EncryptedKeyHashBlob"]

    /**
     * Initializes the attribute from an encrypted private key.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) for this attribute is <b>XCN_OID_ENCRYPTED_KEY_HASH</b> (1.3.6.1.4.1.311.21.21). For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-certenroll_objectid">CERTENROLL_OBJECTID</a>.
     * 
     * You must call either <b>InitializeEncodeFromEncryptedKeyBlob</b> or <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributearchivekeyhash-initializedecode">InitializeDecode</a> before you can use an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509attributearchivekeyhash">IX509AttributeArchiveKeyHash</a> object. The two methods complement each other. The <b>InitializeEncodeFromEncryptedKeyBlob</b> method enables you to construct an encoded <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Abstract Syntax Notation One</a> (ASN.1) structure from raw data, and the <b>InitializeDecode</b> method enables you to initialize raw data from an encoded ASN.1 structure. You can call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributearchivekeyhash-get_encryptedkeyhashblob">EncryptedKeyHashBlob</a> property to retrieve the raw data.
     * @param {Integer} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode encoding applied to the input string that contains the key.
     * @param {BSTR} strEncryptedKeyBlob A <b>BSTR</b> variable that contains the encrypted key.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509attributearchivekeyhash-initializeencodefromencryptedkeyblob
     */
    InitializeEncodeFromEncryptedKeyBlob(Encoding, strEncryptedKeyBlob) {
        if(strEncryptedKeyBlob is String) {
            pin := BSTR.Alloc(strEncryptedKeyBlob)
            strEncryptedKeyBlob := pin.Value
        }

        result := ComCall(10, this, "int", Encoding, "ptr", strEncryptedKeyBlob, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes the object from a Distinguished Encoding Rules (DER) encoded byte array that contains a SHA-1 hash of the encrypted private key.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) for this attribute is <b>XCN_OID_ENCRYPTED_KEY_HASH</b> (1.3.6.1.4.1.311.21.21). For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-certenroll_objectid">CERTENROLL_OBJECTID</a>.
     * 
     * You can use this method if you have a DER-encoded <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Abstract Syntax Notation One</a> (ASN.1) object that contains the attribute value. You must supply the DER-encoded object in a Unicode encoded string. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ibinaryconverter">IBinaryConverter</a> interface.
     * 
     * You must call either <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributearchivekeyhash-initializeencodefromencryptedkeyblob">InitializeEncodeFromEncryptedKeyBlob</a> or <b>InitializeDecode</b> before you can use an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509attributearchivekeyhash">IX509AttributeArchiveKeyHash</a> object. The two methods complement each other. The <b>InitializeEncodeFromEncryptedKeyBlob</b> method enables you to construct an encoded ASN.1 structure from raw data, and the <b>InitializeDecode</b> method enables you to initialize raw data from an encoded ASN.1 structure. You can call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributearchivekeyhash-get_encryptedkeyhashblob">EncryptedKeyHashBlob</a> property to retrieve the raw data.
     * @param {Integer} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode encoding applied to the input string that contains hash value.
     * @param {BSTR} strEncodedData A <b>BSTR</b> variable that contains the DER-encoded attribute.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509attributearchivekeyhash-initializedecode
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
     * Retrieves a string that contains a hash of the encrypted private key.
     * @remarks
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributearchivekeyhash-initializeencodefromencryptedkeyblob">InitializeEncodeFromEncryptedKeyBlob</a> method or the  <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributearchivekeyhash-initializedecode">InitializeDecode</a> method to initialize the <b>EncryptedKeyHashBlob</b> property.
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509attributearchivekeyhash-get_encryptedkeyhashblob
     */
    get_EncryptedKeyHashBlob(Encoding) {
        pValue := BSTR()
        result := ComCall(12, this, "int", Encoding, "ptr", pValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }
}
