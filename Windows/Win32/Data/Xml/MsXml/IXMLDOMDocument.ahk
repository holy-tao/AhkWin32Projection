#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IXMLDOMNode.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IXMLDOMDocument extends IXMLDOMNode{
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
     * 
     * @param {Pointer<IXMLDOMDocumentType>} documentType 
     * @returns {HRESULT} 
     */
    get_doctype(documentType) {
        result := ComCall(43, this, "ptr", documentType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXMLDOMImplementation>} impl 
     * @returns {HRESULT} 
     */
    get_implementation(impl) {
        result := ComCall(44, this, "ptr", impl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXMLDOMElement>} DOMElement 
     * @returns {HRESULT} 
     */
    get_documentElement(DOMElement) {
        result := ComCall(45, this, "ptr", DOMElement, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXMLDOMElement>} DOMElement 
     * @returns {HRESULT} 
     */
    putref_documentElement(DOMElement) {
        result := ComCall(46, this, "ptr", DOMElement, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} tagName 
     * @param {Pointer<IXMLDOMElement>} element 
     * @returns {HRESULT} 
     */
    createElement(tagName, element) {
        tagName := tagName is String ? BSTR.Alloc(tagName).Value : tagName

        result := ComCall(47, this, "ptr", tagName, "ptr", element, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXMLDOMDocumentFragment>} docFrag 
     * @returns {HRESULT} 
     */
    createDocumentFragment(docFrag) {
        result := ComCall(48, this, "ptr", docFrag, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} data 
     * @param {Pointer<IXMLDOMText>} text 
     * @returns {HRESULT} 
     */
    createTextNode(data, text) {
        data := data is String ? BSTR.Alloc(data).Value : data

        result := ComCall(49, this, "ptr", data, "ptr", text, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} data 
     * @param {Pointer<IXMLDOMComment>} comment 
     * @returns {HRESULT} 
     */
    createComment(data, comment) {
        data := data is String ? BSTR.Alloc(data).Value : data

        result := ComCall(50, this, "ptr", data, "ptr", comment, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} data 
     * @param {Pointer<IXMLDOMCDATASection>} cdata 
     * @returns {HRESULT} 
     */
    createCDATASection(data, cdata) {
        data := data is String ? BSTR.Alloc(data).Value : data

        result := ComCall(51, this, "ptr", data, "ptr", cdata, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} target 
     * @param {BSTR} data 
     * @param {Pointer<IXMLDOMProcessingInstruction>} pi 
     * @returns {HRESULT} 
     */
    createProcessingInstruction(target, data, pi) {
        target := target is String ? BSTR.Alloc(target).Value : target
        data := data is String ? BSTR.Alloc(data).Value : data

        result := ComCall(52, this, "ptr", target, "ptr", data, "ptr", pi, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {Pointer<IXMLDOMAttribute>} attribute 
     * @returns {HRESULT} 
     */
    createAttribute(name, attribute) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(53, this, "ptr", name, "ptr", attribute, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {Pointer<IXMLDOMEntityReference>} entityRef 
     * @returns {HRESULT} 
     */
    createEntityReference(name, entityRef) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(54, this, "ptr", name, "ptr", entityRef, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(55, this, "ptr", tagName, "ptr", resultList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} Type 
     * @param {BSTR} name 
     * @param {BSTR} namespaceURI 
     * @param {Pointer<IXMLDOMNode>} node 
     * @returns {HRESULT} 
     */
    createNode(Type, name, namespaceURI, node) {
        name := name is String ? BSTR.Alloc(name).Value : name
        namespaceURI := namespaceURI is String ? BSTR.Alloc(namespaceURI).Value : namespaceURI

        result := ComCall(56, this, "ptr", Type, "ptr", name, "ptr", namespaceURI, "ptr", node, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} idString 
     * @param {Pointer<IXMLDOMNode>} node 
     * @returns {HRESULT} 
     */
    nodeFromID(idString, node) {
        idString := idString is String ? BSTR.Alloc(idString).Value : idString

        result := ComCall(57, this, "ptr", idString, "ptr", node, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} xmlSource 
     * @param {Pointer<VARIANT_BOOL>} isSuccessful 
     * @returns {HRESULT} 
     */
    load(xmlSource, isSuccessful) {
        result := ComCall(58, this, "ptr", xmlSource, "ptr", isSuccessful, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} value 
     * @returns {HRESULT} 
     */
    get_readyState(value) {
        result := ComCall(59, this, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXMLDOMParseError>} errorObj 
     * @returns {HRESULT} 
     */
    get_parseError(errorObj) {
        result := ComCall(60, this, "ptr", errorObj, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} urlString 
     * @returns {HRESULT} 
     */
    get_url(urlString) {
        result := ComCall(61, this, "ptr", urlString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} isAsync 
     * @returns {HRESULT} 
     */
    get_async(isAsync) {
        result := ComCall(62, this, "ptr", isAsync, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} isAsync 
     * @returns {HRESULT} 
     */
    put_async(isAsync) {
        result := ComCall(63, this, "short", isAsync, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    abort() {
        result := ComCall(64, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrXML 
     * @param {Pointer<VARIANT_BOOL>} isSuccessful 
     * @returns {HRESULT} 
     */
    loadXML(bstrXML, isSuccessful) {
        bstrXML := bstrXML is String ? BSTR.Alloc(bstrXML).Value : bstrXML

        result := ComCall(65, this, "ptr", bstrXML, "ptr", isSuccessful, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} destination 
     * @returns {HRESULT} 
     */
    save(destination) {
        result := ComCall(66, this, "ptr", destination, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} isValidating 
     * @returns {HRESULT} 
     */
    get_validateOnParse(isValidating) {
        result := ComCall(67, this, "ptr", isValidating, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} isValidating 
     * @returns {HRESULT} 
     */
    put_validateOnParse(isValidating) {
        result := ComCall(68, this, "short", isValidating, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} isResolving 
     * @returns {HRESULT} 
     */
    get_resolveExternals(isResolving) {
        result := ComCall(69, this, "ptr", isResolving, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} isResolving 
     * @returns {HRESULT} 
     */
    put_resolveExternals(isResolving) {
        result := ComCall(70, this, "short", isResolving, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} isPreserving 
     * @returns {HRESULT} 
     */
    get_preserveWhiteSpace(isPreserving) {
        result := ComCall(71, this, "ptr", isPreserving, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} isPreserving 
     * @returns {HRESULT} 
     */
    put_preserveWhiteSpace(isPreserving) {
        result := ComCall(72, this, "short", isPreserving, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} readystatechangeSink 
     * @returns {HRESULT} 
     */
    put_onreadystatechange(readystatechangeSink) {
        result := ComCall(73, this, "ptr", readystatechangeSink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} ondataavailableSink 
     * @returns {HRESULT} 
     */
    put_ondataavailable(ondataavailableSink) {
        result := ComCall(74, this, "ptr", ondataavailableSink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} ontransformnodeSink 
     * @returns {HRESULT} 
     */
    put_ontransformnode(ontransformnodeSink) {
        result := ComCall(75, this, "ptr", ontransformnodeSink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
