#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class ISAXXMLReader extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISAXXMLReader
     * @type {Guid}
     */
    static IID => Guid("{a4f96ed0-f829-476e-81c0-cdc7bd2a0802}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["getFeature", "putFeature", "getProperty", "putProperty", "getEntityResolver", "putEntityResolver", "getContentHandler", "putContentHandler", "getDTDHandler", "putDTDHandler", "getErrorHandler", "putErrorHandler", "getBaseURL", "putBaseURL", "getSecureBaseURL", "putSecureBaseURL", "parse", "parseURL"]

    /**
     * 
     * @param {PWSTR} pwchName 
     * @param {Pointer<VARIANT_BOOL>} pvfValue 
     * @returns {HRESULT} 
     */
    getFeature(pwchName, pvfValue) {
        pwchName := pwchName is String ? StrPtr(pwchName) : pwchName

        result := ComCall(3, this, "ptr", pwchName, "ptr", pvfValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwchName 
     * @param {VARIANT_BOOL} vfValue 
     * @returns {HRESULT} 
     */
    putFeature(pwchName, vfValue) {
        pwchName := pwchName is String ? StrPtr(pwchName) : pwchName

        result := ComCall(4, this, "ptr", pwchName, "short", vfValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwchName 
     * @param {Pointer<VARIANT>} pvarValue 
     * @returns {HRESULT} 
     */
    getProperty(pwchName, pvarValue) {
        pwchName := pwchName is String ? StrPtr(pwchName) : pwchName

        result := ComCall(5, this, "ptr", pwchName, "ptr", pvarValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwchName 
     * @param {VARIANT} varValue 
     * @returns {HRESULT} 
     */
    putProperty(pwchName, varValue) {
        pwchName := pwchName is String ? StrPtr(pwchName) : pwchName

        result := ComCall(6, this, "ptr", pwchName, "ptr", varValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISAXEntityResolver>} ppResolver 
     * @returns {HRESULT} 
     */
    getEntityResolver(ppResolver) {
        result := ComCall(7, this, "ptr*", ppResolver, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISAXEntityResolver} pResolver 
     * @returns {HRESULT} 
     */
    putEntityResolver(pResolver) {
        result := ComCall(8, this, "ptr", pResolver, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISAXContentHandler>} ppHandler 
     * @returns {HRESULT} 
     */
    getContentHandler(ppHandler) {
        result := ComCall(9, this, "ptr*", ppHandler, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISAXContentHandler} pHandler 
     * @returns {HRESULT} 
     */
    putContentHandler(pHandler) {
        result := ComCall(10, this, "ptr", pHandler, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISAXDTDHandler>} ppHandler 
     * @returns {HRESULT} 
     */
    getDTDHandler(ppHandler) {
        result := ComCall(11, this, "ptr*", ppHandler, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISAXDTDHandler} pHandler 
     * @returns {HRESULT} 
     */
    putDTDHandler(pHandler) {
        result := ComCall(12, this, "ptr", pHandler, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISAXErrorHandler>} ppHandler 
     * @returns {HRESULT} 
     */
    getErrorHandler(ppHandler) {
        result := ComCall(13, this, "ptr*", ppHandler, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISAXErrorHandler} pHandler 
     * @returns {HRESULT} 
     */
    putErrorHandler(pHandler) {
        result := ComCall(14, this, "ptr", pHandler, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} ppwchBaseUrl 
     * @returns {HRESULT} 
     */
    getBaseURL(ppwchBaseUrl) {
        ppwchBaseUrlMarshal := ppwchBaseUrl is VarRef ? "ptr*" : "ptr"

        result := ComCall(15, this, ppwchBaseUrlMarshal, ppwchBaseUrl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwchBaseUrl 
     * @returns {HRESULT} 
     */
    putBaseURL(pwchBaseUrl) {
        pwchBaseUrl := pwchBaseUrl is String ? StrPtr(pwchBaseUrl) : pwchBaseUrl

        result := ComCall(16, this, "ptr", pwchBaseUrl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} ppwchSecureBaseUrl 
     * @returns {HRESULT} 
     */
    getSecureBaseURL(ppwchSecureBaseUrl) {
        ppwchSecureBaseUrlMarshal := ppwchSecureBaseUrl is VarRef ? "ptr*" : "ptr"

        result := ComCall(17, this, ppwchSecureBaseUrlMarshal, ppwchSecureBaseUrl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwchSecureBaseUrl 
     * @returns {HRESULT} 
     */
    putSecureBaseURL(pwchSecureBaseUrl) {
        pwchSecureBaseUrl := pwchSecureBaseUrl is String ? StrPtr(pwchSecureBaseUrl) : pwchSecureBaseUrl

        result := ComCall(18, this, "ptr", pwchSecureBaseUrl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varInput 
     * @returns {HRESULT} 
     */
    parse(varInput) {
        result := ComCall(19, this, "ptr", varInput, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwchUrl 
     * @returns {HRESULT} 
     */
    parseURL(pwchUrl) {
        pwchUrl := pwchUrl is String ? StrPtr(pwchUrl) : pwchUrl

        result := ComCall(20, this, "ptr", pwchUrl, "HRESULT")
        return result
    }
}
