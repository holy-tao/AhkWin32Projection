#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\EncodingType.ahk" { EncodingType }
#Import ".\IX509Attribute.ahk" { IX509Attribute }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Represents an attribute that contains a SHA-1 hash of the encrypted private key to be archived by a certification authority.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/nn-certenroll-ix509attributearchivekeyhash
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct IX509AttributeArchiveKeyHash extends IX509Attribute {
    /**
     * The interface identifier for IX509AttributeArchiveKeyHash
     * @type {Guid}
     */
    static IID := Guid("{728ab328-217d-11da-b2a4-000e7bbb2b09}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IX509AttributeArchiveKeyHash interfaces
    */
    struct Vtbl extends IX509Attribute.Vtbl {
        InitializeEncodeFromEncryptedKeyBlob : IntPtr
        InitializeDecode                     : IntPtr
        get_EncryptedKeyHashBlob             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IX509AttributeArchiveKeyHash.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes the attribute from an encrypted private key.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) for this attribute is <b>XCN_OID_ENCRYPTED_KEY_HASH</b> (1.3.6.1.4.1.311.21.21). For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-certenroll_objectid">CERTENROLL_OBJECTID</a>.
     * 
     * You must call either <b>InitializeEncodeFromEncryptedKeyBlob</b> or <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributearchivekeyhash-initializedecode">InitializeDecode</a> before you can use an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509attributearchivekeyhash">IX509AttributeArchiveKeyHash</a> object. The two methods complement each other. The <b>InitializeEncodeFromEncryptedKeyBlob</b> method enables you to construct an encoded <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Abstract Syntax Notation One</a> (ASN.1) structure from raw data, and the <b>InitializeDecode</b> method enables you to initialize raw data from an encoded ASN.1 structure. You can call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributearchivekeyhash-get_encryptedkeyhashblob">EncryptedKeyHashBlob</a> property to retrieve the raw data.
     * @param {EncodingType} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode encoding applied to the input string that contains the key.
     * @param {BSTR} strEncryptedKeyBlob A <b>BSTR</b> variable that contains the encrypted key.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509attributearchivekeyhash-initializeencodefromencryptedkeyblob
     */
    InitializeEncodeFromEncryptedKeyBlob(Encoding, strEncryptedKeyBlob) {
        strEncryptedKeyBlob := strEncryptedKeyBlob is String ? BSTR.Alloc(strEncryptedKeyBlob).Value : strEncryptedKeyBlob

        result := ComCall(10, this, EncodingType, Encoding, BSTR, strEncryptedKeyBlob, "HRESULT")
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
     * @param {EncodingType} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode encoding applied to the input string that contains hash value.
     * @param {BSTR} strEncodedData A <b>BSTR</b> variable that contains the DER-encoded attribute.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509attributearchivekeyhash-initializedecode
     */
    InitializeDecode(Encoding, strEncodedData) {
        strEncodedData := strEncodedData is String ? BSTR.Alloc(strEncodedData).Value : strEncodedData

        result := ComCall(11, this, EncodingType, Encoding, BSTR, strEncodedData, "HRESULT")
        return result
    }

    /**
     * Retrieves a string that contains a hash of the encrypted private key.
     * @remarks
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributearchivekeyhash-initializeencodefromencryptedkeyblob">InitializeEncodeFromEncryptedKeyBlob</a> method or the  <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509attributearchivekeyhash-initializedecode">InitializeDecode</a> method to initialize the <b>EncryptedKeyHashBlob</b> property.
     * @param {EncodingType} Encoding 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509attributearchivekeyhash-get_encryptedkeyhashblob
     */
    get_EncryptedKeyHashBlob(Encoding) {
        pValue := BSTR.Owned()
        result := ComCall(12, this, EncodingType, Encoding, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    Query(iid) {
        if (IX509AttributeArchiveKeyHash.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InitializeEncodeFromEncryptedKeyBlob := CallbackCreate(GetMethod(implObj, "InitializeEncodeFromEncryptedKeyBlob"), flags, 3)
        this.vtbl.InitializeDecode := CallbackCreate(GetMethod(implObj, "InitializeDecode"), flags, 3)
        this.vtbl.get_EncryptedKeyHashBlob := CallbackCreate(GetMethod(implObj, "get_EncryptedKeyHashBlob"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InitializeEncodeFromEncryptedKeyBlob)
        CallbackFree(this.vtbl.InitializeDecode)
        CallbackFree(this.vtbl.get_EncryptedKeyHashBlob)
    }
}
