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
     * 
     * @param {PWSTR} DNName 
     * @param {PWSTR} Usage 
     * @param {PWSTR} wszPKCS10FileName 
     * @returns {HRESULT} 
     */
    createFilePKCS10WStr(DNName, Usage, wszPKCS10FileName) {
        DNName := DNName is String ? StrPtr(DNName) : DNName
        Usage := Usage is String ? StrPtr(Usage) : Usage
        wszPKCS10FileName := wszPKCS10FileName is String ? StrPtr(wszPKCS10FileName) : wszPKCS10FileName

        result := ComCall(3, this, "ptr", DNName, "ptr", Usage, "ptr", wszPKCS10FileName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} wszPKCS7FileName 
     * @returns {HRESULT} 
     */
    acceptFilePKCS7WStr(wszPKCS7FileName) {
        wszPKCS7FileName := wszPKCS7FileName is String ? StrPtr(wszPKCS7FileName) : wszPKCS7FileName

        result := ComCall(4, this, "ptr", wszPKCS7FileName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} DNName 
     * @param {PWSTR} Usage 
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pPkcs10Blob 
     * @returns {HRESULT} 
     */
    createPKCS10WStr(DNName, Usage, pPkcs10Blob) {
        DNName := DNName is String ? StrPtr(DNName) : DNName
        Usage := Usage is String ? StrPtr(Usage) : Usage

        result := ComCall(5, this, "ptr", DNName, "ptr", Usage, "ptr", pPkcs10Blob, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pBlobPKCS7 
     * @returns {HRESULT} 
     */
    acceptPKCS7Blob(pBlobPKCS7) {
        result := ComCall(6, this, "ptr", pBlobPKCS7, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pBlobPKCS7 
     * @returns {Pointer<CERT_CONTEXT>} 
     */
    getCertContextFromPKCS7(pBlobPKCS7) {
        result := ComCall(7, this, "ptr", pBlobPKCS7, "ptr")
        return result
    }

    /**
     * 
     * @returns {HCERTSTORE} 
     */
    getMyStore() {
        result := ComCall(8, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {HCERTSTORE} 
     */
    getCAStore() {
        result := ComCall(9, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {HCERTSTORE} 
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
     */
    enumProvidersWStr(dwIndex, dwFlags, pbstrProvName) {
        result := ComCall(11, this, "int", dwIndex, "int", dwFlags, "ptr", pbstrProvName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<PWSTR>} pbstr 
     * @returns {HRESULT} 
     */
    enumContainersWStr(dwIndex, pbstr) {
        result := ComCall(12, this, "int", dwIndex, "ptr", pbstr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {CRYPT_INTEGER_BLOB} pkcs7OrPkcs10 
     * @returns {HRESULT} 
     */
    freeRequestInfoBlob(pkcs7OrPkcs10) {
        result := ComCall(13, this, "ptr", pkcs7OrPkcs10, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} szwName 
     * @returns {HRESULT} 
     */
    get_MyStoreNameWStr(szwName) {
        result := ComCall(14, this, "ptr", szwName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} szwName 
     * @returns {HRESULT} 
     */
    put_MyStoreNameWStr(szwName) {
        szwName := szwName is String ? StrPtr(szwName) : szwName

        result := ComCall(15, this, "ptr", szwName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} szwType 
     * @returns {HRESULT} 
     */
    get_MyStoreTypeWStr(szwType) {
        result := ComCall(16, this, "ptr", szwType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} szwType 
     * @returns {HRESULT} 
     */
    put_MyStoreTypeWStr(szwType) {
        szwType := szwType is String ? StrPtr(szwType) : szwType

        result := ComCall(17, this, "ptr", szwType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pdwFlags 
     * @returns {HRESULT} 
     */
    get_MyStoreFlags(pdwFlags) {
        result := ComCall(18, this, "int*", pdwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    put_MyStoreFlags(dwFlags) {
        result := ComCall(19, this, "int", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} szwName 
     * @returns {HRESULT} 
     */
    get_CAStoreNameWStr(szwName) {
        result := ComCall(20, this, "ptr", szwName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} szwName 
     * @returns {HRESULT} 
     */
    put_CAStoreNameWStr(szwName) {
        szwName := szwName is String ? StrPtr(szwName) : szwName

        result := ComCall(21, this, "ptr", szwName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} szwType 
     * @returns {HRESULT} 
     */
    get_CAStoreTypeWStr(szwType) {
        result := ComCall(22, this, "ptr", szwType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} szwType 
     * @returns {HRESULT} 
     */
    put_CAStoreTypeWStr(szwType) {
        szwType := szwType is String ? StrPtr(szwType) : szwType

        result := ComCall(23, this, "ptr", szwType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pdwFlags 
     * @returns {HRESULT} 
     */
    get_CAStoreFlags(pdwFlags) {
        result := ComCall(24, this, "int*", pdwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    put_CAStoreFlags(dwFlags) {
        result := ComCall(25, this, "int", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} szwName 
     * @returns {HRESULT} 
     */
    get_RootStoreNameWStr(szwName) {
        result := ComCall(26, this, "ptr", szwName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} szwName 
     * @returns {HRESULT} 
     */
    put_RootStoreNameWStr(szwName) {
        szwName := szwName is String ? StrPtr(szwName) : szwName

        result := ComCall(27, this, "ptr", szwName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} szwType 
     * @returns {HRESULT} 
     */
    get_RootStoreTypeWStr(szwType) {
        result := ComCall(28, this, "ptr", szwType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} szwType 
     * @returns {HRESULT} 
     */
    put_RootStoreTypeWStr(szwType) {
        szwType := szwType is String ? StrPtr(szwType) : szwType

        result := ComCall(29, this, "ptr", szwType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pdwFlags 
     * @returns {HRESULT} 
     */
    get_RootStoreFlags(pdwFlags) {
        result := ComCall(30, this, "int*", pdwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    put_RootStoreFlags(dwFlags) {
        result := ComCall(31, this, "int", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} szwName 
     * @returns {HRESULT} 
     */
    get_RequestStoreNameWStr(szwName) {
        result := ComCall(32, this, "ptr", szwName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} szwName 
     * @returns {HRESULT} 
     */
    put_RequestStoreNameWStr(szwName) {
        szwName := szwName is String ? StrPtr(szwName) : szwName

        result := ComCall(33, this, "ptr", szwName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} szwType 
     * @returns {HRESULT} 
     */
    get_RequestStoreTypeWStr(szwType) {
        result := ComCall(34, this, "ptr", szwType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} szwType 
     * @returns {HRESULT} 
     */
    put_RequestStoreTypeWStr(szwType) {
        szwType := szwType is String ? StrPtr(szwType) : szwType

        result := ComCall(35, this, "ptr", szwType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pdwFlags 
     * @returns {HRESULT} 
     */
    get_RequestStoreFlags(pdwFlags) {
        result := ComCall(36, this, "int*", pdwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    put_RequestStoreFlags(dwFlags) {
        result := ComCall(37, this, "int", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} szwContainer 
     * @returns {HRESULT} 
     */
    get_ContainerNameWStr(szwContainer) {
        result := ComCall(38, this, "ptr", szwContainer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} szwContainer 
     * @returns {HRESULT} 
     */
    put_ContainerNameWStr(szwContainer) {
        szwContainer := szwContainer is String ? StrPtr(szwContainer) : szwContainer

        result := ComCall(39, this, "ptr", szwContainer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} szwProvider 
     * @returns {HRESULT} 
     */
    get_ProviderNameWStr(szwProvider) {
        result := ComCall(40, this, "ptr", szwProvider, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} szwProvider 
     * @returns {HRESULT} 
     */
    put_ProviderNameWStr(szwProvider) {
        szwProvider := szwProvider is String ? StrPtr(szwProvider) : szwProvider

        result := ComCall(41, this, "ptr", szwProvider, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pdwType 
     * @returns {HRESULT} 
     */
    get_ProviderType(pdwType) {
        result := ComCall(42, this, "int*", pdwType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwType 
     * @returns {HRESULT} 
     */
    put_ProviderType(dwType) {
        result := ComCall(43, this, "int", dwType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pdw 
     * @returns {HRESULT} 
     */
    get_KeySpec(pdw) {
        result := ComCall(44, this, "int*", pdw, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dw 
     * @returns {HRESULT} 
     */
    put_KeySpec(dw) {
        result := ComCall(45, this, "int", dw, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pdwFlags 
     * @returns {HRESULT} 
     */
    get_ProviderFlags(pdwFlags) {
        result := ComCall(46, this, "int*", pdwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    put_ProviderFlags(dwFlags) {
        result := ComCall(47, this, "int", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} fUseExistingKeys 
     * @returns {HRESULT} 
     */
    get_UseExistingKeySet(fUseExistingKeys) {
        result := ComCall(48, this, "ptr", fUseExistingKeys, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fUseExistingKeys 
     * @returns {HRESULT} 
     */
    put_UseExistingKeySet(fUseExistingKeys) {
        result := ComCall(49, this, "int", fUseExistingKeys, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pdwFlags 
     * @returns {HRESULT} 
     */
    get_GenKeyFlags(pdwFlags) {
        result := ComCall(50, this, "int*", pdwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    put_GenKeyFlags(dwFlags) {
        result := ComCall(51, this, "int", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} fDelete 
     * @returns {HRESULT} 
     */
    get_DeleteRequestCert(fDelete) {
        result := ComCall(52, this, "ptr", fDelete, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fDelete 
     * @returns {HRESULT} 
     */
    put_DeleteRequestCert(fDelete) {
        result := ComCall(53, this, "int", fDelete, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} fBool 
     * @returns {HRESULT} 
     */
    get_WriteCertToUserDS(fBool) {
        result := ComCall(54, this, "ptr", fBool, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fBool 
     * @returns {HRESULT} 
     */
    put_WriteCertToUserDS(fBool) {
        result := ComCall(55, this, "int", fBool, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} fBool 
     * @returns {HRESULT} 
     */
    get_EnableT61DNEncoding(fBool) {
        result := ComCall(56, this, "ptr", fBool, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fBool 
     * @returns {HRESULT} 
     */
    put_EnableT61DNEncoding(fBool) {
        result := ComCall(57, this, "int", fBool, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} fBool 
     * @returns {HRESULT} 
     */
    get_WriteCertToCSP(fBool) {
        result := ComCall(58, this, "ptr", fBool, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fBool 
     * @returns {HRESULT} 
     */
    put_WriteCertToCSP(fBool) {
        result := ComCall(59, this, "int", fBool, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} szw 
     * @returns {HRESULT} 
     */
    get_SPCFileNameWStr(szw) {
        result := ComCall(60, this, "ptr", szw, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} szw 
     * @returns {HRESULT} 
     */
    put_SPCFileNameWStr(szw) {
        szw := szw is String ? StrPtr(szw) : szw

        result := ComCall(61, this, "ptr", szw, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} szw 
     * @returns {HRESULT} 
     */
    get_PVKFileNameWStr(szw) {
        result := ComCall(62, this, "ptr", szw, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} szw 
     * @returns {HRESULT} 
     */
    put_PVKFileNameWStr(szw) {
        szw := szw is String ? StrPtr(szw) : szw

        result := ComCall(63, this, "ptr", szw, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} szw 
     * @returns {HRESULT} 
     */
    get_HashAlgorithmWStr(szw) {
        result := ComCall(64, this, "ptr", szw, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} szw 
     * @returns {HRESULT} 
     */
    put_HashAlgorithmWStr(szw) {
        szw := szw is String ? StrPtr(szw) : szw

        result := ComCall(65, this, "ptr", szw, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<CERT_CONTEXT>} ppCertContext 
     * @returns {HRESULT} 
     */
    get_RenewalCertificate(ppCertContext) {
        result := ComCall(66, this, "ptr", ppCertContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<CERT_CONTEXT>} pCertContext 
     * @returns {HRESULT} 
     */
    put_RenewalCertificate(pCertContext) {
        result := ComCall(67, this, "ptr", pCertContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} szw 
     * @returns {HRESULT} 
     */
    AddCertTypeToRequestWStr(szw) {
        szw := szw is String ? StrPtr(szw) : szw

        result := ComCall(68, this, "ptr", szw, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} Name 
     * @param {PWSTR} Value 
     * @returns {HRESULT} 
     */
    AddNameValuePairToSignatureWStr(Name, Value) {
        Name := Name is String ? StrPtr(Name) : Name
        Value := Value is String ? StrPtr(Value) : Value

        result := ComCall(69, this, "ptr", Name, "ptr", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<CERT_EXTENSIONS>} pCertExtensions 
     * @returns {HRESULT} 
     */
    AddExtensionsToRequest(pCertExtensions) {
        result := ComCall(70, this, "ptr", pCertExtensions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<CRYPT_ATTRIBUTES>} pAttributes 
     * @returns {HRESULT} 
     */
    AddAuthenticatedAttributesToPKCS7Request(pAttributes) {
        result := ComCall(71, this, "ptr", pAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pRequest 
     * @param {Pointer<CERT_CONTEXT>} pSigningCertContext 
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pPkcs7Blob 
     * @returns {HRESULT} 
     */
    CreatePKCS7RequestFromRequest(pRequest, pSigningCertContext, pPkcs7Blob) {
        result := ComCall(72, this, "ptr", pRequest, "ptr", pSigningCertContext, "ptr", pPkcs7Blob, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
