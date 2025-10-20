#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IXMLDOMNode extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXMLDOMNode
     * @type {Guid}
     */
    static IID => Guid("{2933bf80-7b36-11d2-b20e-00c04f983e60}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_nodeName", "get_nodeValue", "put_nodeValue", "get_nodeType", "get_parentNode", "get_childNodes", "get_firstChild", "get_lastChild", "get_previousSibling", "get_nextSibling", "get_attributes", "insertBefore", "replaceChild", "removeChild", "appendChild", "hasChildNodes", "get_ownerDocument", "cloneNode", "get_nodeTypeString", "get_text", "put_text", "get_specified", "get_definition", "get_nodeTypedValue", "put_nodeTypedValue", "get_dataType", "put_dataType", "get_xml", "transformNode", "selectNodes", "selectSingleNode", "get_parsed", "get_namespaceURI", "get_prefix", "get_baseName", "transformNodeToObject"]

    /**
     * 
     * @param {Pointer<BSTR>} name 
     * @returns {HRESULT} 
     */
    get_nodeName(name) {
        result := ComCall(7, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} value 
     * @returns {HRESULT} 
     */
    get_nodeValue(value) {
        result := ComCall(8, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} value 
     * @returns {HRESULT} 
     */
    put_nodeValue(value) {
        result := ComCall(9, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} type 
     * @returns {HRESULT} 
     */
    get_nodeType(type) {
        result := ComCall(10, this, "int*", type, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXMLDOMNode>} parent 
     * @returns {HRESULT} 
     */
    get_parentNode(parent) {
        result := ComCall(11, this, "ptr*", parent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXMLDOMNodeList>} childList 
     * @returns {HRESULT} 
     */
    get_childNodes(childList) {
        result := ComCall(12, this, "ptr*", childList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXMLDOMNode>} firstChild 
     * @returns {HRESULT} 
     */
    get_firstChild(firstChild) {
        result := ComCall(13, this, "ptr*", firstChild, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXMLDOMNode>} lastChild 
     * @returns {HRESULT} 
     */
    get_lastChild(lastChild) {
        result := ComCall(14, this, "ptr*", lastChild, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXMLDOMNode>} previousSibling 
     * @returns {HRESULT} 
     */
    get_previousSibling(previousSibling) {
        result := ComCall(15, this, "ptr*", previousSibling, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXMLDOMNode>} nextSibling 
     * @returns {HRESULT} 
     */
    get_nextSibling(nextSibling) {
        result := ComCall(16, this, "ptr*", nextSibling, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXMLDOMNamedNodeMap>} attributeMap 
     * @returns {HRESULT} 
     */
    get_attributes(attributeMap) {
        result := ComCall(17, this, "ptr*", attributeMap, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXMLDOMNode} newChild 
     * @param {VARIANT} refChild 
     * @param {Pointer<IXMLDOMNode>} outNewChild 
     * @returns {HRESULT} 
     */
    insertBefore(newChild, refChild, outNewChild) {
        result := ComCall(18, this, "ptr", newChild, "ptr", refChild, "ptr*", outNewChild, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXMLDOMNode} newChild 
     * @param {IXMLDOMNode} oldChild 
     * @param {Pointer<IXMLDOMNode>} outOldChild 
     * @returns {HRESULT} 
     */
    replaceChild(newChild, oldChild, outOldChild) {
        result := ComCall(19, this, "ptr", newChild, "ptr", oldChild, "ptr*", outOldChild, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXMLDOMNode} childNode 
     * @param {Pointer<IXMLDOMNode>} oldChild 
     * @returns {HRESULT} 
     */
    removeChild(childNode, oldChild) {
        result := ComCall(20, this, "ptr", childNode, "ptr*", oldChild, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXMLDOMNode} newChild 
     * @param {Pointer<IXMLDOMNode>} outNewChild 
     * @returns {HRESULT} 
     */
    appendChild(newChild, outNewChild) {
        result := ComCall(21, this, "ptr", newChild, "ptr*", outNewChild, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} hasChild 
     * @returns {HRESULT} 
     */
    hasChildNodes(hasChild) {
        result := ComCall(22, this, "ptr", hasChild, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXMLDOMDocument>} XMLDOMDocument 
     * @returns {HRESULT} 
     */
    get_ownerDocument(XMLDOMDocument) {
        result := ComCall(23, this, "ptr*", XMLDOMDocument, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} deep 
     * @param {Pointer<IXMLDOMNode>} cloneRoot 
     * @returns {HRESULT} 
     */
    cloneNode(deep, cloneRoot) {
        result := ComCall(24, this, "short", deep, "ptr*", cloneRoot, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} nodeType 
     * @returns {HRESULT} 
     */
    get_nodeTypeString(nodeType) {
        result := ComCall(25, this, "ptr", nodeType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} text 
     * @returns {HRESULT} 
     */
    get_text(text) {
        result := ComCall(26, this, "ptr", text, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} text 
     * @returns {HRESULT} 
     */
    put_text(text) {
        text := text is String ? BSTR.Alloc(text).Value : text

        result := ComCall(27, this, "ptr", text, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} isSpecified 
     * @returns {HRESULT} 
     */
    get_specified(isSpecified) {
        result := ComCall(28, this, "ptr", isSpecified, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXMLDOMNode>} definitionNode 
     * @returns {HRESULT} 
     */
    get_definition(definitionNode) {
        result := ComCall(29, this, "ptr*", definitionNode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} typedValue 
     * @returns {HRESULT} 
     */
    get_nodeTypedValue(typedValue) {
        result := ComCall(30, this, "ptr", typedValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} typedValue 
     * @returns {HRESULT} 
     */
    put_nodeTypedValue(typedValue) {
        result := ComCall(31, this, "ptr", typedValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} dataTypeName 
     * @returns {HRESULT} 
     */
    get_dataType(dataTypeName) {
        result := ComCall(32, this, "ptr", dataTypeName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} dataTypeName 
     * @returns {HRESULT} 
     */
    put_dataType(dataTypeName) {
        dataTypeName := dataTypeName is String ? BSTR.Alloc(dataTypeName).Value : dataTypeName

        result := ComCall(33, this, "ptr", dataTypeName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} xmlString 
     * @returns {HRESULT} 
     */
    get_xml(xmlString) {
        result := ComCall(34, this, "ptr", xmlString, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXMLDOMNode} stylesheet 
     * @param {Pointer<BSTR>} xmlString 
     * @returns {HRESULT} 
     */
    transformNode(stylesheet, xmlString) {
        result := ComCall(35, this, "ptr", stylesheet, "ptr", xmlString, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} queryString 
     * @param {Pointer<IXMLDOMNodeList>} resultList 
     * @returns {HRESULT} 
     */
    selectNodes(queryString, resultList) {
        queryString := queryString is String ? BSTR.Alloc(queryString).Value : queryString

        result := ComCall(36, this, "ptr", queryString, "ptr*", resultList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} queryString 
     * @param {Pointer<IXMLDOMNode>} resultNode 
     * @returns {HRESULT} 
     */
    selectSingleNode(queryString, resultNode) {
        queryString := queryString is String ? BSTR.Alloc(queryString).Value : queryString

        result := ComCall(37, this, "ptr", queryString, "ptr*", resultNode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} isParsed 
     * @returns {HRESULT} 
     */
    get_parsed(isParsed) {
        result := ComCall(38, this, "ptr", isParsed, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} namespaceURI 
     * @returns {HRESULT} 
     */
    get_namespaceURI(namespaceURI) {
        result := ComCall(39, this, "ptr", namespaceURI, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} prefixString 
     * @returns {HRESULT} 
     */
    get_prefix(prefixString) {
        result := ComCall(40, this, "ptr", prefixString, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} nameString 
     * @returns {HRESULT} 
     */
    get_baseName(nameString) {
        result := ComCall(41, this, "ptr", nameString, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXMLDOMNode} stylesheet 
     * @param {VARIANT} outputObject 
     * @returns {HRESULT} 
     */
    transformNodeToObject(stylesheet, outputObject) {
        result := ComCall(42, this, "ptr", stylesheet, "ptr", outputObject, "HRESULT")
        return result
    }
}
