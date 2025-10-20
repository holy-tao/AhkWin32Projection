#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IEnroll2.ahk

/**
 * The IEnroll4 interface represents the Certificate Enrollment Control and is used primarily to generate certificate requests.
 * @see https://docs.microsoft.com/windows/win32/api//xenroll/nn-xenroll-ienroll4
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IEnroll4 extends IEnroll2{
    /**
     * The interface identifier for IEnroll4
     * @type {Guid}
     */
    static IID => Guid("{f8053fe5-78f4-448f-a0db-41d61b73446b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 91

    /**
     * 
     * @param {CRYPT_INTEGER_BLOB} thumbPrintBlob 
     * @returns {HRESULT} 
     */
    put_ThumbPrintWStr(thumbPrintBlob) {
        result := ComCall(91, this, "ptr", thumbPrintBlob, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<CRYPT_INTEGER_BLOB>} thumbPrintBlob 
     * @returns {HRESULT} 
     */
    get_ThumbPrintWStr(thumbPrintBlob) {
        result := ComCall(92, this, "ptr", thumbPrintBlob, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<CERT_CONTEXT>} pPrivateKeyArchiveCert 
     * @returns {HRESULT} 
     */
    SetPrivateKeyArchiveCertificate(pPrivateKeyArchiveCert) {
        result := ComCall(93, this, "ptr", pPrivateKeyArchiveCert, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Pointer<CERT_CONTEXT>} 
     */
    GetPrivateKeyArchiveCertificate() {
        result := ComCall(94, this, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pblobBinary 
     * @param {Pointer<PWSTR>} ppwszString 
     * @returns {HRESULT} 
     */
    binaryBlobToString(Flags, pblobBinary, ppwszString) {
        result := ComCall(95, this, "int", Flags, "ptr", pblobBinary, "ptr", ppwszString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {PWSTR} pwszString 
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pblobBinary 
     * @param {Pointer<Int32>} pdwSkip 
     * @param {Pointer<Int32>} pdwFlags 
     * @returns {HRESULT} 
     */
    stringToBinaryBlob(Flags, pwszString, pblobBinary, pdwSkip, pdwFlags) {
        pwszString := pwszString is String ? StrPtr(pwszString) : pwszString

        result := ComCall(96, this, "int", Flags, "ptr", pwszString, "ptr", pblobBinary, "int*", pdwSkip, "int*", pdwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {PWSTR} pwszName 
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pblobValue 
     * @returns {HRESULT} 
     */
    addExtensionToRequestWStr(Flags, pwszName, pblobValue) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(97, this, "int", Flags, "ptr", pwszName, "ptr", pblobValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {PWSTR} pwszName 
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pblobValue 
     * @returns {HRESULT} 
     */
    addAttributeToRequestWStr(Flags, pwszName, pblobValue) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(98, this, "int", Flags, "ptr", pwszName, "ptr", pblobValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {PWSTR} pwszName 
     * @param {PWSTR} pwszValue 
     * @returns {HRESULT} 
     */
    addNameValuePairToRequestWStr(Flags, pwszName, pwszValue) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName
        pwszValue := pwszValue is String ? StrPtr(pwszValue) : pwszValue

        result := ComCall(99, this, "int", Flags, "ptr", pwszName, "ptr", pwszValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    resetExtensions() {
        result := ComCall(100, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    resetAttributes() {
        result := ComCall(101, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {PWSTR} pwszDNName 
     * @param {PWSTR} pwszUsage 
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pblobRequest 
     * @returns {HRESULT} 
     */
    createRequestWStr(Flags, pwszDNName, pwszUsage, pblobRequest) {
        pwszDNName := pwszDNName is String ? StrPtr(pwszDNName) : pwszDNName
        pwszUsage := pwszUsage is String ? StrPtr(pwszUsage) : pwszUsage

        result := ComCall(102, this, "int", Flags, "ptr", pwszDNName, "ptr", pwszUsage, "ptr", pblobRequest, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {PWSTR} pwszDNName 
     * @param {PWSTR} pwszUsage 
     * @param {PWSTR} pwszRequestFileName 
     * @returns {HRESULT} 
     */
    createFileRequestWStr(Flags, pwszDNName, pwszUsage, pwszRequestFileName) {
        pwszDNName := pwszDNName is String ? StrPtr(pwszDNName) : pwszDNName
        pwszUsage := pwszUsage is String ? StrPtr(pwszUsage) : pwszUsage
        pwszRequestFileName := pwszRequestFileName is String ? StrPtr(pwszRequestFileName) : pwszRequestFileName

        result := ComCall(103, this, "int", Flags, "ptr", pwszDNName, "ptr", pwszUsage, "ptr", pwszRequestFileName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pblobResponse 
     * @returns {HRESULT} 
     */
    acceptResponseBlob(pblobResponse) {
        result := ComCall(104, this, "ptr", pblobResponse, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszResponseFileName 
     * @returns {HRESULT} 
     */
    acceptFileResponseWStr(pwszResponseFileName) {
        pwszResponseFileName := pwszResponseFileName is String ? StrPtr(pwszResponseFileName) : pwszResponseFileName

        result := ComCall(105, this, "ptr", pwszResponseFileName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pblobResponse 
     * @param {Pointer<CERT_CONTEXT>} ppCertContext 
     * @returns {HRESULT} 
     */
    getCertContextFromResponseBlob(pblobResponse, ppCertContext) {
        result := ComCall(106, this, "ptr", pblobResponse, "ptr", ppCertContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszResponseFileName 
     * @param {Pointer<CERT_CONTEXT>} ppCertContext 
     * @returns {HRESULT} 
     */
    getCertContextFromFileResponseWStr(pwszResponseFileName, ppCertContext) {
        pwszResponseFileName := pwszResponseFileName is String ? StrPtr(pwszResponseFileName) : pwszResponseFileName

        result := ComCall(107, this, "ptr", pwszResponseFileName, "ptr", ppCertContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszPassword 
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pblobPFX 
     * @returns {HRESULT} 
     */
    createPFXWStr(pwszPassword, pblobPFX) {
        pwszPassword := pwszPassword is String ? StrPtr(pwszPassword) : pwszPassword

        result := ComCall(108, this, "ptr", pwszPassword, "ptr", pblobPFX, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszPassword 
     * @param {PWSTR} pwszPFXFileName 
     * @returns {HRESULT} 
     */
    createFilePFXWStr(pwszPassword, pwszPFXFileName) {
        pwszPassword := pwszPassword is String ? StrPtr(pwszPassword) : pwszPassword
        pwszPFXFileName := pwszPFXFileName is String ? StrPtr(pwszPFXFileName) : pwszPFXFileName

        result := ComCall(109, this, "ptr", pwszPassword, "ptr", pwszPFXFileName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lRequestID 
     * @param {PWSTR} pwszCADNS 
     * @param {PWSTR} pwszCAName 
     * @param {PWSTR} pwszFriendlyName 
     * @returns {HRESULT} 
     */
    setPendingRequestInfoWStr(lRequestID, pwszCADNS, pwszCAName, pwszFriendlyName) {
        pwszCADNS := pwszCADNS is String ? StrPtr(pwszCADNS) : pwszCADNS
        pwszCAName := pwszCAName is String ? StrPtr(pwszCAName) : pwszCAName
        pwszFriendlyName := pwszFriendlyName is String ? StrPtr(pwszFriendlyName) : pwszFriendlyName

        result := ComCall(110, this, "int", lRequestID, "ptr", pwszCADNS, "ptr", pwszCAName, "ptr", pwszFriendlyName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Integer} lDesiredProperty 
     * @param {Pointer<Void>} ppProperty 
     * @returns {HRESULT} 
     */
    enumPendingRequestWStr(lIndex, lDesiredProperty, ppProperty) {
        result := ComCall(111, this, "int", lIndex, "int", lDesiredProperty, "ptr", ppProperty, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {CRYPT_INTEGER_BLOB} thumbPrintBlob 
     * @returns {HRESULT} 
     */
    removePendingRequestWStr(thumbPrintBlob) {
        result := ComCall(112, this, "ptr", thumbPrintBlob, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lSizeSpec 
     * @param {Integer} lKeySpec 
     * @param {Pointer<Int32>} pdwKeySize 
     * @returns {HRESULT} 
     */
    GetKeyLenEx(lSizeSpec, lKeySpec, pdwKeySize) {
        result := ComCall(113, this, "int", lSizeSpec, "int", lKeySpec, "int*", pdwKeySize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pBlobPKCS7 
     * @param {Pointer<Int32>} plCertInstalled 
     * @returns {HRESULT} 
     */
    InstallPKCS7BlobEx(pBlobPKCS7, plCertInstalled) {
        result := ComCall(114, this, "ptr", pBlobPKCS7, "int*", plCertInstalled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lType 
     * @param {PWSTR} pwszOIDOrName 
     * @param {Integer} lMajorVersion 
     * @param {BOOL} fMinorVersion 
     * @param {Integer} lMinorVersion 
     * @returns {HRESULT} 
     */
    AddCertTypeToRequestWStrEx(lType, pwszOIDOrName, lMajorVersion, fMinorVersion, lMinorVersion) {
        pwszOIDOrName := pwszOIDOrName is String ? StrPtr(pwszOIDOrName) : pwszOIDOrName

        result := ComCall(115, this, "int", lType, "ptr", pwszOIDOrName, "int", lMajorVersion, "int", fMinorVersion, "int", lMinorVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszProvName 
     * @param {Pointer<Int32>} plProvType 
     * @returns {HRESULT} 
     */
    getProviderTypeWStr(pwszProvName, plProvType) {
        pwszProvName := pwszProvName is String ? StrPtr(pwszProvName) : pwszProvName

        result := ComCall(116, this, "ptr", pwszProvName, "int*", plProvType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lPropertyId 
     * @param {Integer} lReserved 
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pBlobProperty 
     * @returns {HRESULT} 
     */
    addBlobPropertyToCertificateWStr(lPropertyId, lReserved, pBlobProperty) {
        result := ComCall(117, this, "int", lPropertyId, "int", lReserved, "ptr", pBlobProperty, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<CERT_CONTEXT>} pSignerCert 
     * @returns {HRESULT} 
     */
    SetSignerCertificate(pSignerCert) {
        result := ComCall(118, this, "ptr", pSignerCert, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lClientId 
     * @returns {HRESULT} 
     */
    put_ClientId(lClientId) {
        result := ComCall(119, this, "int", lClientId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plClientId 
     * @returns {HRESULT} 
     */
    get_ClientId(plClientId) {
        result := ComCall(120, this, "int*", plClientId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fInclude 
     * @returns {HRESULT} 
     */
    put_IncludeSubjectKeyID(fInclude) {
        result := ComCall(121, this, "int", fInclude, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfInclude 
     * @returns {HRESULT} 
     */
    get_IncludeSubjectKeyID(pfInclude) {
        result := ComCall(122, this, "ptr", pfInclude, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
