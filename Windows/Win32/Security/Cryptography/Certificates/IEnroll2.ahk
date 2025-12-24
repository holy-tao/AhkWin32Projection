#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IEnroll.ahk

/**
 * Represents the Certificate Enrollment Control and is used primarily to generate certificate requests.
 * @see https://docs.microsoft.com/windows/win32/api//xenroll/nn-xenroll-ienroll2
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IEnroll2 extends IEnroll{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnroll2
     * @type {Guid}
     */
    static IID => Guid("{c080e199-b7df-11d2-a421-00c04f79fe8e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 73

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InstallPKCS7Blob", "Reset", "GetSupportedKeySpec", "GetKeyLen", "EnumAlgs", "GetAlgNameWStr", "put_ReuseHardwareKeyIfUnableToGenNew", "get_ReuseHardwareKeyIfUnableToGenNew", "put_HashAlgID", "get_HashAlgID", "SetHStoreMy", "SetHStoreCA", "SetHStoreROOT", "SetHStoreRequest", "put_LimitExchangeKeyToEncipherment", "get_LimitExchangeKeyToEncipherment", "put_EnableSMIMECapabilities", "get_EnableSMIMECapabilities"]

    /**
     */
    ReuseHardwareKeyIfUnableToGenNew {
        get => this.get_ReuseHardwareKeyIfUnableToGenNew()
        set => this.put_ReuseHardwareKeyIfUnableToGenNew(value)
    }

    /**
     */
    HashAlgID {
        get => this.get_HashAlgID()
        set => this.put_HashAlgID(value)
    }

    /**
     */
    LimitExchangeKeyToEncipherment {
        get => this.get_LimitExchangeKeyToEncipherment()
        set => this.put_LimitExchangeKeyToEncipherment(value)
    }

    /**
     */
    EnableSMIMECapabilities {
        get => this.get_EnableSMIMECapabilities()
        set => this.put_EnableSMIMECapabilities(value)
    }

    /**
     * Processes a certificate or chain of certificates, placing them into the appropriate certificate stores. This method differs from the acceptPKCS7Blob method in that InstallPKCS7Blob does not receive a request certificate.
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pBlobPKCS7 A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure that contains a certificate or chain of certificates.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success.
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll2-installpkcs7blob
     */
    InstallPKCS7Blob(pBlobPKCS7) {
        result := ComCall(73, this, "ptr", pBlobPKCS7, "HRESULT")
        return result
    }

    /**
     * Returns the certificate enrollment control object to its initial state and thereby allows reuse of the control.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success.
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll2-reset
     */
    Reset() {
        result := ComCall(74, this, "HRESULT")
        return result
    }

    /**
     * Retrieves information regarding the current cryptographic service provider (CSP) support for signature and/or exchange operations.
     * @param {Pointer<Integer>} pdwKeySpec A pointer to a <b>LONG</b> that receives a bit flag indicating whether the current CSP supports <a href="https://docs.microsoft.com/windows/desktop/SecGloss/e-gly">exchange</a> and/or <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">signature keys</a>.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success. If a CSP does not support this method, an error is returned.
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll2-getsupportedkeyspec
     */
    GetSupportedKeySpec(pdwKeySpec) {
        pdwKeySpecMarshal := pdwKeySpec is VarRef ? "int*" : "ptr"

        result := ComCall(75, this, pdwKeySpecMarshal, pdwKeySpec, "HRESULT")
        return result
    }

    /**
     * The IEnroll4::GetKeyLen method retrieves the minimum and maximum key lengths for the signature and exchange keys.
     * @param {BOOL} fMin Boolean value indicating which key length (minimum or maximum) is retrieved. If <i>fMin</i> is <b>TRUE</b>, the minimum key length is retrieved; if it is <b>FALSE</b>, the maximum key length is retrieved.
     * @param {BOOL} fExchange Boolean value indicating the type of key. If <i>fExchange</i> is <b>TRUE</b>, the exchange key length is retrieved; if it is <b>FALSE</b>, the signature key length is retrieved.
     * @param {Pointer<Integer>} pdwKeySize Pointer that receives the key's minimum or maximum length, in bits.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success, and *<i>pdwKeySize</i> will be the value representing the length (in bits) for the key's minimum or maximum length.
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll2-getkeylen
     */
    GetKeyLen(fMin, fExchange, pdwKeySize) {
        pdwKeySizeMarshal := pdwKeySize is VarRef ? "int*" : "ptr"

        result := ComCall(76, this, "int", fMin, "int", fExchange, pdwKeySizeMarshal, pdwKeySize, "HRESULT")
        return result
    }

    /**
     * Retrieves the IDs of cryptographic algorithms in a given algorithm class that are supported by the current cryptographic service provider (CSP).
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
     * @param {Pointer<Integer>} pdwAlgID A pointer to LONG which receives a cryptographic algorithm ID which is supported by the current CSP.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success. When there are no more algorithms to enumerate, the value ERROR_NO_MORE_ITEMS is returned.
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll2-enumalgs
     */
    EnumAlgs(dwIndex, algClass, pdwAlgID) {
        pdwAlgIDMarshal := pdwAlgID is VarRef ? "int*" : "ptr"

        result := ComCall(77, this, "int", dwIndex, "int", algClass, pdwAlgIDMarshal, pdwAlgID, "HRESULT")
        return result
    }

    /**
     * Retrieves the name of a cryptographic algorithm given its ID. The values retrieved by this method depend on the current cryptographic service provider (CSP).
     * @param {Integer} algID Value representing a cryptographic algorithm, as defined in Wincrypt.h. For example, CALG_MD2 is a defined algorithm identifier. For this method to be successful, the current CSP must support the <i>algID</i> algorithm.
     * @param {Pointer<PWSTR>} ppwsz Upon success, pointer to a <b>LPWSTR</b> that represents the name of the algorithm specified by <i>algID</i>.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success. If a CSP does not support this method or does not support the <i>algID</i> cryptographic algorithm, an error is returned.
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll2-getalgnamewstr
     */
    GetAlgNameWStr(algID, ppwsz) {
        ppwszMarshal := ppwsz is VarRef ? "ptr*" : "ptr"

        result := ComCall(78, this, "int", algID, ppwszMarshal, ppwsz, "HRESULT")
        return result
    }

    /**
     * The ReuseHardwareKeyIfUnableToGenNew property of IEnroll4 sets or retrieves a Boolean value that determines the action taken by the certificate enrollment control object if an error is encountered when generating a new key.
     * @remarks
     * 
     * This property is a Boolean value. This property affects only <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service providers</a> (CSP) that return NTE_TOKEN_KEYSET_STORAGE_FULL. These CSPs are typically hardware-based; an example is a smart card. If this property is <b>TRUE</b> and an error is encountered while generating a new key, the certificate enrollment control object will reuse the existing hardware key. If this property is <b>FALSE</b> and an error is encountered while generating a new key, the certificate enrollment control object will not reuse the existing hardware key but will instead pass an error to the caller.
     * 
     * 
     * @param {BOOL} fReuseHardwareKeyIfUnableToGenNew 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll2-put_reusehardwarekeyifunabletogennew
     */
    put_ReuseHardwareKeyIfUnableToGenNew(fReuseHardwareKeyIfUnableToGenNew) {
        result := ComCall(79, this, "int", fReuseHardwareKeyIfUnableToGenNew, "HRESULT")
        return result
    }

    /**
     * The ReuseHardwareKeyIfUnableToGenNew property of IEnroll4 sets or retrieves a Boolean value that determines the action taken by the certificate enrollment control object if an error is encountered when generating a new key.
     * @remarks
     * 
     * This property is a Boolean value. This property affects only <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service providers</a> (CSP) that return NTE_TOKEN_KEYSET_STORAGE_FULL. These CSPs are typically hardware-based; an example is a smart card. If this property is <b>TRUE</b> and an error is encountered while generating a new key, the certificate enrollment control object will reuse the existing hardware key. If this property is <b>FALSE</b> and an error is encountered while generating a new key, the certificate enrollment control object will not reuse the existing hardware key but will instead pass an error to the caller.
     * 
     * 
     * @param {Pointer<BOOL>} fReuseHardwareKeyIfUnableToGenNew 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll2-get_reusehardwarekeyifunabletogennew
     */
    get_ReuseHardwareKeyIfUnableToGenNew(fReuseHardwareKeyIfUnableToGenNew) {
        fReuseHardwareKeyIfUnableToGenNewMarshal := fReuseHardwareKeyIfUnableToGenNew is VarRef ? "int*" : "ptr"

        result := ComCall(80, this, fReuseHardwareKeyIfUnableToGenNewMarshal, fReuseHardwareKeyIfUnableToGenNew, "HRESULT")
        return result
    }

    /**
     * The HashAlgID property of IEnroll4 sets or retrieves the hash algorithm used when signing a PKCS
     * @remarks
     * 
     * The values for this property are <a href="https://docs.microsoft.com/windows/desktop/SecGloss/h-gly">hash algorithm</a> IDs, such as those returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll2-enumalgs">EnumAlgs</a> method. If both the <b>HashAlgID</b> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-get_hashalgorithmwstr">HashAlgorithmWStr</a> properties are set, whichever has been updated most recently determines the hash algorithm used to sign the PKCS #10 request.
     * 
     * 
     * @param {Integer} hashAlgID 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll2-put_hashalgid
     */
    put_HashAlgID(hashAlgID) {
        result := ComCall(81, this, "int", hashAlgID, "HRESULT")
        return result
    }

    /**
     * The HashAlgID property of IEnroll4 sets or retrieves the hash algorithm used when signing a PKCS
     * @remarks
     * 
     * The values for this property are <a href="https://docs.microsoft.com/windows/desktop/SecGloss/h-gly">hash algorithm</a> IDs, such as those returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll2-enumalgs">EnumAlgs</a> method. If both the <b>HashAlgID</b> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-get_hashalgorithmwstr">HashAlgorithmWStr</a> properties are set, whichever has been updated most recently determines the hash algorithm used to sign the PKCS #10 request.
     * 
     * 
     * @param {Pointer<Integer>} hashAlgID 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll2-get_hashalgid
     */
    get_HashAlgID(hashAlgID) {
        hashAlgIDMarshal := hashAlgID is VarRef ? "int*" : "ptr"

        result := ComCall(82, this, hashAlgIDMarshal, hashAlgID, "HRESULT")
        return result
    }

    /**
     * The SetHStoreMy method specifies the handle to use for the MY store. This method was first defined in the IEnroll2 interface.
     * @param {HCERTSTORE} hStore Certificate store handle to use for the MY store.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success.
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll2-sethstoremy
     */
    SetHStoreMy(hStore) {
        hStore := hStore is Win32Handle ? NumGet(hStore, "ptr") : hStore

        result := ComCall(83, this, "ptr", hStore, "HRESULT")
        return result
    }

    /**
     * The SetHStoreCA method specifies the handle to use for the CA store. This method was first defined in the IEnroll2 interface.
     * @param {HCERTSTORE} hStore Certificate store handle to use for the CA store.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success.
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll2-sethstoreca
     */
    SetHStoreCA(hStore) {
        hStore := hStore is Win32Handle ? NumGet(hStore, "ptr") : hStore

        result := ComCall(84, this, "ptr", hStore, "HRESULT")
        return result
    }

    /**
     * The SetHStoreROOT method specifies the handle to use for the Root store. This method was first defined in the IEnroll2 interface.
     * @param {HCERTSTORE} hStore Certificate store handle to use for the Root store.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success.
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll2-sethstoreroot
     */
    SetHStoreROOT(hStore) {
        hStore := hStore is Win32Handle ? NumGet(hStore, "ptr") : hStore

        result := ComCall(85, this, "ptr", hStore, "HRESULT")
        return result
    }

    /**
     * The SetHStoreRequest method specifies the handle to use for the request store. This method was first defined in the IEnroll2 interface.
     * @param {HCERTSTORE} hStore Certificate store handle to use for the request store.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success.
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll2-sethstorerequest
     */
    SetHStoreRequest(hStore) {
        hStore := hStore is Win32Handle ? NumGet(hStore, "ptr") : hStore

        result := ComCall(86, this, "ptr", hStore, "HRESULT")
        return result
    }

    /**
     * The LimitExchangeKeyToEncipherment property of IEnroll4 sets or retrieves a Boolean value that determines whether an AT_KEYEXCHANGE request contains digital signature and nonrepudiation key usages.
     * @remarks
     * 
     * This property is a Boolean value and affects only AT_KEYEXCHANGE requests. It has no impact on AT_SIGNATURE requests.
     * 
     * 
     * If the value for this property is <b>FALSE</b>, an AT_KEYEXCHANGE request will contain the following key usages:
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
     * If the value for this property is <b>TRUE</b>, an AT_KEYEXCHANGE request will contain the following key usages:
     * 
     * <ul>
     * <li>CERT_DATA_ENCIPHERMENT_KEY_USAGE</li>
     * <li>CERT_KEY_ENCIPHERMENT_KEY_USAGE</li>
     * </ul>
     * 
     * 
     * @param {BOOL} fLimitExchangeKeyToEncipherment 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll2-put_limitexchangekeytoencipherment
     */
    put_LimitExchangeKeyToEncipherment(fLimitExchangeKeyToEncipherment) {
        result := ComCall(87, this, "int", fLimitExchangeKeyToEncipherment, "HRESULT")
        return result
    }

    /**
     * The LimitExchangeKeyToEncipherment property of IEnroll4 sets or retrieves a Boolean value that determines whether an AT_KEYEXCHANGE request contains digital signature and nonrepudiation key usages.
     * @remarks
     * 
     * This property is a Boolean value and affects only AT_KEYEXCHANGE requests. It has no impact on AT_SIGNATURE requests.
     * 
     * 
     * If the value for this property is <b>FALSE</b>, an AT_KEYEXCHANGE request will contain the following key usages:
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
     * If the value for this property is <b>TRUE</b>, an AT_KEYEXCHANGE request will contain the following key usages:
     * 
     * <ul>
     * <li>CERT_DATA_ENCIPHERMENT_KEY_USAGE</li>
     * <li>CERT_KEY_ENCIPHERMENT_KEY_USAGE</li>
     * </ul>
     * 
     * 
     * @param {Pointer<BOOL>} fLimitExchangeKeyToEncipherment 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll2-get_limitexchangekeytoencipherment
     */
    get_LimitExchangeKeyToEncipherment(fLimitExchangeKeyToEncipherment) {
        fLimitExchangeKeyToEnciphermentMarshal := fLimitExchangeKeyToEncipherment is VarRef ? "int*" : "ptr"

        result := ComCall(88, this, fLimitExchangeKeyToEnciphermentMarshal, fLimitExchangeKeyToEncipherment, "HRESULT")
        return result
    }

    /**
     * Controls whether the PKCS
     * @param {BOOL} fEnableSMIMECapabilities 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll2-put_enablesmimecapabilities
     */
    put_EnableSMIMECapabilities(fEnableSMIMECapabilities) {
        result := ComCall(89, this, "int", fEnableSMIMECapabilities, "HRESULT")
        return result
    }

    /**
     * Controls whether the PKCS
     * @param {Pointer<BOOL>} fEnableSMIMECapabilities 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll2-get_enablesmimecapabilities
     */
    get_EnableSMIMECapabilities(fEnableSMIMECapabilities) {
        fEnableSMIMECapabilitiesMarshal := fEnableSMIMECapabilities is VarRef ? "int*" : "ptr"

        result := ComCall(90, this, fEnableSMIMECapabilitiesMarshal, fEnableSMIMECapabilities, "HRESULT")
        return result
    }
}
