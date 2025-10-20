#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IVBSAXXMLReader extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVBSAXXMLReader
     * @type {Guid}
     */
    static IID => Guid("{8c033caa-6cd6-4f73-b728-4531af74945f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["getFeature", "putFeature", "getProperty", "putProperty", "get_entityResolver", "putref_entityResolver", "get_contentHandler", "putref_contentHandler", "get_dtdHandler", "putref_dtdHandler", "get_errorHandler", "putref_errorHandler", "get_baseURL", "put_baseURL", "get_secureBaseURL", "put_secureBaseURL", "parse", "parseURL"]

    /**
     * 
     * @param {BSTR} strName 
     * @param {Pointer<VARIANT_BOOL>} fValue 
     * @returns {HRESULT} 
     */
    getFeature(strName, fValue) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(7, this, "ptr", strName, "ptr", fValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strName 
     * @param {VARIANT_BOOL} fValue 
     * @returns {HRESULT} 
     */
    putFeature(strName, fValue) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(8, this, "ptr", strName, "short", fValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strName 
     * @param {Pointer<VARIANT>} varValue 
     * @returns {HRESULT} 
     */
    getProperty(strName, varValue) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(9, this, "ptr", strName, "ptr", varValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strName 
     * @param {VARIANT} varValue 
     * @returns {HRESULT} 
     */
    putProperty(strName, varValue) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(10, this, "ptr", strName, "ptr", varValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IVBSAXEntityResolver>} oResolver 
     * @returns {HRESULT} 
     */
    get_entityResolver(oResolver) {
        result := ComCall(11, this, "ptr*", oResolver, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IVBSAXEntityResolver} oResolver 
     * @returns {HRESULT} 
     */
    putref_entityResolver(oResolver) {
        result := ComCall(12, this, "ptr", oResolver, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IVBSAXContentHandler>} oHandler 
     * @returns {HRESULT} 
     */
    get_contentHandler(oHandler) {
        result := ComCall(13, this, "ptr*", oHandler, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IVBSAXContentHandler} oHandler 
     * @returns {HRESULT} 
     */
    putref_contentHandler(oHandler) {
        result := ComCall(14, this, "ptr", oHandler, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IVBSAXDTDHandler>} oHandler 
     * @returns {HRESULT} 
     */
    get_dtdHandler(oHandler) {
        result := ComCall(15, this, "ptr*", oHandler, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IVBSAXDTDHandler} oHandler 
     * @returns {HRESULT} 
     */
    putref_dtdHandler(oHandler) {
        result := ComCall(16, this, "ptr", oHandler, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IVBSAXErrorHandler>} oHandler 
     * @returns {HRESULT} 
     */
    get_errorHandler(oHandler) {
        result := ComCall(17, this, "ptr*", oHandler, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IVBSAXErrorHandler} oHandler 
     * @returns {HRESULT} 
     */
    putref_errorHandler(oHandler) {
        result := ComCall(18, this, "ptr", oHandler, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strBaseURL 
     * @returns {HRESULT} 
     */
    get_baseURL(strBaseURL) {
        result := ComCall(19, this, "ptr", strBaseURL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strBaseURL 
     * @returns {HRESULT} 
     */
    put_baseURL(strBaseURL) {
        strBaseURL := strBaseURL is String ? BSTR.Alloc(strBaseURL).Value : strBaseURL

        result := ComCall(20, this, "ptr", strBaseURL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strSecureBaseURL 
     * @returns {HRESULT} 
     */
    get_secureBaseURL(strSecureBaseURL) {
        result := ComCall(21, this, "ptr", strSecureBaseURL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strSecureBaseURL 
     * @returns {HRESULT} 
     */
    put_secureBaseURL(strSecureBaseURL) {
        strSecureBaseURL := strSecureBaseURL is String ? BSTR.Alloc(strSecureBaseURL).Value : strSecureBaseURL

        result := ComCall(22, this, "ptr", strSecureBaseURL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varInput 
     * @returns {HRESULT} 
     */
    parse(varInput) {
        result := ComCall(23, this, "ptr", varInput, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strURL 
     * @returns {HRESULT} 
     */
    parseURL(strURL) {
        strURL := strURL is String ? BSTR.Alloc(strURL).Value : strURL

        result := ComCall(24, this, "ptr", strURL, "HRESULT")
        return result
    }
}
