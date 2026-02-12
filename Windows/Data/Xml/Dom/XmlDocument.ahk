#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IXmlDocument.ahk
#Include .\IXmlNode.ahk
#Include .\IXmlNodeSerializer.ahk
#Include .\IXmlNodeSelector.ahk
#Include .\IXmlDocumentIO.ahk
#Include .\IXmlDocumentIO2.ahk
#Include .\IXmlDocumentStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the top level of the XML source. This class includes members for retrieving and creating all other XML objects.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument
 * @namespace Windows.Data.Xml.Dom
 * @version WindowsRuntime 1.4
 */
class XmlDocument extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IXmlDocument

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IXmlDocument.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Asynchronously loads an XML document from the specified location. The document is parsed using the provided settings.
     * @remarks
     * This operation does not start until a call is made to the IAsyncOperation::StartOperation method.
     * @param {Uri} uri_ A URL that specifies the location of the XML file.
     * @returns {IAsyncOperation<XmlDocument>} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.loadfromuriasync
     */
    static LoadFromUriAsync(uri_) {
        if (!XmlDocument.HasProp("__IXmlDocumentStatics")) {
            activatableClassId := HSTRING.Create("Windows.Data.Xml.Dom.XmlDocument")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXmlDocumentStatics.IID)
            XmlDocument.__IXmlDocumentStatics := IXmlDocumentStatics(factoryPtr)
        }

        return XmlDocument.__IXmlDocumentStatics.LoadFromUriAsync(uri_)
    }

    /**
     * Asynchronously loads an XML document from the specified location. The document is parsed using the default parser settings.
     * @param {Uri} uri_ A URL that specifies the location of the XML file.
     * @param {XmlLoadSettings} loadSettings 
     * @returns {IAsyncOperation<XmlDocument>} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.loadfromuriasync
     */
    static LoadFromUriWithSettingsAsync(uri_, loadSettings) {
        if (!XmlDocument.HasProp("__IXmlDocumentStatics")) {
            activatableClassId := HSTRING.Create("Windows.Data.Xml.Dom.XmlDocument")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXmlDocumentStatics.IID)
            XmlDocument.__IXmlDocumentStatics := IXmlDocumentStatics(factoryPtr)
        }

        return XmlDocument.__IXmlDocumentStatics.LoadFromUriWithSettingsAsync(uri_, loadSettings)
    }

    /**
     * Asynchronously loads an XML document from the specified file. The document is parsed using the provided settings.
     * @param {IStorageFile} file_ The file from which to load the document.
     * @returns {IAsyncOperation<XmlDocument>} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.loadfromfileasync
     */
    static LoadFromFileAsync(file_) {
        if (!XmlDocument.HasProp("__IXmlDocumentStatics")) {
            activatableClassId := HSTRING.Create("Windows.Data.Xml.Dom.XmlDocument")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXmlDocumentStatics.IID)
            XmlDocument.__IXmlDocumentStatics := IXmlDocumentStatics(factoryPtr)
        }

        return XmlDocument.__IXmlDocumentStatics.LoadFromFileAsync(file_)
    }

    /**
     * Asynchronously loads an XML document from the specified file. The document is parsed using the default parser settings.
     * @param {IStorageFile} file_ The file from which to load the document.
     * @param {XmlLoadSettings} loadSettings 
     * @returns {IAsyncOperation<XmlDocument>} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.loadfromfileasync
     */
    static LoadFromFileWithSettingsAsync(file_, loadSettings) {
        if (!XmlDocument.HasProp("__IXmlDocumentStatics")) {
            activatableClassId := HSTRING.Create("Windows.Data.Xml.Dom.XmlDocument")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXmlDocumentStatics.IID)
            XmlDocument.__IXmlDocumentStatics := IXmlDocumentStatics(factoryPtr)
        }

        return XmlDocument.__IXmlDocumentStatics.LoadFromFileWithSettingsAsync(file_, loadSettings)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * For XML, this property gets the address of the node that specifies the DTD. This property returns Null for HTML documents and XML documents without a DTD.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.doctype
     * @type {XmlDocumentType} 
     */
    Doctype {
        get => this.get_Doctype()
    }

    /**
     * Gets the Implementation object for the document.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.implementation
     * @type {XmlDomImplementation} 
     */
    Implementation {
        get => this.get_Implementation()
    }

    /**
     * Gets the root element of the document.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.documentelement
     * @type {XmlElement} 
     */
    DocumentElement {
        get => this.get_DocumentElement()
    }

    /**
     * Returns the URL for the last loaded XML document.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.documenturi
     * @type {HSTRING} 
     */
    DocumentUri {
        get => this.get_DocumentUri()
    }

    /**
     * Gets or sets the text associated with the node.
     * @remarks
     * This value depends on the [NodeType](ixmlnode_nodetype.md) property. The following table describes this dependency.
     * 
     * <table>
     *    <tr><th>NodeType</th><th>NodeValue</th></tr>
     *    <tr><td>Element</td><td>Null</td></tr>
     *    <tr><td>Attribute</td><td>Value of attribute</td></tr>
     *    <tr><td>Text</td><td>Content of the text node</td></tr>
     *    <tr><td>CDATASection</td><td>Content of the CDATA Section</td></tr>
     *    <tr><td>EntityReference</td><td>NULL</td></tr>
     *    <tr><td>Entity</td><td>NULL</td></tr>
     *    <tr><td>ProcessingInstruction</td><td>Entire content excluding the target</td></tr>
     *    <tr><td>Comment</td><td>Content of the comment</td></tr>
     *    <tr><td>Document</td><td>NULL</td></tr>
     *    <tr><td>DocumentType</td><td>NULL</td></tr>
     *    <tr><td>DocumentFragment</td><td>NULL</td></tr>
     *    <tr><td>Notation</td><td>NULL</td></tr>
     * </table>
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.nodevalue
     * @type {IInspectable} 
     */
    NodeValue {
        get => this.get_NodeValue()
        set => this.put_NodeValue(value)
    }

    /**
     * Gets the XML Document Object Model (DOM) node type, which determines valid values and whether the node can have child nodes.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.nodetype
     * @type {Integer} 
     */
    NodeType {
        get => this.get_NodeType()
    }

    /**
     * Returns the qualified name for attribute, document type, element, entity, or notation nodes. Returns a fixed string for all other node types.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.nodename
     * @type {HSTRING} 
     */
    NodeName {
        get => this.get_NodeName()
    }

    /**
     * Gets the parent node of the node instance.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.parentnode
     * @type {IXmlNode} 
     */
    ParentNode {
        get => this.get_ParentNode()
    }

    /**
     * Gets a list of children in the current node.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.childnodes
     * @type {XmlNodeList} 
     */
    ChildNodes {
        get => this.get_ChildNodes()
    }

    /**
     * Gets the first child node.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.firstchild
     * @type {IXmlNode} 
     */
    FirstChild {
        get => this.get_FirstChild()
    }

    /**
     * Gets the last child node.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.lastchild
     * @type {IXmlNode} 
     */
    LastChild {
        get => this.get_LastChild()
    }

    /**
     * Gets the previous sibling of the node in the parent's child list. This property is not applicable to this class.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.previoussibling
     * @type {IXmlNode} 
     */
    PreviousSibling {
        get => this.get_PreviousSibling()
    }

    /**
     * Gets the next sibling of the node in the parent's child list. This property is not applicable to this class.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.nextsibling
     * @type {IXmlNode} 
     */
    NextSibling {
        get => this.get_NextSibling()
    }

    /**
     * Gets the list of attributes of this node.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.attributes
     * @type {XmlNamedNodeMap} 
     */
    Attributes {
        get => this.get_Attributes()
    }

    /**
     * Returns the root of the document that contains the node.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.ownerdocument
     * @type {XmlDocument} 
     */
    OwnerDocument {
        get => this.get_OwnerDocument()
    }

    /**
     * Returns the Uniform Resource Identifier (URI) for the namespace.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.namespaceuri
     * @type {IInspectable} 
     */
    NamespaceUri {
        get => this.get_NamespaceUri()
    }

    /**
     * Gets the local name, which is the local part of a qualified name. This is called the local part in Namespaces in XML.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.localname
     * @type {IInspectable} 
     */
    LocalName {
        get => this.get_LocalName()
    }

    /**
     * Gets or sets the namespace prefix.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.prefix
     * @type {IInspectable} 
     */
    Prefix {
        get => this.get_Prefix()
        set => this.put_Prefix(value)
    }

    /**
     * Gets the text from inside the XML.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.innertext
     * @type {HSTRING} 
     */
    InnerText {
        get => this.get_InnerText()
        set => this.put_InnerText(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of the [XmlDocument](xmldocument.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Data.Xml.Dom.XmlDocument")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {XmlDocumentType} 
     */
    get_Doctype() {
        if (!this.HasProp("__IXmlDocument")) {
            if ((queryResult := this.QueryInterface(IXmlDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlDocument := IXmlDocument(outPtr)
        }

        return this.__IXmlDocument.get_Doctype()
    }

    /**
     * 
     * @returns {XmlDomImplementation} 
     */
    get_Implementation() {
        if (!this.HasProp("__IXmlDocument")) {
            if ((queryResult := this.QueryInterface(IXmlDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlDocument := IXmlDocument(outPtr)
        }

        return this.__IXmlDocument.get_Implementation()
    }

    /**
     * 
     * @returns {XmlElement} 
     */
    get_DocumentElement() {
        if (!this.HasProp("__IXmlDocument")) {
            if ((queryResult := this.QueryInterface(IXmlDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlDocument := IXmlDocument(outPtr)
        }

        return this.__IXmlDocument.get_DocumentElement()
    }

    /**
     * Creates an element node using the specified name.
     * @param {HSTRING} tagName The name for the new element node. The string is case-sensitive. This name is subsequently available as the element node's [NodeName](xmlelement_nodename.md) property.
     * @returns {XmlElement} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.createelement
     */
    CreateElement(tagName) {
        if (!this.HasProp("__IXmlDocument")) {
            if ((queryResult := this.QueryInterface(IXmlDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlDocument := IXmlDocument(outPtr)
        }

        return this.__IXmlDocument.CreateElement(tagName)
    }

    /**
     * Creates an empty [XmlDocumentFragment](xmldocumentfragment.md) object.
     * @returns {XmlDocumentFragment} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.createdocumentfragment
     */
    CreateDocumentFragment() {
        if (!this.HasProp("__IXmlDocument")) {
            if ((queryResult := this.QueryInterface(IXmlDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlDocument := IXmlDocument(outPtr)
        }

        return this.__IXmlDocument.CreateDocumentFragment()
    }

    /**
     * Creates a text node that contains the supplied data.
     * @param {HSTRING} data The value to be supplied to the new text object's [NodeValue](xmltext_nodevalue.md).
     * @returns {XmlText} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.createtextnode
     */
    CreateTextNode(data) {
        if (!this.HasProp("__IXmlDocument")) {
            if ((queryResult := this.QueryInterface(IXmlDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlDocument := IXmlDocument(outPtr)
        }

        return this.__IXmlDocument.CreateTextNode(data)
    }

    /**
     * Creates a comment node that contains the supplied data.
     * @param {HSTRING} data The value to be supplied to the new comment object's [NodeValue](xmlcomment_nodevalue.md).
     * @returns {XmlComment} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.createcomment
     */
    CreateComment(data) {
        if (!this.HasProp("__IXmlDocument")) {
            if ((queryResult := this.QueryInterface(IXmlDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlDocument := IXmlDocument(outPtr)
        }

        return this.__IXmlDocument.CreateComment(data)
    }

    /**
     * Creates a processing instruction node that contains the supplied target and data.
     * @param {HSTRING} target The target part of the processing instruction. It supplies the [NodeName](xmlprocessinginstruction_nodename.md) property of the new object.
     * @param {HSTRING} data The remainder of the processing instruction preceding the closing** ?&gt;** characters. It supplies the [NodeValue](xmlprocessinginstruction_nodevalue.md) property for the new object.
     * @returns {XmlProcessingInstruction} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.createprocessinginstruction
     */
    CreateProcessingInstruction(target, data) {
        if (!this.HasProp("__IXmlDocument")) {
            if ((queryResult := this.QueryInterface(IXmlDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlDocument := IXmlDocument(outPtr)
        }

        return this.__IXmlDocument.CreateProcessingInstruction(target, data)
    }

    /**
     * Creates a new attribute with the specified name.
     * @param {HSTRING} name The name of the new attribute object. This name is subsequently available as the new node's [NodeName](xmlattribute_nodename.md) property.
     * @returns {XmlAttribute} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.createattribute
     */
    CreateAttribute(name) {
        if (!this.HasProp("__IXmlDocument")) {
            if ((queryResult := this.QueryInterface(IXmlDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlDocument := IXmlDocument(outPtr)
        }

        return this.__IXmlDocument.CreateAttribute(name)
    }

    /**
     * Creates a new [XmlEntityReference](xmlentityreference.md) object.
     * @param {HSTRING} name The name of the entity referenced. This name is subsequently available as the new object's [NodeName](xmlelement_nodename.md) property.
     * @returns {XmlEntityReference} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.createentityreference
     */
    CreateEntityReference(name) {
        if (!this.HasProp("__IXmlDocument")) {
            if ((queryResult := this.QueryInterface(IXmlDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlDocument := IXmlDocument(outPtr)
        }

        return this.__IXmlDocument.CreateEntityReference(name)
    }

    /**
     * Returns a collection of elements that have the specified name.
     * @param {HSTRING} tagName The element name to find. The value "*" returns all elements in the document.
     * @returns {XmlNodeList} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.getelementsbytagname
     */
    GetElementsByTagName(tagName) {
        if (!this.HasProp("__IXmlDocument")) {
            if ((queryResult := this.QueryInterface(IXmlDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlDocument := IXmlDocument(outPtr)
        }

        return this.__IXmlDocument.GetElementsByTagName(tagName)
    }

    /**
     * Creates a CDATA section node that contains the supplied data.
     * @param {HSTRING} data The value to be supplied to the new CDATA section object's [NodeValue](xmlcdatasection_nodevalue.md) property.
     * @returns {XmlCDataSection} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.createcdatasection
     */
    CreateCDataSection(data) {
        if (!this.HasProp("__IXmlDocument")) {
            if ((queryResult := this.QueryInterface(IXmlDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlDocument := IXmlDocument(outPtr)
        }

        return this.__IXmlDocument.CreateCDataSection(data)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DocumentUri() {
        if (!this.HasProp("__IXmlDocument")) {
            if ((queryResult := this.QueryInterface(IXmlDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlDocument := IXmlDocument(outPtr)
        }

        return this.__IXmlDocument.get_DocumentUri()
    }

    /**
     * Creates a new attribute with the specified namespace and name.
     * @param {IInspectable} namespaceUri The name of the desired namespace or a null value if no namespace is desired.
     * @param {HSTRING} qualifiedName The name of the new attribute object. This name is subsequently available as the new node's [NodeName](xmlattribute_nodename.md) property.
     * @returns {XmlAttribute} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.createattributens
     */
    CreateAttributeNS(namespaceUri, qualifiedName) {
        if (!this.HasProp("__IXmlDocument")) {
            if ((queryResult := this.QueryInterface(IXmlDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlDocument := IXmlDocument(outPtr)
        }

        return this.__IXmlDocument.CreateAttributeNS(namespaceUri, qualifiedName)
    }

    /**
     * Creates an element node using the specified namespace and name.
     * @param {IInspectable} namespaceUri The name of the desired namespace or a null value if no namespace is desired.
     * @param {HSTRING} qualifiedName The name for the new element node. It is case-sensitive. This name is subsequently available as the element node's [NodeName](xmlelement_nodename.md) property.
     * @returns {XmlElement} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.createelementns
     */
    CreateElementNS(namespaceUri, qualifiedName) {
        if (!this.HasProp("__IXmlDocument")) {
            if ((queryResult := this.QueryInterface(IXmlDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlDocument := IXmlDocument(outPtr)
        }

        return this.__IXmlDocument.CreateElementNS(namespaceUri, qualifiedName)
    }

    /**
     * Returns the element that matches the ID attribute.
     * @param {HSTRING} elementId The ID to match.
     * @returns {XmlElement} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.getelementbyid
     */
    GetElementById(elementId) {
        if (!this.HasProp("__IXmlDocument")) {
            if ((queryResult := this.QueryInterface(IXmlDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlDocument := IXmlDocument(outPtr)
        }

        return this.__IXmlDocument.GetElementById(elementId)
    }

    /**
     * Imports a node from another document to this document.
     * @remarks
     * The returned node has no parent (the  is null). The source node is not altered or removed from the original document; this method creates a new copy of the source node.
     * @param {IXmlNode} node_ The object to be cloned.
     * @param {Boolean} deep If true, any children of node will be cloned as well. If false, no children of the node will be cloned.
     * @returns {IXmlNode} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.importnode
     */
    ImportNode(node_, deep) {
        if (!this.HasProp("__IXmlDocument")) {
            if ((queryResult := this.QueryInterface(IXmlDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlDocument := IXmlDocument(outPtr)
        }

        return this.__IXmlDocument.ImportNode(node_, deep)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_NodeValue() {
        if (!this.HasProp("__IXmlNode")) {
            if ((queryResult := this.QueryInterface(IXmlNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlNode := IXmlNode(outPtr)
        }

        return this.__IXmlNode.get_NodeValue()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_NodeValue(value) {
        if (!this.HasProp("__IXmlNode")) {
            if ((queryResult := this.QueryInterface(IXmlNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlNode := IXmlNode(outPtr)
        }

        return this.__IXmlNode.put_NodeValue(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NodeType() {
        if (!this.HasProp("__IXmlNode")) {
            if ((queryResult := this.QueryInterface(IXmlNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlNode := IXmlNode(outPtr)
        }

        return this.__IXmlNode.get_NodeType()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NodeName() {
        if (!this.HasProp("__IXmlNode")) {
            if ((queryResult := this.QueryInterface(IXmlNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlNode := IXmlNode(outPtr)
        }

        return this.__IXmlNode.get_NodeName()
    }

    /**
     * 
     * @returns {IXmlNode} 
     */
    get_ParentNode() {
        if (!this.HasProp("__IXmlNode")) {
            if ((queryResult := this.QueryInterface(IXmlNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlNode := IXmlNode(outPtr)
        }

        return this.__IXmlNode.get_ParentNode()
    }

    /**
     * 
     * @returns {XmlNodeList} 
     */
    get_ChildNodes() {
        if (!this.HasProp("__IXmlNode")) {
            if ((queryResult := this.QueryInterface(IXmlNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlNode := IXmlNode(outPtr)
        }

        return this.__IXmlNode.get_ChildNodes()
    }

    /**
     * 
     * @returns {IXmlNode} 
     */
    get_FirstChild() {
        if (!this.HasProp("__IXmlNode")) {
            if ((queryResult := this.QueryInterface(IXmlNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlNode := IXmlNode(outPtr)
        }

        return this.__IXmlNode.get_FirstChild()
    }

    /**
     * 
     * @returns {IXmlNode} 
     */
    get_LastChild() {
        if (!this.HasProp("__IXmlNode")) {
            if ((queryResult := this.QueryInterface(IXmlNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlNode := IXmlNode(outPtr)
        }

        return this.__IXmlNode.get_LastChild()
    }

    /**
     * 
     * @returns {IXmlNode} 
     */
    get_PreviousSibling() {
        if (!this.HasProp("__IXmlNode")) {
            if ((queryResult := this.QueryInterface(IXmlNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlNode := IXmlNode(outPtr)
        }

        return this.__IXmlNode.get_PreviousSibling()
    }

    /**
     * 
     * @returns {IXmlNode} 
     */
    get_NextSibling() {
        if (!this.HasProp("__IXmlNode")) {
            if ((queryResult := this.QueryInterface(IXmlNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlNode := IXmlNode(outPtr)
        }

        return this.__IXmlNode.get_NextSibling()
    }

    /**
     * 
     * @returns {XmlNamedNodeMap} 
     */
    get_Attributes() {
        if (!this.HasProp("__IXmlNode")) {
            if ((queryResult := this.QueryInterface(IXmlNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlNode := IXmlNode(outPtr)
        }

        return this.__IXmlNode.get_Attributes()
    }

    /**
     * Determines whether a node has children.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.haschildnodes
     */
    HasChildNodes() {
        if (!this.HasProp("__IXmlNode")) {
            if ((queryResult := this.QueryInterface(IXmlNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlNode := IXmlNode(outPtr)
        }

        return this.__IXmlNode.HasChildNodes()
    }

    /**
     * 
     * @returns {XmlDocument} 
     */
    get_OwnerDocument() {
        if (!this.HasProp("__IXmlNode")) {
            if ((queryResult := this.QueryInterface(IXmlNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlNode := IXmlNode(outPtr)
        }

        return this.__IXmlNode.get_OwnerDocument()
    }

    /**
     * Inserts a child node to the left of the specified node, or at the end of the child node list.
     * @param {IXmlNode} newChild The address of the new node to be inserted. The node passed here must be a valid child of the current XML DOM document node. For example, if the current node is an attribute, you cannot pass another attribute in the *newChild* parameter, because an attribute cannot have an attribute as a child. If *newChild* is a DOCUMENT_FRAGMENT node type, all its children are inserted in order before *referenceChild*.
     * 
     * If *newChild* is already in the tree, it is first removed before it is reinserted before the *referenceChild* node. Read-only nodes, such as NODE_DOCUMENT_TYPE and NODE_ENTITY nodes, cannot be passed in the *newChild* parameter.
     * @param {IXmlNode} referenceChild The reference node. The node specified is where the *newChild* node is to be inserted to the left as the preceding sibling in the child list. The node passed here must be a either a child node of the current node or null. If the value is null, the *newChild* node is inserted at the end of the child list. If the *referenceChild* node is not a child of the current node, an error is returned.
     * @returns {IXmlNode} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.insertbefore
     */
    InsertBefore(newChild, referenceChild) {
        if (!this.HasProp("__IXmlNode")) {
            if ((queryResult := this.QueryInterface(IXmlNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlNode := IXmlNode(outPtr)
        }

        return this.__IXmlNode.InsertBefore(newChild, referenceChild)
    }

    /**
     * Replaces the specified old child node with the supplied new child node.
     * @param {IXmlNode} newChild The new child that is to replace the old child. If null, the *referenceChild* parameter is removed without a replacement.
     * @param {IXmlNode} referenceChild The old child that is to be replaced by the new child.
     * @returns {IXmlNode} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.replacechild
     */
    ReplaceChild(newChild, referenceChild) {
        if (!this.HasProp("__IXmlNode")) {
            if ((queryResult := this.QueryInterface(IXmlNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlNode := IXmlNode(outPtr)
        }

        return this.__IXmlNode.ReplaceChild(newChild, referenceChild)
    }

    /**
     * Removes the specified child node from the list of children and returns it.
     * @param {IXmlNode} childNode The child node to be removed from the list of children of this node.
     * @returns {IXmlNode} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.removechild
     */
    RemoveChild(childNode) {
        if (!this.HasProp("__IXmlNode")) {
            if ((queryResult := this.QueryInterface(IXmlNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlNode := IXmlNode(outPtr)
        }

        return this.__IXmlNode.RemoveChild(childNode)
    }

    /**
     * Appends a new child node as the last child of the node.
     * @param {IXmlNode} newChild The new child node to be appended to the end of the list of children of this node.
     * @returns {IXmlNode} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.appendchild
     */
    AppendChild(newChild) {
        if (!this.HasProp("__IXmlNode")) {
            if ((queryResult := this.QueryInterface(IXmlNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlNode := IXmlNode(outPtr)
        }

        return this.__IXmlNode.AppendChild(newChild)
    }

    /**
     * Clones a new node.
     * @param {Boolean} deep A flag that indicates whether to recursively clone all nodes that are descendants of this node. If true, this method creates a clone of the complete tree below this node. If false, this method clones this node and its attributes only.
     * @returns {IXmlNode} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.clonenode
     */
    CloneNode(deep) {
        if (!this.HasProp("__IXmlNode")) {
            if ((queryResult := this.QueryInterface(IXmlNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlNode := IXmlNode(outPtr)
        }

        return this.__IXmlNode.CloneNode(deep)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_NamespaceUri() {
        if (!this.HasProp("__IXmlNode")) {
            if ((queryResult := this.QueryInterface(IXmlNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlNode := IXmlNode(outPtr)
        }

        return this.__IXmlNode.get_NamespaceUri()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_LocalName() {
        if (!this.HasProp("__IXmlNode")) {
            if ((queryResult := this.QueryInterface(IXmlNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlNode := IXmlNode(outPtr)
        }

        return this.__IXmlNode.get_LocalName()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Prefix() {
        if (!this.HasProp("__IXmlNode")) {
            if ((queryResult := this.QueryInterface(IXmlNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlNode := IXmlNode(outPtr)
        }

        return this.__IXmlNode.get_Prefix()
    }

    /**
     * Normalizes all descendant elements by combining two or more adjacent text nodes into one unified text node.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.normalize
     */
    Normalize() {
        if (!this.HasProp("__IXmlNode")) {
            if ((queryResult := this.QueryInterface(IXmlNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlNode := IXmlNode(outPtr)
        }

        return this.__IXmlNode.Normalize()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Prefix(value) {
        if (!this.HasProp("__IXmlNode")) {
            if ((queryResult := this.QueryInterface(IXmlNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlNode := IXmlNode(outPtr)
        }

        return this.__IXmlNode.put_Prefix(value)
    }

    /**
     * Returns the XML representation of the node and all its descendants.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.getxml
     */
    GetXml() {
        if (!this.HasProp("__IXmlNodeSerializer")) {
            if ((queryResult := this.QueryInterface(IXmlNodeSerializer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlNodeSerializer := IXmlNodeSerializer(outPtr)
        }

        return this.__IXmlNodeSerializer.GetXml()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_InnerText() {
        if (!this.HasProp("__IXmlNodeSerializer")) {
            if ((queryResult := this.QueryInterface(IXmlNodeSerializer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlNodeSerializer := IXmlNodeSerializer(outPtr)
        }

        return this.__IXmlNodeSerializer.get_InnerText()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_InnerText(value) {
        if (!this.HasProp("__IXmlNodeSerializer")) {
            if ((queryResult := this.QueryInterface(IXmlNodeSerializer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlNodeSerializer := IXmlNodeSerializer(outPtr)
        }

        return this.__IXmlNodeSerializer.put_InnerText(value)
    }

    /**
     * Applies the specified pattern-matching operation to this node's context and returns the first matching node.
     * @remarks
     * For an example that demonstrates how to use this method, see the [XML DOM sample (Windows 10)](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/XmlDocument).
     * @param {HSTRING} xpath Specifies an XPath expression.
     * @returns {IXmlNode} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.selectsinglenode
     */
    SelectSingleNode(xpath) {
        if (!this.HasProp("__IXmlNodeSelector")) {
            if ((queryResult := this.QueryInterface(IXmlNodeSelector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlNodeSelector := IXmlNodeSelector(outPtr)
        }

        return this.__IXmlNodeSelector.SelectSingleNode(xpath)
    }

    /**
     * Applies the specified pattern-matching operation to this node's context and returns the list of matching nodes as an [XmlNodeList](xmlnodelist.md).
     * @param {HSTRING} xpath Specifies an XPath expression.
     * @returns {XmlNodeList} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.selectnodes
     */
    SelectNodes(xpath) {
        if (!this.HasProp("__IXmlNodeSelector")) {
            if ((queryResult := this.QueryInterface(IXmlNodeSelector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlNodeSelector := IXmlNodeSelector(outPtr)
        }

        return this.__IXmlNodeSelector.SelectNodes(xpath)
    }

    /**
     * Applies the specified pattern-matching operation to this node's context and returns the first matching node.
     * @remarks
     * Prefixes in the query are resolved using the specified namespace declarations.
     * @param {HSTRING} xpath Specifies an XPath expression.
     * @param {IInspectable} namespaces Contains a string that specifies the namespaces to use in XPath expressions when it is necessary to define new namespaces externally. Namespaces are defined in the XML style, as a space-separated list of namespace declaration attributes. You can use this property to set the default namespace as well.
     * @returns {IXmlNode} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.selectsinglenodens
     */
    SelectSingleNodeNS(xpath, namespaces) {
        if (!this.HasProp("__IXmlNodeSelector")) {
            if ((queryResult := this.QueryInterface(IXmlNodeSelector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlNodeSelector := IXmlNodeSelector(outPtr)
        }

        return this.__IXmlNodeSelector.SelectSingleNodeNS(xpath, namespaces)
    }

    /**
     * Applies the specified pattern-matching operation to this node's context and returns the list of matching nodes as an [XmlNodeList](xmlnodelist.md).
     * @remarks
     * Prefixes in the query are resolved using the specified namespace declarations.
     * @param {HSTRING} xpath Specifies an XPath expression.
     * @param {IInspectable} namespaces Contains a string that specifies namespaces for use in XPath expressions when it is necessary to define new namespaces externally. Namespaces are defined in the XML style, as a space-separated list of namespace declaration attributes. You can use this property to set the default namespace as well.
     * @returns {XmlNodeList} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.selectnodesns
     */
    SelectNodesNS(xpath, namespaces) {
        if (!this.HasProp("__IXmlNodeSelector")) {
            if ((queryResult := this.QueryInterface(IXmlNodeSelector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlNodeSelector := IXmlNodeSelector(outPtr)
        }

        return this.__IXmlNodeSelector.SelectNodesNS(xpath, namespaces)
    }

    /**
     * Loads an XML document using the supplied string. The document is parsed using the default parser settings.
     * @param {HSTRING} xml The XML string to load into this XML document object. This string can contain an entire XML document or a well-formed fragment.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.loadxml
     */
    LoadXml(xml) {
        if (!this.HasProp("__IXmlDocumentIO")) {
            if ((queryResult := this.QueryInterface(IXmlDocumentIO.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlDocumentIO := IXmlDocumentIO(outPtr)
        }

        return this.__IXmlDocumentIO.LoadXml(xml)
    }

    /**
     * Loads an XML document using the supplied string. The document is parsed using the settings provided.
     * @param {HSTRING} xml The XML string to load into this XML document object. This string can contain an entire XML document or a well-formed fragment.
     * @param {XmlLoadSettings} loadSettings The settings for parsing the document.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.loadxml
     */
    LoadXmlWithSettings(xml, loadSettings) {
        if (!this.HasProp("__IXmlDocumentIO")) {
            if ((queryResult := this.QueryInterface(IXmlDocumentIO.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlDocumentIO := IXmlDocumentIO(outPtr)
        }

        return this.__IXmlDocumentIO.LoadXmlWithSettings(xml, loadSettings)
    }

    /**
     * Asynchronously saves an XML document to the specified file.
     * @param {IStorageFile} file_ The file to save the document to.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.savetofileasync
     */
    SaveToFileAsync(file_) {
        if (!this.HasProp("__IXmlDocumentIO")) {
            if ((queryResult := this.QueryInterface(IXmlDocumentIO.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlDocumentIO := IXmlDocumentIO(outPtr)
        }

        return this.__IXmlDocumentIO.SaveToFileAsync(file_)
    }

    /**
     * Loads an XML document using the buffer. The document is parsed using the default parser settings.
     * @param {IBuffer} buffer_ The buffer to load into this XML document object. This buffer can contain an entire XML document or a well-formed fragment.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.loadxmlfrombuffer
     */
    LoadXmlFromBuffer(buffer_) {
        if (!this.HasProp("__IXmlDocumentIO2")) {
            if ((queryResult := this.QueryInterface(IXmlDocumentIO2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlDocumentIO2 := IXmlDocumentIO2(outPtr)
        }

        return this.__IXmlDocumentIO2.LoadXmlFromBuffer(buffer_)
    }

    /**
     * Loads an XML document using the buffer. The document is parsed using the settings provided.
     * @param {IBuffer} buffer_ The buffer to load into this XML document object. This buffer can contain an entire XML document or a well-formed fragment.
     * @param {XmlLoadSettings} loadSettings The settings for parsing the document.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldocument.loadxmlfrombuffer
     */
    LoadXmlFromBufferWithSettings(buffer_, loadSettings) {
        if (!this.HasProp("__IXmlDocumentIO2")) {
            if ((queryResult := this.QueryInterface(IXmlDocumentIO2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlDocumentIO2 := IXmlDocumentIO2(outPtr)
        }

        return this.__IXmlDocumentIO2.LoadXmlFromBufferWithSettings(buffer_, loadSettings)
    }

;@endregion Instance Methods
}
