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
     * 
     * @param {PWSTR} DNName 
     * @param {PWSTR} Usage 
     * @param {PWSTR} wszPKCS10FileName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-createfilepkcs10wstr
     */
    createFilePKCS10WStr(DNName, Usage, wszPKCS10FileName) {
        DNName := DNName is String ? StrPtr(DNName) : DNName
        Usage := Usage is String ? StrPtr(Usage) : Usage
        wszPKCS10FileName := wszPKCS10FileName is String ? StrPtr(wszPKCS10FileName) : wszPKCS10FileName

        result := ComCall(3, this, "ptr", DNName, "ptr", Usage, "ptr", wszPKCS10FileName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszPKCS7FileName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-acceptfilepkcs7wstr
     */
    acceptFilePKCS7WStr(wszPKCS7FileName) {
        wszPKCS7FileName := wszPKCS7FileName is String ? StrPtr(wszPKCS7FileName) : wszPKCS7FileName

        result := ComCall(4, this, "ptr", wszPKCS7FileName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} DNName 
     * @param {PWSTR} Usage 
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pPkcs10Blob 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-createpkcs10wstr
     */
    createPKCS10WStr(DNName, Usage, pPkcs10Blob) {
        DNName := DNName is String ? StrPtr(DNName) : DNName
        Usage := Usage is String ? StrPtr(Usage) : Usage

        result := ComCall(5, this, "ptr", DNName, "ptr", Usage, "ptr", pPkcs10Blob, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pBlobPKCS7 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-acceptpkcs7blob
     */
    acceptPKCS7Blob(pBlobPKCS7) {
        result := ComCall(6, this, "ptr", pBlobPKCS7, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pBlobPKCS7 
     * @returns {Pointer<CERT_CONTEXT>} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-getcertcontextfrompkcs7
     */
    getCertContextFromPKCS7(pBlobPKCS7) {
        result := ComCall(7, this, "ptr", pBlobPKCS7, "ptr")
        return result
    }

    /**
     * 
     * @returns {HCERTSTORE} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-getmystore
     */
    getMyStore() {
        result := ComCall(8, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {HCERTSTORE} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-getcastore
     */
    getCAStore() {
        result := ComCall(9, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {HCERTSTORE} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-getroothstore
     */
    getROOTHStore() {
        result := ComCall(10, this, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Integer} dwFlags 
     * @param {Pointer<PWSTR>} pbstrProvName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-enumproviderswstr
     */
    enumProvidersWStr(dwIndex, dwFlags, pbstrProvName) {
        result := ComCall(11, this, "int", dwIndex, "int", dwFlags, "ptr", pbstrProvName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<PWSTR>} pbstr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-enumcontainerswstr
     */
    enumContainersWStr(dwIndex, pbstr) {
        result := ComCall(12, this, "int", dwIndex, "ptr", pbstr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {CRYPT_INTEGER_BLOB} pkcs7OrPkcs10 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-freerequestinfoblob
     */
    freeRequestInfoBlob(pkcs7OrPkcs10) {
        result := ComCall(13, this, "ptr", pkcs7OrPkcs10, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} szwName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-get_mystorenamewstr
     */
    get_MyStoreNameWStr(szwName) {
        result := ComCall(14, this, "ptr", szwName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szwName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-put_mystorenamewstr
     */
    put_MyStoreNameWStr(szwName) {
        szwName := szwName is String ? StrPtr(szwName) : szwName

        result := ComCall(15, this, "ptr", szwName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} szwType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-get_mystoretypewstr
     */
    get_MyStoreTypeWStr(szwType) {
        result := ComCall(16, this, "ptr", szwType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szwType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-put_mystoretypewstr
     */
    put_MyStoreTypeWStr(szwType) {
        szwType := szwType is String ? StrPtr(szwType) : szwType

        result := ComCall(17, this, "ptr", szwType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-get_mystoreflags
     */
    get_MyStoreFlags(pdwFlags) {
        result := ComCall(18, this, "int*", pdwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-put_mystoreflags
     */
    put_MyStoreFlags(dwFlags) {
        result := ComCall(19, this, "int", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} szwName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-get_castorenamewstr
     */
    get_CAStoreNameWStr(szwName) {
        result := ComCall(20, this, "ptr", szwName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szwName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-put_castorenamewstr
     */
    put_CAStoreNameWStr(szwName) {
        szwName := szwName is String ? StrPtr(szwName) : szwName

        result := ComCall(21, this, "ptr", szwName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} szwType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-get_castoretypewstr
     */
    get_CAStoreTypeWStr(szwType) {
        result := ComCall(22, this, "ptr", szwType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szwType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-put_castoretypewstr
     */
    put_CAStoreTypeWStr(szwType) {
        szwType := szwType is String ? StrPtr(szwType) : szwType

        result := ComCall(23, this, "ptr", szwType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-get_castoreflags
     */
    get_CAStoreFlags(pdwFlags) {
        result := ComCall(24, this, "int*", pdwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-put_castoreflags
     */
    put_CAStoreFlags(dwFlags) {
        result := ComCall(25, this, "int", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} szwName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-get_rootstorenamewstr
     */
    get_RootStoreNameWStr(szwName) {
        result := ComCall(26, this, "ptr", szwName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szwName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-put_rootstorenamewstr
     */
    put_RootStoreNameWStr(szwName) {
        szwName := szwName is String ? StrPtr(szwName) : szwName

        result := ComCall(27, this, "ptr", szwName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} szwType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-get_rootstoretypewstr
     */
    get_RootStoreTypeWStr(szwType) {
        result := ComCall(28, this, "ptr", szwType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szwType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-put_rootstoretypewstr
     */
    put_RootStoreTypeWStr(szwType) {
        szwType := szwType is String ? StrPtr(szwType) : szwType

        result := ComCall(29, this, "ptr", szwType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-get_rootstoreflags
     */
    get_RootStoreFlags(pdwFlags) {
        result := ComCall(30, this, "int*", pdwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-put_rootstoreflags
     */
    put_RootStoreFlags(dwFlags) {
        result := ComCall(31, this, "int", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} szwName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-get_requeststorenamewstr
     */
    get_RequestStoreNameWStr(szwName) {
        result := ComCall(32, this, "ptr", szwName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szwName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-put_requeststorenamewstr
     */
    put_RequestStoreNameWStr(szwName) {
        szwName := szwName is String ? StrPtr(szwName) : szwName

        result := ComCall(33, this, "ptr", szwName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} szwType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-get_requeststoretypewstr
     */
    get_RequestStoreTypeWStr(szwType) {
        result := ComCall(34, this, "ptr", szwType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szwType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-put_requeststoretypewstr
     */
    put_RequestStoreTypeWStr(szwType) {
        szwType := szwType is String ? StrPtr(szwType) : szwType

        result := ComCall(35, this, "ptr", szwType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-get_requeststoreflags
     */
    get_RequestStoreFlags(pdwFlags) {
        result := ComCall(36, this, "int*", pdwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-put_requeststoreflags
     */
    put_RequestStoreFlags(dwFlags) {
        result := ComCall(37, this, "int", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} szwContainer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-get_containernamewstr
     */
    get_ContainerNameWStr(szwContainer) {
        result := ComCall(38, this, "ptr", szwContainer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szwContainer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-put_containernamewstr
     */
    put_ContainerNameWStr(szwContainer) {
        szwContainer := szwContainer is String ? StrPtr(szwContainer) : szwContainer

        result := ComCall(39, this, "ptr", szwContainer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} szwProvider 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-get_providernamewstr
     */
    get_ProviderNameWStr(szwProvider) {
        result := ComCall(40, this, "ptr", szwProvider, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szwProvider 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-put_providernamewstr
     */
    put_ProviderNameWStr(szwProvider) {
        szwProvider := szwProvider is String ? StrPtr(szwProvider) : szwProvider

        result := ComCall(41, this, "ptr", szwProvider, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-get_providertype
     */
    get_ProviderType(pdwType) {
        result := ComCall(42, this, "int*", pdwType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-put_providertype
     */
    put_ProviderType(dwType) {
        result := ComCall(43, this, "int", dwType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdw 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-get_keyspec
     */
    get_KeySpec(pdw) {
        result := ComCall(44, this, "int*", pdw, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dw 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-put_keyspec
     */
    put_KeySpec(dw) {
        result := ComCall(45, this, "int", dw, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-get_providerflags
     */
    get_ProviderFlags(pdwFlags) {
        result := ComCall(46, this, "int*", pdwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-put_providerflags
     */
    put_ProviderFlags(dwFlags) {
        result := ComCall(47, this, "int", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} fUseExistingKeys 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-get_useexistingkeyset
     */
    get_UseExistingKeySet(fUseExistingKeys) {
        result := ComCall(48, this, "ptr", fUseExistingKeys, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fUseExistingKeys 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-put_useexistingkeyset
     */
    put_UseExistingKeySet(fUseExistingKeys) {
        result := ComCall(49, this, "int", fUseExistingKeys, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-get_genkeyflags
     */
    get_GenKeyFlags(pdwFlags) {
        result := ComCall(50, this, "int*", pdwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-put_genkeyflags
     */
    put_GenKeyFlags(dwFlags) {
        result := ComCall(51, this, "int", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} fDelete 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-get_deleterequestcert
     */
    get_DeleteRequestCert(fDelete) {
        result := ComCall(52, this, "ptr", fDelete, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fDelete 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-put_deleterequestcert
     */
    put_DeleteRequestCert(fDelete) {
        result := ComCall(53, this, "int", fDelete, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} fBool 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-get_writecerttouserds
     */
    get_WriteCertToUserDS(fBool) {
        result := ComCall(54, this, "ptr", fBool, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fBool 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-put_writecerttouserds
     */
    put_WriteCertToUserDS(fBool) {
        result := ComCall(55, this, "int", fBool, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} fBool 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-get_enablet61dnencoding
     */
    get_EnableT61DNEncoding(fBool) {
        result := ComCall(56, this, "ptr", fBool, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fBool 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-put_enablet61dnencoding
     */
    put_EnableT61DNEncoding(fBool) {
        result := ComCall(57, this, "int", fBool, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} fBool 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-get_writecerttocsp
     */
    get_WriteCertToCSP(fBool) {
        result := ComCall(58, this, "ptr", fBool, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fBool 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-put_writecerttocsp
     */
    put_WriteCertToCSP(fBool) {
        result := ComCall(59, this, "int", fBool, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} szw 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-get_spcfilenamewstr
     */
    get_SPCFileNameWStr(szw) {
        result := ComCall(60, this, "ptr", szw, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szw 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-put_spcfilenamewstr
     */
    put_SPCFileNameWStr(szw) {
        szw := szw is String ? StrPtr(szw) : szw

        result := ComCall(61, this, "ptr", szw, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} szw 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-get_pvkfilenamewstr
     */
    get_PVKFileNameWStr(szw) {
        result := ComCall(62, this, "ptr", szw, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szw 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-put_pvkfilenamewstr
     */
    put_PVKFileNameWStr(szw) {
        szw := szw is String ? StrPtr(szw) : szw

        result := ComCall(63, this, "ptr", szw, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} szw 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-get_hashalgorithmwstr
     */
    get_HashAlgorithmWStr(szw) {
        result := ComCall(64, this, "ptr", szw, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szw 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-put_hashalgorithmwstr
     */
    put_HashAlgorithmWStr(szw) {
        szw := szw is String ? StrPtr(szw) : szw

        result := ComCall(65, this, "ptr", szw, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<CERT_CONTEXT>>} ppCertContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-get_renewalcertificate
     */
    get_RenewalCertificate(ppCertContext) {
        result := ComCall(66, this, "ptr*", ppCertContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<CERT_CONTEXT>} pCertContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-put_renewalcertificate
     */
    put_RenewalCertificate(pCertContext) {
        result := ComCall(67, this, "ptr", pCertContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szw 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-addcerttypetorequestwstr
     */
    AddCertTypeToRequestWStr(szw) {
        szw := szw is String ? StrPtr(szw) : szw

        result := ComCall(68, this, "ptr", szw, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} Name 
     * @param {PWSTR} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-addnamevaluepairtosignaturewstr
     */
    AddNameValuePairToSignatureWStr(Name, Value) {
        Name := Name is String ? StrPtr(Name) : Name
        Value := Value is String ? StrPtr(Value) : Value

        result := ComCall(69, this, "ptr", Name, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<CERT_EXTENSIONS>} pCertExtensions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-addextensionstorequest
     */
    AddExtensionsToRequest(pCertExtensions) {
        result := ComCall(70, this, "ptr", pCertExtensions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<CRYPT_ATTRIBUTES>} pAttributes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-addauthenticatedattributestopkcs7request
     */
    AddAuthenticatedAttributesToPKCS7Request(pAttributes) {
        result := ComCall(71, this, "ptr", pAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pRequest 
     * @param {Pointer<CERT_CONTEXT>} pSigningCertContext 
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pPkcs7Blob 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll-createpkcs7requestfromrequest
     */
    CreatePKCS7RequestFromRequest(pRequest, pSigningCertContext, pPkcs7Blob) {
        result := ComCall(72, this, "ptr", pRequest, "ptr", pSigningCertContext, "ptr", pPkcs7Blob, "HRESULT")
        return result
    }
}
