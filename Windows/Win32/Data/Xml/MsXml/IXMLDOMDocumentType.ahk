#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IXMLDOMNamedNodeMap.ahk
#Include .\IXMLDOMNode.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IXMLDOMDocumentType extends IXMLDOMNode{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXMLDOMDocumentType
     * @type {Guid}
     */
    static IID => Guid("{2933bf8b-7b36-11d2-b20e-00c04f983e60}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 43

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_name", "get_entities", "get_notations"]

    /**
     * @type {BSTR} 
     */
    name {
        get => this.get_name()
    }

    /**
     * @type {IXMLDOMNamedNodeMap} 
     */
    entities {
        get => this.get_entities()
    }

    /**
     * @type {IXMLDOMNamedNodeMap} 
     */
    notations {
        get => this.get_notations()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_name() {
        rootName := BSTR()
        result := ComCall(43, this, "ptr", rootName, "HRESULT")
        return rootName
    }

    /**
     * 
     * @returns {IXMLDOMNamedNodeMap} 
     */
    get_entities() {
        result := ComCall(44, this, "ptr*", &entityMap := 0, "HRESULT")
        return IXMLDOMNamedNodeMap(entityMap)
    }

    /**
     * 
     * @returns {IXMLDOMNamedNodeMap} 
     */
    get_notations() {
        result := ComCall(45, this, "ptr*", &notationMap := 0, "HRESULT")
        return IXMLDOMNamedNodeMap(notationMap)
    }
}
