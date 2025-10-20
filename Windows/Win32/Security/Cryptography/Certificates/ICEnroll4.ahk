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
     * 
     * @param {BSTR} bstrCert 
     * @returns {HRESULT} 
     */
    put_PrivateKeyArchiveCertificate(bstrCert) {
        bstrCert := bstrCert is String ? BSTR.Alloc(bstrCert).Value : bstrCert

        result := ComCall(83, this, "ptr", bstrCert, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrCert 
     * @returns {HRESULT} 
     */
    get_PrivateKeyArchiveCertificate(pbstrCert) {
        result := ComCall(84, this, "ptr", pbstrCert, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrThumbPrint 
     * @returns {HRESULT} 
     */
    put_ThumbPrint(bstrThumbPrint) {
        bstrThumbPrint := bstrThumbPrint is String ? BSTR.Alloc(bstrThumbPrint).Value : bstrThumbPrint

        result := ComCall(85, this, "ptr", bstrThumbPrint, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrThumbPrint 
     * @returns {HRESULT} 
     */
    get_ThumbPrint(pbstrThumbPrint) {
        result := ComCall(86, this, "ptr", pbstrThumbPrint, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {BSTR} strBinary 
     * @param {Pointer<BSTR>} pstrEncoded 
     * @returns {HRESULT} 
     */
    binaryToString(Flags, strBinary, pstrEncoded) {
        strBinary := strBinary is String ? BSTR.Alloc(strBinary).Value : strBinary

        result := ComCall(87, this, "int", Flags, "ptr", strBinary, "ptr", pstrEncoded, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {BSTR} strEncoded 
     * @param {Pointer<BSTR>} pstrBinary 
     * @returns {HRESULT} 
     */
    stringToBinary(Flags, strEncoded, pstrBinary) {
        strEncoded := strEncoded is String ? BSTR.Alloc(strEncoded).Value : strEncoded

        result := ComCall(88, this, "int", Flags, "ptr", strEncoded, "ptr", pstrBinary, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {BSTR} strName 
     * @param {BSTR} strValue 
     * @returns {HRESULT} 
     */
    addExtensionToRequest(Flags, strName, strValue) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName
        strValue := strValue is String ? BSTR.Alloc(strValue).Value : strValue

        result := ComCall(89, this, "int", Flags, "ptr", strName, "ptr", strValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {BSTR} strName 
     * @param {BSTR} strValue 
     * @returns {HRESULT} 
     */
    addAttributeToRequest(Flags, strName, strValue) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName
        strValue := strValue is String ? BSTR.Alloc(strValue).Value : strValue

        result := ComCall(90, this, "int", Flags, "ptr", strName, "ptr", strValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {BSTR} strName 
     * @param {BSTR} strValue 
     * @returns {HRESULT} 
     */
    addNameValuePairToRequest(Flags, strName, strValue) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName
        strValue := strValue is String ? BSTR.Alloc(strValue).Value : strValue

        result := ComCall(91, this, "int", Flags, "ptr", strName, "ptr", strValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    resetExtensions() {
        result := ComCall(92, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    resetAttributes() {
        result := ComCall(93, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {BSTR} strDNName 
     * @param {BSTR} Usage 
     * @param {Pointer<BSTR>} pstrRequest 
     * @returns {HRESULT} 
     */
    createRequest(Flags, strDNName, Usage, pstrRequest) {
        strDNName := strDNName is String ? BSTR.Alloc(strDNName).Value : strDNName
        Usage := Usage is String ? BSTR.Alloc(Usage).Value : Usage

        result := ComCall(94, this, "int", Flags, "ptr", strDNName, "ptr", Usage, "ptr", pstrRequest, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {BSTR} strDNName 
     * @param {BSTR} strUsage 
     * @param {BSTR} strRequestFileName 
     * @returns {HRESULT} 
     */
    createFileRequest(Flags, strDNName, strUsage, strRequestFileName) {
        strDNName := strDNName is String ? BSTR.Alloc(strDNName).Value : strDNName
        strUsage := strUsage is String ? BSTR.Alloc(strUsage).Value : strUsage
        strRequestFileName := strRequestFileName is String ? BSTR.Alloc(strRequestFileName).Value : strRequestFileName

        result := ComCall(95, this, "int", Flags, "ptr", strDNName, "ptr", strUsage, "ptr", strRequestFileName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strResponse 
     * @returns {HRESULT} 
     */
    acceptResponse(strResponse) {
        strResponse := strResponse is String ? BSTR.Alloc(strResponse).Value : strResponse

        result := ComCall(96, this, "ptr", strResponse, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strResponseFileName 
     * @returns {HRESULT} 
     */
    acceptFileResponse(strResponseFileName) {
        strResponseFileName := strResponseFileName is String ? BSTR.Alloc(strResponseFileName).Value : strResponseFileName

        result := ComCall(97, this, "ptr", strResponseFileName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strResponse 
     * @param {Pointer<BSTR>} pstrCert 
     * @returns {HRESULT} 
     */
    getCertFromResponse(strResponse, pstrCert) {
        strResponse := strResponse is String ? BSTR.Alloc(strResponse).Value : strResponse

        result := ComCall(98, this, "ptr", strResponse, "ptr", pstrCert, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strResponseFileName 
     * @param {Pointer<BSTR>} pstrCert 
     * @returns {HRESULT} 
     */
    getCertFromFileResponse(strResponseFileName, pstrCert) {
        strResponseFileName := strResponseFileName is String ? BSTR.Alloc(strResponseFileName).Value : strResponseFileName

        result := ComCall(99, this, "ptr", strResponseFileName, "ptr", pstrCert, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strPassword 
     * @param {Pointer<BSTR>} pstrPFX 
     * @returns {HRESULT} 
     */
    createPFX(strPassword, pstrPFX) {
        strPassword := strPassword is String ? BSTR.Alloc(strPassword).Value : strPassword

        result := ComCall(100, this, "ptr", strPassword, "ptr", pstrPFX, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strPassword 
     * @param {BSTR} strPFXFileName 
     * @returns {HRESULT} 
     */
    createFilePFX(strPassword, strPFXFileName) {
        strPassword := strPassword is String ? BSTR.Alloc(strPassword).Value : strPassword
        strPFXFileName := strPFXFileName is String ? BSTR.Alloc(strPFXFileName).Value : strPFXFileName

        result := ComCall(101, this, "ptr", strPassword, "ptr", strPFXFileName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lRequestID 
     * @param {BSTR} strCADNS 
     * @param {BSTR} strCAName 
     * @param {BSTR} strFriendlyName 
     * @returns {HRESULT} 
     */
    setPendingRequestInfo(lRequestID, strCADNS, strCAName, strFriendlyName) {
        strCADNS := strCADNS is String ? BSTR.Alloc(strCADNS).Value : strCADNS
        strCAName := strCAName is String ? BSTR.Alloc(strCAName).Value : strCAName
        strFriendlyName := strFriendlyName is String ? BSTR.Alloc(strFriendlyName).Value : strFriendlyName

        result := ComCall(102, this, "int", lRequestID, "ptr", strCADNS, "ptr", strCAName, "ptr", strFriendlyName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Integer} lDesiredProperty 
     * @param {Pointer<VARIANT>} pvarProperty 
     * @returns {HRESULT} 
     */
    enumPendingRequest(lIndex, lDesiredProperty, pvarProperty) {
        result := ComCall(103, this, "int", lIndex, "int", lDesiredProperty, "ptr", pvarProperty, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strThumbprint 
     * @returns {HRESULT} 
     */
    removePendingRequest(strThumbprint) {
        strThumbprint := strThumbprint is String ? BSTR.Alloc(strThumbprint).Value : strThumbprint

        result := ComCall(104, this, "ptr", strThumbprint, "int")
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
        result := ComCall(105, this, "int", lSizeSpec, "int", lKeySpec, "int*", pdwKeySize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} PKCS7 
     * @param {Pointer<Int32>} plCertInstalled 
     * @returns {HRESULT} 
     */
    InstallPKCS7Ex(PKCS7, plCertInstalled) {
        PKCS7 := PKCS7 is String ? BSTR.Alloc(PKCS7).Value : PKCS7

        result := ComCall(106, this, "ptr", PKCS7, "int*", plCertInstalled, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    addCertTypeToRequestEx(lType, bstrOIDOrName, lMajorVersion, fMinorVersion, lMinorVersion) {
        bstrOIDOrName := bstrOIDOrName is String ? BSTR.Alloc(bstrOIDOrName).Value : bstrOIDOrName

        result := ComCall(107, this, "int", lType, "ptr", bstrOIDOrName, "int", lMajorVersion, "int", fMinorVersion, "int", lMinorVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strProvName 
     * @param {Pointer<Int32>} plProvType 
     * @returns {HRESULT} 
     */
    getProviderType(strProvName, plProvType) {
        strProvName := strProvName is String ? BSTR.Alloc(strProvName).Value : strProvName

        result := ComCall(108, this, "ptr", strProvName, "int*", plProvType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrCert 
     * @returns {HRESULT} 
     */
    put_SignerCertificate(bstrCert) {
        bstrCert := bstrCert is String ? BSTR.Alloc(bstrCert).Value : bstrCert

        result := ComCall(109, this, "ptr", bstrCert, "int")
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
        result := ComCall(110, this, "int", lClientId, "int")
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
        result := ComCall(111, this, "int*", plClientId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lPropertyId 
     * @param {Integer} lReserved 
     * @param {BSTR} bstrProperty 
     * @returns {HRESULT} 
     */
    addBlobPropertyToCertificate(lPropertyId, lReserved, bstrProperty) {
        bstrProperty := bstrProperty is String ? BSTR.Alloc(bstrProperty).Value : bstrProperty

        result := ComCall(112, this, "int", lPropertyId, "int", lReserved, "ptr", bstrProperty, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    resetBlobProperties() {
        result := ComCall(113, this, "int")
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
        result := ComCall(114, this, "int", fInclude, "int")
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
        result := ComCall(115, this, "ptr", pfInclude, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
