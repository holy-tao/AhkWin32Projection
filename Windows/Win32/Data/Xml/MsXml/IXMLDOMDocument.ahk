#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IXMLDOMDocumentType.ahk
#Include .\IXMLDOMImplementation.ahk
#Include .\IXMLDOMElement.ahk
#Include .\IXMLDOMDocumentFragment.ahk
#Include .\IXMLDOMText.ahk
#Include .\IXMLDOMComment.ahk
#Include .\IXMLDOMCDATASection.ahk
#Include .\IXMLDOMProcessingInstruction.ahk
#Include .\IXMLDOMAttribute.ahk
#Include .\IXMLDOMEntityReference.ahk
#Include .\IXMLDOMNodeList.ahk
#Include .\IXMLDOMNode.ahk
#Include .\IXMLDOMParseError.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IXMLDOMDocument extends IXMLDOMNode{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXMLDOMDocument
     * @type {Guid}
     */
    static IID => Guid("{2933bf81-7b36-11d2-b20e-00c04f983e60}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 43

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_doctype", "get_implementation", "get_documentElement", "putref_documentElement", "createElement", "createDocumentFragment", "createTextNode", "createComment", "createCDATASection", "createProcessingInstruction", "createAttribute", "createEntityReference", "getElementsByTagName", "createNode", "nodeFromID", "load", "get_readyState", "get_parseError", "get_url", "get_async", "put_async", "abort", "loadXML", "save", "get_validateOnParse", "put_validateOnParse", "get_resolveExternals", "put_resolveExternals", "get_preserveWhiteSpace", "put_preserveWhiteSpace", "put_onreadystatechange", "put_ondataavailable", "put_ontransformnode"]

    /**
     * @type {IXMLDOMDocumentType} 
     */
    doctype {
        get => this.get_doctype()
    }

    /**
     * @type {IXMLDOMImplementation} 
     */
    implementation {
        get => this.get_implementation()
    }

    /**
     * @type {IXMLDOMElement} 
     */
    documentElement {
        get => this.get_documentElement()
    }

    /**
     * @type {Integer} 
     */
    readyState {
        get => this.get_readyState()
    }

    /**
     * @type {IXMLDOMParseError} 
     */
    parseError {
        get => this.get_parseError()
    }

    /**
     * @type {BSTR} 
     */
    url {
        get => this.get_url()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    async {
        get => this.get_async()
        set => this.put_async(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    validateOnParse {
        get => this.get_validateOnParse()
        set => this.put_validateOnParse(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    resolveExternals {
        get => this.get_resolveExternals()
        set => this.put_resolveExternals(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    preserveWhiteSpace {
        get => this.get_preserveWhiteSpace()
        set => this.put_preserveWhiteSpace(value)
    }

    /**
     * @type {HRESULT} 
     */
    onreadystatechange {
        set => this.put_onreadystatechange(value)
    }

    /**
     * @type {HRESULT} 
     */
    ondataavailable {
        set => this.put_ondataavailable(value)
    }

    /**
     * @type {HRESULT} 
     */
    ontransformnode {
        set => this.put_ontransformnode(value)
    }

    /**
     * 
     * @returns {IXMLDOMDocumentType} 
     */
    get_doctype() {
        result := ComCall(43, this, "ptr*", &documentType := 0, "HRESULT")
        return IXMLDOMDocumentType(documentType)
    }

    /**
     * 
     * @returns {IXMLDOMImplementation} 
     */
    get_implementation() {
        result := ComCall(44, this, "ptr*", &impl := 0, "HRESULT")
        return IXMLDOMImplementation(impl)
    }

    /**
     * 
     * @returns {IXMLDOMElement} 
     */
    get_documentElement() {
        result := ComCall(45, this, "ptr*", &DOMElement := 0, "HRESULT")
        return IXMLDOMElement(DOMElement)
    }

    /**
     * 
     * @param {IXMLDOMElement} DOMElement 
     * @returns {HRESULT} 
     */
    putref_documentElement(DOMElement) {
        result := ComCall(46, this, "ptr", DOMElement, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} tagName 
     * @returns {IXMLDOMElement} 
     */
    createElement(tagName) {
        tagName := tagName is String ? BSTR.Alloc(tagName).Value : tagName

        result := ComCall(47, this, "ptr", tagName, "ptr*", &element := 0, "HRESULT")
        return IXMLDOMElement(element)
    }

    /**
     * 
     * @returns {IXMLDOMDocumentFragment} 
     */
    createDocumentFragment() {
        result := ComCall(48, this, "ptr*", &docFrag := 0, "HRESULT")
        return IXMLDOMDocumentFragment(docFrag)
    }

    /**
     * 
     * @param {BSTR} data 
     * @returns {IXMLDOMText} 
     */
    createTextNode(data) {
        data := data is String ? BSTR.Alloc(data).Value : data

        result := ComCall(49, this, "ptr", data, "ptr*", &text := 0, "HRESULT")
        return IXMLDOMText(text)
    }

    /**
     * 
     * @param {BSTR} data 
     * @returns {IXMLDOMComment} 
     */
    createComment(data) {
        data := data is String ? BSTR.Alloc(data).Value : data

        result := ComCall(50, this, "ptr", data, "ptr*", &comment := 0, "HRESULT")
        return IXMLDOMComment(comment)
    }

    /**
     * 
     * @param {BSTR} data 
     * @returns {IXMLDOMCDATASection} 
     */
    createCDATASection(data) {
        data := data is String ? BSTR.Alloc(data).Value : data

        result := ComCall(51, this, "ptr", data, "ptr*", &cdata := 0, "HRESULT")
        return IXMLDOMCDATASection(cdata)
    }

    /**
     * 
     * @param {BSTR} target 
     * @param {BSTR} data 
     * @returns {IXMLDOMProcessingInstruction} 
     */
    createProcessingInstruction(target, data) {
        target := target is String ? BSTR.Alloc(target).Value : target
        data := data is String ? BSTR.Alloc(data).Value : data

        result := ComCall(52, this, "ptr", target, "ptr", data, "ptr*", &pi := 0, "HRESULT")
        return IXMLDOMProcessingInstruction(pi)
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {IXMLDOMAttribute} 
     */
    createAttribute(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(53, this, "ptr", name, "ptr*", &attribute := 0, "HRESULT")
        return IXMLDOMAttribute(attribute)
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {IXMLDOMEntityReference} 
     */
    createEntityReference(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(54, this, "ptr", name, "ptr*", &entityRef := 0, "HRESULT")
        return IXMLDOMEntityReference(entityRef)
    }

    /**
     * 
     * @param {BSTR} tagName 
     * @returns {IXMLDOMNodeList} 
     */
    getElementsByTagName(tagName) {
        tagName := tagName is String ? BSTR.Alloc(tagName).Value : tagName

        result := ComCall(55, this, "ptr", tagName, "ptr*", &resultList := 0, "HRESULT")
        return IXMLDOMNodeList(resultList)
    }

    /**
     * 
     * @param {VARIANT} Type 
     * @param {BSTR} name 
     * @param {BSTR} namespaceURI 
     * @returns {IXMLDOMNode} 
     */
    createNode(Type, name, namespaceURI) {
        name := name is String ? BSTR.Alloc(name).Value : name
        namespaceURI := namespaceURI is String ? BSTR.Alloc(namespaceURI).Value : namespaceURI

        result := ComCall(56, this, "ptr", Type, "ptr", name, "ptr", namespaceURI, "ptr*", &node := 0, "HRESULT")
        return IXMLDOMNode(node)
    }

    /**
     * 
     * @param {BSTR} idString 
     * @returns {IXMLDOMNode} 
     */
    nodeFromID(idString) {
        idString := idString is String ? BSTR.Alloc(idString).Value : idString

        result := ComCall(57, this, "ptr", idString, "ptr*", &node := 0, "HRESULT")
        return IXMLDOMNode(node)
    }

    /**
     * 
     * @param {VARIANT} xmlSource 
     * @returns {VARIANT_BOOL} 
     */
    load(xmlSource) {
        result := ComCall(58, this, "ptr", xmlSource, "short*", &isSuccessful := 0, "HRESULT")
        return isSuccessful
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_readyState() {
        result := ComCall(59, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @returns {IXMLDOMParseError} 
     */
    get_parseError() {
        result := ComCall(60, this, "ptr*", &errorObj := 0, "HRESULT")
        return IXMLDOMParseError(errorObj)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_url() {
        urlString := BSTR()
        result := ComCall(61, this, "ptr", urlString, "HRESULT")
        return urlString
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_async() {
        result := ComCall(62, this, "short*", &isAsync := 0, "HRESULT")
        return isAsync
    }

    /**
     * 
     * @param {VARIANT_BOOL} isAsync 
     * @returns {HRESULT} 
     */
    put_async(isAsync) {
        result := ComCall(63, this, "short", isAsync, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    abort() {
        result := ComCall(64, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrXML 
     * @returns {VARIANT_BOOL} 
     */
    loadXML(bstrXML) {
        bstrXML := bstrXML is String ? BSTR.Alloc(bstrXML).Value : bstrXML

        result := ComCall(65, this, "ptr", bstrXML, "short*", &isSuccessful := 0, "HRESULT")
        return isSuccessful
    }

    /**
     * 
     * @param {VARIANT} destination 
     * @returns {HRESULT} 
     */
    save(destination) {
        result := ComCall(66, this, "ptr", destination, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_validateOnParse() {
        result := ComCall(67, this, "short*", &isValidating := 0, "HRESULT")
        return isValidating
    }

    /**
     * 
     * @param {VARIANT_BOOL} isValidating 
     * @returns {HRESULT} 
     */
    put_validateOnParse(isValidating) {
        result := ComCall(68, this, "short", isValidating, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_resolveExternals() {
        result := ComCall(69, this, "short*", &isResolving := 0, "HRESULT")
        return isResolving
    }

    /**
     * 
     * @param {VARIANT_BOOL} isResolving 
     * @returns {HRESULT} 
     */
    put_resolveExternals(isResolving) {
        result := ComCall(70, this, "short", isResolving, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_preserveWhiteSpace() {
        result := ComCall(71, this, "short*", &isPreserving := 0, "HRESULT")
        return isPreserving
    }

    /**
     * 
     * @param {VARIANT_BOOL} isPreserving 
     * @returns {HRESULT} 
     */
    put_preserveWhiteSpace(isPreserving) {
        result := ComCall(72, this, "short", isPreserving, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} readystatechangeSink 
     * @returns {HRESULT} 
     */
    put_onreadystatechange(readystatechangeSink) {
        result := ComCall(73, this, "ptr", readystatechangeSink, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} ondataavailableSink 
     * @returns {HRESULT} 
     */
    put_ondataavailable(ondataavailableSink) {
        result := ComCall(74, this, "ptr", ondataavailableSink, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} ontransformnodeSink 
     * @returns {HRESULT} 
     */
    put_ontransformnode(ontransformnodeSink) {
        result := ComCall(75, this, "ptr", ontransformnodeSink, "HRESULT")
        return result
    }
}
