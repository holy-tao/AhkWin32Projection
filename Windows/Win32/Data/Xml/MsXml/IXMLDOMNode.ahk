#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Variant\VARIANT.ahk
#Include .\IXMLDOMNode.ahk
#Include .\IXMLDOMNodeList.ahk
#Include .\IXMLDOMNamedNodeMap.ahk
#Include .\IXMLDOMDocument.ahk
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
     * @type {BSTR} 
     */
    nodeName {
        get => this.get_nodeName()
    }

    /**
     * @type {VARIANT} 
     */
    nodeValue {
        get => this.get_nodeValue()
        set => this.put_nodeValue(value)
    }

    /**
     * @type {Integer} 
     */
    nodeType {
        get => this.get_nodeType()
    }

    /**
     * @type {IXMLDOMNode} 
     */
    parentNode {
        get => this.get_parentNode()
    }

    /**
     * @type {IXMLDOMNodeList} 
     */
    childNodes {
        get => this.get_childNodes()
    }

    /**
     * @type {IXMLDOMNode} 
     */
    firstChild {
        get => this.get_firstChild()
    }

    /**
     * @type {IXMLDOMNode} 
     */
    lastChild {
        get => this.get_lastChild()
    }

    /**
     * @type {IXMLDOMNode} 
     */
    previousSibling {
        get => this.get_previousSibling()
    }

    /**
     * @type {IXMLDOMNode} 
     */
    nextSibling {
        get => this.get_nextSibling()
    }

    /**
     * @type {IXMLDOMNamedNodeMap} 
     */
    attributes {
        get => this.get_attributes()
    }

    /**
     * @type {IXMLDOMDocument} 
     */
    ownerDocument {
        get => this.get_ownerDocument()
    }

    /**
     * @type {BSTR} 
     */
    nodeTypeString {
        get => this.get_nodeTypeString()
    }

    /**
     * @type {BSTR} 
     */
    text {
        get => this.get_text()
        set => this.put_text(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    specified {
        get => this.get_specified()
    }

    /**
     * @type {IXMLDOMNode} 
     */
    definition {
        get => this.get_definition()
    }

    /**
     * @type {VARIANT} 
     */
    nodeTypedValue {
        get => this.get_nodeTypedValue()
        set => this.put_nodeTypedValue(value)
    }

    /**
     * @type {VARIANT} 
     */
    dataType {
        get => this.get_dataType()
        set => this.put_dataType(value)
    }

    /**
     * @type {BSTR} 
     */
    xml {
        get => this.get_xml()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    parsed {
        get => this.get_parsed()
    }

    /**
     * @type {BSTR} 
     */
    namespaceURI {
        get => this.get_namespaceURI()
    }

    /**
     * @type {BSTR} 
     */
    prefix {
        get => this.get_prefix()
    }

    /**
     * @type {BSTR} 
     */
    baseName {
        get => this.get_baseName()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_nodeName() {
        name := BSTR()
        result := ComCall(7, this, "ptr", name, "HRESULT")
        return name
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_nodeValue() {
        value := VARIANT()
        result := ComCall(8, this, "ptr", value, "HRESULT")
        return value
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
     * @returns {Integer} 
     */
    get_nodeType() {
        result := ComCall(10, this, "int*", &type := 0, "HRESULT")
        return type
    }

    /**
     * 
     * @returns {IXMLDOMNode} 
     */
    get_parentNode() {
        result := ComCall(11, this, "ptr*", &parent := 0, "HRESULT")
        return IXMLDOMNode(parent)
    }

    /**
     * 
     * @returns {IXMLDOMNodeList} 
     */
    get_childNodes() {
        result := ComCall(12, this, "ptr*", &childList := 0, "HRESULT")
        return IXMLDOMNodeList(childList)
    }

    /**
     * 
     * @returns {IXMLDOMNode} 
     */
    get_firstChild() {
        result := ComCall(13, this, "ptr*", &firstChild := 0, "HRESULT")
        return IXMLDOMNode(firstChild)
    }

    /**
     * 
     * @returns {IXMLDOMNode} 
     */
    get_lastChild() {
        result := ComCall(14, this, "ptr*", &lastChild := 0, "HRESULT")
        return IXMLDOMNode(lastChild)
    }

    /**
     * 
     * @returns {IXMLDOMNode} 
     */
    get_previousSibling() {
        result := ComCall(15, this, "ptr*", &previousSibling := 0, "HRESULT")
        return IXMLDOMNode(previousSibling)
    }

    /**
     * 
     * @returns {IXMLDOMNode} 
     */
    get_nextSibling() {
        result := ComCall(16, this, "ptr*", &nextSibling := 0, "HRESULT")
        return IXMLDOMNode(nextSibling)
    }

    /**
     * 
     * @returns {IXMLDOMNamedNodeMap} 
     */
    get_attributes() {
        result := ComCall(17, this, "ptr*", &attributeMap := 0, "HRESULT")
        return IXMLDOMNamedNodeMap(attributeMap)
    }

    /**
     * 
     * @param {IXMLDOMNode} newChild 
     * @param {VARIANT} refChild 
     * @returns {IXMLDOMNode} 
     */
    insertBefore(newChild, refChild) {
        result := ComCall(18, this, "ptr", newChild, "ptr", refChild, "ptr*", &outNewChild := 0, "HRESULT")
        return IXMLDOMNode(outNewChild)
    }

    /**
     * 
     * @param {IXMLDOMNode} newChild 
     * @param {IXMLDOMNode} oldChild 
     * @returns {IXMLDOMNode} 
     */
    replaceChild(newChild, oldChild) {
        result := ComCall(19, this, "ptr", newChild, "ptr", oldChild, "ptr*", &outOldChild := 0, "HRESULT")
        return IXMLDOMNode(outOldChild)
    }

    /**
     * 
     * @param {IXMLDOMNode} childNode 
     * @returns {IXMLDOMNode} 
     */
    removeChild(childNode) {
        result := ComCall(20, this, "ptr", childNode, "ptr*", &oldChild := 0, "HRESULT")
        return IXMLDOMNode(oldChild)
    }

    /**
     * 
     * @param {IXMLDOMNode} newChild 
     * @returns {IXMLDOMNode} 
     */
    appendChild(newChild) {
        result := ComCall(21, this, "ptr", newChild, "ptr*", &outNewChild := 0, "HRESULT")
        return IXMLDOMNode(outNewChild)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    hasChildNodes() {
        result := ComCall(22, this, "short*", &hasChild := 0, "HRESULT")
        return hasChild
    }

    /**
     * 
     * @returns {IXMLDOMDocument} 
     */
    get_ownerDocument() {
        result := ComCall(23, this, "ptr*", &XMLDOMDocument := 0, "HRESULT")
        return IXMLDOMDocument(XMLDOMDocument)
    }

    /**
     * 
     * @param {VARIANT_BOOL} deep 
     * @returns {IXMLDOMNode} 
     */
    cloneNode(deep) {
        result := ComCall(24, this, "short", deep, "ptr*", &cloneRoot := 0, "HRESULT")
        return IXMLDOMNode(cloneRoot)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_nodeTypeString() {
        nodeType := BSTR()
        result := ComCall(25, this, "ptr", nodeType, "HRESULT")
        return nodeType
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_text() {
        text := BSTR()
        result := ComCall(26, this, "ptr", text, "HRESULT")
        return text
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
     * @returns {VARIANT_BOOL} 
     */
    get_specified() {
        result := ComCall(28, this, "short*", &isSpecified := 0, "HRESULT")
        return isSpecified
    }

    /**
     * 
     * @returns {IXMLDOMNode} 
     */
    get_definition() {
        result := ComCall(29, this, "ptr*", &definitionNode := 0, "HRESULT")
        return IXMLDOMNode(definitionNode)
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_nodeTypedValue() {
        typedValue := VARIANT()
        result := ComCall(30, this, "ptr", typedValue, "HRESULT")
        return typedValue
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
     * @returns {VARIANT} 
     */
    get_dataType() {
        dataTypeName := VARIANT()
        result := ComCall(32, this, "ptr", dataTypeName, "HRESULT")
        return dataTypeName
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
     * @returns {BSTR} 
     */
    get_xml() {
        xmlString := BSTR()
        result := ComCall(34, this, "ptr", xmlString, "HRESULT")
        return xmlString
    }

    /**
     * 
     * @param {IXMLDOMNode} stylesheet 
     * @returns {BSTR} 
     */
    transformNode(stylesheet) {
        xmlString := BSTR()
        result := ComCall(35, this, "ptr", stylesheet, "ptr", xmlString, "HRESULT")
        return xmlString
    }

    /**
     * 
     * @param {BSTR} queryString 
     * @returns {IXMLDOMNodeList} 
     */
    selectNodes(queryString) {
        queryString := queryString is String ? BSTR.Alloc(queryString).Value : queryString

        result := ComCall(36, this, "ptr", queryString, "ptr*", &resultList := 0, "HRESULT")
        return IXMLDOMNodeList(resultList)
    }

    /**
     * 
     * @param {BSTR} queryString 
     * @returns {IXMLDOMNode} 
     */
    selectSingleNode(queryString) {
        queryString := queryString is String ? BSTR.Alloc(queryString).Value : queryString

        result := ComCall(37, this, "ptr", queryString, "ptr*", &resultNode := 0, "HRESULT")
        return IXMLDOMNode(resultNode)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_parsed() {
        result := ComCall(38, this, "short*", &isParsed := 0, "HRESULT")
        return isParsed
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_namespaceURI() {
        namespaceURI := BSTR()
        result := ComCall(39, this, "ptr", namespaceURI, "HRESULT")
        return namespaceURI
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_prefix() {
        prefixString := BSTR()
        result := ComCall(40, this, "ptr", prefixString, "HRESULT")
        return prefixString
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_baseName() {
        nameString := BSTR()
        result := ComCall(41, this, "ptr", nameString, "HRESULT")
        return nameString
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
