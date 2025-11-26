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
     * 
     * @param {BSTR} DNName 
     * @param {BSTR} Usage 
     * @param {BSTR} wszPKCS10FileName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-createfilepkcs10
     */
    createFilePKCS10(DNName, Usage, wszPKCS10FileName) {
        DNName := DNName is String ? BSTR.Alloc(DNName).Value : DNName
        Usage := Usage is String ? BSTR.Alloc(Usage).Value : Usage
        wszPKCS10FileName := wszPKCS10FileName is String ? BSTR.Alloc(wszPKCS10FileName).Value : wszPKCS10FileName

        result := ComCall(7, this, "ptr", DNName, "ptr", Usage, "ptr", wszPKCS10FileName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} wszPKCS7FileName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-acceptfilepkcs7
     */
    acceptFilePKCS7(wszPKCS7FileName) {
        wszPKCS7FileName := wszPKCS7FileName is String ? BSTR.Alloc(wszPKCS7FileName).Value : wszPKCS7FileName

        result := ComCall(8, this, "ptr", wszPKCS7FileName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} DNName 
     * @param {BSTR} Usage 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-createpkcs10
     */
    createPKCS10(DNName, Usage) {
        DNName := DNName is String ? BSTR.Alloc(DNName).Value : DNName
        Usage := Usage is String ? BSTR.Alloc(Usage).Value : Usage

        pPKCS10 := BSTR()
        result := ComCall(9, this, "ptr", DNName, "ptr", Usage, "ptr", pPKCS10, "HRESULT")
        return pPKCS10
    }

    /**
     * 
     * @param {BSTR} PKCS7 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-acceptpkcs7
     */
    acceptPKCS7(PKCS7) {
        PKCS7 := PKCS7 is String ? BSTR.Alloc(PKCS7).Value : PKCS7

        result := ComCall(10, this, "ptr", PKCS7, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} wszPKCS7 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-getcertfrompkcs7
     */
    getCertFromPKCS7(wszPKCS7) {
        wszPKCS7 := wszPKCS7 is String ? BSTR.Alloc(wszPKCS7).Value : wszPKCS7

        pbstrCert := BSTR()
        result := ComCall(11, this, "ptr", wszPKCS7, "ptr", pbstrCert, "HRESULT")
        return pbstrCert
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Integer} dwFlags 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-enumproviders
     */
    enumProviders(dwIndex, dwFlags) {
        pbstrProvName := BSTR()
        result := ComCall(12, this, "int", dwIndex, "int", dwFlags, "ptr", pbstrProvName, "HRESULT")
        return pbstrProvName
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-enumcontainers
     */
    enumContainers(dwIndex) {
        pbstr := BSTR()
        result := ComCall(13, this, "int", dwIndex, "ptr", pbstr, "HRESULT")
        return pbstr
    }

    /**
     * 
     * @param {BSTR} PKCS7OrPKCS10 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-freerequestinfo
     */
    freeRequestInfo(PKCS7OrPKCS10) {
        PKCS7OrPKCS10 := PKCS7OrPKCS10 is String ? BSTR.Alloc(PKCS7OrPKCS10).Value : PKCS7OrPKCS10

        result := ComCall(14, this, "ptr", PKCS7OrPKCS10, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-get_mystorename
     */
    get_MyStoreName() {
        pbstrName := BSTR()
        result := ComCall(15, this, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-put_mystorename
     */
    put_MyStoreName(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(16, this, "ptr", bstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-get_mystoretype
     */
    get_MyStoreType() {
        pbstrType := BSTR()
        result := ComCall(17, this, "ptr", pbstrType, "HRESULT")
        return pbstrType
    }

    /**
     * 
     * @param {BSTR} bstrType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-put_mystoretype
     */
    put_MyStoreType(bstrType) {
        bstrType := bstrType is String ? BSTR.Alloc(bstrType).Value : bstrType

        result := ComCall(18, this, "ptr", bstrType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-get_mystoreflags
     */
    get_MyStoreFlags() {
        result := ComCall(19, this, "int*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-put_mystoreflags
     */
    put_MyStoreFlags(dwFlags) {
        result := ComCall(20, this, "int", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-get_castorename
     */
    get_CAStoreName() {
        pbstrName := BSTR()
        result := ComCall(21, this, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-put_castorename
     */
    put_CAStoreName(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(22, this, "ptr", bstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-get_castoretype
     */
    get_CAStoreType() {
        pbstrType := BSTR()
        result := ComCall(23, this, "ptr", pbstrType, "HRESULT")
        return pbstrType
    }

    /**
     * 
     * @param {BSTR} bstrType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-put_castoretype
     */
    put_CAStoreType(bstrType) {
        bstrType := bstrType is String ? BSTR.Alloc(bstrType).Value : bstrType

        result := ComCall(24, this, "ptr", bstrType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-get_castoreflags
     */
    get_CAStoreFlags() {
        result := ComCall(25, this, "int*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-put_castoreflags
     */
    put_CAStoreFlags(dwFlags) {
        result := ComCall(26, this, "int", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-get_rootstorename
     */
    get_RootStoreName() {
        pbstrName := BSTR()
        result := ComCall(27, this, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-put_rootstorename
     */
    put_RootStoreName(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(28, this, "ptr", bstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-get_rootstoretype
     */
    get_RootStoreType() {
        pbstrType := BSTR()
        result := ComCall(29, this, "ptr", pbstrType, "HRESULT")
        return pbstrType
    }

    /**
     * 
     * @param {BSTR} bstrType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-put_rootstoretype
     */
    put_RootStoreType(bstrType) {
        bstrType := bstrType is String ? BSTR.Alloc(bstrType).Value : bstrType

        result := ComCall(30, this, "ptr", bstrType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-get_rootstoreflags
     */
    get_RootStoreFlags() {
        result := ComCall(31, this, "int*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-put_rootstoreflags
     */
    put_RootStoreFlags(dwFlags) {
        result := ComCall(32, this, "int", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-get_requeststorename
     */
    get_RequestStoreName() {
        pbstrName := BSTR()
        result := ComCall(33, this, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-put_requeststorename
     */
    put_RequestStoreName(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(34, this, "ptr", bstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-get_requeststoretype
     */
    get_RequestStoreType() {
        pbstrType := BSTR()
        result := ComCall(35, this, "ptr", pbstrType, "HRESULT")
        return pbstrType
    }

    /**
     * 
     * @param {BSTR} bstrType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-put_requeststoretype
     */
    put_RequestStoreType(bstrType) {
        bstrType := bstrType is String ? BSTR.Alloc(bstrType).Value : bstrType

        result := ComCall(36, this, "ptr", bstrType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-get_requeststoreflags
     */
    get_RequestStoreFlags() {
        result := ComCall(37, this, "int*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-put_requeststoreflags
     */
    put_RequestStoreFlags(dwFlags) {
        result := ComCall(38, this, "int", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-get_containername
     */
    get_ContainerName() {
        pbstrContainer := BSTR()
        result := ComCall(39, this, "ptr", pbstrContainer, "HRESULT")
        return pbstrContainer
    }

    /**
     * 
     * @param {BSTR} bstrContainer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-put_containername
     */
    put_ContainerName(bstrContainer) {
        bstrContainer := bstrContainer is String ? BSTR.Alloc(bstrContainer).Value : bstrContainer

        result := ComCall(40, this, "ptr", bstrContainer, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-get_providername
     */
    get_ProviderName() {
        pbstrProvider := BSTR()
        result := ComCall(41, this, "ptr", pbstrProvider, "HRESULT")
        return pbstrProvider
    }

    /**
     * 
     * @param {BSTR} bstrProvider 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-put_providername
     */
    put_ProviderName(bstrProvider) {
        bstrProvider := bstrProvider is String ? BSTR.Alloc(bstrProvider).Value : bstrProvider

        result := ComCall(42, this, "ptr", bstrProvider, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-get_providertype
     */
    get_ProviderType() {
        result := ComCall(43, this, "int*", &pdwType := 0, "HRESULT")
        return pdwType
    }

    /**
     * 
     * @param {Integer} dwType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-put_providertype
     */
    put_ProviderType(dwType) {
        result := ComCall(44, this, "int", dwType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-get_keyspec
     */
    get_KeySpec() {
        result := ComCall(45, this, "int*", &pdw := 0, "HRESULT")
        return pdw
    }

    /**
     * 
     * @param {Integer} dw 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-put_keyspec
     */
    put_KeySpec(dw) {
        result := ComCall(46, this, "int", dw, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-get_providerflags
     */
    get_ProviderFlags() {
        result := ComCall(47, this, "int*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-put_providerflags
     */
    put_ProviderFlags(dwFlags) {
        result := ComCall(48, this, "int", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-get_useexistingkeyset
     */
    get_UseExistingKeySet() {
        result := ComCall(49, this, "int*", &fUseExistingKeys := 0, "HRESULT")
        return fUseExistingKeys
    }

    /**
     * 
     * @param {BOOL} fUseExistingKeys 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-put_useexistingkeyset
     */
    put_UseExistingKeySet(fUseExistingKeys) {
        result := ComCall(50, this, "int", fUseExistingKeys, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-get_genkeyflags
     */
    get_GenKeyFlags() {
        result := ComCall(51, this, "int*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-put_genkeyflags
     */
    put_GenKeyFlags(dwFlags) {
        result := ComCall(52, this, "int", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-get_deleterequestcert
     */
    get_DeleteRequestCert() {
        result := ComCall(53, this, "int*", &fDelete := 0, "HRESULT")
        return fDelete
    }

    /**
     * 
     * @param {BOOL} fDelete 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-put_deleterequestcert
     */
    put_DeleteRequestCert(fDelete) {
        result := ComCall(54, this, "int", fDelete, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-get_writecerttocsp
     */
    get_WriteCertToCSP() {
        result := ComCall(55, this, "int*", &fBool := 0, "HRESULT")
        return fBool
    }

    /**
     * 
     * @param {BOOL} fBool 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-put_writecerttocsp
     */
    put_WriteCertToCSP(fBool) {
        result := ComCall(56, this, "int", fBool, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-get_spcfilename
     */
    get_SPCFileName() {
        pbstr := BSTR()
        result := ComCall(57, this, "ptr", pbstr, "HRESULT")
        return pbstr
    }

    /**
     * 
     * @param {BSTR} bstr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-put_spcfilename
     */
    put_SPCFileName(bstr) {
        bstr := bstr is String ? BSTR.Alloc(bstr).Value : bstr

        result := ComCall(58, this, "ptr", bstr, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-get_pvkfilename
     */
    get_PVKFileName() {
        pbstr := BSTR()
        result := ComCall(59, this, "ptr", pbstr, "HRESULT")
        return pbstr
    }

    /**
     * 
     * @param {BSTR} bstr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-put_pvkfilename
     */
    put_PVKFileName(bstr) {
        bstr := bstr is String ? BSTR.Alloc(bstr).Value : bstr

        result := ComCall(60, this, "ptr", bstr, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-get_hashalgorithm
     */
    get_HashAlgorithm() {
        pbstr := BSTR()
        result := ComCall(61, this, "ptr", pbstr, "HRESULT")
        return pbstr
    }

    /**
     * 
     * @param {BSTR} bstr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-put_hashalgorithm
     */
    put_HashAlgorithm(bstr) {
        bstr := bstr is String ? BSTR.Alloc(bstr).Value : bstr

        result := ComCall(62, this, "ptr", bstr, "HRESULT")
        return result
    }
}
