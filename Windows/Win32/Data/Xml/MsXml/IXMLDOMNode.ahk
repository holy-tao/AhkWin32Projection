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
     * 
     * @param {Pointer<BSTR>} name 
     * @returns {HRESULT} 
     */
    get_nodeName(name) {
        result := ComCall(7, this, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} value 
     * @returns {HRESULT} 
     */
    get_nodeValue(value) {
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} value 
     * @returns {HRESULT} 
     */
    put_nodeValue(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} type 
     * @returns {HRESULT} 
     */
    get_nodeType(type) {
        result := ComCall(10, this, "int*", type, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXMLDOMNode>} parent 
     * @returns {HRESULT} 
     */
    get_parentNode(parent) {
        result := ComCall(11, this, "ptr", parent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXMLDOMNodeList>} childList 
     * @returns {HRESULT} 
     */
    get_childNodes(childList) {
        result := ComCall(12, this, "ptr", childList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXMLDOMNode>} firstChild 
     * @returns {HRESULT} 
     */
    get_firstChild(firstChild) {
        result := ComCall(13, this, "ptr", firstChild, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXMLDOMNode>} lastChild 
     * @returns {HRESULT} 
     */
    get_lastChild(lastChild) {
        result := ComCall(14, this, "ptr", lastChild, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXMLDOMNode>} previousSibling 
     * @returns {HRESULT} 
     */
    get_previousSibling(previousSibling) {
        result := ComCall(15, this, "ptr", previousSibling, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXMLDOMNode>} nextSibling 
     * @returns {HRESULT} 
     */
    get_nextSibling(nextSibling) {
        result := ComCall(16, this, "ptr", nextSibling, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXMLDOMNamedNodeMap>} attributeMap 
     * @returns {HRESULT} 
     */
    get_attributes(attributeMap) {
        result := ComCall(17, this, "ptr", attributeMap, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXMLDOMNode>} newChild 
     * @param {VARIANT} refChild 
     * @param {Pointer<IXMLDOMNode>} outNewChild 
     * @returns {HRESULT} 
     */
    insertBefore(newChild, refChild, outNewChild) {
        result := ComCall(18, this, "ptr", newChild, "ptr", refChild, "ptr", outNewChild, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXMLDOMNode>} newChild 
     * @param {Pointer<IXMLDOMNode>} oldChild 
     * @param {Pointer<IXMLDOMNode>} outOldChild 
     * @returns {HRESULT} 
     */
    replaceChild(newChild, oldChild, outOldChild) {
        result := ComCall(19, this, "ptr", newChild, "ptr", oldChild, "ptr", outOldChild, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXMLDOMNode>} childNode 
     * @param {Pointer<IXMLDOMNode>} oldChild 
     * @returns {HRESULT} 
     */
    removeChild(childNode, oldChild) {
        result := ComCall(20, this, "ptr", childNode, "ptr", oldChild, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXMLDOMNode>} newChild 
     * @param {Pointer<IXMLDOMNode>} outNewChild 
     * @returns {HRESULT} 
     */
    appendChild(newChild, outNewChild) {
        result := ComCall(21, this, "ptr", newChild, "ptr", outNewChild, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} hasChild 
     * @returns {HRESULT} 
     */
    hasChildNodes(hasChild) {
        result := ComCall(22, this, "ptr", hasChild, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXMLDOMDocument>} XMLDOMDocument 
     * @returns {HRESULT} 
     */
    get_ownerDocument(XMLDOMDocument) {
        result := ComCall(23, this, "ptr", XMLDOMDocument, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} deep 
     * @param {Pointer<IXMLDOMNode>} cloneRoot 
     * @returns {HRESULT} 
     */
    cloneNode(deep, cloneRoot) {
        result := ComCall(24, this, "short", deep, "ptr", cloneRoot, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} nodeType 
     * @returns {HRESULT} 
     */
    get_nodeTypeString(nodeType) {
        result := ComCall(25, this, "ptr", nodeType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} text 
     * @returns {HRESULT} 
     */
    get_text(text) {
        result := ComCall(26, this, "ptr", text, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} text 
     * @returns {HRESULT} 
     */
    put_text(text) {
        text := text is String ? BSTR.Alloc(text).Value : text

        result := ComCall(27, this, "ptr", text, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} isSpecified 
     * @returns {HRESULT} 
     */
    get_specified(isSpecified) {
        result := ComCall(28, this, "ptr", isSpecified, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXMLDOMNode>} definitionNode 
     * @returns {HRESULT} 
     */
    get_definition(definitionNode) {
        result := ComCall(29, this, "ptr", definitionNode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} typedValue 
     * @returns {HRESULT} 
     */
    get_nodeTypedValue(typedValue) {
        result := ComCall(30, this, "ptr", typedValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} typedValue 
     * @returns {HRESULT} 
     */
    put_nodeTypedValue(typedValue) {
        result := ComCall(31, this, "ptr", typedValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} dataTypeName 
     * @returns {HRESULT} 
     */
    get_dataType(dataTypeName) {
        result := ComCall(32, this, "ptr", dataTypeName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} dataTypeName 
     * @returns {HRESULT} 
     */
    put_dataType(dataTypeName) {
        dataTypeName := dataTypeName is String ? BSTR.Alloc(dataTypeName).Value : dataTypeName

        result := ComCall(33, this, "ptr", dataTypeName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} xmlString 
     * @returns {HRESULT} 
     */
    get_xml(xmlString) {
        result := ComCall(34, this, "ptr", xmlString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXMLDOMNode>} stylesheet 
     * @param {Pointer<BSTR>} xmlString 
     * @returns {HRESULT} 
     */
    transformNode(stylesheet, xmlString) {
        result := ComCall(35, this, "ptr", stylesheet, "ptr", xmlString, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(36, this, "ptr", queryString, "ptr", resultList, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(37, this, "ptr", queryString, "ptr", resultNode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} isParsed 
     * @returns {HRESULT} 
     */
    get_parsed(isParsed) {
        result := ComCall(38, this, "ptr", isParsed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} namespaceURI 
     * @returns {HRESULT} 
     */
    get_namespaceURI(namespaceURI) {
        result := ComCall(39, this, "ptr", namespaceURI, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} prefixString 
     * @returns {HRESULT} 
     */
    get_prefix(prefixString) {
        result := ComCall(40, this, "ptr", prefixString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} nameString 
     * @returns {HRESULT} 
     */
    get_baseName(nameString) {
        result := ComCall(41, this, "ptr", nameString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXMLDOMNode>} stylesheet 
     * @param {VARIANT} outputObject 
     * @returns {HRESULT} 
     */
    transformNodeToObject(stylesheet, outputObject) {
        result := ComCall(42, this, "ptr", stylesheet, "ptr", outputObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
