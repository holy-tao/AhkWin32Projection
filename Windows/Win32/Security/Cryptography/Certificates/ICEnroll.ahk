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
     * @param {Pointer<BSTR>} pPKCS10 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-createpkcs10
     */
    createPKCS10(DNName, Usage, pPKCS10) {
        DNName := DNName is String ? BSTR.Alloc(DNName).Value : DNName
        Usage := Usage is String ? BSTR.Alloc(Usage).Value : Usage

        result := ComCall(9, this, "ptr", DNName, "ptr", Usage, "ptr", pPKCS10, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} pbstrCert 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-getcertfrompkcs7
     */
    getCertFromPKCS7(wszPKCS7, pbstrCert) {
        wszPKCS7 := wszPKCS7 is String ? BSTR.Alloc(wszPKCS7).Value : wszPKCS7

        result := ComCall(11, this, "ptr", wszPKCS7, "ptr", pbstrCert, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Integer} dwFlags 
     * @param {Pointer<BSTR>} pbstrProvName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-enumproviders
     */
    enumProviders(dwIndex, dwFlags, pbstrProvName) {
        result := ComCall(12, this, "int", dwIndex, "int", dwFlags, "ptr", pbstrProvName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-enumcontainers
     */
    enumContainers(dwIndex, pbstr) {
        result := ComCall(13, this, "int", dwIndex, "ptr", pbstr, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-get_mystorename
     */
    get_MyStoreName(pbstrName) {
        result := ComCall(15, this, "ptr", pbstrName, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} pbstrType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-get_mystoretype
     */
    get_MyStoreType(pbstrType) {
        result := ComCall(17, this, "ptr", pbstrType, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-get_mystoreflags
     */
    get_MyStoreFlags(pdwFlags) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "int*" : "ptr"

        result := ComCall(19, this, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-get_castorename
     */
    get_CAStoreName(pbstrName) {
        result := ComCall(21, this, "ptr", pbstrName, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} pbstrType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-get_castoretype
     */
    get_CAStoreType(pbstrType) {
        result := ComCall(23, this, "ptr", pbstrType, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-get_castoreflags
     */
    get_CAStoreFlags(pdwFlags) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "int*" : "ptr"

        result := ComCall(25, this, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-get_rootstorename
     */
    get_RootStoreName(pbstrName) {
        result := ComCall(27, this, "ptr", pbstrName, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} pbstrType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-get_rootstoretype
     */
    get_RootStoreType(pbstrType) {
        result := ComCall(29, this, "ptr", pbstrType, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-get_rootstoreflags
     */
    get_RootStoreFlags(pdwFlags) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "int*" : "ptr"

        result := ComCall(31, this, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-get_requeststorename
     */
    get_RequestStoreName(pbstrName) {
        result := ComCall(33, this, "ptr", pbstrName, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} pbstrType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-get_requeststoretype
     */
    get_RequestStoreType(pbstrType) {
        result := ComCall(35, this, "ptr", pbstrType, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-get_requeststoreflags
     */
    get_RequestStoreFlags(pdwFlags) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "int*" : "ptr"

        result := ComCall(37, this, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} pbstrContainer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-get_containername
     */
    get_ContainerName(pbstrContainer) {
        result := ComCall(39, this, "ptr", pbstrContainer, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} pbstrProvider 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-get_providername
     */
    get_ProviderName(pbstrProvider) {
        result := ComCall(41, this, "ptr", pbstrProvider, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pdwType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-get_providertype
     */
    get_ProviderType(pdwType) {
        pdwTypeMarshal := pdwType is VarRef ? "int*" : "ptr"

        result := ComCall(43, this, pdwTypeMarshal, pdwType, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pdw 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-get_keyspec
     */
    get_KeySpec(pdw) {
        pdwMarshal := pdw is VarRef ? "int*" : "ptr"

        result := ComCall(45, this, pdwMarshal, pdw, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-get_providerflags
     */
    get_ProviderFlags(pdwFlags) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "int*" : "ptr"

        result := ComCall(47, this, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
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
     * @param {Pointer<BOOL>} fUseExistingKeys 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-get_useexistingkeyset
     */
    get_UseExistingKeySet(fUseExistingKeys) {
        result := ComCall(49, this, "ptr", fUseExistingKeys, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-get_genkeyflags
     */
    get_GenKeyFlags(pdwFlags) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "int*" : "ptr"

        result := ComCall(51, this, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
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
     * @param {Pointer<BOOL>} fDelete 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-get_deleterequestcert
     */
    get_DeleteRequestCert(fDelete) {
        result := ComCall(53, this, "ptr", fDelete, "HRESULT")
        return result
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
     * @param {Pointer<BOOL>} fBool 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-get_writecerttocsp
     */
    get_WriteCertToCSP(fBool) {
        result := ComCall(55, this, "ptr", fBool, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-get_spcfilename
     */
    get_SPCFileName(pbstr) {
        result := ComCall(57, this, "ptr", pbstr, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-get_pvkfilename
     */
    get_PVKFileName(pbstr) {
        result := ComCall(59, this, "ptr", pbstr, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll-get_hashalgorithm
     */
    get_HashAlgorithm(pbstr) {
        result := ComCall(61, this, "ptr", pbstr, "HRESULT")
        return result
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
