#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class ISAXXMLReader extends IUnknown{
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
     * 
     * @param {PWSTR} pwchName 
     * @param {Pointer<VARIANT_BOOL>} pvfValue 
     * @returns {HRESULT} 
     */
    getFeature(pwchName, pvfValue) {
        pwchName := pwchName is String ? StrPtr(pwchName) : pwchName

        result := ComCall(3, this, "ptr", pwchName, "ptr", pvfValue, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(4, this, "ptr", pwchName, "short", vfValue, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(5, this, "ptr", pwchName, "ptr", pvarValue, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(6, this, "ptr", pwchName, "ptr", varValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISAXEntityResolver>} ppResolver 
     * @returns {HRESULT} 
     */
    getEntityResolver(ppResolver) {
        result := ComCall(7, this, "ptr", ppResolver, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISAXEntityResolver>} pResolver 
     * @returns {HRESULT} 
     */
    putEntityResolver(pResolver) {
        result := ComCall(8, this, "ptr", pResolver, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISAXContentHandler>} ppHandler 
     * @returns {HRESULT} 
     */
    getContentHandler(ppHandler) {
        result := ComCall(9, this, "ptr", ppHandler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISAXContentHandler>} pHandler 
     * @returns {HRESULT} 
     */
    putContentHandler(pHandler) {
        result := ComCall(10, this, "ptr", pHandler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISAXDTDHandler>} ppHandler 
     * @returns {HRESULT} 
     */
    getDTDHandler(ppHandler) {
        result := ComCall(11, this, "ptr", ppHandler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISAXDTDHandler>} pHandler 
     * @returns {HRESULT} 
     */
    putDTDHandler(pHandler) {
        result := ComCall(12, this, "ptr", pHandler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISAXErrorHandler>} ppHandler 
     * @returns {HRESULT} 
     */
    getErrorHandler(ppHandler) {
        result := ComCall(13, this, "ptr", ppHandler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISAXErrorHandler>} pHandler 
     * @returns {HRESULT} 
     */
    putErrorHandler(pHandler) {
        result := ComCall(14, this, "ptr", pHandler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} ppwchBaseUrl 
     * @returns {HRESULT} 
     */
    getBaseURL(ppwchBaseUrl) {
        result := ComCall(15, this, "ushort*", ppwchBaseUrl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwchBaseUrl 
     * @returns {HRESULT} 
     */
    putBaseURL(pwchBaseUrl) {
        pwchBaseUrl := pwchBaseUrl is String ? StrPtr(pwchBaseUrl) : pwchBaseUrl

        result := ComCall(16, this, "ptr", pwchBaseUrl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} ppwchSecureBaseUrl 
     * @returns {HRESULT} 
     */
    getSecureBaseURL(ppwchSecureBaseUrl) {
        result := ComCall(17, this, "ushort*", ppwchSecureBaseUrl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwchSecureBaseUrl 
     * @returns {HRESULT} 
     */
    putSecureBaseURL(pwchSecureBaseUrl) {
        pwchSecureBaseUrl := pwchSecureBaseUrl is String ? StrPtr(pwchSecureBaseUrl) : pwchSecureBaseUrl

        result := ComCall(18, this, "ptr", pwchSecureBaseUrl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} varInput 
     * @returns {HRESULT} 
     */
    parse(varInput) {
        result := ComCall(19, this, "ptr", varInput, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwchUrl 
     * @returns {HRESULT} 
     */
    parseURL(pwchUrl) {
        pwchUrl := pwchUrl is String ? StrPtr(pwchUrl) : pwchUrl

        result := ComCall(20, this, "ptr", pwchUrl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
