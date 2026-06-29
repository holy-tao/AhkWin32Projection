#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IXMLDOMNodeList.ahk" { IXMLDOMNodeList }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import ".\IXMLDOMNamedNodeMap.ahk" { IXMLDOMNamedNodeMap }
#Import ".\IXMLDOMDocument.ahk" { IXMLDOMDocument }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\DOMNodeType.ahk" { DOMNodeType }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct IXMLDOMNode extends IDispatch {
    /**
     * The interface identifier for IXMLDOMNode
     * @type {Guid}
     */
    static IID := Guid("{2933bf80-7b36-11d2-b20e-00c04f983e60}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXMLDOMNode interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_nodeName          : IntPtr
        get_nodeValue         : IntPtr
        put_nodeValue         : IntPtr
        get_nodeType          : IntPtr
        get_parentNode        : IntPtr
        get_childNodes        : IntPtr
        get_firstChild        : IntPtr
        get_lastChild         : IntPtr
        get_previousSibling   : IntPtr
        get_nextSibling       : IntPtr
        get_attributes        : IntPtr
        insertBefore          : IntPtr
        replaceChild          : IntPtr
        removeChild           : IntPtr
        appendChild           : IntPtr
        hasChildNodes         : IntPtr
        get_ownerDocument     : IntPtr
        cloneNode             : IntPtr
        get_nodeTypeString    : IntPtr
        get_text              : IntPtr
        put_text              : IntPtr
        get_specified         : IntPtr
        get_definition        : IntPtr
        get_nodeTypedValue    : IntPtr
        put_nodeTypedValue    : IntPtr
        get_dataType          : IntPtr
        put_dataType          : IntPtr
        get_xml               : IntPtr
        transformNode         : IntPtr
        selectNodes           : IntPtr
        selectSingleNode      : IntPtr
        get_parsed            : IntPtr
        get_namespaceURI      : IntPtr
        get_prefix            : IntPtr
        get_baseName          : IntPtr
        transformNodeToObject : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXMLDOMNode.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @type {DOMNodeType} 
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
        name := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, name, "HRESULT")
        return name
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_nodeValue() {
        value := VARIANT()
        result := ComCall(8, this, VARIANT.Ptr, value, "HRESULT")
        return value
    }

    /**
     * 
     * @param {VARIANT} value 
     * @returns {HRESULT} 
     */
    put_nodeValue(value) {
        result := ComCall(9, this, VARIANT, value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {DOMNodeType} 
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
        result := ComCall(18, this, "ptr", newChild, VARIANT, refChild, "ptr*", &outNewChild := 0, "HRESULT")
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
        result := ComCall(22, this, VARIANT_BOOL.Ptr, &hasChild := 0, "HRESULT")
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
        result := ComCall(24, this, VARIANT_BOOL, deep, "ptr*", &cloneRoot := 0, "HRESULT")
        return IXMLDOMNode(cloneRoot)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_nodeTypeString() {
        nodeType := BSTR.Owned()
        result := ComCall(25, this, BSTR.Ptr, nodeType, "HRESULT")
        return nodeType
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_text() {
        text := BSTR.Owned()
        result := ComCall(26, this, BSTR.Ptr, text, "HRESULT")
        return text
    }

    /**
     * 
     * @param {BSTR} text 
     * @returns {HRESULT} 
     */
    put_text(text) {
        text := text is String ? BSTR.Alloc(text).Value : text

        result := ComCall(27, this, BSTR, text, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_specified() {
        result := ComCall(28, this, VARIANT_BOOL.Ptr, &isSpecified := 0, "HRESULT")
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
        result := ComCall(30, this, VARIANT.Ptr, typedValue, "HRESULT")
        return typedValue
    }

    /**
     * 
     * @param {VARIANT} typedValue 
     * @returns {HRESULT} 
     */
    put_nodeTypedValue(typedValue) {
        result := ComCall(31, this, VARIANT, typedValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_dataType() {
        dataTypeName := VARIANT()
        result := ComCall(32, this, VARIANT.Ptr, dataTypeName, "HRESULT")
        return dataTypeName
    }

    /**
     * 
     * @param {BSTR} dataTypeName 
     * @returns {HRESULT} 
     */
    put_dataType(dataTypeName) {
        dataTypeName := dataTypeName is String ? BSTR.Alloc(dataTypeName).Value : dataTypeName

        result := ComCall(33, this, BSTR, dataTypeName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_xml() {
        xmlString := BSTR.Owned()
        result := ComCall(34, this, BSTR.Ptr, xmlString, "HRESULT")
        return xmlString
    }

    /**
     * 
     * @param {IXMLDOMNode} stylesheet 
     * @returns {BSTR} 
     */
    transformNode(stylesheet) {
        xmlString := BSTR.Owned()
        result := ComCall(35, this, "ptr", stylesheet, BSTR.Ptr, xmlString, "HRESULT")
        return xmlString
    }

    /**
     * 
     * @param {BSTR} queryString 
     * @returns {IXMLDOMNodeList} 
     */
    selectNodes(queryString) {
        queryString := queryString is String ? BSTR.Alloc(queryString).Value : queryString

        result := ComCall(36, this, BSTR, queryString, "ptr*", &resultList := 0, "HRESULT")
        return IXMLDOMNodeList(resultList)
    }

    /**
     * 
     * @param {BSTR} queryString 
     * @returns {IXMLDOMNode} 
     */
    selectSingleNode(queryString) {
        queryString := queryString is String ? BSTR.Alloc(queryString).Value : queryString

        result := ComCall(37, this, BSTR, queryString, "ptr*", &resultNode := 0, "HRESULT")
        return IXMLDOMNode(resultNode)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_parsed() {
        result := ComCall(38, this, VARIANT_BOOL.Ptr, &isParsed := 0, "HRESULT")
        return isParsed
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_namespaceURI() {
        namespaceURI := BSTR.Owned()
        result := ComCall(39, this, BSTR.Ptr, namespaceURI, "HRESULT")
        return namespaceURI
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_prefix() {
        prefixString := BSTR.Owned()
        result := ComCall(40, this, BSTR.Ptr, prefixString, "HRESULT")
        return prefixString
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_baseName() {
        nameString := BSTR.Owned()
        result := ComCall(41, this, BSTR.Ptr, nameString, "HRESULT")
        return nameString
    }

    /**
     * 
     * @param {IXMLDOMNode} stylesheet 
     * @param {VARIANT} outputObject 
     * @returns {HRESULT} 
     */
    transformNodeToObject(stylesheet, outputObject) {
        result := ComCall(42, this, "ptr", stylesheet, VARIANT, outputObject, "HRESULT")
        return result
    }

    Query(iid) {
        if (IXMLDOMNode.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_nodeName := CallbackCreate(GetMethod(implObj, "get_nodeName"), flags, 2)
        this.vtbl.get_nodeValue := CallbackCreate(GetMethod(implObj, "get_nodeValue"), flags, 2)
        this.vtbl.put_nodeValue := CallbackCreate(GetMethod(implObj, "put_nodeValue"), flags, 2)
        this.vtbl.get_nodeType := CallbackCreate(GetMethod(implObj, "get_nodeType"), flags, 2)
        this.vtbl.get_parentNode := CallbackCreate(GetMethod(implObj, "get_parentNode"), flags, 2)
        this.vtbl.get_childNodes := CallbackCreate(GetMethod(implObj, "get_childNodes"), flags, 2)
        this.vtbl.get_firstChild := CallbackCreate(GetMethod(implObj, "get_firstChild"), flags, 2)
        this.vtbl.get_lastChild := CallbackCreate(GetMethod(implObj, "get_lastChild"), flags, 2)
        this.vtbl.get_previousSibling := CallbackCreate(GetMethod(implObj, "get_previousSibling"), flags, 2)
        this.vtbl.get_nextSibling := CallbackCreate(GetMethod(implObj, "get_nextSibling"), flags, 2)
        this.vtbl.get_attributes := CallbackCreate(GetMethod(implObj, "get_attributes"), flags, 2)
        this.vtbl.insertBefore := CallbackCreate(GetMethod(implObj, "insertBefore"), flags, 4)
        this.vtbl.replaceChild := CallbackCreate(GetMethod(implObj, "replaceChild"), flags, 4)
        this.vtbl.removeChild := CallbackCreate(GetMethod(implObj, "removeChild"), flags, 3)
        this.vtbl.appendChild := CallbackCreate(GetMethod(implObj, "appendChild"), flags, 3)
        this.vtbl.hasChildNodes := CallbackCreate(GetMethod(implObj, "hasChildNodes"), flags, 2)
        this.vtbl.get_ownerDocument := CallbackCreate(GetMethod(implObj, "get_ownerDocument"), flags, 2)
        this.vtbl.cloneNode := CallbackCreate(GetMethod(implObj, "cloneNode"), flags, 3)
        this.vtbl.get_nodeTypeString := CallbackCreate(GetMethod(implObj, "get_nodeTypeString"), flags, 2)
        this.vtbl.get_text := CallbackCreate(GetMethod(implObj, "get_text"), flags, 2)
        this.vtbl.put_text := CallbackCreate(GetMethod(implObj, "put_text"), flags, 2)
        this.vtbl.get_specified := CallbackCreate(GetMethod(implObj, "get_specified"), flags, 2)
        this.vtbl.get_definition := CallbackCreate(GetMethod(implObj, "get_definition"), flags, 2)
        this.vtbl.get_nodeTypedValue := CallbackCreate(GetMethod(implObj, "get_nodeTypedValue"), flags, 2)
        this.vtbl.put_nodeTypedValue := CallbackCreate(GetMethod(implObj, "put_nodeTypedValue"), flags, 2)
        this.vtbl.get_dataType := CallbackCreate(GetMethod(implObj, "get_dataType"), flags, 2)
        this.vtbl.put_dataType := CallbackCreate(GetMethod(implObj, "put_dataType"), flags, 2)
        this.vtbl.get_xml := CallbackCreate(GetMethod(implObj, "get_xml"), flags, 2)
        this.vtbl.transformNode := CallbackCreate(GetMethod(implObj, "transformNode"), flags, 3)
        this.vtbl.selectNodes := CallbackCreate(GetMethod(implObj, "selectNodes"), flags, 3)
        this.vtbl.selectSingleNode := CallbackCreate(GetMethod(implObj, "selectSingleNode"), flags, 3)
        this.vtbl.get_parsed := CallbackCreate(GetMethod(implObj, "get_parsed"), flags, 2)
        this.vtbl.get_namespaceURI := CallbackCreate(GetMethod(implObj, "get_namespaceURI"), flags, 2)
        this.vtbl.get_prefix := CallbackCreate(GetMethod(implObj, "get_prefix"), flags, 2)
        this.vtbl.get_baseName := CallbackCreate(GetMethod(implObj, "get_baseName"), flags, 2)
        this.vtbl.transformNodeToObject := CallbackCreate(GetMethod(implObj, "transformNodeToObject"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_nodeName)
        CallbackFree(this.vtbl.get_nodeValue)
        CallbackFree(this.vtbl.put_nodeValue)
        CallbackFree(this.vtbl.get_nodeType)
        CallbackFree(this.vtbl.get_parentNode)
        CallbackFree(this.vtbl.get_childNodes)
        CallbackFree(this.vtbl.get_firstChild)
        CallbackFree(this.vtbl.get_lastChild)
        CallbackFree(this.vtbl.get_previousSibling)
        CallbackFree(this.vtbl.get_nextSibling)
        CallbackFree(this.vtbl.get_attributes)
        CallbackFree(this.vtbl.insertBefore)
        CallbackFree(this.vtbl.replaceChild)
        CallbackFree(this.vtbl.removeChild)
        CallbackFree(this.vtbl.appendChild)
        CallbackFree(this.vtbl.hasChildNodes)
        CallbackFree(this.vtbl.get_ownerDocument)
        CallbackFree(this.vtbl.cloneNode)
        CallbackFree(this.vtbl.get_nodeTypeString)
        CallbackFree(this.vtbl.get_text)
        CallbackFree(this.vtbl.put_text)
        CallbackFree(this.vtbl.get_specified)
        CallbackFree(this.vtbl.get_definition)
        CallbackFree(this.vtbl.get_nodeTypedValue)
        CallbackFree(this.vtbl.put_nodeTypedValue)
        CallbackFree(this.vtbl.get_dataType)
        CallbackFree(this.vtbl.put_dataType)
        CallbackFree(this.vtbl.get_xml)
        CallbackFree(this.vtbl.transformNode)
        CallbackFree(this.vtbl.selectNodes)
        CallbackFree(this.vtbl.selectSingleNode)
        CallbackFree(this.vtbl.get_parsed)
        CallbackFree(this.vtbl.get_namespaceURI)
        CallbackFree(this.vtbl.get_prefix)
        CallbackFree(this.vtbl.get_baseName)
        CallbackFree(this.vtbl.transformNodeToObject)
    }
}
