#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Variant\VARIANT.ahk
#Include .\IVBSAXEntityResolver.ahk
#Include .\IVBSAXContentHandler.ahk
#Include .\IVBSAXDTDHandler.ahk
#Include .\IVBSAXErrorHandler.ahk
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
     * @type {IVBSAXEntityResolver} 
     */
    entityResolver {
        get => this.get_entityResolver()
    }

    /**
     * @type {IVBSAXContentHandler} 
     */
    contentHandler {
        get => this.get_contentHandler()
    }

    /**
     * @type {IVBSAXDTDHandler} 
     */
    dtdHandler {
        get => this.get_dtdHandler()
    }

    /**
     * @type {IVBSAXErrorHandler} 
     */
    errorHandler {
        get => this.get_errorHandler()
    }

    /**
     * @type {BSTR} 
     */
    baseURL {
        get => this.get_baseURL()
        set => this.put_baseURL(value)
    }

    /**
     * @type {BSTR} 
     */
    secureBaseURL {
        get => this.get_secureBaseURL()
        set => this.put_secureBaseURL(value)
    }

    /**
     * 
     * @param {BSTR} strName 
     * @returns {VARIANT_BOOL} 
     */
    getFeature(strName) {
        if(strName is String) {
            pin := BSTR.Alloc(strName)
            strName := pin.Value
        }

        result := ComCall(7, this, "ptr", strName, "short*", &fValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return fValue
    }

    /**
     * 
     * @param {BSTR} strName 
     * @param {VARIANT_BOOL} fValue 
     * @returns {HRESULT} 
     */
    putFeature(strName, fValue) {
        if(strName is String) {
            pin := BSTR.Alloc(strName)
            strName := pin.Value
        }

        result := ComCall(8, this, "ptr", strName, "short", fValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * getPropertyInfo Method (SQLServerDriver)
     * @remarks
     * This getPropertyInfo method is specified by the getPropertyInfo method in the java.sql.Driver interface.
     * @param {BSTR} strName 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/connect/jdbc/reference/getpropertyinfo-method-sqlserverdriver
     */
    getProperty(strName) {
        if(strName is String) {
            pin := BSTR.Alloc(strName)
            strName := pin.Value
        }

        varValue := VARIANT()
        result := ComCall(9, this, "ptr", strName, "ptr", varValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return varValue
    }

    /**
     * 
     * @param {BSTR} strName 
     * @param {VARIANT} varValue 
     * @returns {HRESULT} 
     */
    putProperty(strName, varValue) {
        if(strName is String) {
            pin := BSTR.Alloc(strName)
            strName := pin.Value
        }

        result := ComCall(10, this, "ptr", strName, "ptr", varValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVBSAXEntityResolver} 
     */
    get_entityResolver() {
        result := ComCall(11, this, "ptr*", &oResolver := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVBSAXEntityResolver(oResolver)
    }

    /**
     * 
     * @param {IVBSAXEntityResolver} oResolver 
     * @returns {HRESULT} 
     */
    putref_entityResolver(oResolver) {
        result := ComCall(12, this, "ptr", oResolver, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVBSAXContentHandler} 
     */
    get_contentHandler() {
        result := ComCall(13, this, "ptr*", &oHandler := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVBSAXContentHandler(oHandler)
    }

    /**
     * 
     * @param {IVBSAXContentHandler} oHandler 
     * @returns {HRESULT} 
     */
    putref_contentHandler(oHandler) {
        result := ComCall(14, this, "ptr", oHandler, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVBSAXDTDHandler} 
     */
    get_dtdHandler() {
        result := ComCall(15, this, "ptr*", &oHandler := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVBSAXDTDHandler(oHandler)
    }

    /**
     * 
     * @param {IVBSAXDTDHandler} oHandler 
     * @returns {HRESULT} 
     */
    putref_dtdHandler(oHandler) {
        result := ComCall(16, this, "ptr", oHandler, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVBSAXErrorHandler} 
     */
    get_errorHandler() {
        result := ComCall(17, this, "ptr*", &oHandler := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVBSAXErrorHandler(oHandler)
    }

    /**
     * 
     * @param {IVBSAXErrorHandler} oHandler 
     * @returns {HRESULT} 
     */
    putref_errorHandler(oHandler) {
        result := ComCall(18, this, "ptr", oHandler, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_baseURL() {
        strBaseURL := BSTR()
        result := ComCall(19, this, "ptr", strBaseURL, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return strBaseURL
    }

    /**
     * 
     * @param {BSTR} strBaseURL 
     * @returns {HRESULT} 
     */
    put_baseURL(strBaseURL) {
        if(strBaseURL is String) {
            pin := BSTR.Alloc(strBaseURL)
            strBaseURL := pin.Value
        }

        result := ComCall(20, this, "ptr", strBaseURL, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_secureBaseURL() {
        strSecureBaseURL := BSTR()
        result := ComCall(21, this, "ptr", strSecureBaseURL, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return strSecureBaseURL
    }

    /**
     * 
     * @param {BSTR} strSecureBaseURL 
     * @returns {HRESULT} 
     */
    put_secureBaseURL(strSecureBaseURL) {
        if(strSecureBaseURL is String) {
            pin := BSTR.Alloc(strSecureBaseURL)
            strSecureBaseURL := pin.Value
        }

        result := ComCall(22, this, "ptr", strSecureBaseURL, "int")
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
        result := ComCall(23, this, "ptr", varInput, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} strURL 
     * @returns {HRESULT} 
     */
    parseURL(strURL) {
        if(strURL is String) {
            pin := BSTR.Alloc(strURL)
            strURL := pin.Value
        }

        result := ComCall(24, this, "ptr", strURL, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
