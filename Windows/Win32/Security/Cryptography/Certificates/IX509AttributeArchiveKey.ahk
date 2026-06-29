#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IObjectId.ahk" { IObjectId }
#Import ".\IX509PrivateKey.ahk" { IX509PrivateKey }
#Import ".\EncodingType.ahk" { EncodingType }
#Import ".\IX509Attribute.ahk" { IX509Attribute }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Represents an attribute that contains an encrypted private key to be archived by a certification authority.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/nn-certenroll-ix509attributearchivekey
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct IX509AttributeArchiveKey extends IX509Attribute {
    /**
     * The interface identifier for IX509AttributeArchiveKey
     * @type {Guid}
     */
    static IID := Guid("{728ab327-217d-11da-b2a4-000e7bbb2b09}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IX509AttributeArchiveKey interfaces
    */
    struct Vtbl extends IX509Attribute.Vtbl {
        InitializeEncode        : IntPtr
        InitializeDecode        : IntPtr
        get_EncryptedKeyBlob    : IntPtr
        get_EncryptionAlgorithm : IntPtr
        get_EncryptionStrength  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IX509AttributeArchiveKey.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @remarks
     * The object identifier for this attribute is <b>XCN_OID_ARCHIVED_KEY_ATTR</b> (1.3.6.1.4.1.311.21.13). For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-certenroll_objectid">CERTENROLL_OBJECTID</a>.
     * 
     * You must call either <b>InitializeEncode</b> or <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributearchivekey-initializedecode">InitializeDecode</a> before you can use an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509attributearchivekey">IX509AttributeArchiveKey</a> object. The two methods complement each other. The <b>InitializeEncode</b> method enables you to construct an encoded <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Abstract Syntax Notation One</a> (ASN.1) structure from raw data, and the <b>InitializeDecode</b> method enables you to initialize raw data from an encoded ASN.1 structure. You can call the following properties to retrieve the raw data:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributearchivekey-get_encryptionalgorithm">EncryptionAlgorithm</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributearchivekey-get_encryptedkeyblob">EncryptedKeyBlob</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributearchivekey-get_encryptionstrength">EncryptionStrength</a>
     * </li>
     * </ul>
     * @param {IX509PrivateKey} pKey Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509privatekey">IX509PrivateKey</a> interface that represents the key.
     * @param {EncodingType} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode encoding applied to the input string that contains the encrypted key.
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
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509attributearchivekey-initializeencode
     */
    InitializeEncode(pKey, Encoding, strCAXCert, pAlgorithm, EncryptionStrength) {
        strCAXCert := strCAXCert is String ? BSTR.Alloc(strCAXCert).Value : strCAXCert

        result := ComCall(10, this, "ptr", pKey, EncodingType, Encoding, BSTR, strCAXCert, "ptr", pAlgorithm, "int", EncryptionStrength, "HRESULT")
        return result
    }

    /**
     * Initializes the object from a Distinguished Encoding Rules (DER) encoded byte array that contains the encrypted private key.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) for this attribute is <b>XCN_OID_ARCHIVED_KEY_ATTR</b> (1.3.6.1.4.1.311.21.13). For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-certenroll_objectid">CERTENROLL_OBJECTID</a>.
     * 
     * You can use this method if you have a DER-encoded <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Abstract Syntax Notation One</a> (ASN.1) object that contains the attribute value. You must supply the DER-encoded object in a Unicode encoded string. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ibinaryconverter">IBinaryConverter</a> interface.
     * 
     * You must call either <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributearchivekey-initializeencode">InitializeEncode</a> or <b>InitializeDecode</b> before you can use an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509attributearchivekey">IX509AttributeArchiveKey</a> object. The two methods complement each other. The <b>InitializeEncode</b> method enables you to construct an encoded ASN.1 structure from raw data, and the <b>InitializeDecode</b> method enables you to initialize raw data from an encoded ASN.1 structure. You can call the following properties to retrieve the raw data:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributearchivekey-get_encryptionalgorithm">EncryptionAlgorithm</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributearchivekey-get_encryptedkeyblob">EncryptedKeyBlob</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributearchivekey-get_encryptionstrength">EncryptionStrength</a>
     * </li>
     * </ul>
     * @param {EncodingType} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode encoding applied to the input string.
     * @param {BSTR} strEncodedData A <b>BSTR</b> variable that contains the DER-encoded attribute.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509attributearchivekey-initializedecode
     */
    InitializeDecode(Encoding, strEncodedData) {
        strEncodedData := strEncodedData is String ? BSTR.Alloc(strEncodedData).Value : strEncodedData

        result := ComCall(11, this, EncodingType, Encoding, BSTR, strEncodedData, "HRESULT")
        return result
    }

    /**
     * Retrieves a byte array that contains the encrypted key.
     * @remarks
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
     * @param {EncodingType} Encoding 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509attributearchivekey-get_encryptedkeyblob
     */
    get_EncryptedKeyBlob(Encoding) {
        pValue := BSTR.Owned()
        result := ComCall(12, this, EncodingType, Encoding, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    /**
     * Retrieves the object identifier (OID) of the symmetric encryption algorithm used to encrypt the private key.
     * @remarks
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
     * @returns {IObjectId} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509attributearchivekey-get_encryptionalgorithm
     */
    get_EncryptionAlgorithm() {
        result := ComCall(13, this, "ptr*", &ppValue := 0, "HRESULT")
        return IObjectId(ppValue)
    }

    /**
     * Retrieves an integer that contains the encryption strength of the symmetric algorithm used to encrypt the key.
     * @remarks
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509attributearchivekey-get_encryptionstrength
     */
    get_EncryptionStrength() {
        result := ComCall(14, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    Query(iid) {
        if (IX509AttributeArchiveKey.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InitializeEncode := CallbackCreate(GetMethod(implObj, "InitializeEncode"), flags, 6)
        this.vtbl.InitializeDecode := CallbackCreate(GetMethod(implObj, "InitializeDecode"), flags, 3)
        this.vtbl.get_EncryptedKeyBlob := CallbackCreate(GetMethod(implObj, "get_EncryptedKeyBlob"), flags, 3)
        this.vtbl.get_EncryptionAlgorithm := CallbackCreate(GetMethod(implObj, "get_EncryptionAlgorithm"), flags, 2)
        this.vtbl.get_EncryptionStrength := CallbackCreate(GetMethod(implObj, "get_EncryptionStrength"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InitializeEncode)
        CallbackFree(this.vtbl.InitializeDecode)
        CallbackFree(this.vtbl.get_EncryptedKeyBlob)
        CallbackFree(this.vtbl.get_EncryptionAlgorithm)
        CallbackFree(this.vtbl.get_EncryptionStrength)
    }
}
