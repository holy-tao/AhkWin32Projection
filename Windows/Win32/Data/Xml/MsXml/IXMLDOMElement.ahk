#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Variant\VARIANT.ahk
#Include .\IXMLDOMAttribute.ahk
#Include .\IXMLDOMNodeList.ahk
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
     * @returns {BSTR} 
     */
    get_tagName() {
        tagName := BSTR()
        result := ComCall(43, this, "ptr", tagName, "HRESULT")
        return tagName
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {VARIANT} 
     */
    getAttribute(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        value := VARIANT()
        result := ComCall(44, this, "ptr", name, "ptr", value, "HRESULT")
        return value
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
     * @returns {IXMLDOMAttribute} 
     */
    getAttributeNode(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(47, this, "ptr", name, "ptr*", &attributeNode := 0, "HRESULT")
        return IXMLDOMAttribute(attributeNode)
    }

    /**
     * 
     * @param {IXMLDOMAttribute} DOMAttribute 
     * @returns {IXMLDOMAttribute} 
     */
    setAttributeNode(DOMAttribute) {
        result := ComCall(48, this, "ptr", DOMAttribute, "ptr*", &attributeNode := 0, "HRESULT")
        return IXMLDOMAttribute(attributeNode)
    }

    /**
     * 
     * @param {IXMLDOMAttribute} DOMAttribute 
     * @returns {IXMLDOMAttribute} 
     */
    removeAttributeNode(DOMAttribute) {
        result := ComCall(49, this, "ptr", DOMAttribute, "ptr*", &attributeNode := 0, "HRESULT")
        return IXMLDOMAttribute(attributeNode)
    }

    /**
     * 
     * @param {BSTR} tagName 
     * @returns {IXMLDOMNodeList} 
     */
    getElementsByTagName(tagName) {
        tagName := tagName is String ? BSTR.Alloc(tagName).Value : tagName

        result := ComCall(50, this, "ptr", tagName, "ptr*", &resultList := 0, "HRESULT")
        return IXMLDOMNodeList(resultList)
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
