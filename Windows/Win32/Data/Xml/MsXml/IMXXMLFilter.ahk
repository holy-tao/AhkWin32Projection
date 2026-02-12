#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Variant\VARIANT.ahk
#Include ..\..\..\System\Com\IUnknown.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IMXXMLFilter extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMXXMLFilter
     * @type {Guid}
     */
    static IID => Guid("{c90352f7-643c-4fbc-bb23-e996eb2d51fd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["getFeature", "putFeature", "getProperty", "putProperty", "get_entityResolver", "putref_entityResolver", "get_contentHandler", "putref_contentHandler", "get_dtdHandler", "putref_dtdHandler", "get_errorHandler", "putref_errorHandler"]

    /**
     * @type {IUnknown} 
     */
    entityResolver {
        get => this.get_entityResolver()
    }

    /**
     * @type {IUnknown} 
     */
    contentHandler {
        get => this.get_contentHandler()
    }

    /**
     * @type {IUnknown} 
     */
    dtdHandler {
        get => this.get_dtdHandler()
    }

    /**
     * @type {IUnknown} 
     */
    errorHandler {
        get => this.get_errorHandler()
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
     * @returns {IUnknown} 
     */
    get_entityResolver() {
        result := ComCall(11, this, "ptr*", &oResolver := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(oResolver)
    }

    /**
     * 
     * @param {IUnknown} oResolver 
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
     * @returns {IUnknown} 
     */
    get_contentHandler() {
        result := ComCall(13, this, "ptr*", &oHandler := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(oHandler)
    }

    /**
     * 
     * @param {IUnknown} oHandler 
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
     * @returns {IUnknown} 
     */
    get_dtdHandler() {
        result := ComCall(15, this, "ptr*", &oHandler := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(oHandler)
    }

    /**
     * 
     * @param {IUnknown} oHandler 
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
     * @returns {IUnknown} 
     */
    get_errorHandler() {
        result := ComCall(17, this, "ptr*", &oHandler := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(oHandler)
    }

    /**
     * 
     * @param {IUnknown} oHandler 
     * @returns {HRESULT} 
     */
    putref_errorHandler(oHandler) {
        result := ComCall(18, this, "ptr", oHandler, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
