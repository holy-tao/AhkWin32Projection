#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ICEnroll2.ahk

/**
 * One of several interfaces that represent the Certificate Enrollment Control.
 * @see https://docs.microsoft.com/windows/win32/api//xenroll/nn-xenroll-icenroll3
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICEnroll3 extends ICEnroll2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICEnroll3
     * @type {Guid}
     */
    static IID => Guid("{c28c2d95-b7de-11d2-a421-00c04f79fe8e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 69

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InstallPKCS7", "Reset", "GetSupportedKeySpec", "GetKeyLen", "EnumAlgs", "GetAlgName", "put_ReuseHardwareKeyIfUnableToGenNew", "get_ReuseHardwareKeyIfUnableToGenNew", "put_HashAlgID", "get_HashAlgID", "put_LimitExchangeKeyToEncipherment", "get_LimitExchangeKeyToEncipherment", "put_EnableSMIMECapabilities", "get_EnableSMIMECapabilities"]

    /**
     * @type {BOOL} 
     */
    ReuseHardwareKeyIfUnableToGenNew {
        get => this.get_ReuseHardwareKeyIfUnableToGenNew()
        set => this.put_ReuseHardwareKeyIfUnableToGenNew(value)
    }

    /**
     * @type {Integer} 
     */
    HashAlgID {
        get => this.get_HashAlgID()
        set => this.put_HashAlgID(value)
    }

    /**
     * @type {BOOL} 
     */
    LimitExchangeKeyToEncipherment {
        get => this.get_LimitExchangeKeyToEncipherment()
        set => this.put_LimitExchangeKeyToEncipherment(value)
    }

    /**
     * @type {BOOL} 
     */
    EnableSMIMECapabilities {
        get => this.get_EnableSMIMECapabilities()
        set => this.put_EnableSMIMECapabilities(value)
    }

    /**
     * Processes a certificate or chain of certificates, placing them into the appropriate certificate stores. This method differs from the acceptPKCS7 method in that InstallPKCS7 does not receive a request certificate.
     * @param {BSTR} PKCS7 A string that contains a certificate or chain of certificates.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll3-installpkcs7
     */
    InstallPKCS7(PKCS7) {
        PKCS7 := PKCS7 is String ? BSTR.Alloc(PKCS7).Value : PKCS7

        result := ComCall(69, this, "ptr", PKCS7, "HRESULT")
        return result
    }

    /**
     * Returns the certificate enrollment control object to its initial state and thereby allow reuse of the control. This method was first defined in the ICEnroll3 interface.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll3-reset
     */
    Reset() {
        result := ComCall(70, this, "HRESULT")
        return result
    }

    /**
     * Retrieves information regarding the current cryptographic service provider (CSP) support for signature and/or exchange operations. This method was first defined in the ICEnroll3 interface.
     * @returns {Integer} A pointer to a <b>LONG</b> that receives a bit flag that indicates whether the current CSP supports <a href="https://docs.microsoft.com/windows/desktop/SecGloss/e-gly">exchange</a> and <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">signature keys</a>.
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll3-getsupportedkeyspec
     */
    GetSupportedKeySpec() {
        result := ComCall(71, this, "int*", &pdwKeySpec := 0, "HRESULT")
        return pdwKeySpec
    }

    /**
     * Retrieves the minimum and maximum key lengths for the signature and exchange keys.
     * @param {BOOL} fMin Boolean value indicating which key length (minimum or maximum) is retrieved. If <i>fMin</i> is <b>TRUE</b>, the minimum key length is retrieved; if it is <b>FALSE</b>, the maximum key length is retrieved.
     * @param {BOOL} fExchange Boolean value indicating the type of key. If <i>fExchange</i> is <b>TRUE</b>, the exchange key length is retrieved; if it is <b>FALSE</b>, the signature key length is retrieved.
     * @returns {Integer} Pointer that receives the key's minimum or maximum length, in bits.
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll3-getkeylen
     */
    GetKeyLen(fMin, fExchange) {
        result := ComCall(72, this, "int", fMin, "int", fExchange, "int*", &pdwKeySize := 0, "HRESULT")
        return pdwKeySize
    }

    /**
     * The ICEnroll4::EnumAlgs method retrieves the IDs of cryptographic algorithms in a given algorithm class that are supported by the current cryptographic service provider (CSP).
     * @param {Integer} dwIndex Specifies the ordinal position of the algorithm whose ID will be retrieved. Specify zero for the first algorithm.
     * @param {Integer} algClass A cryptographic algorithm class. The IDs returned by this method will be in the specified class. Specify one of the following:
     * 
     * <ul>
     * <li>ALG_CLASS_HASH</li>
     * <li>ALG_CLASS_KEY_EXCHANGE</li>
     * <li>ALG_CLASS_MSG_ENCRYPT</li>
     * <li>ALG_CLASS_DATA_ENCRYPT</li>
     * <li>ALG_CLASS_SIGNATURE</li>
     * </ul>
     * @returns {Integer} A pointer to a variable to receive a cryptographic algorithm ID that is supported by the current CSP.
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll3-enumalgs
     */
    EnumAlgs(dwIndex, algClass) {
        result := ComCall(73, this, "int", dwIndex, "int", algClass, "int*", &pdwAlgID := 0, "HRESULT")
        return pdwAlgID
    }

    /**
     * Retrieves the name of a cryptographic algorithm given its ID. The values retrieved by this method depend on the current cryptographic service provider (CSP). This method was first defined in the ICEnroll3 interface.
     * @param {Integer} algID A value that represents a cryptographic algorithm, as defined in Wincrypt.h. For example, CALG_MD2 is a defined algorithm identifier. For this method to be successful, the current CSP must support the <i>algID</i> algorithm.
     * @returns {BSTR} Upon success, a pointer to a <b>BSTR</b> that represents the name of the algorithm specified by <i>algID</i>. When you have finished using the <b>BSTR</b>, free it by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll3-getalgname
     */
    GetAlgName(algID) {
        pbstr := BSTR()
        result := ComCall(74, this, "int", algID, "ptr", pbstr, "HRESULT")
        return pbstr
    }

    /**
     * Sets or retrieves a Boolean value that determines the action taken by the certificate enrollment control object if an error is encountered when generating a new key.
     * @remarks
     * 
     * This property is a Boolean value. This property affects only <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service providers</a> that return NTE_TOKEN_KEYSET_STORAGE_FULL. These CSPs are typically hardware-based; an example is a smart card. If this property is true and an error is encountered while generating a new key, the certificate enrollment control object will reuse the existing hardware key. If this property is false and an error is encountered while generating a new key, the certificate enrollment control object will not reuse the existing hardware key but will instead pass an error to the caller.
     * 
     * 
     * 
     * @param {BOOL} fReuseHardwareKeyIfUnableToGenNew 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll3-put_reusehardwarekeyifunabletogennew
     */
    put_ReuseHardwareKeyIfUnableToGenNew(fReuseHardwareKeyIfUnableToGenNew) {
        result := ComCall(75, this, "int", fReuseHardwareKeyIfUnableToGenNew, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a Boolean value that determines the action taken by the certificate enrollment control object if an error is encountered when generating a new key.
     * @remarks
     * 
     * This property is a Boolean value. This property affects only <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service providers</a> that return NTE_TOKEN_KEYSET_STORAGE_FULL. These CSPs are typically hardware-based; an example is a smart card. If this property is true and an error is encountered while generating a new key, the certificate enrollment control object will reuse the existing hardware key. If this property is false and an error is encountered while generating a new key, the certificate enrollment control object will not reuse the existing hardware key but will instead pass an error to the caller.
     * 
     * 
     * 
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll3-get_reusehardwarekeyifunabletogennew
     */
    get_ReuseHardwareKeyIfUnableToGenNew() {
        result := ComCall(76, this, "int*", &fReuseHardwareKeyIfUnableToGenNew := 0, "HRESULT")
        return fReuseHardwareKeyIfUnableToGenNew
    }

    /**
     * Sets or retrieves the hash algorithm used when signing a PKCS
     * @remarks
     * 
     * The values for this property are <a href="https://docs.microsoft.com/windows/desktop/SecGloss/h-gly">hash algorithm</a> IDs, such as those returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll3-enumalgs">EnumAlgs</a> method. If both the <b>HashAlgID</b> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-get_hashalgorithm">HashAlgorithm</a> properties are set, whichever has been updated most recently determines the hash algorithm used to sign the PKCS #10 request.
     * 
     * 
     * 
     * @param {Integer} hashAlgID 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll3-put_hashalgid
     */
    put_HashAlgID(hashAlgID) {
        result := ComCall(77, this, "int", hashAlgID, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the hash algorithm used when signing a PKCS
     * @remarks
     * 
     * The values for this property are <a href="https://docs.microsoft.com/windows/desktop/SecGloss/h-gly">hash algorithm</a> IDs, such as those returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll3-enumalgs">EnumAlgs</a> method. If both the <b>HashAlgID</b> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-get_hashalgorithm">HashAlgorithm</a> properties are set, whichever has been updated most recently determines the hash algorithm used to sign the PKCS #10 request.
     * 
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll3-get_hashalgid
     */
    get_HashAlgID() {
        result := ComCall(78, this, "int*", &hashAlgID := 0, "HRESULT")
        return hashAlgID
    }

    /**
     * Sets or retrieves a Boolean value that determines whether an AT_KEYEXCHANGE request contains digital signature and nonrepudiation key usages.
     * @remarks
     * 
     * This property is a Boolean value and affects only AT_KEYEXCHANGE requests. It has no impact on AT_SIGNATURE requests.
     * 
     * 
     * If the value for this property is false, an AT_KEYEXCHANGE request will contain the following key usages:
     * 
     * <ul>
     * <li>CERT_DATA_ENCIPHERMENT_KEY_USAGE</li>
     * <li>CERT_KEY_ENCIPHERMENT_KEY_USAGE</li>
     * <li>CERT_DIGITAL_SIGNATURE_KEY_USAGE</li>
     * <li>CERT_NON_REPUDIATION_KEY_USAGE</li>
     * </ul>
     * 
     * 
     * 
     * If the value for this property is true, an AT_KEYEXCHANGE request will contain the following key usages:
     * 
     * <ul>
     * <li>CERT_DATA_ENCIPHERMENT_KEY_USAGE</li>
     * <li>CERT_KEY_ENCIPHERMENT_KEY_USAGE</li>
     * </ul>
     * 
     * 
     * 
     * 
     * @param {BOOL} fLimitExchangeKeyToEncipherment 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll3-put_limitexchangekeytoencipherment
     */
    put_LimitExchangeKeyToEncipherment(fLimitExchangeKeyToEncipherment) {
        result := ComCall(79, this, "int", fLimitExchangeKeyToEncipherment, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a Boolean value that determines whether an AT_KEYEXCHANGE request contains digital signature and nonrepudiation key usages.
     * @remarks
     * 
     * This property is a Boolean value and affects only AT_KEYEXCHANGE requests. It has no impact on AT_SIGNATURE requests.
     * 
     * 
     * If the value for this property is false, an AT_KEYEXCHANGE request will contain the following key usages:
     * 
     * <ul>
     * <li>CERT_DATA_ENCIPHERMENT_KEY_USAGE</li>
     * <li>CERT_KEY_ENCIPHERMENT_KEY_USAGE</li>
     * <li>CERT_DIGITAL_SIGNATURE_KEY_USAGE</li>
     * <li>CERT_NON_REPUDIATION_KEY_USAGE</li>
     * </ul>
     * 
     * 
     * 
     * If the value for this property is true, an AT_KEYEXCHANGE request will contain the following key usages:
     * 
     * <ul>
     * <li>CERT_DATA_ENCIPHERMENT_KEY_USAGE</li>
     * <li>CERT_KEY_ENCIPHERMENT_KEY_USAGE</li>
     * </ul>
     * 
     * 
     * 
     * 
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll3-get_limitexchangekeytoencipherment
     */
    get_LimitExchangeKeyToEncipherment() {
        result := ComCall(80, this, "int*", &fLimitExchangeKeyToEncipherment := 0, "HRESULT")
        return fLimitExchangeKeyToEncipherment
    }

    /**
     * The ICEnroll4::EnableSMIMECapabilities property controls whether the PKCS
     * @param {BOOL} fEnableSMIMECapabilities 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll3-put_enablesmimecapabilities
     */
    put_EnableSMIMECapabilities(fEnableSMIMECapabilities) {
        result := ComCall(81, this, "int", fEnableSMIMECapabilities, "HRESULT")
        return result
    }

    /**
     * The ICEnroll4::EnableSMIMECapabilities property controls whether the PKCS
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll3-get_enablesmimecapabilities
     */
    get_EnableSMIMECapabilities() {
        result := ComCall(82, this, "int*", &fEnableSMIMECapabilities := 0, "HRESULT")
        return fEnableSMIMECapabilities
    }
}
