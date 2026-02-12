#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Variant\VARIANT.ahk
#Include .\ISAXEntityResolver.ahk
#Include .\ISAXContentHandler.ahk
#Include .\ISAXDTDHandler.ahk
#Include .\ISAXErrorHandler.ahk
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
     * @returns {VARIANT_BOOL} 
     */
    getFeature(pwchName) {
        pwchName := pwchName is String ? StrPtr(pwchName) : pwchName

        result := ComCall(3, this, "ptr", pwchName, "short*", &pvfValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pvfValue
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
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * getPropertyInfo Method (SQLServerDriver)
     * @remarks
     * This getPropertyInfo method is specified by the getPropertyInfo method in the java.sql.Driver interface.
     * @param {PWSTR} pwchName 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/connect/jdbc/reference/getpropertyinfo-method-sqlserverdriver
     */
    getProperty(pwchName) {
        pwchName := pwchName is String ? StrPtr(pwchName) : pwchName

        pvarValue := VARIANT()
        result := ComCall(5, this, "ptr", pwchName, "ptr", pvarValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pvarValue
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
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ISAXEntityResolver} 
     */
    getEntityResolver() {
        result := ComCall(7, this, "ptr*", &ppResolver := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISAXEntityResolver(ppResolver)
    }

    /**
     * 
     * @param {ISAXEntityResolver} pResolver 
     * @returns {HRESULT} 
     */
    putEntityResolver(pResolver) {
        result := ComCall(8, this, "ptr", pResolver, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ISAXContentHandler} 
     */
    getContentHandler() {
        result := ComCall(9, this, "ptr*", &ppHandler := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISAXContentHandler(ppHandler)
    }

    /**
     * 
     * @param {ISAXContentHandler} pHandler 
     * @returns {HRESULT} 
     */
    putContentHandler(pHandler) {
        result := ComCall(10, this, "ptr", pHandler, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ISAXDTDHandler} 
     */
    getDTDHandler() {
        result := ComCall(11, this, "ptr*", &ppHandler := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISAXDTDHandler(ppHandler)
    }

    /**
     * 
     * @param {ISAXDTDHandler} pHandler 
     * @returns {HRESULT} 
     */
    putDTDHandler(pHandler) {
        result := ComCall(12, this, "ptr", pHandler, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ISAXErrorHandler} 
     */
    getErrorHandler() {
        result := ComCall(13, this, "ptr*", &ppHandler := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISAXErrorHandler(ppHandler)
    }

    /**
     * 
     * @param {ISAXErrorHandler} pHandler 
     * @returns {HRESULT} 
     */
    putErrorHandler(pHandler) {
        result := ComCall(14, this, "ptr", pHandler, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Pointer<Integer>} 
     */
    getBaseURL() {
        result := ComCall(15, this, "ptr*", &ppwchBaseUrl := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppwchBaseUrl
    }

    /**
     * 
     * @param {PWSTR} pwchBaseUrl 
     * @returns {HRESULT} 
     */
    putBaseURL(pwchBaseUrl) {
        pwchBaseUrl := pwchBaseUrl is String ? StrPtr(pwchBaseUrl) : pwchBaseUrl

        result := ComCall(16, this, "ptr", pwchBaseUrl, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Pointer<Integer>} 
     */
    getSecureBaseURL() {
        result := ComCall(17, this, "ptr*", &ppwchSecureBaseUrl := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppwchSecureBaseUrl
    }

    /**
     * 
     * @param {PWSTR} pwchSecureBaseUrl 
     * @returns {HRESULT} 
     */
    putSecureBaseURL(pwchSecureBaseUrl) {
        pwchSecureBaseUrl := pwchSecureBaseUrl is String ? StrPtr(pwchSecureBaseUrl) : pwchSecureBaseUrl

        result := ComCall(18, this, "ptr", pwchSecureBaseUrl, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {VARIANT} varInput 
     * @returns {HRESULT} 
     */
    parse(varInput) {
        result := ComCall(19, this, "ptr", varInput, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
