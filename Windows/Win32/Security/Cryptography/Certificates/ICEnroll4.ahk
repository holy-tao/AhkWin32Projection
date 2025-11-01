#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ICEnroll3.ahk

/**
 * The ICEnroll4 interface is one of several interfaces that represent the Certificate Enrollment Control.
 * @see https://docs.microsoft.com/windows/win32/api//xenroll/nn-xenroll-icenroll4
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICEnroll4 extends ICEnroll3{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICEnroll4
     * @type {Guid}
     */
    static IID => Guid("{c1f1188a-2eb5-4a80-841b-7e729a356d90}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 83

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_PrivateKeyArchiveCertificate", "get_PrivateKeyArchiveCertificate", "put_ThumbPrint", "get_ThumbPrint", "binaryToString", "stringToBinary", "addExtensionToRequest", "addAttributeToRequest", "addNameValuePairToRequest", "resetExtensions", "resetAttributes", "createRequest", "createFileRequest", "acceptResponse", "acceptFileResponse", "getCertFromResponse", "getCertFromFileResponse", "createPFX", "createFilePFX", "setPendingRequestInfo", "enumPendingRequest", "removePendingRequest", "GetKeyLenEx", "InstallPKCS7Ex", "addCertTypeToRequestEx", "getProviderType", "put_SignerCertificate", "put_ClientId", "get_ClientId", "addBlobPropertyToCertificate", "resetBlobProperties", "put_IncludeSubjectKeyID", "get_IncludeSubjectKeyID"]

    /**
     * 
     * @param {BSTR} bstrCert 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll4-put_privatekeyarchivecertificate
     */
    put_PrivateKeyArchiveCertificate(bstrCert) {
        bstrCert := bstrCert is String ? BSTR.Alloc(bstrCert).Value : bstrCert

        result := ComCall(83, this, "ptr", bstrCert, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrCert 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll4-get_privatekeyarchivecertificate
     */
    get_PrivateKeyArchiveCertificate(pbstrCert) {
        result := ComCall(84, this, "ptr", pbstrCert, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrThumbPrint 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll4-put_thumbprint
     */
    put_ThumbPrint(bstrThumbPrint) {
        bstrThumbPrint := bstrThumbPrint is String ? BSTR.Alloc(bstrThumbPrint).Value : bstrThumbPrint

        result := ComCall(85, this, "ptr", bstrThumbPrint, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrThumbPrint 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll4-get_thumbprint
     */
    get_ThumbPrint(pbstrThumbPrint) {
        result := ComCall(86, this, "ptr", pbstrThumbPrint, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {BSTR} strBinary 
     * @param {Pointer<BSTR>} pstrEncoded 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll4-binarytostring
     */
    binaryToString(Flags, strBinary, pstrEncoded) {
        strBinary := strBinary is String ? BSTR.Alloc(strBinary).Value : strBinary

        result := ComCall(87, this, "int", Flags, "ptr", strBinary, "ptr", pstrEncoded, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {BSTR} strEncoded 
     * @param {Pointer<BSTR>} pstrBinary 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll4-stringtobinary
     */
    stringToBinary(Flags, strEncoded, pstrBinary) {
        strEncoded := strEncoded is String ? BSTR.Alloc(strEncoded).Value : strEncoded

        result := ComCall(88, this, "int", Flags, "ptr", strEncoded, "ptr", pstrBinary, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {BSTR} strName 
     * @param {BSTR} strValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll4-addextensiontorequest
     */
    addExtensionToRequest(Flags, strName, strValue) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName
        strValue := strValue is String ? BSTR.Alloc(strValue).Value : strValue

        result := ComCall(89, this, "int", Flags, "ptr", strName, "ptr", strValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {BSTR} strName 
     * @param {BSTR} strValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll4-addattributetorequest
     */
    addAttributeToRequest(Flags, strName, strValue) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName
        strValue := strValue is String ? BSTR.Alloc(strValue).Value : strValue

        result := ComCall(90, this, "int", Flags, "ptr", strName, "ptr", strValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {BSTR} strName 
     * @param {BSTR} strValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll4-addnamevaluepairtorequest
     */
    addNameValuePairToRequest(Flags, strName, strValue) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName
        strValue := strValue is String ? BSTR.Alloc(strValue).Value : strValue

        result := ComCall(91, this, "int", Flags, "ptr", strName, "ptr", strValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll4-resetextensions
     */
    resetExtensions() {
        result := ComCall(92, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll4-resetattributes
     */
    resetAttributes() {
        result := ComCall(93, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {BSTR} strDNName 
     * @param {BSTR} Usage 
     * @param {Pointer<BSTR>} pstrRequest 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll4-createrequest
     */
    createRequest(Flags, strDNName, Usage, pstrRequest) {
        strDNName := strDNName is String ? BSTR.Alloc(strDNName).Value : strDNName
        Usage := Usage is String ? BSTR.Alloc(Usage).Value : Usage

        result := ComCall(94, this, "int", Flags, "ptr", strDNName, "ptr", Usage, "ptr", pstrRequest, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {BSTR} strDNName 
     * @param {BSTR} strUsage 
     * @param {BSTR} strRequestFileName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll4-createfilerequest
     */
    createFileRequest(Flags, strDNName, strUsage, strRequestFileName) {
        strDNName := strDNName is String ? BSTR.Alloc(strDNName).Value : strDNName
        strUsage := strUsage is String ? BSTR.Alloc(strUsage).Value : strUsage
        strRequestFileName := strRequestFileName is String ? BSTR.Alloc(strRequestFileName).Value : strRequestFileName

        result := ComCall(95, this, "int", Flags, "ptr", strDNName, "ptr", strUsage, "ptr", strRequestFileName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strResponse 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll4-acceptresponse
     */
    acceptResponse(strResponse) {
        strResponse := strResponse is String ? BSTR.Alloc(strResponse).Value : strResponse

        result := ComCall(96, this, "ptr", strResponse, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strResponseFileName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll4-acceptfileresponse
     */
    acceptFileResponse(strResponseFileName) {
        strResponseFileName := strResponseFileName is String ? BSTR.Alloc(strResponseFileName).Value : strResponseFileName

        result := ComCall(97, this, "ptr", strResponseFileName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strResponse 
     * @param {Pointer<BSTR>} pstrCert 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll4-getcertfromresponse
     */
    getCertFromResponse(strResponse, pstrCert) {
        strResponse := strResponse is String ? BSTR.Alloc(strResponse).Value : strResponse

        result := ComCall(98, this, "ptr", strResponse, "ptr", pstrCert, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strResponseFileName 
     * @param {Pointer<BSTR>} pstrCert 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll4-getcertfromfileresponse
     */
    getCertFromFileResponse(strResponseFileName, pstrCert) {
        strResponseFileName := strResponseFileName is String ? BSTR.Alloc(strResponseFileName).Value : strResponseFileName

        result := ComCall(99, this, "ptr", strResponseFileName, "ptr", pstrCert, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strPassword 
     * @param {Pointer<BSTR>} pstrPFX 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll4-createpfx
     */
    createPFX(strPassword, pstrPFX) {
        strPassword := strPassword is String ? BSTR.Alloc(strPassword).Value : strPassword

        result := ComCall(100, this, "ptr", strPassword, "ptr", pstrPFX, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strPassword 
     * @param {BSTR} strPFXFileName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll4-createfilepfx
     */
    createFilePFX(strPassword, strPFXFileName) {
        strPassword := strPassword is String ? BSTR.Alloc(strPassword).Value : strPassword
        strPFXFileName := strPFXFileName is String ? BSTR.Alloc(strPFXFileName).Value : strPFXFileName

        result := ComCall(101, this, "ptr", strPassword, "ptr", strPFXFileName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lRequestID 
     * @param {BSTR} strCADNS 
     * @param {BSTR} strCAName 
     * @param {BSTR} strFriendlyName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll4-setpendingrequestinfo
     */
    setPendingRequestInfo(lRequestID, strCADNS, strCAName, strFriendlyName) {
        strCADNS := strCADNS is String ? BSTR.Alloc(strCADNS).Value : strCADNS
        strCAName := strCAName is String ? BSTR.Alloc(strCAName).Value : strCAName
        strFriendlyName := strFriendlyName is String ? BSTR.Alloc(strFriendlyName).Value : strFriendlyName

        result := ComCall(102, this, "int", lRequestID, "ptr", strCADNS, "ptr", strCAName, "ptr", strFriendlyName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Integer} lDesiredProperty 
     * @param {Pointer<VARIANT>} pvarProperty 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll4-enumpendingrequest
     */
    enumPendingRequest(lIndex, lDesiredProperty, pvarProperty) {
        result := ComCall(103, this, "int", lIndex, "int", lDesiredProperty, "ptr", pvarProperty, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strThumbprint 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll4-removependingrequest
     */
    removePendingRequest(strThumbprint) {
        strThumbprint := strThumbprint is String ? BSTR.Alloc(strThumbprint).Value : strThumbprint

        result := ComCall(104, this, "ptr", strThumbprint, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lSizeSpec 
     * @param {Integer} lKeySpec 
     * @param {Pointer<Integer>} pdwKeySize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll4-getkeylenex
     */
    GetKeyLenEx(lSizeSpec, lKeySpec, pdwKeySize) {
        pdwKeySizeMarshal := pdwKeySize is VarRef ? "int*" : "ptr"

        result := ComCall(105, this, "int", lSizeSpec, "int", lKeySpec, pdwKeySizeMarshal, pdwKeySize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} PKCS7 
     * @param {Pointer<Integer>} plCertInstalled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll4-installpkcs7ex
     */
    InstallPKCS7Ex(PKCS7, plCertInstalled) {
        PKCS7 := PKCS7 is String ? BSTR.Alloc(PKCS7).Value : PKCS7

        plCertInstalledMarshal := plCertInstalled is VarRef ? "int*" : "ptr"

        result := ComCall(106, this, "ptr", PKCS7, plCertInstalledMarshal, plCertInstalled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lType 
     * @param {BSTR} bstrOIDOrName 
     * @param {Integer} lMajorVersion 
     * @param {BOOL} fMinorVersion 
     * @param {Integer} lMinorVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll4-addcerttypetorequestex
     */
    addCertTypeToRequestEx(lType, bstrOIDOrName, lMajorVersion, fMinorVersion, lMinorVersion) {
        bstrOIDOrName := bstrOIDOrName is String ? BSTR.Alloc(bstrOIDOrName).Value : bstrOIDOrName

        result := ComCall(107, this, "int", lType, "ptr", bstrOIDOrName, "int", lMajorVersion, "int", fMinorVersion, "int", lMinorVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strProvName 
     * @param {Pointer<Integer>} plProvType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll4-getprovidertype
     */
    getProviderType(strProvName, plProvType) {
        strProvName := strProvName is String ? BSTR.Alloc(strProvName).Value : strProvName

        plProvTypeMarshal := plProvType is VarRef ? "int*" : "ptr"

        result := ComCall(108, this, "ptr", strProvName, plProvTypeMarshal, plProvType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrCert 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll4-put_signercertificate
     */
    put_SignerCertificate(bstrCert) {
        bstrCert := bstrCert is String ? BSTR.Alloc(bstrCert).Value : bstrCert

        result := ComCall(109, this, "ptr", bstrCert, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lClientId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll4-put_clientid
     */
    put_ClientId(lClientId) {
        result := ComCall(110, this, "int", lClientId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plClientId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll4-get_clientid
     */
    get_ClientId(plClientId) {
        plClientIdMarshal := plClientId is VarRef ? "int*" : "ptr"

        result := ComCall(111, this, plClientIdMarshal, plClientId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lPropertyId 
     * @param {Integer} lReserved 
     * @param {BSTR} bstrProperty 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll4-addblobpropertytocertificate
     */
    addBlobPropertyToCertificate(lPropertyId, lReserved, bstrProperty) {
        bstrProperty := bstrProperty is String ? BSTR.Alloc(bstrProperty).Value : bstrProperty

        result := ComCall(112, this, "int", lPropertyId, "int", lReserved, "ptr", bstrProperty, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll4-resetblobproperties
     */
    resetBlobProperties() {
        result := ComCall(113, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fInclude 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll4-put_includesubjectkeyid
     */
    put_IncludeSubjectKeyID(fInclude) {
        result := ComCall(114, this, "int", fInclude, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfInclude 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll4-get_includesubjectkeyid
     */
    get_IncludeSubjectKeyID(pfInclude) {
        result := ComCall(115, this, "ptr", pfInclude, "HRESULT")
        return result
    }
}
