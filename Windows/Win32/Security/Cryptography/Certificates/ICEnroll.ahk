#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The ICEnroll interface is one of several interfaces that represent the Certificate Enrollment Control.
 * @see https://docs.microsoft.com/windows/win32/api//xenroll/nn-xenroll-icenroll
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICEnroll extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICEnroll
     * @type {Guid}
     */
    static IID => Guid("{43f8f288-7a20-11d0-8f06-00c04fc295e1}")

    /**
     * The class identifier for CEnroll
     * @type {Guid}
     */
    static CLSID => Guid("{43f8f289-7a20-11d0-8f06-00c04fc295e1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["createFilePKCS10", "acceptFilePKCS7", "createPKCS10", "acceptPKCS7", "getCertFromPKCS7", "enumProviders", "enumContainers", "freeRequestInfo", "get_MyStoreName", "put_MyStoreName", "get_MyStoreType", "put_MyStoreType", "get_MyStoreFlags", "put_MyStoreFlags", "get_CAStoreName", "put_CAStoreName", "get_CAStoreType", "put_CAStoreType", "get_CAStoreFlags", "put_CAStoreFlags", "get_RootStoreName", "put_RootStoreName", "get_RootStoreType", "put_RootStoreType", "get_RootStoreFlags", "put_RootStoreFlags", "get_RequestStoreName", "put_RequestStoreName", "get_RequestStoreType", "put_RequestStoreType", "get_RequestStoreFlags", "put_RequestStoreFlags", "get_ContainerName", "put_ContainerName", "get_ProviderName", "put_ProviderName", "get_ProviderType", "put_ProviderType", "get_KeySpec", "put_KeySpec", "get_ProviderFlags", "put_ProviderFlags", "get_UseExistingKeySet", "put_UseExistingKeySet", "get_GenKeyFlags", "put_GenKeyFlags", "get_DeleteRequestCert", "put_DeleteRequestCert", "get_WriteCertToCSP", "put_WriteCertToCSP", "get_SPCFileName", "put_SPCFileName", "get_PVKFileName", "put_PVKFileName", "get_HashAlgorithm", "put_HashAlgorithm"]

    /**
     * @type {BSTR} 
     */
    MyStoreName {
        get => this.get_MyStoreName()
        set => this.put_MyStoreName(value)
    }

    /**
     * @type {BSTR} 
     */
    MyStoreType {
        get => this.get_MyStoreType()
        set => this.put_MyStoreType(value)
    }

    /**
     * @type {Integer} 
     */
    MyStoreFlags {
        get => this.get_MyStoreFlags()
        set => this.put_MyStoreFlags(value)
    }

    /**
     * @type {BSTR} 
     */
    CAStoreName {
        get => this.get_CAStoreName()
        set => this.put_CAStoreName(value)
    }

    /**
     * @type {BSTR} 
     */
    CAStoreType {
        get => this.get_CAStoreType()
        set => this.put_CAStoreType(value)
    }

    /**
     * @type {Integer} 
     */
    CAStoreFlags {
        get => this.get_CAStoreFlags()
        set => this.put_CAStoreFlags(value)
    }

    /**
     * @type {BSTR} 
     */
    RootStoreName {
        get => this.get_RootStoreName()
        set => this.put_RootStoreName(value)
    }

    /**
     * @type {BSTR} 
     */
    RootStoreType {
        get => this.get_RootStoreType()
        set => this.put_RootStoreType(value)
    }

    /**
     * @type {Integer} 
     */
    RootStoreFlags {
        get => this.get_RootStoreFlags()
        set => this.put_RootStoreFlags(value)
    }

    /**
     * @type {BSTR} 
     */
    RequestStoreName {
        get => this.get_RequestStoreName()
        set => this.put_RequestStoreName(value)
    }

    /**
     * @type {BSTR} 
     */
    RequestStoreType {
        get => this.get_RequestStoreType()
        set => this.put_RequestStoreType(value)
    }

    /**
     * @type {Integer} 
     */
    RequestStoreFlags {
        get => this.get_RequestStoreFlags()
        set => this.put_RequestStoreFlags(value)
    }

    /**
     * @type {BSTR} 
     */
    ContainerName {
        get => this.get_ContainerName()
        set => this.put_ContainerName(value)
    }

    /**
     * @type {BSTR} 
     */
    ProviderName {
        get => this.get_ProviderName()
        set => this.put_ProviderName(value)
    }

    /**
     * @type {Integer} 
     */
    ProviderType {
        get => this.get_ProviderType()
        set => this.put_ProviderType(value)
    }

    /**
     * @type {Integer} 
     */
    KeySpec {
        get => this.get_KeySpec()
        set => this.put_KeySpec(value)
    }

    /**
     * @type {Integer} 
     */
    ProviderFlags {
        get => this.get_ProviderFlags()
        set => this.put_ProviderFlags(value)
    }

    /**
     * @type {BOOL} 
     */
    UseExistingKeySet {
        get => this.get_UseExistingKeySet()
        set => this.put_UseExistingKeySet(value)
    }

    /**
     * @type {Integer} 
     */
    GenKeyFlags {
        get => this.get_GenKeyFlags()
        set => this.put_GenKeyFlags(value)
    }

    /**
     * @type {BOOL} 
     */
    DeleteRequestCert {
        get => this.get_DeleteRequestCert()
        set => this.put_DeleteRequestCert(value)
    }

    /**
     * @type {BOOL} 
     */
    WriteCertToCSP {
        get => this.get_WriteCertToCSP()
        set => this.put_WriteCertToCSP(value)
    }

    /**
     * @type {BSTR} 
     */
    SPCFileName {
        get => this.get_SPCFileName()
        set => this.put_SPCFileName(value)
    }

    /**
     * @type {BSTR} 
     */
    PVKFileName {
        get => this.get_PVKFileName()
        set => this.put_PVKFileName(value)
    }

    /**
     * @type {BSTR} 
     */
    HashAlgorithm {
        get => this.get_HashAlgorithm()
        set => this.put_HashAlgorithm(value)
    }

    /**
     * Creates a base64-encoded PKCS
     * @param {BSTR} DNName The distinguished name (DN) of the entity for which the request is being made. <i>DNName</i> must follow the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/x-gly">X.500</a> naming convention. For example "CN=User, O=Microsoft". If a two-letter prefix does not exist, an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) may be provided instead.
     * @param {BSTR} Usage An <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">OID</a> that describes the purpose of the certificate being generated, for example, individual or commercial Authenticode certificate, or client authentication. You can also specify multiple OIDs separated by a comma.
     * 
     * The OID is passed through to the PKCS #10 request. The control does not examine the OID.
     * @param {BSTR} wszPKCS10FileName The name of the file in which the base64-encoded PKCS #10 (in <b>BSTR</b> form) is saved. The contents of this file may be submitted to a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a> for processing.
     * @returns {HRESULT} <h3>VB</h3>
     * The return value is an <b>HRESULT</b>. A value of <b>S_OK</b> indicates success.
     * 
     * If the method fails, the return value is an <b>HRESULT</b> indicating the error. For a list of common error codes, see 
     * <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-createfilepkcs10
     */
    createFilePKCS10(DNName, Usage, wszPKCS10FileName) {
        DNName := DNName is String ? BSTR.Alloc(DNName).Value : DNName
        Usage := Usage is String ? BSTR.Alloc(Usage).Value : Usage
        wszPKCS10FileName := wszPKCS10FileName is String ? BSTR.Alloc(wszPKCS10FileName).Value : wszPKCS10FileName

        result := ComCall(7, this, "ptr", DNName, "ptr", Usage, "ptr", wszPKCS10FileName, "HRESULT")
        return result
    }

    /**
     * Accepts and processes a file that contains a PKCS
     * @param {BSTR} wszPKCS7FileName Specifies the name of the file that contains the PKCS #7 message.
     * @returns {HRESULT} <h3>VB</h3>
     * The return value is an <b>HRESULT</b>. A value of S_OK indicates success. Upon successful completion of this function, the PKCS #7 message in the file will be accepted.
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-acceptfilepkcs7
     */
    acceptFilePKCS7(wszPKCS7FileName) {
        wszPKCS7FileName := wszPKCS7FileName is String ? BSTR.Alloc(wszPKCS7FileName).Value : wszPKCS7FileName

        result := ComCall(8, this, "ptr", wszPKCS7FileName, "HRESULT")
        return result
    }

    /**
     * Creates a base64-encoded PKCS
     * @param {BSTR} DNName The distinguished name (DN) of the entity for which the request is being made. In this parameter, the DN name must follow the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/x-gly">X.500</a> naming convention. For example "CN=User, O=Microsoft". If a two-letter prefix does not exist, an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">OID</a> may be provided instead.
     * @param {BSTR} Usage An <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) that describes the purpose of the certificate being generated. For example, Individual or Commercial Authenticode certificate, or Client Authentication. You can also specify multiple OIDs separated by a comma.
     * 
     * The  OID is passed through to the PKCS #10 request. For general extensibility and ease of understanding, the control does not attempt to understand specific-purpose OIDs. Therefore if you specify a Client Authentication OID, the generated key will still be a signature key, not an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/e-gly">exchange key</a>.
     * @returns {BSTR} The returned base64-encoded PKCS10 certificate request.
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-createpkcs10
     */
    createPKCS10(DNName, Usage) {
        DNName := DNName is String ? BSTR.Alloc(DNName).Value : DNName
        Usage := Usage is String ? BSTR.Alloc(Usage).Value : Usage

        pPKCS10 := BSTR()
        result := ComCall(9, this, "ptr", DNName, "ptr", Usage, "ptr", pPKCS10, "HRESULT")
        return pPKCS10
    }

    /**
     * Accepts and processes a PKCS
     * @param {BSTR} PKCS7 Represents the base64-encoded PKCS #7 that contains the certificate and the chain of certificates that identifies the issuer.
     * @returns {HRESULT} <h3>VB</h3>
     * The return value is an <b>HRESULT</b>. A value of S_OK indicates success. Upon successful completion of this function, the PKCS #7 will be accepted.
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-acceptpkcs7
     */
    acceptPKCS7(PKCS7) {
        PKCS7 := PKCS7 is String ? BSTR.Alloc(PKCS7).Value : PKCS7

        result := ComCall(10, this, "ptr", PKCS7, "HRESULT")
        return result
    }

    /**
     * Retrieves the certificate, contained in a PKCS
     * @param {BSTR} wszPKCS7 Specifies the PKCS #7 from which the issued certificate is being retrieved.
     * @returns {BSTR} A pointer to a <b>BSTR</b> variable to receive the issued certificate. When you have finished using the <b>BSTR</b>, free it by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-getcertfrompkcs7
     */
    getCertFromPKCS7(wszPKCS7) {
        wszPKCS7 := wszPKCS7 is String ? BSTR.Alloc(wszPKCS7).Value : wszPKCS7

        pbstrCert := BSTR()
        result := ComCall(11, this, "ptr", wszPKCS7, "ptr", pbstrCert, "HRESULT")
        return pbstrCert
    }

    /**
     * Retrieves the names of the available cryptographic service providers (CSPs) specified by the ProviderType property. This method was first defined in the ICEnroll interface.
     * @param {Integer} dwIndex Specifies the ordinal position of the CSP whose name will be retrieved. Specify zero for the first CSP.
     * @param {Integer} dwFlags Specifies flags that are passed through to the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptenumprovidersa">CryptEnumProviders</a> function. This parameter is not currently used; specify zero.
     * @returns {BSTR} A pointer to a <b>BSTR</b> variable that receives the name of a CSP with the specified property type. When you have finished using the <b>BSTR</b>, free it by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-enumproviders
     */
    enumProviders(dwIndex, dwFlags) {
        pbstrProvName := BSTR()
        result := ComCall(12, this, "int", dwIndex, "int", dwFlags, "ptr", pbstrProvName, "HRESULT")
        return pbstrProvName
    }

    /**
     * Retrieves the names of containers for the cryptographic service provider (CSP) specified by the ProviderName property. This method was first defined in the ICEnroll interface.
     * @param {Integer} dwIndex Specifies the ordinal position of the container whose name will be retrieved. Specify zero for the first container.
     * @returns {BSTR} A pointer to a <b>BSTR</b> variable that receives the name of the container. When you have finished using the <b>BSTR</b>, free it by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-enumcontainers
     */
    enumContainers(dwIndex) {
        pbstr := BSTR()
        result := ComCall(13, this, "int", dwIndex, "ptr", pbstr, "HRESULT")
        return pbstr
    }

    /**
     * Releases session identifiers when they are no longer needed.
     * @param {BSTR} PKCS7OrPKCS10 Specifies the session identifier that represents the data.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-freerequestinfo
     */
    freeRequestInfo(PKCS7OrPKCS10) {
        PKCS7OrPKCS10 := PKCS7OrPKCS10 is String ? BSTR.Alloc(PKCS7OrPKCS10).Value : PKCS7OrPKCS10

        result := ComCall(14, this, "ptr", PKCS7OrPKCS10, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the name of the store where certificates with linked private keys are kept.
     * @remarks
     * 
     * The <b>MyStoreName</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptpkcs7">acceptPKCS7</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptfilepkcs7">acceptFilePKCS7</a>
     * </li>
     * </ul>
     * 
     * 
     * The ability to set this property is disabled when  the Certificate Enrollment Control is executed as a scripted control.
     * 
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-get_mystorename
     */
    get_MyStoreName() {
        pbstrName := BSTR()
        result := ComCall(15, this, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * Sets or retrieves the name of the store where certificates with linked private keys are kept.
     * @remarks
     * 
     * The <b>MyStoreName</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptpkcs7">acceptPKCS7</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptfilepkcs7">acceptFilePKCS7</a>
     * </li>
     * </ul>
     * 
     * 
     * The ability to set this property is disabled when  the Certificate Enrollment Control is executed as a scripted control.
     * 
     * 
     * 
     * @param {BSTR} bstrName 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-put_mystorename
     */
    put_MyStoreName(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(16, this, "ptr", bstrName, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the type of store specified by the MyStoreName property.
     * @remarks
     * 
     * The <b>MyStoreType</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptpkcs7">acceptPKCS7</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptfilepkcs7">acceptFilePKCS7</a>
     * </li>
     * </ul>
     * 
     * 
     * The ability to set this property is disabled when  the Certificate Enrollment Control is executed as a scripted control.
     * 
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-get_mystoretype
     */
    get_MyStoreType() {
        pbstrType := BSTR()
        result := ComCall(17, this, "ptr", pbstrType, "HRESULT")
        return pbstrType
    }

    /**
     * Sets or retrieves the type of store specified by the MyStoreName property.
     * @remarks
     * 
     * The <b>MyStoreType</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptpkcs7">acceptPKCS7</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptfilepkcs7">acceptFilePKCS7</a>
     * </li>
     * </ul>
     * 
     * 
     * The ability to set this property is disabled when  the Certificate Enrollment Control is executed as a scripted control.
     * 
     * 
     * 
     * @param {BSTR} bstrType 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-put_mystoretype
     */
    put_MyStoreType(bstrType) {
        bstrType := bstrType is String ? BSTR.Alloc(bstrType).Value : bstrType

        result := ComCall(18, this, "ptr", bstrType, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the registry location used for MY store.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptpkcs7">acceptPKCS7</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptfilepkcs7">acceptFilePKCS7</a>
     * </li>
     * </ul>
     * 
     * 
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-get_mystoreflags
     */
    get_MyStoreFlags() {
        result := ComCall(19, this, "int*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    /**
     * Sets or retrieves the registry location used for MY store.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptpkcs7">acceptPKCS7</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptfilepkcs7">acceptFilePKCS7</a>
     * </li>
     * </ul>
     * 
     * 
     * 
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-put_mystoreflags
     */
    put_MyStoreFlags(dwFlags) {
        result := ComCall(20, this, "int", dwFlags, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the name of the store where all non-&quot;ROOT&quot; and non-&quot;MY&quot; certificates are kept.
     * @remarks
     * 
     * The <b>CAStoreName</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptpkcs7">acceptPKCS7</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptfilepkcs7">acceptFilePKCS7</a>
     * </li>
     * </ul>
     * 
     * 
     * The ability to set this property is disabled when  the Certificate Enrollment Control is executed as a scripted control.
     * 
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-get_castorename
     */
    get_CAStoreName() {
        pbstrName := BSTR()
        result := ComCall(21, this, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * Sets or retrieves the name of the store where all non-&quot;ROOT&quot; and non-&quot;MY&quot; certificates are kept.
     * @remarks
     * 
     * The <b>CAStoreName</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptpkcs7">acceptPKCS7</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptfilepkcs7">acceptFilePKCS7</a>
     * </li>
     * </ul>
     * 
     * 
     * The ability to set this property is disabled when  the Certificate Enrollment Control is executed as a scripted control.
     * 
     * 
     * 
     * @param {BSTR} bstrName 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-put_castorename
     */
    put_CAStoreName(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(22, this, "ptr", bstrName, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the type of store to use for the store specified by the CAStoreName property.
     * @remarks
     * 
     * The <b>CAStoreType</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptpkcs7">acceptPKCS7</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptfilepkcs7">acceptFilePKCS7</a>
     * </li>
     * </ul>
     * 
     * 
     * The ability to set this property is disabled when  the Certificate Enrollment Control is executed as a scripted control.
     * 
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-get_castoretype
     */
    get_CAStoreType() {
        pbstrType := BSTR()
        result := ComCall(23, this, "ptr", pbstrType, "HRESULT")
        return pbstrType
    }

    /**
     * Sets or retrieves the type of store to use for the store specified by the CAStoreName property.
     * @remarks
     * 
     * The <b>CAStoreType</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptpkcs7">acceptPKCS7</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptfilepkcs7">acceptFilePKCS7</a>
     * </li>
     * </ul>
     * 
     * 
     * The ability to set this property is disabled when  the Certificate Enrollment Control is executed as a scripted control.
     * 
     * 
     * 
     * @param {BSTR} bstrType 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-put_castoretype
     */
    put_CAStoreType(bstrType) {
        bstrType := bstrType is String ? BSTR.Alloc(bstrType).Value : bstrType

        result := ComCall(24, this, "ptr", bstrType, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a flag that controls the certification authority (CA) store when the store is opened.
     * @remarks
     * 
     * The <b>CAStoreFlags</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptpkcs7">acceptPKCS7</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptfilepkcs7">acceptFilePKCS7</a>
     * </li>
     * </ul>
     * 
     * 
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-get_castoreflags
     */
    get_CAStoreFlags() {
        result := ComCall(25, this, "int*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    /**
     * Sets or retrieves a flag that controls the certification authority (CA) store when the store is opened.
     * @remarks
     * 
     * The <b>CAStoreFlags</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptpkcs7">acceptPKCS7</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptfilepkcs7">acceptFilePKCS7</a>
     * </li>
     * </ul>
     * 
     * 
     * 
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-put_castoreflags
     */
    put_CAStoreFlags(dwFlags) {
        result := ComCall(26, this, "int", dwFlags, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the name of the root store where all intrinsically trusted, self-signed root certificates are kept.
     * @remarks
     * 
     * <b>RootStoreName</b> affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptpkcs7">acceptPKCS7</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptfilepkcs7">acceptFilePKCS7</a>
     * </li>
     * </ul>
     * 
     * 
     * The ability to set this property is disabled when  the Certificate Enrollment Control is executed as a scripted control.
     * 
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-get_rootstorename
     */
    get_RootStoreName() {
        pbstrName := BSTR()
        result := ComCall(27, this, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * Sets or retrieves the name of the root store where all intrinsically trusted, self-signed root certificates are kept.
     * @remarks
     * 
     * <b>RootStoreName</b> affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptpkcs7">acceptPKCS7</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptfilepkcs7">acceptFilePKCS7</a>
     * </li>
     * </ul>
     * 
     * 
     * The ability to set this property is disabled when  the Certificate Enrollment Control is executed as a scripted control.
     * 
     * 
     * 
     * @param {BSTR} bstrName 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-put_rootstorename
     */
    put_RootStoreName(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(28, this, "ptr", bstrName, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the type of store to use for the store specified by the RootStoreName property.
     * @remarks
     * 
     * <b>RootStoreType</b> affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptpkcs7">acceptPKCS7</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptfilepkcs7">acceptFilePKCS7</a>
     * </li>
     * </ul>
     * 
     * 
     * The ability to set this property is disabled when  the Certificate Enrollment Control is executed as a scripted control.
     * 
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-get_rootstoretype
     */
    get_RootStoreType() {
        pbstrType := BSTR()
        result := ComCall(29, this, "ptr", pbstrType, "HRESULT")
        return pbstrType
    }

    /**
     * Sets or retrieves the type of store to use for the store specified by the RootStoreName property.
     * @remarks
     * 
     * <b>RootStoreType</b> affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptpkcs7">acceptPKCS7</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptfilepkcs7">acceptFilePKCS7</a>
     * </li>
     * </ul>
     * 
     * 
     * The ability to set this property is disabled when  the Certificate Enrollment Control is executed as a scripted control.
     * 
     * 
     * 
     * @param {BSTR} bstrType 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-put_rootstoretype
     */
    put_RootStoreType(bstrType) {
        bstrType := bstrType is String ? BSTR.Alloc(bstrType).Value : bstrType

        result := ComCall(30, this, "ptr", bstrType, "HRESULT")
        return result
    }

    /**
     * The RootStoreFlags property of ICEnroll4 sets or retrieves the registry location used for the root store.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptpkcs7">acceptPKCS7</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptfilepkcs7">acceptFilePKCS7</a>
     * </li>
     * </ul>
     * 
     * 
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-get_rootstoreflags
     */
    get_RootStoreFlags() {
        result := ComCall(31, this, "int*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    /**
     * The RootStoreFlags property of ICEnroll4 sets or retrieves the registry location used for the root store.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptpkcs7">acceptPKCS7</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptfilepkcs7">acceptFilePKCS7</a>
     * </li>
     * </ul>
     * 
     * 
     * 
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-put_rootstoreflags
     */
    put_RootStoreFlags(dwFlags) {
        result := ComCall(32, this, "int", dwFlags, "HRESULT")
        return result
    }

    /**
     * Sets or retrievesICEnroll the name of the store that contains the dummy certificate.
     * @remarks
     * 
     * Typically, modification of the <b>RequestStoreName</b> property is  performed only in advanced applications. Changing this value is not recommended for most applications.
     * 
     * 
     * The <b>RequestStoreName</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptpkcs7">acceptPKCS7</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptfilepkcs7">acceptFilePKCS7</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createpkcs10">createPKCS10</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createfilepkcs10">createFilePKCS10</a>
     * </li>
     * </ul>
     * 
     * 
     * The ability to set this property is disabled when  the Certificate Enrollment Control is executed as a scripted control.
     * 
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-get_requeststorename
     */
    get_RequestStoreName() {
        pbstrName := BSTR()
        result := ComCall(33, this, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * Sets or retrievesICEnroll the name of the store that contains the dummy certificate.
     * @remarks
     * 
     * Typically, modification of the <b>RequestStoreName</b> property is  performed only in advanced applications. Changing this value is not recommended for most applications.
     * 
     * 
     * The <b>RequestStoreName</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptpkcs7">acceptPKCS7</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptfilepkcs7">acceptFilePKCS7</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createpkcs10">createPKCS10</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createfilepkcs10">createFilePKCS10</a>
     * </li>
     * </ul>
     * 
     * 
     * The ability to set this property is disabled when  the Certificate Enrollment Control is executed as a scripted control.
     * 
     * 
     * 
     * @param {BSTR} bstrName 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-put_requeststorename
     */
    put_RequestStoreName(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(34, this, "ptr", bstrName, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the type of store to use for the store specified by the RequestStoreName property. This store type is passed directly to the CertOpenStore function.
     * @remarks
     * 
     * Typically, modification of the <b>RequestStoreType</b> property is  performed only in advanced applications.
     * 
     * 
     * <b>RequestStoreType</b> affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptpkcs7">acceptPKCS7</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptfilepkcs7">acceptFilePKCS7</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createpkcs10">createPKCS10</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createfilepkcs10">createFilePKCS10</a>
     * </li>
     * </ul>
     * 
     * 
     * The ability to set this property is disabled when  the Certificate Enrollment Control is executed as a scripted control.
     * 
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-get_requeststoretype
     */
    get_RequestStoreType() {
        pbstrType := BSTR()
        result := ComCall(35, this, "ptr", pbstrType, "HRESULT")
        return pbstrType
    }

    /**
     * Sets or retrieves the type of store to use for the store specified by the RequestStoreName property. This store type is passed directly to the CertOpenStore function.
     * @remarks
     * 
     * Typically, modification of the <b>RequestStoreType</b> property is  performed only in advanced applications.
     * 
     * 
     * <b>RequestStoreType</b> affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptpkcs7">acceptPKCS7</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptfilepkcs7">acceptFilePKCS7</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createpkcs10">createPKCS10</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createfilepkcs10">createFilePKCS10</a>
     * </li>
     * </ul>
     * 
     * 
     * The ability to set this property is disabled when  the Certificate Enrollment Control is executed as a scripted control.
     * 
     * 
     * 
     * @param {BSTR} bstrType 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-put_requeststoretype
     */
    put_RequestStoreType(bstrType) {
        bstrType := bstrType is String ? BSTR.Alloc(bstrType).Value : bstrType

        result := ComCall(36, this, "ptr", bstrType, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the registry location used for the request store.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptpkcs7">acceptPKCS7</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptfilepkcs7">acceptFilePKCS7</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createpkcs10">createPKCS10</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createfilepkcs10">createFilePKCS10</a>
     * </li>
     * </ul>
     * 
     * 
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-get_requeststoreflags
     */
    get_RequestStoreFlags() {
        result := ComCall(37, this, "int*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    /**
     * Sets or retrieves the registry location used for the request store.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptpkcs7">acceptPKCS7</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptfilepkcs7">acceptFilePKCS7</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createpkcs10">createPKCS10</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createfilepkcs10">createFilePKCS10</a>
     * </li>
     * </ul>
     * 
     * 
     * 
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-put_requeststoreflags
     */
    put_RequestStoreFlags(dwFlags) {
        result := ComCall(38, this, "int", dwFlags, "HRESULT")
        return result
    }

    /**
     * The ContainerName property of ICEnroll4 sets or retrieves the name of the key container to use.
     * @remarks
     * 
     * The container specified may be an existing container or a new one. It may only be an existing container if the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-get_useexistingkeyset">UseExistingKeySet</a> property is set, as long as the key set has not been generated yet. For example, if only an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/e-gly">exchange key</a> set has been generated for a container, it is still possible to perform a certificate enrollment using the signature key set without setting <b>UseExistingKeySet</b>. The <i>exchange key set</i> could be used if <b>UseExistingKeySet</b> is set beforehand.
     * 
     * By default, a new container is selected each time the <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nn-xenroll-icenroll">ICEnroll</a> control is run. This ensures that a new key set is generated. If this property is not explicitly set, a generated GUID is used as the container name.
     * 
     * 
     * The <b>ContainerName</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createpkcs10">createPKCS10</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createfilepkcs10">createFilePKCS10</a>
     * </li>
     * </ul>
     * 
     * 
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-get_containername
     */
    get_ContainerName() {
        pbstrContainer := BSTR()
        result := ComCall(39, this, "ptr", pbstrContainer, "HRESULT")
        return pbstrContainer
    }

    /**
     * The ContainerName property of ICEnroll4 sets or retrieves the name of the key container to use.
     * @remarks
     * 
     * The container specified may be an existing container or a new one. It may only be an existing container if the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-get_useexistingkeyset">UseExistingKeySet</a> property is set, as long as the key set has not been generated yet. For example, if only an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/e-gly">exchange key</a> set has been generated for a container, it is still possible to perform a certificate enrollment using the signature key set without setting <b>UseExistingKeySet</b>. The <i>exchange key set</i> could be used if <b>UseExistingKeySet</b> is set beforehand.
     * 
     * By default, a new container is selected each time the <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nn-xenroll-icenroll">ICEnroll</a> control is run. This ensures that a new key set is generated. If this property is not explicitly set, a generated GUID is used as the container name.
     * 
     * 
     * The <b>ContainerName</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createpkcs10">createPKCS10</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createfilepkcs10">createFilePKCS10</a>
     * </li>
     * </ul>
     * 
     * 
     * 
     * 
     * @param {BSTR} bstrContainer 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-put_containername
     */
    put_ContainerName(bstrContainer) {
        bstrContainer := bstrContainer is String ? BSTR.Alloc(bstrContainer).Value : bstrContainer

        result := ComCall(40, this, "ptr", bstrContainer, "HRESULT")
        return result
    }

    /**
     * The ProviderName property of ICEnroll4 sets or retrieves the name of the cryptographic service provider (CSP) to use.
     * @remarks
     * 
     * The <b>ProviderName</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createpkcs10">createPKCS10</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createfilepkcs10">createFilePKCS10</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-enumcontainers">enumContainers</a>
     * </li>
     * </ul>
     * 
     * 
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-get_providername
     */
    get_ProviderName() {
        pbstrProvider := BSTR()
        result := ComCall(41, this, "ptr", pbstrProvider, "HRESULT")
        return pbstrProvider
    }

    /**
     * The ProviderName property of ICEnroll4 sets or retrieves the name of the cryptographic service provider (CSP) to use.
     * @remarks
     * 
     * The <b>ProviderName</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createpkcs10">createPKCS10</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createfilepkcs10">createFilePKCS10</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-enumcontainers">enumContainers</a>
     * </li>
     * </ul>
     * 
     * 
     * 
     * 
     * @param {BSTR} bstrProvider 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-put_providername
     */
    put_ProviderName(bstrProvider) {
        bstrProvider := bstrProvider is String ? BSTR.Alloc(bstrProvider).Value : bstrProvider

        result := ComCall(42, this, "ptr", bstrProvider, "HRESULT")
        return result
    }

    /**
     * The ProviderType property of ICEnroll4 sets or retrieves the type of provider.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createpkcs10">createPKCS10</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createfilepkcs10">createFilePKCS10</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-enumproviders">enumProviders</a>
     * </li>
     * </ul>
     * 
     * 
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-get_providertype
     */
    get_ProviderType() {
        result := ComCall(43, this, "int*", &pdwType := 0, "HRESULT")
        return pdwType
    }

    /**
     * The ProviderType property of ICEnroll4 sets or retrieves the type of provider.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createpkcs10">createPKCS10</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createfilepkcs10">createFilePKCS10</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-enumproviders">enumProviders</a>
     * </li>
     * </ul>
     * 
     * 
     * 
     * 
     * @param {Integer} dwType 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-put_providertype
     */
    put_ProviderType(dwType) {
        result := ComCall(44, this, "int", dwType, "HRESULT")
        return result
    }

    /**
     * The KeySpec property of ICEnroll4 sets or retrieves the type of key generated.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createpkcs10">createPKCS10</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createfilepkcs10">createFilePKCS10</a>
     * </li>
     * </ul>
     * 
     * 
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-get_keyspec
     */
    get_KeySpec() {
        result := ComCall(45, this, "int*", &pdw := 0, "HRESULT")
        return pdw
    }

    /**
     * The KeySpec property of ICEnroll4 sets or retrieves the type of key generated.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createpkcs10">createPKCS10</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createfilepkcs10">createFilePKCS10</a>
     * </li>
     * </ul>
     * 
     * 
     * 
     * 
     * @param {Integer} dw 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-put_keyspec
     */
    put_KeySpec(dw) {
        result := ComCall(46, this, "int", dw, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the provider type.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createpkcs10">createPKCS10</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createfilepkcs10">createFilePKCS10</a>
     * </li>
     * </ul>
     * 
     * 
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-get_providerflags
     */
    get_ProviderFlags() {
        result := ComCall(47, this, "int*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    /**
     * Sets or retrieves the provider type.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createpkcs10">createPKCS10</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createfilepkcs10">createFilePKCS10</a>
     * </li>
     * </ul>
     * 
     * 
     * 
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-put_providerflags
     */
    put_ProviderFlags(dwFlags) {
        result := ComCall(48, this, "int", dwFlags, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a Boolean value that determines whether the existing keys should be used.
     * @remarks
     * 
     *  If an existing key set is used, the <b>UseExistingKeySet</b> property must be set to true.
     * 
     * 
     * The <b>UseExistingKeySet</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createpkcs10">createPKCS10</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createfilepkcs10">createFilePKCS10</a>
     * </li>
     * </ul>
     * 
     * 
     * 
     * 
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-get_useexistingkeyset
     */
    get_UseExistingKeySet() {
        result := ComCall(49, this, "int*", &fUseExistingKeys := 0, "HRESULT")
        return fUseExistingKeys
    }

    /**
     * Sets or retrieves a Boolean value that determines whether the existing keys should be used.
     * @remarks
     * 
     *  If an existing key set is used, the <b>UseExistingKeySet</b> property must be set to true.
     * 
     * 
     * The <b>UseExistingKeySet</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createpkcs10">createPKCS10</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createfilepkcs10">createFilePKCS10</a>
     * </li>
     * </ul>
     * 
     * 
     * 
     * 
     * @param {BOOL} fUseExistingKeys 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-put_useexistingkeyset
     */
    put_UseExistingKeySet(fUseExistingKeys) {
        result := ComCall(50, this, "int", fUseExistingKeys, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the values passed to the CryptGenKey function when the certificate request is generated.
     * @remarks
     * 
     * By default, private keys are not exportable unless a .pvk file is requested. To make the private key exportable without specifying a .pvk file, set <b>GenKeyFlags</b> to CRYPT_EXPORTABLE.
     * 
     * To specify a .pvk file name,  use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-get_pvkfilename">PVKFileName</a> property.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createpkcs10">createPKCS10</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createfilepkcs10">createFilePKCS10</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll4-createrequest">createRequest</a>
     * </li>
     * </ul>
     * 
     * 
     * <div class="alert"><b>Note</b>  The default value for the <b>GenKeyFlags</b> property is zero. If you need to change this value, you must do so before calling these methods. After calling any of these methods, you cannot change the <b>GenKeyFlags</b> property value.</div>
     * <div> </div>
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-get_genkeyflags
     */
    get_GenKeyFlags() {
        result := ComCall(51, this, "int*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    /**
     * Sets or retrieves the values passed to the CryptGenKey function when the certificate request is generated.
     * @remarks
     * 
     * By default, private keys are not exportable unless a .pvk file is requested. To make the private key exportable without specifying a .pvk file, set <b>GenKeyFlags</b> to CRYPT_EXPORTABLE.
     * 
     * To specify a .pvk file name,  use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-get_pvkfilename">PVKFileName</a> property.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createpkcs10">createPKCS10</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createfilepkcs10">createFilePKCS10</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll4-createrequest">createRequest</a>
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
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-put_genkeyflags
     */
    put_GenKeyFlags(dwFlags) {
        result := ComCall(52, this, "int", dwFlags, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a Boolean value that determines whether dummy certificates in the request store are deleted.
     * @remarks
     * 
     * The <b>DeleteRequestCert</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptpkcs7">acceptPKCS7</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptfilepkcs7">acceptFilePKCS7</a>
     * </li>
     * </ul>
     * 
     * 
     * 
     * 
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-get_deleterequestcert
     */
    get_DeleteRequestCert() {
        result := ComCall(53, this, "int*", &fDelete := 0, "HRESULT")
        return fDelete
    }

    /**
     * Sets or retrieves a Boolean value that determines whether dummy certificates in the request store are deleted.
     * @remarks
     * 
     * The <b>DeleteRequestCert</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptpkcs7">acceptPKCS7</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptfilepkcs7">acceptFilePKCS7</a>
     * </li>
     * </ul>
     * 
     * 
     * 
     * 
     * @param {BOOL} fDelete 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-put_deleterequestcert
     */
    put_DeleteRequestCert(fDelete) {
        result := ComCall(54, this, "int", fDelete, "HRESULT")
        return result
    }

    /**
     * The WriteCertToCSP property of ICEnroll4 sets or retrieves a Boolean value that determines whether a certificate should be written to the cryptographic service provider (CSP).
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptpkcs7">acceptPKCS7</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptfilepkcs7">acceptFilePKCS7</a>
     * </li>
     * </ul>
     * 
     * 
     * 
     * 
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-get_writecerttocsp
     */
    get_WriteCertToCSP() {
        result := ComCall(55, this, "int*", &fBool := 0, "HRESULT")
        return fBool
    }

    /**
     * The WriteCertToCSP property of ICEnroll4 sets or retrieves a Boolean value that determines whether a certificate should be written to the cryptographic service provider (CSP).
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptpkcs7">acceptPKCS7</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptfilepkcs7">acceptFilePKCS7</a>
     * </li>
     * </ul>
     * 
     * 
     * 
     * 
     * @param {BOOL} fBool 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-put_writecerttocsp
     */
    put_WriteCertToCSP(fBool) {
        result := ComCall(56, this, "int", fBool, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the name of the file to which to write the base64-encoded PKCS
     * @remarks
     * 
     * The file is written as a binary PKCS #7. Specifying this file does not affect the acceptance of the certificates into any of the user's stores.
     * 
     * If the file already exists, the user is notified and prompted for permission to overwrite it.
     * 
     * 
     * <b>SPCFileName</b> affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptpkcs7">acceptPKCS7</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptfilepkcs7">acceptFilePKCS7</a>
     * </li>
     * </ul>
     * 
     * 
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-get_spcfilename
     */
    get_SPCFileName() {
        pbstr := BSTR()
        result := ComCall(57, this, "ptr", pbstr, "HRESULT")
        return pbstr
    }

    /**
     * Sets or retrieves the name of the file to which to write the base64-encoded PKCS
     * @remarks
     * 
     * The file is written as a binary PKCS #7. Specifying this file does not affect the acceptance of the certificates into any of the user's stores.
     * 
     * If the file already exists, the user is notified and prompted for permission to overwrite it.
     * 
     * 
     * <b>SPCFileName</b> affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptpkcs7">acceptPKCS7</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptfilepkcs7">acceptFilePKCS7</a>
     * </li>
     * </ul>
     * 
     * 
     * 
     * 
     * @param {BSTR} bstr 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-put_spcfilename
     */
    put_SPCFileName(bstr) {
        bstr := bstr is String ? BSTR.Alloc(bstr).Value : bstr

        result := ComCall(58, this, "ptr", bstr, "HRESULT")
        return result
    }

    /**
     * The PVKFileName property of ICEnroll4 sets or retrieves the name of the file that will contain exported keys.
     * @remarks
     * 
     * The <b>PVKFileName</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createpkcs10">createPKCS10</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createfilepkcs10">createFilePKCS10</a>
     * </li>
     * </ul>
     * 
     * 
     * Exporting functionality may not be supported by the  <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a> (CSP). Historically, <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Authenticode</a> has exported the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">private key</a> to a .pvk file on a disk and removed the keys from the registry. By default, private keys are not generated for exportation, and many cryptographic service providers do not support exporting keys. However, if the CSP supports exporting private keys, specifying a non-NULL value for the <b>PVKFileName</b> property causes the private keys to be generated as exportable and the private and public keys to be written to the file specified by the <b>PVKFileName</b> property. The private key is removed from the CSP. The file name specified by the property can be any accessible file. By default, no .pvk file is generated, and the keys are not generated as exportable.
     * 
     * If the .pvk file already exists, the user is notified and prompted for permission to overwrite it.
     * 
     * 
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-get_genkeyflags">GenKeyFlags</a> property also has a flag that controls whether the private key can be exported. Use care when using  the <b>GenKeyFlags</b> property and the <b>PVKFileName</b> property together. If the <b>PVKFileName</b> property is set first, the <b>GenKeyFlags</b> property is automatically set to CRYPT_EXPORTABLE. If the <b>GenKeyFlags</b> property is set (by using the <b>put_GenKeyFlags</b> function) without including the CRYPT_EXPORTABLE flag, then the <b>GenKeyFlags</b> will not be set to CRYPT_EXPORTABLE, and the generated keys will not be exportable. The following procedure demonstrates this:
     * 
     * <ol>
     * <li>Call <b>put_PVKFileName</b> to set the file name for the file that will receive the exported keys. The <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-get_genkeyflags">GenKeyFlags</a> property is automatically set to CRYPT_EXPORTABLE.</li>
     * <li>Call <b>put_GenKeyFlags</b> with a value not set to CRYPT_EXPORTABLE, for example, zero.</li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-get_genkeyflags">GenKeyFlags</a> is no longer set to CRYPT_EXPORTABLE (the value that was automatically set in step one).</li>
     * </ol>
     * 
     * 
     * Any keys generated by following the previous steps will be not exportable. Therefore, it is recommended that the user set the <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-get_genkeyflags">GenKeyFlags</a> property before the <b>PVKFileName</b> property when they are used together.
     * 
     * Alternatively, the user could determine the current value of the CRYPT_EXPORTABLE bit in the <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-get_genkeyflags">GenKeyFlags</a> property and then perform a bitwise-<b>OR</b> operation between this value and any changes that are made to the <b>GenKeyFlags</b> property to ensure that the bit is not wiped out. The user could also specifically set the CRYPT_EXPORTABLE bit when updating the <b>GenKeyFlags</b> property.
     * 
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-get_pvkfilename
     */
    get_PVKFileName() {
        pbstr := BSTR()
        result := ComCall(59, this, "ptr", pbstr, "HRESULT")
        return pbstr
    }

    /**
     * The PVKFileName property of ICEnroll4 sets or retrieves the name of the file that will contain exported keys.
     * @remarks
     * 
     * The <b>PVKFileName</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createpkcs10">createPKCS10</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createfilepkcs10">createFilePKCS10</a>
     * </li>
     * </ul>
     * 
     * 
     * Exporting functionality may not be supported by the  <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a> (CSP). Historically, <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Authenticode</a> has exported the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">private key</a> to a .pvk file on a disk and removed the keys from the registry. By default, private keys are not generated for exportation, and many cryptographic service providers do not support exporting keys. However, if the CSP supports exporting private keys, specifying a non-NULL value for the <b>PVKFileName</b> property causes the private keys to be generated as exportable and the private and public keys to be written to the file specified by the <b>PVKFileName</b> property. The private key is removed from the CSP. The file name specified by the property can be any accessible file. By default, no .pvk file is generated, and the keys are not generated as exportable.
     * 
     * If the .pvk file already exists, the user is notified and prompted for permission to overwrite it.
     * 
     * 
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-get_genkeyflags">GenKeyFlags</a> property also has a flag that controls whether the private key can be exported. Use care when using  the <b>GenKeyFlags</b> property and the <b>PVKFileName</b> property together. If the <b>PVKFileName</b> property is set first, the <b>GenKeyFlags</b> property is automatically set to CRYPT_EXPORTABLE. If the <b>GenKeyFlags</b> property is set (by using the <b>put_GenKeyFlags</b> function) without including the CRYPT_EXPORTABLE flag, then the <b>GenKeyFlags</b> will not be set to CRYPT_EXPORTABLE, and the generated keys will not be exportable. The following procedure demonstrates this:
     * 
     * <ol>
     * <li>Call <b>put_PVKFileName</b> to set the file name for the file that will receive the exported keys. The <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-get_genkeyflags">GenKeyFlags</a> property is automatically set to CRYPT_EXPORTABLE.</li>
     * <li>Call <b>put_GenKeyFlags</b> with a value not set to CRYPT_EXPORTABLE, for example, zero.</li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-get_genkeyflags">GenKeyFlags</a> is no longer set to CRYPT_EXPORTABLE (the value that was automatically set in step one).</li>
     * </ol>
     * 
     * 
     * Any keys generated by following the previous steps will be not exportable. Therefore, it is recommended that the user set the <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-get_genkeyflags">GenKeyFlags</a> property before the <b>PVKFileName</b> property when they are used together.
     * 
     * Alternatively, the user could determine the current value of the CRYPT_EXPORTABLE bit in the <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-get_genkeyflags">GenKeyFlags</a> property and then perform a bitwise-<b>OR</b> operation between this value and any changes that are made to the <b>GenKeyFlags</b> property to ensure that the bit is not wiped out. The user could also specifically set the CRYPT_EXPORTABLE bit when updating the <b>GenKeyFlags</b> property.
     * 
     * 
     * 
     * @param {BSTR} bstr 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-put_pvkfilename
     */
    put_PVKFileName(bstr) {
        bstr := bstr is String ? BSTR.Alloc(bstr).Value : bstr

        result := ComCall(60, this, "ptr", bstr, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves only the signature hashing algorithm used to sign the PKCS
     * @remarks
     * 
     * This  signature <a href="https://docs.microsoft.com/windows/desktop/SecGloss/h-gly">hashing algorithm</a> is not to be confused with the <i>hashing algorithm</i> used to sign the certificate. The enrollment control currently supports any <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">OID</a> for <i>hashing algorithms</i>, plus the following display name values: SHA1 (the default), MD2, and MD5. When retrieving this property, the retrieved value is in OID format (that is, SHA1 appears as 1.3.14.3.2.29). When setting this property, the corresponding OID format can be used as an alternative to the text shown for the defined friendly values.
     * 
     * The Certificate Enrollment Control considers the value of the <b>HashAlgorithm</b> property  as a hint to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/h-gly">hashing algorithm</a> to use for signing the PKCS #10 certification request. If the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a> (CSP) supports the algorithm specified in the <b>HashAlgorithm</b> property, the algorithm will be used. Otherwise, the Certificate Enrollment Control will try to use SHA1. If SHA1 is not supported by the CSP, then MD5 will be tried. If neither SHA1 nor MD5 is supported, the Certificate Enrollment Control will try to use the first <i>hashing algorithm</i> returned from the CSP.
     * 
     * 
     * The <b>HashAlgorithm</b>  property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createpkcs10">createPKCS10</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createfilepkcs10">createFilePKCS10</a>
     * </li>
     * </ul>
     * 
     * 
     * If both the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll3-get_hashalgid">HashAlgID</a> and <b>HashAlgorithm</b> properties are set, whichever is last updated will specify which <a href="https://docs.microsoft.com/windows/desktop/SecGloss/h-gly">hashing algorithm</a> will be used to sign the PKCS #10 certification request.
     * 
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-get_hashalgorithm
     */
    get_HashAlgorithm() {
        pbstr := BSTR()
        result := ComCall(61, this, "ptr", pbstr, "HRESULT")
        return pbstr
    }

    /**
     * Sets or retrieves only the signature hashing algorithm used to sign the PKCS
     * @remarks
     * 
     * This  signature <a href="https://docs.microsoft.com/windows/desktop/SecGloss/h-gly">hashing algorithm</a> is not to be confused with the <i>hashing algorithm</i> used to sign the certificate. The enrollment control currently supports any <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">OID</a> for <i>hashing algorithms</i>, plus the following display name values: SHA1 (the default), MD2, and MD5. When retrieving this property, the retrieved value is in OID format (that is, SHA1 appears as 1.3.14.3.2.29). When setting this property, the corresponding OID format can be used as an alternative to the text shown for the defined friendly values.
     * 
     * The Certificate Enrollment Control considers the value of the <b>HashAlgorithm</b> property  as a hint to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/h-gly">hashing algorithm</a> to use for signing the PKCS #10 certification request. If the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a> (CSP) supports the algorithm specified in the <b>HashAlgorithm</b> property, the algorithm will be used. Otherwise, the Certificate Enrollment Control will try to use SHA1. If SHA1 is not supported by the CSP, then MD5 will be tried. If neither SHA1 nor MD5 is supported, the Certificate Enrollment Control will try to use the first <i>hashing algorithm</i> returned from the CSP.
     * 
     * 
     * The <b>HashAlgorithm</b>  property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createpkcs10">createPKCS10</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createfilepkcs10">createFilePKCS10</a>
     * </li>
     * </ul>
     * 
     * 
     * If both the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll3-get_hashalgid">HashAlgID</a> and <b>HashAlgorithm</b> properties are set, whichever is last updated will specify which <a href="https://docs.microsoft.com/windows/desktop/SecGloss/h-gly">hashing algorithm</a> will be used to sign the PKCS #10 certification request.
     * 
     * 
     * 
     * @param {BSTR} bstr 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll-put_hashalgorithm
     */
    put_HashAlgorithm(bstr) {
        bstr := bstr is String ? BSTR.Alloc(bstr).Value : bstr

        result := ComCall(62, this, "ptr", bstr, "HRESULT")
        return result
    }
}
