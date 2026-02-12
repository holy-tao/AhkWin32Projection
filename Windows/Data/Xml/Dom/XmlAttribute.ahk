#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IXmlAttribute.ahk
#Include .\IXmlNode.ahk
#Include .\IXmlNodeSerializer.ahk
#Include .\IXmlNodeSelector.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an attribute of an XmlElement. Valid and default values for the attribute are defined in a document type definition (DTD) or schema.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlattribute
 * @namespace Windows.Data.Xml.Dom
 * @version WindowsRuntime 1.4
 */
class XmlAttribute extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IXmlAttribute

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IXmlAttribute.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Returns the attribute name.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlattribute.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Gets a value that indicates whether the attribute is explicitly specified or derived from a default value in the document type definition (DTD) or schema.
     * @remarks
     * If you change the value of the attribute (even if it has the same value as the default value) then this property is automatically set to true. To re-specify the attribute as the default value from the DTD, you must delete the attribute. The implementation will then make a new attribute available with this property set to false and the default value (if one exists).
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlattribute.specified
     * @type {Boolean} 
     */
    Specified {
        get => this.get_Specified()
    }

    /**
     * Gets or sets the attribute value.
     * @remarks
     * When the value is retrieved, it is returned as a string. When the value is set, a text node is created with the unparsed contents of the string provided.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlattribute.value
     * @type {HSTRING} 
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
    }

    /**
     * Gets or sets the text associated with the node.
     * @remarks
     * On retrieval, the value of this attribute is returned as a string. Character and general entity references are replaced with their values.
     * 
     * On setting, this property creates a Text node with the unparsed contents of the string.
     * 
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
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlattribute.nodevalue
     * @type {IInspectable} 
     */
    NodeValue {
        get => this.get_NodeValue()
        set => this.put_NodeValue(value)
    }

    /**
     * Gets the XML Document Object Model (DOM) node type, which determines valid values and whether the node can have child nodes.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlattribute.nodetype
     * @type {Integer} 
     */
    NodeType {
        get => this.get_NodeType()
    }

    /**
     * Returns the qualified name for attribute, document type, element, entity, or notation nodes. Returns a fixed string for all other node types.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlattribute.nodename
     * @type {HSTRING} 
     */
    NodeName {
        get => this.get_NodeName()
    }

    /**
     * This property is not applicable to this class and will throw an exception.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlattribute.parentnode
     * @type {IXmlNode} 
     */
    ParentNode {
        get => this.get_ParentNode()
    }

    /**
     * Gets a list of children in the current node.
     * @remarks
     * Child nodes can be a text or entity reference.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlattribute.childnodes
     * @type {XmlNodeList} 
     */
    ChildNodes {
        get => this.get_ChildNodes()
    }

    /**
     * Gets the first child node.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlattribute.firstchild
     * @type {IXmlNode} 
     */
    FirstChild {
        get => this.get_FirstChild()
    }

    /**
     * Gets the last child node.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlattribute.lastchild
     * @type {IXmlNode} 
     */
    LastChild {
        get => this.get_LastChild()
    }

    /**
     * This property is not applicable to this class and will throw an exception.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlattribute.previoussibling
     * @type {IXmlNode} 
     */
    PreviousSibling {
        get => this.get_PreviousSibling()
    }

    /**
     * This property is not applicable to this class and will always return null.
     * @remarks
     * Attribute objects inherit the Node interface, but are not actually child nodes of the element they describe and are not considered part of the document tree. Therefore this property will always return null.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlattribute.nextsibling
     * @type {IXmlNode} 
     */
    NextSibling {
        get => this.get_NextSibling()
    }

    /**
     * This method is not applicable to this class and will throw an exception.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlattribute.attributes
     * @type {XmlNamedNodeMap} 
     */
    Attributes {
        get => this.get_Attributes()
    }

    /**
     * Returns the root of the document that contains the node.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlattribute.ownerdocument
     * @type {XmlDocument} 
     */
    OwnerDocument {
        get => this.get_OwnerDocument()
    }

    /**
     * Returns the Uniform Resource Identifier (URI) for the namespace.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlattribute.namespaceuri
     * @type {IInspectable} 
     */
    NamespaceUri {
        get => this.get_NamespaceUri()
    }

    /**
     * Gets the local name, which is the local part of a qualified name. This is called the local part in Namespaces in XML.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlattribute.localname
     * @type {IInspectable} 
     */
    LocalName {
        get => this.get_LocalName()
    }

    /**
     * Gets or sets the namespace prefix.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlattribute.prefix
     * @type {IInspectable} 
     */
    Prefix {
        get => this.get_Prefix()
        set => this.put_Prefix(value)
    }

    /**
     * Gets the text from inside the XML.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlattribute.innertext
     * @type {HSTRING} 
     */
    InnerText {
        get => this.get_InnerText()
        set => this.put_InnerText(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__IXmlAttribute")) {
            if ((queryResult := this.QueryInterface(IXmlAttribute.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlAttribute := IXmlAttribute(outPtr)
        }

        return this.__IXmlAttribute.get_Name()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Specified() {
        if (!this.HasProp("__IXmlAttribute")) {
            if ((queryResult := this.QueryInterface(IXmlAttribute.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlAttribute := IXmlAttribute(outPtr)
        }

        return this.__IXmlAttribute.get_Specified()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Value() {
        if (!this.HasProp("__IXmlAttribute")) {
            if ((queryResult := this.QueryInterface(IXmlAttribute.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlAttribute := IXmlAttribute(outPtr)
        }

        return this.__IXmlAttribute.get_Value()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Value(value) {
        if (!this.HasProp("__IXmlAttribute")) {
            if ((queryResult := this.QueryInterface(IXmlAttribute.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlAttribute := IXmlAttribute(outPtr)
        }

        return this.__IXmlAttribute.put_Value(value)
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
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlattribute.haschildnodes
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
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlattribute.insertbefore
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
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlattribute.replacechild
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
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlattribute.removechild
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
     * This method is not applicable to this class and will throw an exception.
     * @param {IXmlNode} newChild The new child node to be appended to the end of the list of children of this node.
     * @returns {IXmlNode} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlattribute.appendchild
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
     * @remarks
     * If you want the cloned attribute to include the value of the attribute, you must use deep clone; otherwise only the attribute name is cloned.
     * @param {Boolean} deep A flag that indicates whether to recursively clone all nodes that are descendants of this node. If true, this method creates a clone of the complete tree below this node. If false, this method clones this node and its attributes only.
     * @returns {IXmlNode} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlattribute.clonenode
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
     * This method is not applicable to this class and will throw an exception.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlattribute.normalize
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
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlattribute.getxml
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
     * @param {HSTRING} xpath Specifies an XPath expression.
     * @returns {IXmlNode} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlattribute.selectsinglenode
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
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlattribute.selectnodes
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
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlattribute.selectsinglenodens
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
     * @param {HSTRING} xpath Specifies an XPath expresssion.
     * @param {IInspectable} namespaces Contains a string that specifies namespaces for use in XPath expressions when it is necessary to define new namespaces externally. Namespaces are defined in the XML style, as a space-separated list of namespace declaration attributes. You can use this property to set the default namespace as well.
     * @returns {XmlNodeList} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlattribute.selectnodesns
     */
    SelectNodesNS(xpath, namespaces) {
        if (!this.HasProp("__IXmlNodeSelector")) {
            if ((queryResult := this.QueryInterface(IXmlNodeSelector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlNodeSelector := IXmlNodeSelector(outPtr)
        }

        return this.__IXmlNodeSelector.SelectNodesNS(xpath, namespaces)
    }

;@endregion Instance Methods
}
