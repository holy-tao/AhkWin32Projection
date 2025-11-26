#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IObjectId.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Represents information used to sign a certificate request.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509signatureinformation
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509SignatureInformation extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509SignatureInformation
     * @type {Guid}
     */
    static IID => Guid("{728ab33c-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HashAlgorithm", "put_HashAlgorithm", "get_PublicKeyAlgorithm", "put_PublicKeyAlgorithm", "get_Parameters", "put_Parameters", "get_AlternateSignatureAlgorithm", "put_AlternateSignatureAlgorithm", "get_AlternateSignatureAlgorithmSet", "get_NullSigned", "put_NullSigned", "GetSignatureAlgorithm", "SetDefaultValues"]

    /**
     * @type {IObjectId} 
     */
    HashAlgorithm {
        get => this.get_HashAlgorithm()
        set => this.put_HashAlgorithm(value)
    }

    /**
     * @type {IObjectId} 
     */
    PublicKeyAlgorithm {
        get => this.get_PublicKeyAlgorithm()
        set => this.put_PublicKeyAlgorithm(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    AlternateSignatureAlgorithm {
        get => this.get_AlternateSignatureAlgorithm()
        set => this.put_AlternateSignatureAlgorithm(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    AlternateSignatureAlgorithmSet {
        get => this.get_AlternateSignatureAlgorithmSet()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    NullSigned {
        get => this.get_NullSigned()
        set => this.put_NullSigned(value)
    }

    /**
     * 
     * @returns {IObjectId} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509signatureinformation-get_hashalgorithm
     */
    get_HashAlgorithm() {
        result := ComCall(7, this, "ptr*", &ppValue := 0, "HRESULT")
        return IObjectId(ppValue)
    }

    /**
     * 
     * @param {IObjectId} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509signatureinformation-put_hashalgorithm
     */
    put_HashAlgorithm(pValue) {
        result := ComCall(8, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IObjectId} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509signatureinformation-get_publickeyalgorithm
     */
    get_PublicKeyAlgorithm() {
        result := ComCall(9, this, "ptr*", &ppValue := 0, "HRESULT")
        return IObjectId(ppValue)
    }

    /**
     * 
     * @param {IObjectId} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509signatureinformation-put_publickeyalgorithm
     */
    put_PublicKeyAlgorithm(pValue) {
        result := ComCall(10, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509signatureinformation-get_parameters
     */
    get_Parameters(Encoding) {
        pValue := BSTR()
        result := ComCall(11, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509signatureinformation-put_parameters
     */
    put_Parameters(Encoding, Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(12, this, "int", Encoding, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509signatureinformation-get_alternatesignaturealgorithm
     */
    get_AlternateSignatureAlgorithm() {
        result := ComCall(13, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509signatureinformation-put_alternatesignaturealgorithm
     */
    put_AlternateSignatureAlgorithm(Value) {
        result := ComCall(14, this, "short", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509signatureinformation-get_alternatesignaturealgorithmset
     */
    get_AlternateSignatureAlgorithmSet() {
        result := ComCall(15, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509signatureinformation-get_nullsigned
     */
    get_NullSigned() {
        result := ComCall(16, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509signatureinformation-put_nullsigned
     */
    put_NullSigned(Value) {
        result := ComCall(17, this, "short", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Pkcs7Signature 
     * @param {VARIANT_BOOL} SignatureKey 
     * @returns {IObjectId} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509signatureinformation-getsignaturealgorithm
     */
    GetSignatureAlgorithm(Pkcs7Signature, SignatureKey) {
        result := ComCall(18, this, "short", Pkcs7Signature, "short", SignatureKey, "ptr*", &ppValue := 0, "HRESULT")
        return IObjectId(ppValue)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509signatureinformation-setdefaultvalues
     */
    SetDefaultValues() {
        result := ComCall(19, this, "HRESULT")
        return result
    }
}
