#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\HCERTSTORE.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Represents the Certificate Enrollment Control and is used primarily to generate certificate requests.
 * @see https://docs.microsoft.com/windows/win32/api//xenroll/nn-xenroll-ienroll
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IEnroll extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnroll
     * @type {Guid}
     */
    static IID => Guid("{acaa7838-4585-11d1-ab57-00c04fc295e1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["createFilePKCS10WStr", "acceptFilePKCS7WStr", "createPKCS10WStr", "acceptPKCS7Blob", "getCertContextFromPKCS7", "getMyStore", "getCAStore", "getROOTHStore", "enumProvidersWStr", "enumContainersWStr", "freeRequestInfoBlob", "get_MyStoreNameWStr", "put_MyStoreNameWStr", "get_MyStoreTypeWStr", "put_MyStoreTypeWStr", "get_MyStoreFlags", "put_MyStoreFlags", "get_CAStoreNameWStr", "put_CAStoreNameWStr", "get_CAStoreTypeWStr", "put_CAStoreTypeWStr", "get_CAStoreFlags", "put_CAStoreFlags", "get_RootStoreNameWStr", "put_RootStoreNameWStr", "get_RootStoreTypeWStr", "put_RootStoreTypeWStr", "get_RootStoreFlags", "put_RootStoreFlags", "get_RequestStoreNameWStr", "put_RequestStoreNameWStr", "get_RequestStoreTypeWStr", "put_RequestStoreTypeWStr", "get_RequestStoreFlags", "put_RequestStoreFlags", "get_ContainerNameWStr", "put_ContainerNameWStr", "get_ProviderNameWStr", "put_ProviderNameWStr", "get_ProviderType", "put_ProviderType", "get_KeySpec", "put_KeySpec", "get_ProviderFlags", "put_ProviderFlags", "get_UseExistingKeySet", "put_UseExistingKeySet", "get_GenKeyFlags", "put_GenKeyFlags", "get_DeleteRequestCert", "put_DeleteRequestCert", "get_WriteCertToUserDS", "put_WriteCertToUserDS", "get_EnableT61DNEncoding", "put_EnableT61DNEncoding", "get_WriteCertToCSP", "put_WriteCertToCSP", "get_SPCFileNameWStr", "put_SPCFileNameWStr", "get_PVKFileNameWStr", "put_PVKFileNameWStr", "get_HashAlgorithmWStr", "put_HashAlgorithmWStr", "get_RenewalCertificate", "put_RenewalCertificate", "AddCertTypeToRequestWStr", "AddNameValuePairToSignatureWStr", "AddExtensionsToRequest", "AddAuthenticatedAttributesToPKCS7Request", "CreatePKCS7RequestFromRequest"]

    /**
     */
    MyStoreNameWStr {
        get => this.get_MyStoreNameWStr()
        set => this.put_MyStoreNameWStr(value)
    }

    /**
     */
    MyStoreTypeWStr {
        get => this.get_MyStoreTypeWStr()
        set => this.put_MyStoreTypeWStr(value)
    }

    /**
     */
    MyStoreFlags {
        get => this.get_MyStoreFlags()
        set => this.put_MyStoreFlags(value)
    }

    /**
     */
    CAStoreNameWStr {
        get => this.get_CAStoreNameWStr()
        set => this.put_CAStoreNameWStr(value)
    }

    /**
     */
    CAStoreTypeWStr {
        get => this.get_CAStoreTypeWStr()
        set => this.put_CAStoreTypeWStr(value)
    }

    /**
     */
    CAStoreFlags {
        get => this.get_CAStoreFlags()
        set => this.put_CAStoreFlags(value)
    }

    /**
     */
    RootStoreNameWStr {
        get => this.get_RootStoreNameWStr()
        set => this.put_RootStoreNameWStr(value)
    }

    /**
     */
    RootStoreTypeWStr {
        get => this.get_RootStoreTypeWStr()
        set => this.put_RootStoreTypeWStr(value)
    }

    /**
     */
    RootStoreFlags {
        get => this.get_RootStoreFlags()
        set => this.put_RootStoreFlags(value)
    }

    /**
     */
    RequestStoreNameWStr {
        get => this.get_RequestStoreNameWStr()
        set => this.put_RequestStoreNameWStr(value)
    }

    /**
     */
    RequestStoreTypeWStr {
        get => this.get_RequestStoreTypeWStr()
        set => this.put_RequestStoreTypeWStr(value)
    }

    /**
     */
    RequestStoreFlags {
        get => this.get_RequestStoreFlags()
        set => this.put_RequestStoreFlags(value)
    }

    /**
     */
    ContainerNameWStr {
        get => this.get_ContainerNameWStr()
        set => this.put_ContainerNameWStr(value)
    }

    /**
     */
    ProviderNameWStr {
        get => this.get_ProviderNameWStr()
        set => this.put_ProviderNameWStr(value)
    }

    /**
     */
    ProviderType {
        get => this.get_ProviderType()
        set => this.put_ProviderType(value)
    }

    /**
     */
    KeySpec {
        get => this.get_KeySpec()
        set => this.put_KeySpec(value)
    }

    /**
     */
    ProviderFlags {
        get => this.get_ProviderFlags()
        set => this.put_ProviderFlags(value)
    }

    /**
     */
    UseExistingKeySet {
        get => this.get_UseExistingKeySet()
        set => this.put_UseExistingKeySet(value)
    }

    /**
     */
    GenKeyFlags {
        get => this.get_GenKeyFlags()
        set => this.put_GenKeyFlags(value)
    }

    /**
     */
    DeleteRequestCert {
        get => this.get_DeleteRequestCert()
        set => this.put_DeleteRequestCert(value)
    }

    /**
     */
    WriteCertToUserDS {
        get => this.get_WriteCertToUserDS()
        set => this.put_WriteCertToUserDS(value)
    }

    /**
     */
    EnableT61DNEncoding {
        get => this.get_EnableT61DNEncoding()
        set => this.put_EnableT61DNEncoding(value)
    }

    /**
     */
    WriteCertToCSP {
        get => this.get_WriteCertToCSP()
        set => this.put_WriteCertToCSP(value)
    }

    /**
     */
    SPCFileNameWStr {
        get => this.get_SPCFileNameWStr()
        set => this.put_SPCFileNameWStr(value)
    }

    /**
     */
    PVKFileNameWStr {
        get => this.get_PVKFileNameWStr()
        set => this.put_PVKFileNameWStr(value)
    }

    /**
     */
    HashAlgorithmWStr {
        get => this.get_HashAlgorithmWStr()
        set => this.put_HashAlgorithmWStr(value)
    }

    /**
     */
    RenewalCertificate {
        get => this.get_RenewalCertificate()
        set => this.put_RenewalCertificate(value)
    }

    /**
     * Creates a base64-encoded PKCS
     * @remarks
     * 
     * By default, the Microsoft Base Cryptographic Provider is used, and a unique signature key is created.
     * 
     * 
     * @param {PWSTR} DNName The distinguished name (DN) of the entity for which the request is being made. <i>DNName</i> must follow the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/x-gly">X.500</a> naming convention. For example, "CN=User, O=Microsoft". If a two-letter prefix does not exist, an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) may be provided instead.
     * @param {PWSTR} Usage An <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">OID</a> that describes the purpose of the certificate being generated, for example, individual or commercial Authenticode certificate, or client authentication. You can also specify multiple OIDs separated by a comma.
     * 
     * The OID is passed through to the PKCS #10 request. The control does not examine the OID.
     * @param {PWSTR} wszPKCS10FileName The name of the file in which the base64-encoded PKCS #10 is saved. The contents of this file may be submitted to a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a> for processing.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-createfilepkcs10wstr
     */
    createFilePKCS10WStr(DNName, Usage, wszPKCS10FileName) {
        DNName := DNName is String ? StrPtr(DNName) : DNName
        Usage := Usage is String ? StrPtr(Usage) : Usage
        wszPKCS10FileName := wszPKCS10FileName is String ? StrPtr(wszPKCS10FileName) : wszPKCS10FileName

        result := ComCall(3, this, "ptr", DNName, "ptr", Usage, "ptr", wszPKCS10FileName, "HRESULT")
        return result
    }

    /**
     * Accepts and processes a PKCS
     * @param {PWSTR} wszPKCS7FileName Specifies the name of the file containing the PKCS #7.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success. Upon successful completion of this function, the PKCS #7 in the file will be accepted.
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-acceptfilepkcs7wstr
     */
    acceptFilePKCS7WStr(wszPKCS7FileName) {
        wszPKCS7FileName := wszPKCS7FileName is String ? StrPtr(wszPKCS7FileName) : wszPKCS7FileName

        result := ComCall(4, this, "ptr", wszPKCS7FileName, "HRESULT")
        return result
    }

    /**
     * Creates a base64-encoded PKCS
     * @param {PWSTR} DNName A null-terminated Unicode string that contains the distinguished name (DN) of the entity for which the request is being made. In this parameter, the DN name must follow the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/x-gly">X.500</a> naming convention. For example "CN=User, O=Microsoft". If a two-letter prefix does not exist, an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) may be provided instead.
     * @param {PWSTR} Usage A null-terminated Unicode string that contains an OID that describes the purpose of the certificate being generated. For example, Individual or Commercial Authenticode certificate, or Client Authentication. You can also specify multiple OIDs separated by a comma.
     * 
     * The  OID is passed through to the PKCS #10 request. For general extensibility and ease of understanding, the control does not attempt to understand specific-purpose OIDs. Therefore if you specify a Client Authentication OID, the generated key will still be a signature key, not an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/e-gly">exchange key</a>.
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pPkcs10Blob A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> that receives the base64-encoded PKCS10 certificate request.
     * 
     * When you have finished using this memory, free it by passing the <b>pbData</b> member of this structure to the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @returns {HRESULT} If the method succeeds, the method returns S_OK and <i>pPkcs10Blob</i> contains a base64-encoded PKCS #10 request that can be directly posted to a web server for processing.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-createpkcs10wstr
     */
    createPKCS10WStr(DNName, Usage, pPkcs10Blob) {
        DNName := DNName is String ? StrPtr(DNName) : DNName
        Usage := Usage is String ? StrPtr(Usage) : Usage

        result := ComCall(5, this, "ptr", DNName, "ptr", Usage, "ptr", pPkcs10Blob, "HRESULT")
        return result
    }

    /**
     * Accepts and processes a PKCS
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pBlobPKCS7 Represents the base64-encoded PKCS #7 containing the certificate and the chain of certificates identifying the issuer.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success. Upon successful completion of this function, the PKCS #7 will be accepted.
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-acceptpkcs7blob
     */
    acceptPKCS7Blob(pBlobPKCS7) {
        result := ComCall(6, this, "ptr", pBlobPKCS7, "HRESULT")
        return result
    }

    /**
     * Retrieves a certificate context based on a PKCS
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pBlobPKCS7 A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure that represents the PKCS #7.
     * @returns {Pointer<CERT_CONTEXT>} The return value is a pointer to a <a href="/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> representing the certificate context, or <b>NULL</b> if the method fails.
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-getcertcontextfrompkcs7
     */
    getCertContextFromPKCS7(pBlobPKCS7) {
        result := ComCall(7, this, "ptr", pBlobPKCS7, "ptr")
        return result
    }

    /**
     * The getMyStore method is not implemented.
     * @returns {HCERTSTORE} This method always returns <b>NULL</b>. <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> will return <b>ERROR_CALL_NOT_IMPLEMENTED</b>.
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-getmystore
     */
    getMyStore() {
        result := ComCall(8, this, "ptr")
        return HCERTSTORE({Value: result}, True)
    }

    /**
     * The getCAStore method is not implemented.
     * @returns {HCERTSTORE} This method always returns <b>NULL</b>. <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> will return <b>ERROR_CALL_NOT_IMPLEMENTED</b>.
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-getcastore
     */
    getCAStore() {
        result := ComCall(9, this, "ptr")
        return HCERTSTORE({Value: result}, True)
    }

    /**
     * The getROOTHStore method is not implemented.
     * @returns {HCERTSTORE} This method always returns <b>NULL</b>. <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> will return <b>ERROR_CALL_NOT_IMPLEMENTED</b>.
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-getroothstore
     */
    getROOTHStore() {
        result := ComCall(10, this, "ptr")
        return HCERTSTORE({Value: result}, True)
    }

    /**
     * The IEnroll4::enumProvidersWStr method retrieves the names of the available cryptographic service providers (CSPs) specified by the ProviderType property.
     * @param {Integer} dwIndex Specifies the ordinal position of the CSP whose name will be retrieved. Specify zero for the first CSP.
     * @param {Integer} dwFlags Specifies flags that are passed through to the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptenumprovidersa">CryptEnumProviders</a> function. Not currently used; specify zero.
     * @param {Pointer<PWSTR>} pbstrProvName A pointer to a <b>LPWSTR</b> variable that receives the name of a CSP with the specified property type.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success. The value ERROR_NO_MORE_ITEMS is returned when there are no more CSPs with the property type indicated by the 
     * <a href="/windows/desktop/api/xenroll/nf-xenroll-ienroll-get_providertype">ProviderType</a> property.
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-enumproviderswstr
     */
    enumProvidersWStr(dwIndex, dwFlags, pbstrProvName) {
        pbstrProvNameMarshal := pbstrProvName is VarRef ? "ptr*" : "ptr"

        result := ComCall(11, this, "int", dwIndex, "int", dwFlags, pbstrProvNameMarshal, pbstrProvName, "HRESULT")
        return result
    }

    /**
     * Retrieves the names of containers for the cryptographic service provider (CSP) specified by the ProviderNameWStr property.
     * @param {Integer} dwIndex Specifies the ordinal position of the container whose name will be retrieved. Specify zero for the first container.
     * @param {Pointer<PWSTR>} pbstr A pointer to a <b>LPWSTR</b> variable that receives the name of the container.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success. The value ERROR_NO_MORE_ITEMS is returned when there are no more items.
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-enumcontainerswstr
     */
    enumContainersWStr(dwIndex, pbstr) {
        pbstrMarshal := pbstr is VarRef ? "ptr*" : "ptr"

        result := ComCall(12, this, "int", dwIndex, pbstrMarshal, pbstr, "HRESULT")
        return result
    }

    /**
     * The freeRequestInfoBlob method deletes a certificate context. This method was first defined in the IEnroll interface.
     * @param {CRYPT_INTEGER_BLOB} pkcs7OrPkcs10 A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure that specifies the session information whose context is being deleted.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success.
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-freerequestinfoblob
     */
    freeRequestInfoBlob(pkcs7OrPkcs10) {
        result := ComCall(13, this, "ptr", pkcs7OrPkcs10, "HRESULT")
        return result
    }

    /**
     * The MyStoreNameWStr property of IEnroll4 sets or retrieves the name of the store where certificates with linked private keys are kept.
     * @remarks
     * 
     * The <b>MyStoreNameWStr</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptpkcs7blob">acceptPKCS7Blob</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptfilepkcs7wstr">acceptFilePKCS7WStr</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {Pointer<PWSTR>} szwName 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-get_mystorenamewstr
     */
    get_MyStoreNameWStr(szwName) {
        szwNameMarshal := szwName is VarRef ? "ptr*" : "ptr"

        result := ComCall(14, this, szwNameMarshal, szwName, "HRESULT")
        return result
    }

    /**
     * The MyStoreNameWStr property of IEnroll4 sets or retrieves the name of the store where certificates with linked private keys are kept.
     * @remarks
     * 
     * The <b>MyStoreNameWStr</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptpkcs7blob">acceptPKCS7Blob</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptfilepkcs7wstr">acceptFilePKCS7WStr</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {PWSTR} szwName 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-put_mystorenamewstr
     */
    put_MyStoreNameWStr(szwName) {
        szwName := szwName is String ? StrPtr(szwName) : szwName

        result := ComCall(15, this, "ptr", szwName, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the type of store specified by the MyStoreTypeWStr property.
     * @remarks
     * 
     * The <b>MyStoreTypeWStr</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptpkcs7blob">acceptPKCS7Blob</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptfilepkcs7wstr">acceptFilePKCS7WStr</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {Pointer<PWSTR>} szwType 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-get_mystoretypewstr
     */
    get_MyStoreTypeWStr(szwType) {
        szwTypeMarshal := szwType is VarRef ? "ptr*" : "ptr"

        result := ComCall(16, this, szwTypeMarshal, szwType, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the type of store specified by the MyStoreTypeWStr property.
     * @remarks
     * 
     * The <b>MyStoreTypeWStr</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptpkcs7blob">acceptPKCS7Blob</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptfilepkcs7wstr">acceptFilePKCS7WStr</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {PWSTR} szwType 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-put_mystoretypewstr
     */
    put_MyStoreTypeWStr(szwType) {
        szwType := szwType is String ? StrPtr(szwType) : szwType

        result := ComCall(17, this, "ptr", szwType, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the registry location used for the MY store.
     * @remarks
     * 
     * The <b>MyStoreFlags</b> property value is passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certopenstore">CertOpenStore</a> CryptoAPI function by using its <i>dwFlags</i> parameter.
     * 
     * 
     * The <b>MyStoreFlags</b> property should be set before using the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptpkcs7blob">acceptPKCS7Blob</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptfilepkcs7wstr">acceptFilePKCS7WStr</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-get_mystoreflags
     */
    get_MyStoreFlags(pdwFlags) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the registry location used for the MY store.
     * @remarks
     * 
     * The <b>MyStoreFlags</b> property value is passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certopenstore">CertOpenStore</a> CryptoAPI function by using its <i>dwFlags</i> parameter.
     * 
     * 
     * The <b>MyStoreFlags</b> property should be set before using the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptpkcs7blob">acceptPKCS7Blob</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptfilepkcs7wstr">acceptFilePKCS7WStr</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-put_mystoreflags
     */
    put_MyStoreFlags(dwFlags) {
        result := ComCall(19, this, "int", dwFlags, "HRESULT")
        return result
    }

    /**
     * The CAStoreNameWStr property of IEnroll4 sets or retrieves the name of the store where all non-&quot;ROOT&quot; and non-&quot;MY&quot; certificates are kept.
     * @remarks
     * 
     * The <b>CAStoreNameWStr</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptpkcs7blob">acceptPKCS7Blob</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptfilepkcs7wstr">acceptFilePKCS7WStr</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {Pointer<PWSTR>} szwName 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-get_castorenamewstr
     */
    get_CAStoreNameWStr(szwName) {
        szwNameMarshal := szwName is VarRef ? "ptr*" : "ptr"

        result := ComCall(20, this, szwNameMarshal, szwName, "HRESULT")
        return result
    }

    /**
     * The CAStoreNameWStr property of IEnroll4 sets or retrieves the name of the store where all non-&quot;ROOT&quot; and non-&quot;MY&quot; certificates are kept.
     * @remarks
     * 
     * The <b>CAStoreNameWStr</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptpkcs7blob">acceptPKCS7Blob</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptfilepkcs7wstr">acceptFilePKCS7WStr</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {PWSTR} szwName 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-put_castorenamewstr
     */
    put_CAStoreNameWStr(szwName) {
        szwName := szwName is String ? StrPtr(szwName) : szwName

        result := ComCall(21, this, "ptr", szwName, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the type of store to use for the store specified by the CAStoreNameWStr property.
     * @remarks
     * 
     * The <b>CAStoreTypeWStr</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptpkcs7blob">acceptPKCS7Blob</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptfilepkcs7wstr">acceptFilePKCS7WStr</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {Pointer<PWSTR>} szwType 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-get_castoretypewstr
     */
    get_CAStoreTypeWStr(szwType) {
        szwTypeMarshal := szwType is VarRef ? "ptr*" : "ptr"

        result := ComCall(22, this, szwTypeMarshal, szwType, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the type of store to use for the store specified by the CAStoreNameWStr property.
     * @remarks
     * 
     * The <b>CAStoreTypeWStr</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptpkcs7blob">acceptPKCS7Blob</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptfilepkcs7wstr">acceptFilePKCS7WStr</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {PWSTR} szwType 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-put_castoretypewstr
     */
    put_CAStoreTypeWStr(szwType) {
        szwType := szwType is String ? StrPtr(szwType) : szwType

        result := ComCall(23, this, "ptr", szwType, "HRESULT")
        return result
    }

    /**
     * The CAStoreFlags property of IEnroll4 sets or retrieves a flag that controls the certification authority (CA) store when the store is opened.
     * @remarks
     * 
     * The <b>CAStoreFlags</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptpkcs7blob">acceptPKCS7Blob</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptfilepkcs7wstr">acceptFilePKCS7WStr</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-get_castoreflags
     */
    get_CAStoreFlags(pdwFlags) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "int*" : "ptr"

        result := ComCall(24, this, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
    }

    /**
     * The CAStoreFlags property of IEnroll4 sets or retrieves a flag that controls the certification authority (CA) store when the store is opened.
     * @remarks
     * 
     * The <b>CAStoreFlags</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptpkcs7blob">acceptPKCS7Blob</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptfilepkcs7wstr">acceptFilePKCS7WStr</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-put_castoreflags
     */
    put_CAStoreFlags(dwFlags) {
        result := ComCall(25, this, "int", dwFlags, "HRESULT")
        return result
    }

    /**
     * The RootStoreNameWStr property of IEnroll4 sets or retrieves the name of the root store where all intrinsically trusted, self-signed root certificates are kept.
     * @remarks
     * 
     * <b>RootStoreNameWStr</b> affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptpkcs7blob">acceptPKCS7Blob</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptfilepkcs7wstr">acceptFilePKCS7WStr</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {Pointer<PWSTR>} szwName 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-get_rootstorenamewstr
     */
    get_RootStoreNameWStr(szwName) {
        szwNameMarshal := szwName is VarRef ? "ptr*" : "ptr"

        result := ComCall(26, this, szwNameMarshal, szwName, "HRESULT")
        return result
    }

    /**
     * The RootStoreNameWStr property of IEnroll4 sets or retrieves the name of the root store where all intrinsically trusted, self-signed root certificates are kept.
     * @remarks
     * 
     * <b>RootStoreNameWStr</b> affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptpkcs7blob">acceptPKCS7Blob</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptfilepkcs7wstr">acceptFilePKCS7WStr</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {PWSTR} szwName 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-put_rootstorenamewstr
     */
    put_RootStoreNameWStr(szwName) {
        szwName := szwName is String ? StrPtr(szwName) : szwName

        result := ComCall(27, this, "ptr", szwName, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the type of store to use for the store specified by the RootStoreNameWStr property.
     * @remarks
     * 
     * <b>RootStoreTypeWStr</b> affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptpkcs7blob">acceptPKCS7Blob</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptfilepkcs7wstr">acceptFilePKCS7WStr</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {Pointer<PWSTR>} szwType 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-get_rootstoretypewstr
     */
    get_RootStoreTypeWStr(szwType) {
        szwTypeMarshal := szwType is VarRef ? "ptr*" : "ptr"

        result := ComCall(28, this, szwTypeMarshal, szwType, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the type of store to use for the store specified by the RootStoreNameWStr property.
     * @remarks
     * 
     * <b>RootStoreTypeWStr</b> affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptpkcs7blob">acceptPKCS7Blob</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptfilepkcs7wstr">acceptFilePKCS7WStr</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {PWSTR} szwType 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-put_rootstoretypewstr
     */
    put_RootStoreTypeWStr(szwType) {
        szwType := szwType is String ? StrPtr(szwType) : szwType

        result := ComCall(29, this, "ptr", szwType, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the registry location used for the root store.
     * @remarks
     * 
     * The <b>RootStoreFlags</b> property value is passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certopenstore">CertOpenStore</a> CryptoAPI function by using  its <i>dwFlags</i> parameter.
     * 
     * 
     * The <b>RootStoreFlags</b> property should be set before using the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptpkcs7blob">acceptPKCS7Blob</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptfilepkcs7wstr">acceptFilePKCS7WStr</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-get_rootstoreflags
     */
    get_RootStoreFlags(pdwFlags) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "int*" : "ptr"

        result := ComCall(30, this, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the registry location used for the root store.
     * @remarks
     * 
     * The <b>RootStoreFlags</b> property value is passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certopenstore">CertOpenStore</a> CryptoAPI function by using  its <i>dwFlags</i> parameter.
     * 
     * 
     * The <b>RootStoreFlags</b> property should be set before using the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptpkcs7blob">acceptPKCS7Blob</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptfilepkcs7wstr">acceptFilePKCS7WStr</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-put_rootstoreflags
     */
    put_RootStoreFlags(dwFlags) {
        result := ComCall(31, this, "int", dwFlags, "HRESULT")
        return result
    }

    /**
     * The RequestStoreNameWStr property of IEnroll4 sets or retrieves the name of the store that contains the dummy certificate.
     * @remarks
     * 
     * Typically, modification of the <b>RequestStoreNameWStr</b> property is  performed only in advanced applications. Changing this value is not recommended for most applications.
     * 
     * 
     * The <b>RequestStoreNameWStr</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptpkcs7blob">acceptPKCS7Blob</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptfilepkcs7wstr">acceptFilePKCS7WStr</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createpkcs10wstr">createPKCS10WStr</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createfilepkcs10wstr">createFilePKCS10WStr</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {Pointer<PWSTR>} szwName 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-get_requeststorenamewstr
     */
    get_RequestStoreNameWStr(szwName) {
        szwNameMarshal := szwName is VarRef ? "ptr*" : "ptr"

        result := ComCall(32, this, szwNameMarshal, szwName, "HRESULT")
        return result
    }

    /**
     * The RequestStoreNameWStr property of IEnroll4 sets or retrieves the name of the store that contains the dummy certificate.
     * @remarks
     * 
     * Typically, modification of the <b>RequestStoreNameWStr</b> property is  performed only in advanced applications. Changing this value is not recommended for most applications.
     * 
     * 
     * The <b>RequestStoreNameWStr</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptpkcs7blob">acceptPKCS7Blob</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptfilepkcs7wstr">acceptFilePKCS7WStr</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createpkcs10wstr">createPKCS10WStr</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createfilepkcs10wstr">createFilePKCS10WStr</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {PWSTR} szwName 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-put_requeststorenamewstr
     */
    put_RequestStoreNameWStr(szwName) {
        szwName := szwName is String ? StrPtr(szwName) : szwName

        result := ComCall(33, this, "ptr", szwName, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the type of store to use for the store specified by the RequestStoreNameWStr property. This store type is passed directly to the CertOpenStore function.
     * @remarks
     * 
     * Typically, modification of the <b>RequestStoreTypeWStr</b> property is  performed only in advanced applications.
     * 
     * 
     * <b>RequestStoreTypeWStr</b> affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptpkcs7blob">acceptPKCS7Blob</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptfilepkcs7wstr">acceptFilePKCS7WStr</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createpkcs10wstr">createPKCS10WStr</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createfilepkcs10wstr">createFilePKCS10WStr</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {Pointer<PWSTR>} szwType 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-get_requeststoretypewstr
     */
    get_RequestStoreTypeWStr(szwType) {
        szwTypeMarshal := szwType is VarRef ? "ptr*" : "ptr"

        result := ComCall(34, this, szwTypeMarshal, szwType, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the type of store to use for the store specified by the RequestStoreNameWStr property. This store type is passed directly to the CertOpenStore function.
     * @remarks
     * 
     * Typically, modification of the <b>RequestStoreTypeWStr</b> property is  performed only in advanced applications.
     * 
     * 
     * <b>RequestStoreTypeWStr</b> affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptpkcs7blob">acceptPKCS7Blob</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptfilepkcs7wstr">acceptFilePKCS7WStr</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createpkcs10wstr">createPKCS10WStr</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createfilepkcs10wstr">createFilePKCS10WStr</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {PWSTR} szwType 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-put_requeststoretypewstr
     */
    put_RequestStoreTypeWStr(szwType) {
        szwType := szwType is String ? StrPtr(szwType) : szwType

        result := ComCall(35, this, "ptr", szwType, "HRESULT")
        return result
    }

    /**
     * The RequestStoreFlags property of IEnroll4 sets or retrieves the registry location used for the request store.
     * @remarks
     * 
     * The <b>RequestStoreFlags</b> property value is passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certopenstore">CertOpenStore</a> CryptoAPI function  by using its <i>dwFlags</i> parameter.
     * 
     * Typically, modification of the <b>RequestStoreFlags</b> property is  performed only in advanced applications.
     * 
     * 
     * The <b>RequestStoreFlags</b> property should be set before using the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptpkcs7blob">acceptPKCS7Blob</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptfilepkcs7wstr">acceptFilePKCS7WStr</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createpkcs10wstr">createPKCS10WStr</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createfilepkcs10wstr">createFilePKCS10WStr</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-get_requeststoreflags
     */
    get_RequestStoreFlags(pdwFlags) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "int*" : "ptr"

        result := ComCall(36, this, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
    }

    /**
     * The RequestStoreFlags property of IEnroll4 sets or retrieves the registry location used for the request store.
     * @remarks
     * 
     * The <b>RequestStoreFlags</b> property value is passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certopenstore">CertOpenStore</a> CryptoAPI function  by using its <i>dwFlags</i> parameter.
     * 
     * Typically, modification of the <b>RequestStoreFlags</b> property is  performed only in advanced applications.
     * 
     * 
     * The <b>RequestStoreFlags</b> property should be set before using the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptpkcs7blob">acceptPKCS7Blob</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptfilepkcs7wstr">acceptFilePKCS7WStr</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createpkcs10wstr">createPKCS10WStr</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createfilepkcs10wstr">createFilePKCS10WStr</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-put_requeststoreflags
     */
    put_RequestStoreFlags(dwFlags) {
        result := ComCall(37, this, "int", dwFlags, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the name of the key container to use.
     * @remarks
     * 
     * The container specified may be an existing container or a new one. It may only be an existing container if the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-get_useexistingkeyset">UseExistingKeySet</a> property is set, as long as the key set has not been generated yet. For example, if only an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/e-gly">exchange key</a> set has been generated for a container, it is still possible to perform a certificate enrollment using the signature key set without setting <b>UseExistingKeySet</b>. The <i>exchange key set</i> could be used if <b>UseExistingKeySet</b> is set beforehand.
     * 
     * By default, a new container is selected each time the <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nn-xenroll-ienroll">IEnroll</a> control is run. This ensures that a new key set is generated. If this property is not explicitly set, a generated GUID is used as the container name.
     * 
     * 
     * The <b>ContainerNameWStr</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createpkcs10wstr">createPKCS10WStr</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createfilepkcs10wstr">createFilePKCS10WStr</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {Pointer<PWSTR>} szwContainer 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-get_containernamewstr
     */
    get_ContainerNameWStr(szwContainer) {
        szwContainerMarshal := szwContainer is VarRef ? "ptr*" : "ptr"

        result := ComCall(38, this, szwContainerMarshal, szwContainer, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the name of the key container to use.
     * @remarks
     * 
     * The container specified may be an existing container or a new one. It may only be an existing container if the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-get_useexistingkeyset">UseExistingKeySet</a> property is set, as long as the key set has not been generated yet. For example, if only an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/e-gly">exchange key</a> set has been generated for a container, it is still possible to perform a certificate enrollment using the signature key set without setting <b>UseExistingKeySet</b>. The <i>exchange key set</i> could be used if <b>UseExistingKeySet</b> is set beforehand.
     * 
     * By default, a new container is selected each time the <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nn-xenroll-ienroll">IEnroll</a> control is run. This ensures that a new key set is generated. If this property is not explicitly set, a generated GUID is used as the container name.
     * 
     * 
     * The <b>ContainerNameWStr</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createpkcs10wstr">createPKCS10WStr</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createfilepkcs10wstr">createFilePKCS10WStr</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {PWSTR} szwContainer 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-put_containernamewstr
     */
    put_ContainerNameWStr(szwContainer) {
        szwContainer := szwContainer is String ? StrPtr(szwContainer) : szwContainer

        result := ComCall(39, this, "ptr", szwContainer, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the name of the cryptographic service provider (CSP) to use.
     * @remarks
     * 
     * The <b>ProviderNameWStr</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createpkcs10wstr">createPKCS10WStr</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createfilepkcs10wstr">createFilePKCS10WStr</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-enumcontainerswstr">enumContainersWStr</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {Pointer<PWSTR>} szwProvider 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-get_providernamewstr
     */
    get_ProviderNameWStr(szwProvider) {
        szwProviderMarshal := szwProvider is VarRef ? "ptr*" : "ptr"

        result := ComCall(40, this, szwProviderMarshal, szwProvider, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the name of the cryptographic service provider (CSP) to use.
     * @remarks
     * 
     * The <b>ProviderNameWStr</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createpkcs10wstr">createPKCS10WStr</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createfilepkcs10wstr">createFilePKCS10WStr</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-enumcontainerswstr">enumContainersWStr</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {PWSTR} szwProvider 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-put_providernamewstr
     */
    put_ProviderNameWStr(szwProvider) {
        szwProvider := szwProvider is String ? StrPtr(szwProvider) : szwProvider

        result := ComCall(41, this, "ptr", szwProvider, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the type of provider.
     * @remarks
     * 
     * For general information about provider types, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/cryptographic-provider-types">Cryptographic Provider Types</a>.
     * 
     * For more information about valid values for the Microsoft Base Cryptographic Provider, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptacquirecontexta">CryptAcquireContext</a> CryptoAPI function.
     * 
     * For provider type information for other CSPs, see the documentation provided with the CSP.
     * 
     * The <b>ProviderType</b> property value is passed to <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptacquirecontexta">CryptAcquireContext</a>  by using its <i>dwProvType</i> parameter.
     * 
     * 
     * The <b>ProviderType</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createpkcs10wstr">createPKCS10WStr</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createfilepkcs10wstr">createFilePKCS10WStr</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-enumproviderswstr">enumProvidersWStr</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {Pointer<Integer>} pdwType 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-get_providertype
     */
    get_ProviderType(pdwType) {
        pdwTypeMarshal := pdwType is VarRef ? "int*" : "ptr"

        result := ComCall(42, this, pdwTypeMarshal, pdwType, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the type of provider.
     * @remarks
     * 
     * For general information about provider types, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/cryptographic-provider-types">Cryptographic Provider Types</a>.
     * 
     * For more information about valid values for the Microsoft Base Cryptographic Provider, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptacquirecontexta">CryptAcquireContext</a> CryptoAPI function.
     * 
     * For provider type information for other CSPs, see the documentation provided with the CSP.
     * 
     * The <b>ProviderType</b> property value is passed to <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptacquirecontexta">CryptAcquireContext</a>  by using its <i>dwProvType</i> parameter.
     * 
     * 
     * The <b>ProviderType</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createpkcs10wstr">createPKCS10WStr</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createfilepkcs10wstr">createFilePKCS10WStr</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-enumproviderswstr">enumProvidersWStr</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {Integer} dwType 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-put_providertype
     */
    put_ProviderType(dwType) {
        result := ComCall(43, this, "int", dwType, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the type of key generated.
     * @remarks
     * 
     * For the Microsoft Base Cryptographic Provider, the <b>KeySpec</b> property has a value of AT_KEYEXCHANGE for <a href="https://docs.microsoft.com/windows/desktop/SecGloss/e-gly">exchange keys</a>, or AT_SIGNATURE for signature keys. The default is AT_SIGNATURE.
     * 
     * For information about the other Microsoft CSPs, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/cryptographic-service-providers">Cryptographic Service Providers</a> in the CryptoAPI 2.0 documentation.
     * 
     * For information about other CSPs, see the documentation provided with the CSP.
     * 
     * 
     * The <b>KeySpec</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createpkcs10wstr">createPKCS10WStr</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createfilepkcs10wstr">createFilePKCS10WStr</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {Pointer<Integer>} pdw 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-get_keyspec
     */
    get_KeySpec(pdw) {
        pdwMarshal := pdw is VarRef ? "int*" : "ptr"

        result := ComCall(44, this, pdwMarshal, pdw, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the type of key generated.
     * @remarks
     * 
     * For the Microsoft Base Cryptographic Provider, the <b>KeySpec</b> property has a value of AT_KEYEXCHANGE for <a href="https://docs.microsoft.com/windows/desktop/SecGloss/e-gly">exchange keys</a>, or AT_SIGNATURE for signature keys. The default is AT_SIGNATURE.
     * 
     * For information about the other Microsoft CSPs, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/cryptographic-service-providers">Cryptographic Service Providers</a> in the CryptoAPI 2.0 documentation.
     * 
     * For information about other CSPs, see the documentation provided with the CSP.
     * 
     * 
     * The <b>KeySpec</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createpkcs10wstr">createPKCS10WStr</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createfilepkcs10wstr">createFilePKCS10WStr</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {Integer} dw 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-put_keyspec
     */
    put_KeySpec(dw) {
        result := ComCall(45, this, "int", dw, "HRESULT")
        return result
    }

    /**
     * The ProviderFlags property of IEnroll4 sets or retrieves the provider type.
     * @remarks
     * 
     * For  more information about   valid <b>ProviderFlags</b> values for the Microsoft Base Cryptographic Provider, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptacquirecontexta">CryptAcquireContext</a> CryptoAPI function.
     * 
     * For information about  other CSPs, see the documentation provided with the CSP.
     * 
     * The <b>ProviderFlags</b> property value is passed to <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptacquirecontexta">CryptAcquireContext</a>  by using  its <i>dwFlags</i> parameter.
     * 
     * 
     * The <b>ProviderFlags</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createpkcs10wstr">createPKCS10WStr</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createfilepkcs10wstr">createFilePKCS10WStr</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-get_providerflags
     */
    get_ProviderFlags(pdwFlags) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "int*" : "ptr"

        result := ComCall(46, this, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
    }

    /**
     * The ProviderFlags property of IEnroll4 sets or retrieves the provider type.
     * @remarks
     * 
     * For  more information about   valid <b>ProviderFlags</b> values for the Microsoft Base Cryptographic Provider, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptacquirecontexta">CryptAcquireContext</a> CryptoAPI function.
     * 
     * For information about  other CSPs, see the documentation provided with the CSP.
     * 
     * The <b>ProviderFlags</b> property value is passed to <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptacquirecontexta">CryptAcquireContext</a>  by using  its <i>dwFlags</i> parameter.
     * 
     * 
     * The <b>ProviderFlags</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createpkcs10wstr">createPKCS10WStr</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createfilepkcs10wstr">createFilePKCS10WStr</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-put_providerflags
     */
    put_ProviderFlags(dwFlags) {
        result := ComCall(47, this, "int", dwFlags, "HRESULT")
        return result
    }

    /**
     * The UseExistingKeySet property of IEnroll4 sets or retrieves a Boolean value that determines whether the existing keys should be used.
     * @remarks
     * 
     *  If an existing key set is used, the <b>UseExistingKeySet</b> property must be set to true.
     * 
     * 
     * The <b>UseExistingKeySet</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createpkcs10wstr">createPKCS10WStr</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createfilepkcs10wstr">createFilePKCS10WStr</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {Pointer<BOOL>} fUseExistingKeys 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-get_useexistingkeyset
     */
    get_UseExistingKeySet(fUseExistingKeys) {
        fUseExistingKeysMarshal := fUseExistingKeys is VarRef ? "int*" : "ptr"

        result := ComCall(48, this, fUseExistingKeysMarshal, fUseExistingKeys, "HRESULT")
        return result
    }

    /**
     * The UseExistingKeySet property of IEnroll4 sets or retrieves a Boolean value that determines whether the existing keys should be used.
     * @remarks
     * 
     *  If an existing key set is used, the <b>UseExistingKeySet</b> property must be set to true.
     * 
     * 
     * The <b>UseExistingKeySet</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createpkcs10wstr">createPKCS10WStr</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createfilepkcs10wstr">createFilePKCS10WStr</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {BOOL} fUseExistingKeys 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-put_useexistingkeyset
     */
    put_UseExistingKeySet(fUseExistingKeys) {
        result := ComCall(49, this, "int", fUseExistingKeys, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the values passed to CryptGenKey when the certificate request is generated.
     * @remarks
     * 
     * By default, private keys are not exportable unless a .pvk file is requested. To make the private key exportable without specifying a .pvk file, set <b>GenKeyFlags</b> to CRYPT_EXPORTABLE.
     * 
     * To specify a .pvk file name,  use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-get_pvkfilenamewstr">PVKFileNameWStr</a> property.
     * 
     * The <b>GenKeyFlags</b> property value is passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptgenkey">CryptGenKey</a> CryptoAPI function by using its <i>dwFlags</i> parameter.
     * 
     * If the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a>  (CSP) does not support exportable private keys, an error occurs.
     * 
     * 
     * The <b>GenKeyFlags</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createpkcs10wstr">createPKCS10WStr</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createfilepkcs10wstr">createFilePKCS10WStr</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll4-createrequestwstr">createRequestWStr</a>
     * </li>
     * </ul>
     * 
     * 
     * <div class="alert"><b>Note</b>  The default value for the <b>GenKeyFlags</b> property is zero. If you need to change this value, you must do so before calling these methods. After calling any of these methods, you cannot change the <b>GenKeyFlags</b> property value.</div>
     * <div> </div>
     * 
     * 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-get_genkeyflags
     */
    get_GenKeyFlags(pdwFlags) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "int*" : "ptr"

        result := ComCall(50, this, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the values passed to CryptGenKey when the certificate request is generated.
     * @remarks
     * 
     * By default, private keys are not exportable unless a .pvk file is requested. To make the private key exportable without specifying a .pvk file, set <b>GenKeyFlags</b> to CRYPT_EXPORTABLE.
     * 
     * To specify a .pvk file name,  use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-get_pvkfilenamewstr">PVKFileNameWStr</a> property.
     * 
     * The <b>GenKeyFlags</b> property value is passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptgenkey">CryptGenKey</a> CryptoAPI function by using its <i>dwFlags</i> parameter.
     * 
     * If the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a>  (CSP) does not support exportable private keys, an error occurs.
     * 
     * 
     * The <b>GenKeyFlags</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createpkcs10wstr">createPKCS10WStr</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createfilepkcs10wstr">createFilePKCS10WStr</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll4-createrequestwstr">createRequestWStr</a>
     * </li>
     * </ul>
     * 
     * 
     * <div class="alert"><b>Note</b>  The default value for the <b>GenKeyFlags</b> property is zero. If you need to change this value, you must do so before calling these methods. After calling any of these methods, you cannot change the <b>GenKeyFlags</b> property value.</div>
     * <div> </div>
     * 
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-put_genkeyflags
     */
    put_GenKeyFlags(dwFlags) {
        result := ComCall(51, this, "int", dwFlags, "HRESULT")
        return result
    }

    /**
     * The DeleteRequestCert property of IEnroll4 sets or retrieves a Boolean value that determines whether dummy certificates in the request store are deleted.
     * @remarks
     * 
     * The <b>DeleteRequestCert</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptpkcs7blob">acceptPKCS7Blob</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptfilepkcs7wstr">acceptFilePKCS7WStr</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {Pointer<BOOL>} fDelete 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-get_deleterequestcert
     */
    get_DeleteRequestCert(fDelete) {
        fDeleteMarshal := fDelete is VarRef ? "int*" : "ptr"

        result := ComCall(52, this, fDeleteMarshal, fDelete, "HRESULT")
        return result
    }

    /**
     * The DeleteRequestCert property of IEnroll4 sets or retrieves a Boolean value that determines whether dummy certificates in the request store are deleted.
     * @remarks
     * 
     * The <b>DeleteRequestCert</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptpkcs7blob">acceptPKCS7Blob</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptfilepkcs7wstr">acceptFilePKCS7WStr</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {BOOL} fDelete 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-put_deleterequestcert
     */
    put_DeleteRequestCert(fDelete) {
        result := ComCall(53, this, "int", fDelete, "HRESULT")
        return result
    }

    /**
     * The WriteCertToUserDS property of IEnroll4 sets or retrieves a Boolean value that determines whether the certificate is written to the user's Active Directory store.
     * @remarks
     * 
     * <b>WriteCertToUserDS</b> affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptpkcs7blob">acceptPKCS7Blob</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptfilepkcs7wstr">acceptFilePKCS7WStr</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {Pointer<BOOL>} fBool 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-get_writecerttouserds
     */
    get_WriteCertToUserDS(fBool) {
        fBoolMarshal := fBool is VarRef ? "int*" : "ptr"

        result := ComCall(54, this, fBoolMarshal, fBool, "HRESULT")
        return result
    }

    /**
     * The WriteCertToUserDS property of IEnroll4 sets or retrieves a Boolean value that determines whether the certificate is written to the user's Active Directory store.
     * @remarks
     * 
     * <b>WriteCertToUserDS</b> affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptpkcs7blob">acceptPKCS7Blob</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptfilepkcs7wstr">acceptFilePKCS7WStr</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {BOOL} fBool 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-put_writecerttouserds
     */
    put_WriteCertToUserDS(fBool) {
        result := ComCall(55, this, "int", fBool, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a Boolean value that determines whether the distinguished name in the request is encoded as a T61 string instead of as a Unicode string.
     * @remarks
     * 
     * The <b>EnableT61DNEncoding</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createpkcs10wstr">createPKCS10WStr</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createfilepkcs10wstr">createFilePKCS10WStr</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {Pointer<BOOL>} fBool 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-get_enablet61dnencoding
     */
    get_EnableT61DNEncoding(fBool) {
        fBoolMarshal := fBool is VarRef ? "int*" : "ptr"

        result := ComCall(56, this, fBoolMarshal, fBool, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a Boolean value that determines whether the distinguished name in the request is encoded as a T61 string instead of as a Unicode string.
     * @remarks
     * 
     * The <b>EnableT61DNEncoding</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createpkcs10wstr">createPKCS10WStr</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createfilepkcs10wstr">createFilePKCS10WStr</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {BOOL} fBool 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-put_enablet61dnencoding
     */
    put_EnableT61DNEncoding(fBool) {
        result := ComCall(57, this, "int", fBool, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a Boolean value that determines whether a certificate should be written to the cryptographic service provider (CSP).
     * @remarks
     * 
     * This property is typically used with smart cards, where the certificate is written to the smart card in addition to being written to the "MY" store.
     * 
     * The default value is <b>true</b>, which means that the Certificate Enrollment Control will try to write the certificate to the CSP but will not fail unless a hardware token error is encountered. If this value is <b>true</b>, but no smart card or other hardware-dependent CSP is installed, then hardware token errors will be ignored.
     * 
     * To explicitly force that the Certificate Enrollment Control not attempt to write to the CSP, set this value to false.
     * 
     * 
     * <b>WriteCertToCSP</b> affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptpkcs7blob">acceptPKCS7Blob</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptfilepkcs7wstr">acceptFilePKCS7WStr</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {Pointer<BOOL>} fBool 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-get_writecerttocsp
     */
    get_WriteCertToCSP(fBool) {
        fBoolMarshal := fBool is VarRef ? "int*" : "ptr"

        result := ComCall(58, this, fBoolMarshal, fBool, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a Boolean value that determines whether a certificate should be written to the cryptographic service provider (CSP).
     * @remarks
     * 
     * This property is typically used with smart cards, where the certificate is written to the smart card in addition to being written to the "MY" store.
     * 
     * The default value is <b>true</b>, which means that the Certificate Enrollment Control will try to write the certificate to the CSP but will not fail unless a hardware token error is encountered. If this value is <b>true</b>, but no smart card or other hardware-dependent CSP is installed, then hardware token errors will be ignored.
     * 
     * To explicitly force that the Certificate Enrollment Control not attempt to write to the CSP, set this value to false.
     * 
     * 
     * <b>WriteCertToCSP</b> affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptpkcs7blob">acceptPKCS7Blob</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptfilepkcs7wstr">acceptFilePKCS7WStr</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {BOOL} fBool 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-put_writecerttocsp
     */
    put_WriteCertToCSP(fBool) {
        result := ComCall(59, this, "int", fBool, "HRESULT")
        return result
    }

    /**
     * The SPCFileNameWStr property of IEnroll4 sets or retrieves the name of the file to which to write the base64-encoded PKCS
     * @remarks
     * 
     * The file is written as a binary PKCS #7. Specifying this file does not affect the acceptance of the certificates into any of the user's stores.
     * 
     * If the file already exists, the user is notified and prompted for permission to overwrite it.
     * 
     * 
     * <b>SPCFileNameWStr</b> affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptpkcs7blob">acceptPKCS7Blob</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptfilepkcs7wstr">acceptFilePKCS7WStr</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {Pointer<PWSTR>} szw 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-get_spcfilenamewstr
     */
    get_SPCFileNameWStr(szw) {
        szwMarshal := szw is VarRef ? "ptr*" : "ptr"

        result := ComCall(60, this, szwMarshal, szw, "HRESULT")
        return result
    }

    /**
     * The SPCFileNameWStr property of IEnroll4 sets or retrieves the name of the file to which to write the base64-encoded PKCS
     * @remarks
     * 
     * The file is written as a binary PKCS #7. Specifying this file does not affect the acceptance of the certificates into any of the user's stores.
     * 
     * If the file already exists, the user is notified and prompted for permission to overwrite it.
     * 
     * 
     * <b>SPCFileNameWStr</b> affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptpkcs7blob">acceptPKCS7Blob</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-acceptfilepkcs7wstr">acceptFilePKCS7WStr</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {PWSTR} szw 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-put_spcfilenamewstr
     */
    put_SPCFileNameWStr(szw) {
        szw := szw is String ? StrPtr(szw) : szw

        result := ComCall(61, this, "ptr", szw, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the name of the file that will contain exported keys.
     * @remarks
     * 
     * The <b>PVKFileNameWStr</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createpkcs10wstr">createPKCS10WStr</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createfilepkcs10wstr">createFilePKCS10WStr</a>
     * </li>
     * </ul>
     * 
     * 
     * Exporting functionality may not be supported by the  <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a> (CSP). Historically, <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Authenticode</a> has exported the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">private key</a> to a .pvk file on a disk and removed the keys from the registry. By default, private keys are not generated for exportation, and many cryptographic service providers do not support exporting keys. However, if the CSP supports exporting private keys, specifying a non-NULL value for the <b>PVKFileNameWStr</b> property causes the private keys to be generated as exportable and the private and public keys to be written to the file specified by the <b>PVKFileNameWStr</b> property. The private key is removed from the CSP. The file name specified by the property can be any accessible file. By default, no .pvk file is generated, and the keys are not generated as exportable.
     * 
     * If the .pvk file already exists, the user is notified and prompted for permission to overwrite it.
     * 
     * 
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-get_genkeyflags">GenKeyFlags</a> property also has a flag that controls whether the private key can be exported. Use care when using  the <b>GenKeyFlags</b> property and the <b>PVKFileNameWStr</b> property together. If the <b>PVKFileNameWStr</b> property is set first, the <b>GenKeyFlags</b> property is automatically set to CRYPT_EXPORTABLE. If the <b>GenKeyFlags</b> property is set (by using the <b>put_GenKeyFlags</b> function) without including the CRYPT_EXPORTABLE flag, then the <b>GenKeyFlags</b> will not be set to CRYPT_EXPORTABLE, and the generated keys will not be exportable. The following procedure demonstrates this:
     * 
     * <ol>
     * <li>Call <b>put_PVKFileNameWStr</b> to set the file name for the file that will receive the exported keys. The <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-get_genkeyflags">GenKeyFlags</a> property is automatically set to CRYPT_EXPORTABLE.</li>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-get_genkeyflags">put_GenKeyFlags</a> with a value not set to CRYPT_EXPORTABLE, for example, zero.</li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-get_genkeyflags">GenKeyFlags</a> is no longer set to CRYPT_EXPORTABLE (the value that was automatically set in step one).</li>
     * </ol>
     * 
     * 
     * Any keys generated by following the previous steps will be not exportable. Therefore, it is recommended that the user set the <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-get_genkeyflags">GenKeyFlags</a> property before the <b>PVKFileNameWStr</b> property when they are used together.
     * 
     * Alternatively, the user could determine the current value of the CRYPT_EXPORTABLE bit in the <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-get_genkeyflags">GenKeyFlags</a> property and then perform a bitwise-<b>OR</b>  operation between this value and any changes that are made to the <b>GenKeyFlags</b> property to ensure that the bit is not wiped out. The user could also specifically set the CRYPT_EXPORTABLE bit when updating the <b>GenKeyFlags</b> property.
     * 
     * 
     * @param {Pointer<PWSTR>} szw 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-get_pvkfilenamewstr
     */
    get_PVKFileNameWStr(szw) {
        szwMarshal := szw is VarRef ? "ptr*" : "ptr"

        result := ComCall(62, this, szwMarshal, szw, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the name of the file that will contain exported keys.
     * @remarks
     * 
     * The <b>PVKFileNameWStr</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createpkcs10wstr">createPKCS10WStr</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createfilepkcs10wstr">createFilePKCS10WStr</a>
     * </li>
     * </ul>
     * 
     * 
     * Exporting functionality may not be supported by the  <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a> (CSP). Historically, <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Authenticode</a> has exported the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">private key</a> to a .pvk file on a disk and removed the keys from the registry. By default, private keys are not generated for exportation, and many cryptographic service providers do not support exporting keys. However, if the CSP supports exporting private keys, specifying a non-NULL value for the <b>PVKFileNameWStr</b> property causes the private keys to be generated as exportable and the private and public keys to be written to the file specified by the <b>PVKFileNameWStr</b> property. The private key is removed from the CSP. The file name specified by the property can be any accessible file. By default, no .pvk file is generated, and the keys are not generated as exportable.
     * 
     * If the .pvk file already exists, the user is notified and prompted for permission to overwrite it.
     * 
     * 
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-get_genkeyflags">GenKeyFlags</a> property also has a flag that controls whether the private key can be exported. Use care when using  the <b>GenKeyFlags</b> property and the <b>PVKFileNameWStr</b> property together. If the <b>PVKFileNameWStr</b> property is set first, the <b>GenKeyFlags</b> property is automatically set to CRYPT_EXPORTABLE. If the <b>GenKeyFlags</b> property is set (by using the <b>put_GenKeyFlags</b> function) without including the CRYPT_EXPORTABLE flag, then the <b>GenKeyFlags</b> will not be set to CRYPT_EXPORTABLE, and the generated keys will not be exportable. The following procedure demonstrates this:
     * 
     * <ol>
     * <li>Call <b>put_PVKFileNameWStr</b> to set the file name for the file that will receive the exported keys. The <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-get_genkeyflags">GenKeyFlags</a> property is automatically set to CRYPT_EXPORTABLE.</li>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-get_genkeyflags">put_GenKeyFlags</a> with a value not set to CRYPT_EXPORTABLE, for example, zero.</li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-get_genkeyflags">GenKeyFlags</a> is no longer set to CRYPT_EXPORTABLE (the value that was automatically set in step one).</li>
     * </ol>
     * 
     * 
     * Any keys generated by following the previous steps will be not exportable. Therefore, it is recommended that the user set the <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-get_genkeyflags">GenKeyFlags</a> property before the <b>PVKFileNameWStr</b> property when they are used together.
     * 
     * Alternatively, the user could determine the current value of the CRYPT_EXPORTABLE bit in the <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-get_genkeyflags">GenKeyFlags</a> property and then perform a bitwise-<b>OR</b>  operation between this value and any changes that are made to the <b>GenKeyFlags</b> property to ensure that the bit is not wiped out. The user could also specifically set the CRYPT_EXPORTABLE bit when updating the <b>GenKeyFlags</b> property.
     * 
     * 
     * @param {PWSTR} szw 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-put_pvkfilenamewstr
     */
    put_PVKFileNameWStr(szw) {
        szw := szw is String ? StrPtr(szw) : szw

        result := ComCall(63, this, "ptr", szw, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves only the signature hashing algorithm used to sign the PKCS
     * @remarks
     * 
     * This  signature hashing algorithm is not to be confused with the hashing algorithm used to sign the certificate. The enrollment control currently supports any OID for hashing algorithms, plus the following display name values: SHA1 (the default), MD2, and MD5. When retrieving this property, the retrieved value is in OID format (that is, SHA1 appears as 1.3.14.3.2.29). When setting this property, the corresponding OID format can be used as an alternative to the text shown for the defined friendly values.
     * 
     * The Certificate Enrollment Control considers the value of the <b>HashAlgorithmWStr</b> property  as a hint to the hashing algorithm to use for signing the PKCS #10 certification request. If the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a> (CSP) supports the algorithm specified in the <b>HashAlgorithmWStr</b> property, the algorithm will be used. Otherwise, the Certificate Enrollment Control will try to use SHA1. If SHA1 is not supported by the CSP, then MD5 will be tried. If neither SHA1 nor MD5 is supported, the Certificate Enrollment Control will try to use the first hashing algorithm returned from the CSP.
     * 
     * 
     * The <b>HashAlgorithmWStr</b>  property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createpkcs10wstr">createPKCS10WStr</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createfilepkcs10wstr">createFilePKCS10WStr</a>
     * </li>
     * </ul>
     * 
     * 
     * If both the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll2-get_hashalgid">HashAlgID</a> and <b>HashAlgorithmWStr</b> properties are set, whichever is last updated will specify which hashing algorithm will be used to sign the PKCS #10 certification request.
     * 
     * 
     * @param {Pointer<PWSTR>} szw 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-get_hashalgorithmwstr
     */
    get_HashAlgorithmWStr(szw) {
        szwMarshal := szw is VarRef ? "ptr*" : "ptr"

        result := ComCall(64, this, szwMarshal, szw, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves only the signature hashing algorithm used to sign the PKCS
     * @remarks
     * 
     * This  signature hashing algorithm is not to be confused with the hashing algorithm used to sign the certificate. The enrollment control currently supports any OID for hashing algorithms, plus the following display name values: SHA1 (the default), MD2, and MD5. When retrieving this property, the retrieved value is in OID format (that is, SHA1 appears as 1.3.14.3.2.29). When setting this property, the corresponding OID format can be used as an alternative to the text shown for the defined friendly values.
     * 
     * The Certificate Enrollment Control considers the value of the <b>HashAlgorithmWStr</b> property  as a hint to the hashing algorithm to use for signing the PKCS #10 certification request. If the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a> (CSP) supports the algorithm specified in the <b>HashAlgorithmWStr</b> property, the algorithm will be used. Otherwise, the Certificate Enrollment Control will try to use SHA1. If SHA1 is not supported by the CSP, then MD5 will be tried. If neither SHA1 nor MD5 is supported, the Certificate Enrollment Control will try to use the first hashing algorithm returned from the CSP.
     * 
     * 
     * The <b>HashAlgorithmWStr</b>  property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createpkcs10wstr">createPKCS10WStr</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createfilepkcs10wstr">createFilePKCS10WStr</a>
     * </li>
     * </ul>
     * 
     * 
     * If both the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll2-get_hashalgid">HashAlgID</a> and <b>HashAlgorithmWStr</b> properties are set, whichever is last updated will specify which hashing algorithm will be used to sign the PKCS #10 certification request.
     * 
     * 
     * @param {PWSTR} szw 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-put_hashalgorithmwstr
     */
    put_HashAlgorithmWStr(szw) {
        szw := szw is String ? StrPtr(szw) : szw

        result := ComCall(65, this, "ptr", szw, "HRESULT")
        return result
    }

    /**
     * Specifies the certificate context for the renewal certificate.
     * @remarks
     * 
     * For more information about how to create a certificate renewal request, see <a href="https://docs.microsoft.com/previous-versions/ms867026(v=msdn.10)#certenroll_topic8">Creating a Renewal Request</a> in Creating Certificate Requests Using the Certificate Enrollment Control and CryptoAPI.
     * 
     * 
     * @param {Pointer<Pointer<CERT_CONTEXT>>} ppCertContext 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-get_renewalcertificate
     */
    get_RenewalCertificate(ppCertContext) {
        ppCertContextMarshal := ppCertContext is VarRef ? "ptr*" : "ptr"

        result := ComCall(66, this, ppCertContextMarshal, ppCertContext, "HRESULT")
        return result
    }

    /**
     * Specifies the certificate context for the renewal certificate.
     * @remarks
     * 
     * For more information about how to create a certificate renewal request, see <a href="https://docs.microsoft.com/previous-versions/ms867026(v=msdn.10)#certenroll_topic8">Creating a Renewal Request</a> in Creating Certificate Requests Using the Certificate Enrollment Control and CryptoAPI.
     * 
     * 
     * @param {Pointer<CERT_CONTEXT>} pCertContext 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-put_renewalcertificate
     */
    put_RenewalCertificate(pCertContext) {
        result := ComCall(67, this, "ptr", pCertContext, "HRESULT")
        return result
    }

    /**
     * Adds a certificate template to a request (used to support the enterprise certification authority (CA)).
     * @param {PWSTR} szw Fully qualified name of the certificate template which is being added to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate request</a>. This value is interpreted by the certification authority.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>, with S_OK returned if the call is successful.
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-addcerttypetorequestwstr
     */
    AddCertTypeToRequestWStr(szw) {
        szw := szw is String ? StrPtr(szw) : szw

        result := ComCall(68, this, "ptr", szw, "HRESULT")
        return result
    }

    /**
     * Adds the authenticated name-value pair of an attribute to the request. The certification authority (CA) interprets the meaning of the name-value pair.
     * @param {PWSTR} Name A null-terminated Unicode string that contains the name of the attribute, such as "2.5.4.6", for the country/region name.
     * @param {PWSTR} Value A null-terminated Unicode string that contains the value of the attribute, such as "US" or "<i>DomainName</i>&#92;<i>UserID</i>".
     * @returns {HRESULT} The return value is an <b>HRESULT</b>, with S_OK returned if the call is successful.
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-addnamevaluepairtosignaturewstr
     */
    AddNameValuePairToSignatureWStr(Name, Value) {
        Name := Name is String ? StrPtr(Name) : Name
        Value := Value is String ? StrPtr(Value) : Value

        result := ComCall(69, this, "ptr", Name, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * The AddExtensionsToRequest method adds extensions to the certificate request. This method was first defined in the IEnroll interface.
     * @param {Pointer<CERT_EXTENSIONS>} pCertExtensions A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_extensions">CERT_EXTENSIONS</a> structure that represents the extensions to add to the request.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>, with S_OK returned if the call is successful.
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-addextensionstorequest
     */
    AddExtensionsToRequest(pCertExtensions) {
        result := ComCall(70, this, "ptr", pCertExtensions, "HRESULT")
        return result
    }

    /**
     * The AddAuthenticatedAttributesToPKCS7Request method adds authenticated attributes to a PKCS
     * @param {Pointer<CRYPT_ATTRIBUTES>} pAttributes A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_attributes">CRYPT_ATTRIBUTES</a> structure that represents the authenticated attributes to add to the PKCS #7 certificate request.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>, with S_OK returned if the call is successful.
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-addauthenticatedattributestopkcs7request
     */
    AddAuthenticatedAttributesToPKCS7Request(pAttributes) {
        result := ComCall(71, this, "ptr", pAttributes, "HRESULT")
        return result
    }

    /**
     * The CreatePKCS7RequestFromRequest method creates a PKCS
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pRequest A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure that represents the existing request.
     * @param {Pointer<CERT_CONTEXT>} pSigningCertContext A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure that represents the certificate used to sign the request.
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pPkcs7Blob A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure that receives the returned PKCS  #7 certificate request.
     * 
     * When you have finished using this memory, free it by passing the <b>pbData</b> member of this structure to the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @returns {HRESULT} If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll-createpkcs7requestfromrequest
     */
    CreatePKCS7RequestFromRequest(pRequest, pSigningCertContext, pPkcs7Blob) {
        result := ComCall(72, this, "ptr", pRequest, "ptr", pSigningCertContext, "ptr", pPkcs7Blob, "HRESULT")
        return result
    }
}
