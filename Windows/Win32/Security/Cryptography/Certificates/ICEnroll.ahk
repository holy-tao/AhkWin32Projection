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
     * 
     * @param {BSTR} DNName 
     * @param {BSTR} Usage 
     * @param {BSTR} wszPKCS10FileName 
     * @returns {HRESULT} 
     */
    createFilePKCS10(DNName, Usage, wszPKCS10FileName) {
        DNName := DNName is String ? BSTR.Alloc(DNName).Value : DNName
        Usage := Usage is String ? BSTR.Alloc(Usage).Value : Usage
        wszPKCS10FileName := wszPKCS10FileName is String ? BSTR.Alloc(wszPKCS10FileName).Value : wszPKCS10FileName

        result := ComCall(7, this, "ptr", DNName, "ptr", Usage, "ptr", wszPKCS10FileName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} wszPKCS7FileName 
     * @returns {HRESULT} 
     */
    acceptFilePKCS7(wszPKCS7FileName) {
        wszPKCS7FileName := wszPKCS7FileName is String ? BSTR.Alloc(wszPKCS7FileName).Value : wszPKCS7FileName

        result := ComCall(8, this, "ptr", wszPKCS7FileName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} DNName 
     * @param {BSTR} Usage 
     * @param {Pointer<BSTR>} pPKCS10 
     * @returns {HRESULT} 
     */
    createPKCS10(DNName, Usage, pPKCS10) {
        DNName := DNName is String ? BSTR.Alloc(DNName).Value : DNName
        Usage := Usage is String ? BSTR.Alloc(Usage).Value : Usage

        result := ComCall(9, this, "ptr", DNName, "ptr", Usage, "ptr", pPKCS10, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} PKCS7 
     * @returns {HRESULT} 
     */
    acceptPKCS7(PKCS7) {
        PKCS7 := PKCS7 is String ? BSTR.Alloc(PKCS7).Value : PKCS7

        result := ComCall(10, this, "ptr", PKCS7, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} wszPKCS7 
     * @param {Pointer<BSTR>} pbstrCert 
     * @returns {HRESULT} 
     */
    getCertFromPKCS7(wszPKCS7, pbstrCert) {
        wszPKCS7 := wszPKCS7 is String ? BSTR.Alloc(wszPKCS7).Value : wszPKCS7

        result := ComCall(11, this, "ptr", wszPKCS7, "ptr", pbstrCert, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Integer} dwFlags 
     * @param {Pointer<BSTR>} pbstrProvName 
     * @returns {HRESULT} 
     */
    enumProviders(dwIndex, dwFlags, pbstrProvName) {
        result := ComCall(12, this, "int", dwIndex, "int", dwFlags, "ptr", pbstrProvName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     */
    enumContainers(dwIndex, pbstr) {
        result := ComCall(13, this, "int", dwIndex, "ptr", pbstr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} PKCS7OrPKCS10 
     * @returns {HRESULT} 
     */
    freeRequestInfo(PKCS7OrPKCS10) {
        PKCS7OrPKCS10 := PKCS7OrPKCS10 is String ? BSTR.Alloc(PKCS7OrPKCS10).Value : PKCS7OrPKCS10

        result := ComCall(14, this, "ptr", PKCS7OrPKCS10, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    get_MyStoreName(pbstrName) {
        result := ComCall(15, this, "ptr", pbstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {HRESULT} 
     */
    put_MyStoreName(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(16, this, "ptr", bstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrType 
     * @returns {HRESULT} 
     */
    get_MyStoreType(pbstrType) {
        result := ComCall(17, this, "ptr", pbstrType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrType 
     * @returns {HRESULT} 
     */
    put_MyStoreType(bstrType) {
        bstrType := bstrType is String ? BSTR.Alloc(bstrType).Value : bstrType

        result := ComCall(18, this, "ptr", bstrType, "int")
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
        result := ComCall(19, this, "int*", pdwFlags, "int")
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
        result := ComCall(20, this, "int", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    get_CAStoreName(pbstrName) {
        result := ComCall(21, this, "ptr", pbstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {HRESULT} 
     */
    put_CAStoreName(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(22, this, "ptr", bstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrType 
     * @returns {HRESULT} 
     */
    get_CAStoreType(pbstrType) {
        result := ComCall(23, this, "ptr", pbstrType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrType 
     * @returns {HRESULT} 
     */
    put_CAStoreType(bstrType) {
        bstrType := bstrType is String ? BSTR.Alloc(bstrType).Value : bstrType

        result := ComCall(24, this, "ptr", bstrType, "int")
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
        result := ComCall(25, this, "int*", pdwFlags, "int")
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
        result := ComCall(26, this, "int", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    get_RootStoreName(pbstrName) {
        result := ComCall(27, this, "ptr", pbstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {HRESULT} 
     */
    put_RootStoreName(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(28, this, "ptr", bstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrType 
     * @returns {HRESULT} 
     */
    get_RootStoreType(pbstrType) {
        result := ComCall(29, this, "ptr", pbstrType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrType 
     * @returns {HRESULT} 
     */
    put_RootStoreType(bstrType) {
        bstrType := bstrType is String ? BSTR.Alloc(bstrType).Value : bstrType

        result := ComCall(30, this, "ptr", bstrType, "int")
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
        result := ComCall(31, this, "int*", pdwFlags, "int")
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
        result := ComCall(32, this, "int", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    get_RequestStoreName(pbstrName) {
        result := ComCall(33, this, "ptr", pbstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {HRESULT} 
     */
    put_RequestStoreName(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(34, this, "ptr", bstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrType 
     * @returns {HRESULT} 
     */
    get_RequestStoreType(pbstrType) {
        result := ComCall(35, this, "ptr", pbstrType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrType 
     * @returns {HRESULT} 
     */
    put_RequestStoreType(bstrType) {
        bstrType := bstrType is String ? BSTR.Alloc(bstrType).Value : bstrType

        result := ComCall(36, this, "ptr", bstrType, "int")
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
        result := ComCall(37, this, "int*", pdwFlags, "int")
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
        result := ComCall(38, this, "int", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrContainer 
     * @returns {HRESULT} 
     */
    get_ContainerName(pbstrContainer) {
        result := ComCall(39, this, "ptr", pbstrContainer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrContainer 
     * @returns {HRESULT} 
     */
    put_ContainerName(bstrContainer) {
        bstrContainer := bstrContainer is String ? BSTR.Alloc(bstrContainer).Value : bstrContainer

        result := ComCall(40, this, "ptr", bstrContainer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrProvider 
     * @returns {HRESULT} 
     */
    get_ProviderName(pbstrProvider) {
        result := ComCall(41, this, "ptr", pbstrProvider, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrProvider 
     * @returns {HRESULT} 
     */
    put_ProviderName(bstrProvider) {
        bstrProvider := bstrProvider is String ? BSTR.Alloc(bstrProvider).Value : bstrProvider

        result := ComCall(42, this, "ptr", bstrProvider, "int")
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
        result := ComCall(43, this, "int*", pdwType, "int")
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
        result := ComCall(44, this, "int", dwType, "int")
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
        result := ComCall(45, this, "int*", pdw, "int")
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
        result := ComCall(46, this, "int", dw, "int")
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
        result := ComCall(47, this, "int*", pdwFlags, "int")
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
        result := ComCall(48, this, "int", dwFlags, "int")
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
        result := ComCall(49, this, "ptr", fUseExistingKeys, "int")
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
        result := ComCall(50, this, "int", fUseExistingKeys, "int")
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
        result := ComCall(51, this, "int*", pdwFlags, "int")
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
        result := ComCall(52, this, "int", dwFlags, "int")
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
        result := ComCall(53, this, "ptr", fDelete, "int")
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
        result := ComCall(54, this, "int", fDelete, "int")
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
        result := ComCall(55, this, "ptr", fBool, "int")
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
        result := ComCall(56, this, "int", fBool, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     */
    get_SPCFileName(pbstr) {
        result := ComCall(57, this, "ptr", pbstr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstr 
     * @returns {HRESULT} 
     */
    put_SPCFileName(bstr) {
        bstr := bstr is String ? BSTR.Alloc(bstr).Value : bstr

        result := ComCall(58, this, "ptr", bstr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     */
    get_PVKFileName(pbstr) {
        result := ComCall(59, this, "ptr", pbstr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstr 
     * @returns {HRESULT} 
     */
    put_PVKFileName(bstr) {
        bstr := bstr is String ? BSTR.Alloc(bstr).Value : bstr

        result := ComCall(60, this, "ptr", bstr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     */
    get_HashAlgorithm(pbstr) {
        result := ComCall(61, this, "ptr", pbstr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstr 
     * @returns {HRESULT} 
     */
    put_HashAlgorithm(bstr) {
        bstr := bstr is String ? BSTR.Alloc(bstr).Value : bstr

        result := ComCall(62, this, "ptr", bstr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
