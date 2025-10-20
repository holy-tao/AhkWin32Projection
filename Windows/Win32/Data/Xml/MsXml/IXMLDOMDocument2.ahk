#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<IXMLDOMSchemaCollection>} namespaceCollection 
     * @returns {HRESULT} 
     */
    get_namespaces(namespaceCollection) {
        result := ComCall(76, this, "ptr*", namespaceCollection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} otherCollection 
     * @returns {HRESULT} 
     */
    get_schemas(otherCollection) {
        result := ComCall(77, this, "ptr", otherCollection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} otherCollection 
     * @returns {HRESULT} 
     */
    putref_schemas(otherCollection) {
        result := ComCall(78, this, "ptr", otherCollection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXMLDOMParseError>} errorObj 
     * @returns {HRESULT} 
     */
    validate(errorObj) {
        result := ComCall(79, this, "ptr*", errorObj, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {VARIANT} value 
     * @returns {HRESULT} 
     */
    setProperty(name, value) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(80, this, "ptr", name, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {Pointer<VARIANT>} value 
     * @returns {HRESULT} 
     */
    getProperty(name, value) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(81, this, "ptr", name, "ptr", value, "HRESULT")
        return result
    }
}
