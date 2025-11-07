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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_ThumbPrintWStr", "get_ThumbPrintWStr", "SetPrivateKeyArchiveCertificate", "GetPrivateKeyArchiveCertificate", "binaryBlobToString", "stringToBinaryBlob", "addExtensionToRequestWStr", "addAttributeToRequestWStr", "addNameValuePairToRequestWStr", "resetExtensions", "resetAttributes", "createRequestWStr", "createFileRequestWStr", "acceptResponseBlob", "acceptFileResponseWStr", "getCertContextFromResponseBlob", "getCertContextFromFileResponseWStr", "createPFXWStr", "createFilePFXWStr", "setPendingRequestInfoWStr", "enumPendingRequestWStr", "removePendingRequestWStr", "GetKeyLenEx", "InstallPKCS7BlobEx", "AddCertTypeToRequestWStrEx", "getProviderTypeWStr", "addBlobPropertyToCertificateWStr", "SetSignerCertificate", "put_ClientId", "get_ClientId", "put_IncludeSubjectKeyID", "get_IncludeSubjectKeyID"]

    /**
     * 
     * @param {CRYPT_INTEGER_BLOB} thumbPrintBlob 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-put_thumbprintwstr
     */
    put_ThumbPrintWStr(thumbPrintBlob) {
        result := ComCall(91, this, "ptr", thumbPrintBlob, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<CRYPT_INTEGER_BLOB>} thumbPrintBlob 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-get_thumbprintwstr
     */
    get_ThumbPrintWStr(thumbPrintBlob) {
        result := ComCall(92, this, "ptr", thumbPrintBlob, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<CERT_CONTEXT>} pPrivateKeyArchiveCert 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-setprivatekeyarchivecertificate
     */
    SetPrivateKeyArchiveCertificate(pPrivateKeyArchiveCert) {
        result := ComCall(93, this, "ptr", pPrivateKeyArchiveCert, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer<CERT_CONTEXT>} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-getprivatekeyarchivecertificate
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
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-binaryblobtostring
     */
    binaryBlobToString(Flags, pblobBinary, ppwszString) {
        ppwszStringMarshal := ppwszString is VarRef ? "ptr*" : "ptr"

        result := ComCall(95, this, "int", Flags, "ptr", pblobBinary, ppwszStringMarshal, ppwszString, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {PWSTR} pwszString 
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pblobBinary 
     * @param {Pointer<Integer>} pdwSkip 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-stringtobinaryblob
     */
    stringToBinaryBlob(Flags, pwszString, pblobBinary, pdwSkip, pdwFlags) {
        pwszString := pwszString is String ? StrPtr(pwszString) : pwszString

        pdwSkipMarshal := pdwSkip is VarRef ? "int*" : "ptr"
        pdwFlagsMarshal := pdwFlags is VarRef ? "int*" : "ptr"

        result := ComCall(96, this, "int", Flags, "ptr", pwszString, "ptr", pblobBinary, pdwSkipMarshal, pdwSkip, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {PWSTR} pwszName 
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pblobValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-addextensiontorequestwstr
     */
    addExtensionToRequestWStr(Flags, pwszName, pblobValue) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(97, this, "int", Flags, "ptr", pwszName, "ptr", pblobValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {PWSTR} pwszName 
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pblobValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-addattributetorequestwstr
     */
    addAttributeToRequestWStr(Flags, pwszName, pblobValue) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(98, this, "int", Flags, "ptr", pwszName, "ptr", pblobValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {PWSTR} pwszName 
     * @param {PWSTR} pwszValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-addnamevaluepairtorequestwstr
     */
    addNameValuePairToRequestWStr(Flags, pwszName, pwszValue) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName
        pwszValue := pwszValue is String ? StrPtr(pwszValue) : pwszValue

        result := ComCall(99, this, "int", Flags, "ptr", pwszName, "ptr", pwszValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-resetextensions
     */
    resetExtensions() {
        result := ComCall(100, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-resetattributes
     */
    resetAttributes() {
        result := ComCall(101, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {PWSTR} pwszDNName 
     * @param {PWSTR} pwszUsage 
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pblobRequest 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-createrequestwstr
     */
    createRequestWStr(Flags, pwszDNName, pwszUsage, pblobRequest) {
        pwszDNName := pwszDNName is String ? StrPtr(pwszDNName) : pwszDNName
        pwszUsage := pwszUsage is String ? StrPtr(pwszUsage) : pwszUsage

        result := ComCall(102, this, "int", Flags, "ptr", pwszDNName, "ptr", pwszUsage, "ptr", pblobRequest, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {PWSTR} pwszDNName 
     * @param {PWSTR} pwszUsage 
     * @param {PWSTR} pwszRequestFileName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-createfilerequestwstr
     */
    createFileRequestWStr(Flags, pwszDNName, pwszUsage, pwszRequestFileName) {
        pwszDNName := pwszDNName is String ? StrPtr(pwszDNName) : pwszDNName
        pwszUsage := pwszUsage is String ? StrPtr(pwszUsage) : pwszUsage
        pwszRequestFileName := pwszRequestFileName is String ? StrPtr(pwszRequestFileName) : pwszRequestFileName

        result := ComCall(103, this, "int", Flags, "ptr", pwszDNName, "ptr", pwszUsage, "ptr", pwszRequestFileName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pblobResponse 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-acceptresponseblob
     */
    acceptResponseBlob(pblobResponse) {
        result := ComCall(104, this, "ptr", pblobResponse, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszResponseFileName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-acceptfileresponsewstr
     */
    acceptFileResponseWStr(pwszResponseFileName) {
        pwszResponseFileName := pwszResponseFileName is String ? StrPtr(pwszResponseFileName) : pwszResponseFileName

        result := ComCall(105, this, "ptr", pwszResponseFileName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pblobResponse 
     * @param {Pointer<Pointer<CERT_CONTEXT>>} ppCertContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-getcertcontextfromresponseblob
     */
    getCertContextFromResponseBlob(pblobResponse, ppCertContext) {
        ppCertContextMarshal := ppCertContext is VarRef ? "ptr*" : "ptr"

        result := ComCall(106, this, "ptr", pblobResponse, ppCertContextMarshal, ppCertContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszResponseFileName 
     * @param {Pointer<Pointer<CERT_CONTEXT>>} ppCertContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-getcertcontextfromfileresponsewstr
     */
    getCertContextFromFileResponseWStr(pwszResponseFileName, ppCertContext) {
        pwszResponseFileName := pwszResponseFileName is String ? StrPtr(pwszResponseFileName) : pwszResponseFileName

        ppCertContextMarshal := ppCertContext is VarRef ? "ptr*" : "ptr"

        result := ComCall(107, this, "ptr", pwszResponseFileName, ppCertContextMarshal, ppCertContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszPassword 
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pblobPFX 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-createpfxwstr
     */
    createPFXWStr(pwszPassword, pblobPFX) {
        pwszPassword := pwszPassword is String ? StrPtr(pwszPassword) : pwszPassword

        result := ComCall(108, this, "ptr", pwszPassword, "ptr", pblobPFX, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszPassword 
     * @param {PWSTR} pwszPFXFileName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-createfilepfxwstr
     */
    createFilePFXWStr(pwszPassword, pwszPFXFileName) {
        pwszPassword := pwszPassword is String ? StrPtr(pwszPassword) : pwszPassword
        pwszPFXFileName := pwszPFXFileName is String ? StrPtr(pwszPFXFileName) : pwszPFXFileName

        result := ComCall(109, this, "ptr", pwszPassword, "ptr", pwszPFXFileName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lRequestID 
     * @param {PWSTR} pwszCADNS 
     * @param {PWSTR} pwszCAName 
     * @param {PWSTR} pwszFriendlyName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-setpendingrequestinfowstr
     */
    setPendingRequestInfoWStr(lRequestID, pwszCADNS, pwszCAName, pwszFriendlyName) {
        pwszCADNS := pwszCADNS is String ? StrPtr(pwszCADNS) : pwszCADNS
        pwszCAName := pwszCAName is String ? StrPtr(pwszCAName) : pwszCAName
        pwszFriendlyName := pwszFriendlyName is String ? StrPtr(pwszFriendlyName) : pwszFriendlyName

        result := ComCall(110, this, "int", lRequestID, "ptr", pwszCADNS, "ptr", pwszCAName, "ptr", pwszFriendlyName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Integer} lDesiredProperty 
     * @param {Pointer<Void>} ppProperty 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-enumpendingrequestwstr
     */
    enumPendingRequestWStr(lIndex, lDesiredProperty, ppProperty) {
        ppPropertyMarshal := ppProperty is VarRef ? "ptr" : "ptr"

        result := ComCall(111, this, "int", lIndex, "int", lDesiredProperty, ppPropertyMarshal, ppProperty, "HRESULT")
        return result
    }

    /**
     * 
     * @param {CRYPT_INTEGER_BLOB} thumbPrintBlob 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-removependingrequestwstr
     */
    removePendingRequestWStr(thumbPrintBlob) {
        result := ComCall(112, this, "ptr", thumbPrintBlob, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lSizeSpec 
     * @param {Integer} lKeySpec 
     * @param {Pointer<Integer>} pdwKeySize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-getkeylenex
     */
    GetKeyLenEx(lSizeSpec, lKeySpec, pdwKeySize) {
        pdwKeySizeMarshal := pdwKeySize is VarRef ? "int*" : "ptr"

        result := ComCall(113, this, "int", lSizeSpec, "int", lKeySpec, pdwKeySizeMarshal, pdwKeySize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pBlobPKCS7 
     * @param {Pointer<Integer>} plCertInstalled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-installpkcs7blobex
     */
    InstallPKCS7BlobEx(pBlobPKCS7, plCertInstalled) {
        plCertInstalledMarshal := plCertInstalled is VarRef ? "int*" : "ptr"

        result := ComCall(114, this, "ptr", pBlobPKCS7, plCertInstalledMarshal, plCertInstalled, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-addcerttypetorequestwstrex
     */
    AddCertTypeToRequestWStrEx(lType, pwszOIDOrName, lMajorVersion, fMinorVersion, lMinorVersion) {
        pwszOIDOrName := pwszOIDOrName is String ? StrPtr(pwszOIDOrName) : pwszOIDOrName

        result := ComCall(115, this, "int", lType, "ptr", pwszOIDOrName, "int", lMajorVersion, "int", fMinorVersion, "int", lMinorVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszProvName 
     * @param {Pointer<Integer>} plProvType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-getprovidertypewstr
     */
    getProviderTypeWStr(pwszProvName, plProvType) {
        pwszProvName := pwszProvName is String ? StrPtr(pwszProvName) : pwszProvName

        plProvTypeMarshal := plProvType is VarRef ? "int*" : "ptr"

        result := ComCall(116, this, "ptr", pwszProvName, plProvTypeMarshal, plProvType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lPropertyId 
     * @param {Integer} lReserved 
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pBlobProperty 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-addblobpropertytocertificatewstr
     */
    addBlobPropertyToCertificateWStr(lPropertyId, lReserved, pBlobProperty) {
        result := ComCall(117, this, "int", lPropertyId, "int", lReserved, "ptr", pBlobProperty, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<CERT_CONTEXT>} pSignerCert 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-setsignercertificate
     */
    SetSignerCertificate(pSignerCert) {
        result := ComCall(118, this, "ptr", pSignerCert, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lClientId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-put_clientid
     */
    put_ClientId(lClientId) {
        result := ComCall(119, this, "int", lClientId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plClientId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-get_clientid
     */
    get_ClientId(plClientId) {
        plClientIdMarshal := plClientId is VarRef ? "int*" : "ptr"

        result := ComCall(120, this, plClientIdMarshal, plClientId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fInclude 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-put_includesubjectkeyid
     */
    put_IncludeSubjectKeyID(fInclude) {
        result := ComCall(121, this, "int", fInclude, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfInclude 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-get_includesubjectkeyid
     */
    get_IncludeSubjectKeyID(pfInclude) {
        pfIncludeMarshal := pfInclude is VarRef ? "int*" : "ptr"

        result := ComCall(122, this, pfIncludeMarshal, pfInclude, "HRESULT")
        return result
    }
}
