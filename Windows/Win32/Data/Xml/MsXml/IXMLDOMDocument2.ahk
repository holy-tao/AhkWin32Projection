#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IXMLDOMSchemaCollection.ahk
#Include ..\..\..\System\Variant\VARIANT.ahk
#Include .\IXMLDOMParseError.ahk
#Include .\IXMLDOMDocument.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IXMLDOMDocument2 extends IXMLDOMDocument{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXMLDOMDocument2
     * @type {Guid}
     */
    static IID => Guid("{2933bf95-7b36-11d2-b20e-00c04f983e60}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 76

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_namespaces", "get_schemas", "putref_schemas", "validate", "setProperty", "getProperty"]

    /**
     * @type {IXMLDOMSchemaCollection} 
     */
    namespaces {
        get => this.get_namespaces()
    }

    /**
     * @type {VARIANT} 
     */
    schemas {
        get => this.get_schemas()
    }

    /**
     * 
     * @returns {IXMLDOMSchemaCollection} 
     */
    get_namespaces() {
        result := ComCall(76, this, "ptr*", &namespaceCollection := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXMLDOMSchemaCollection(namespaceCollection)
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_schemas() {
        otherCollection := VARIANT()
        result := ComCall(77, this, "ptr", otherCollection, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return otherCollection
    }

    /**
     * 
     * @param {VARIANT} otherCollection 
     * @returns {HRESULT} 
     */
    putref_schemas(otherCollection) {
        result := ComCall(78, this, "ptr", otherCollection, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IXMLDOMParseError} 
     */
    validate() {
        result := ComCall(79, this, "ptr*", &errorObj := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXMLDOMParseError(errorObj)
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {VARIANT} value 
     * @returns {HRESULT} 
     */
    setProperty(name, value) {
        if(name is String) {
            pin := BSTR.Alloc(name)
            name := pin.Value
        }

        result := ComCall(80, this, "ptr", name, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * getPropertyInfo Method (SQLServerDriver)
     * @remarks
     * This getPropertyInfo method is specified by the getPropertyInfo method in the java.sql.Driver interface.
     * @param {BSTR} name 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/connect/jdbc/reference/getpropertyinfo-method-sqlserverdriver
     */
    getProperty(name) {
        if(name is String) {
            pin := BSTR.Alloc(name)
            name := pin.Value
        }

        value := VARIANT()
        result := ComCall(81, this, "ptr", name, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
