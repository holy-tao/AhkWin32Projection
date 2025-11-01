#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IXMLDOMNode.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IXMLDOMElement extends IXMLDOMNode{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXMLDOMElement
     * @type {Guid}
     */
    static IID => Guid("{2933bf86-7b36-11d2-b20e-00c04f983e60}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 43

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_tagName", "getAttribute", "setAttribute", "removeAttribute", "getAttributeNode", "setAttributeNode", "removeAttributeNode", "getElementsByTagName", "normalize"]

    /**
     * 
     * @param {Pointer<BSTR>} tagName 
     * @returns {HRESULT} 
     */
    get_tagName(tagName) {
        result := ComCall(43, this, "ptr", tagName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {Pointer<VARIANT>} value 
     * @returns {HRESULT} 
     */
    getAttribute(name, value) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(44, this, "ptr", name, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {VARIANT} value 
     * @returns {HRESULT} 
     */
    setAttribute(name, value) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(45, this, "ptr", name, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     */
    removeAttribute(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(46, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {Pointer<IXMLDOMAttribute>} attributeNode 
     * @returns {HRESULT} 
     */
    getAttributeNode(name, attributeNode) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(47, this, "ptr", name, "ptr*", attributeNode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXMLDOMAttribute} DOMAttribute 
     * @param {Pointer<IXMLDOMAttribute>} attributeNode 
     * @returns {HRESULT} 
     */
    setAttributeNode(DOMAttribute, attributeNode) {
        result := ComCall(48, this, "ptr", DOMAttribute, "ptr*", attributeNode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXMLDOMAttribute} DOMAttribute 
     * @param {Pointer<IXMLDOMAttribute>} attributeNode 
     * @returns {HRESULT} 
     */
    removeAttributeNode(DOMAttribute, attributeNode) {
        result := ComCall(49, this, "ptr", DOMAttribute, "ptr*", attributeNode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} tagName 
     * @param {Pointer<IXMLDOMNodeList>} resultList 
     * @returns {HRESULT} 
     */
    getElementsByTagName(tagName, resultList) {
        tagName := tagName is String ? BSTR.Alloc(tagName).Value : tagName

        result := ComCall(50, this, "ptr", tagName, "ptr*", resultList, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    normalize() {
        result := ComCall(51, this, "HRESULT")
        return result
    }
}
