#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IObjectId.ahk
#Include .\IX509Attribute.ahk

/**
 * Represents an attribute that contains an encrypted private key to be archived by a certification authority.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509attributearchivekey
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509AttributeArchiveKey extends IX509Attribute{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509AttributeArchiveKey
     * @type {Guid}
     */
    static IID => Guid("{728ab327-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeEncode", "InitializeDecode", "get_EncryptedKeyBlob", "get_EncryptionAlgorithm", "get_EncryptionStrength"]

    /**
     * @type {IObjectId} 
     */
    EncryptionAlgorithm {
        get => this.get_EncryptionAlgorithm()
    }

    /**
     * @type {Integer} 
     */
    EncryptionStrength {
        get => this.get_EncryptionStrength()
    }

    /**
     * Initializes the attribute from an IX509PrivateKey object, the certification authority encryption certificate, and the symmetric encryption algorithm object identifier (OID).
     * @param {IX509PrivateKey} pKey Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509privatekey">IX509PrivateKey</a> interface that represents the key.
     * @param {Integer} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode encoding applied to the input string that contains the encrypted key.
     * @param {BSTR} strCAXCert A <b>BSTR</b> variable that contains the certification authority encryption certificate that contains the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">public key</a> used to encrypt the private key.
     * 
     * Beginning with Windows 7 and Windows Server 2008 R2, you can specify a certificate thumb print or serial number rather than an encoded certificate. Doing so causes the function to search the appropriate local stores for the matching certificate. Keep in mind the following points:
     * 
     * <ul>
     * <li>The <b>BSTR</b> must be an even number of hexadecimal digits.</li>
     * <li>Whitespace between hexadecimal pairs is ignored.</li>
     * <li>The <i>Encoding</i> parameter must be set to <b>XCN_CRYPT_STRING_HEXRAW</b>.</li>
     * <li>Only the personal and request stores are searched for the private key.</li>
     * </ul>
     * @param {IObjectId} pAlgorithm Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectid">IObjectId</a> interface that represents the OID of the symmetric encryption algorithm used to encrypt the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">private key</a>. This parameter is optional. If you do not supply an OID, XCN_OID_RSA_DES_EDE3_CBC (Triple DES) is used.
     * @param {Integer} EncryptionStrength A <b>LONG</b> variable that contains the encryption strength of the algorithm identified by the <i>pAlgorithm</i> parameter. This parameter is not currently used because the Certificate Enrollment SDK does not support any algorithms for which the OID does not already imply the strength (key length). For example, AES has multiple strengths but strength each is already indicated by the OID.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509attributearchivekey-initializeencode
     */
    InitializeEncode(pKey, Encoding, strCAXCert, pAlgorithm, EncryptionStrength) {
        strCAXCert := strCAXCert is String ? BSTR.Alloc(strCAXCert).Value : strCAXCert

        result := ComCall(10, this, "ptr", pKey, "int", Encoding, "ptr", strCAXCert, "ptr", pAlgorithm, "int", EncryptionStrength, "HRESULT")
        return result
    }

    /**
     * Initializes the object from a Distinguished Encoding Rules (DER) encoded byte array that contains the encrypted private key.
     * @param {Integer} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode encoding applied to the input string.
     * @param {BSTR} strEncodedData A <b>BSTR</b> variable that contains the DER-encoded attribute.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509attributearchivekey-initializedecode
     */
    InitializeDecode(Encoding, strEncodedData) {
        strEncodedData := strEncodedData is String ? BSTR.Alloc(strEncodedData).Value : strEncodedData

        result := ComCall(11, this, "int", Encoding, "ptr", strEncodedData, "HRESULT")
        return result
    }

    /**
     * Retrieves a byte array that contains the encrypted key.
     * @remarks
     * 
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributearchivekey-initializeencode">InitializeEncode</a> method or the  <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributearchivekey-initializedecode">InitializeDecode</a> method to initialize the <b>EncryptedKeyBlob</b> property. You can call the following properties to retrieve the raw data:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributearchivekey-get_encryptionalgorithm">EncryptionAlgorithm</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributearchivekey-get_encryptionstrength">EncryptionStrength</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509attributearchivekey-get_encryptedkeyblob
     */
    get_EncryptedKeyBlob(Encoding) {
        pValue := BSTR()
        result := ComCall(12, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Retrieves the object identifier (OID) of the symmetric encryption algorithm used to encrypt the private key.
     * @remarks
     * 
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributearchivekey-initializeencode">InitializeEncode</a> method or the  <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributearchivekey-initializedecode">InitializeDecode</a> method to initialize the <b>EncryptionAlgorithm</b> property. You can call the following properties to retrieve the raw data:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributearchivekey-get_encryptedkeyblob">EncryptedKeyBlob</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributearchivekey-get_encryptionstrength">EncryptionStrength</a>
     * </li>
     * </ul>
     * 
     * 
     * @returns {IObjectId} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509attributearchivekey-get_encryptionalgorithm
     */
    get_EncryptionAlgorithm() {
        result := ComCall(13, this, "ptr*", &ppValue := 0, "HRESULT")
        return IObjectId(ppValue)
    }

    /**
     * Retrieves an integer that contains the encryption strength of the symmetric algorithm used to encrypt the key.
     * @remarks
     * 
     * You can specify this property by calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributearchivekey-initializeencode">InitializeEncode</a> method or the  <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributearchivekey-initializedecode">InitializeDecode</a> method. However, the property is currently ignored and zero is returned because the Certificate Enrollment SDK does not support any algorithms for which the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) does not already imply the encryption strength (key length). For example, AES has multiple strengths, but each strength is already indicated by the OID. 
     * 
     * You can call the following properties to retrieve the raw data:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributearchivekey-get_encryptionalgorithm">EncryptionAlgorithm</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributearchivekey-get_encryptedkeyblob">EncryptedKeyBlob</a>
     * </li>
     * </ul>
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509attributearchivekey-get_encryptionstrength
     */
    get_EncryptionStrength() {
        result := ComCall(14, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }
}
