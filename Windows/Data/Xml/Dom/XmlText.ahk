#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IXmlText.ahk
#Include .\IXmlCharacterData.ahk
#Include .\IXmlNode.ahk
#Include .\IXmlNodeSerializer.ahk
#Include .\IXmlNodeSelector.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the text content of an element.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmltext
 * @namespace Windows.Data.Xml.Dom
 * @version WindowsRuntime 1.4
 */
class XmlText extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IXmlText

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IXmlText.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the node data depending on the node type.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmltext.data
     * @type {HSTRING} 
     */
    Data {
        get => this.get_Data()
        set => this.put_Data(value)
    }

    /**
     * Gets the length of the data, in Unicode characters.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmltext.length
     * @type {Integer} 
     */
    Length {
        get => this.get_Length()
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
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmltext.nodevalue
     * @type {IInspectable} 
     */
    NodeValue {
        get => this.get_NodeValue()
        set => this.put_NodeValue(value)
    }

    /**
     * Gets the XML Document Object Model (DOM) node type, which determines valid values and whether the node can have child nodes.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmltext.nodetype
     * @type {Integer} 
     */
    NodeType {
        get => this.get_NodeType()
    }

    /**
     * Returns the qualified name for attribute, document type, element, entity, or notation nodes. Returns a fixed string for all other node types.
     * @remarks
     * This value depends on the [NodeType](ixmlnode_nodetype.md) property. The following table describes this dependency.
     * 
     * <table>
     *    <tr><th>NodeType</th><th>NodeName</th></tr>
     *    <tr><td>Element</td><td>tagName</td></tr>
     *    <tr><td>Attribute</td><td>name of attribute</td></tr>
     *    <tr><td>Text</td><td>#text</td></tr>
     *    <tr><td>CDATASection</td><td>#cdata-section</td></tr>
     *    <tr><td>EntityReference</td><td>name of entity referenced</td></tr>
     *    <tr><td>Entity</td><td>entity name</td></tr>
     *    <tr><td>ProcessingInstruction</td><td>target</td></tr>
     *    <tr><td>Comment</td><td>#comment</td></tr>
     *    <tr><td>Document</td><td>#document</td></tr>
     *    <tr><td>DocumentType</td><td>document type name</td></tr>
     *    <tr><td>DocumentFragment</td><td>#document-fragment</td></tr>
     *    <tr><td>Notation</td><td>notation name</td></tr>
     * </table>
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmltext.nodename
     * @type {HSTRING} 
     */
    NodeName {
        get => this.get_NodeName()
    }

    /**
     * Gets the parent node of the node instance.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmltext.parentnode
     * @type {IXmlNode} 
     */
    ParentNode {
        get => this.get_ParentNode()
    }

    /**
     * Gets a list of children in the current node.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmltext.childnodes
     * @type {XmlNodeList} 
     */
    ChildNodes {
        get => this.get_ChildNodes()
    }

    /**
     * Gets the first child node.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmltext.firstchild
     * @type {IXmlNode} 
     */
    FirstChild {
        get => this.get_FirstChild()
    }

    /**
     * Gets the last child node.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmltext.lastchild
     * @type {IXmlNode} 
     */
    LastChild {
        get => this.get_LastChild()
    }

    /**
     * Gets the previous sibling of the node in the parent's child list.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmltext.previoussibling
     * @type {IXmlNode} 
     */
    PreviousSibling {
        get => this.get_PreviousSibling()
    }

    /**
     * Gets the next sibling of the node in the parent's child list.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmltext.nextsibling
     * @type {IXmlNode} 
     */
    NextSibling {
        get => this.get_NextSibling()
    }

    /**
     * Gets the list of attributes of this node.
     * @remarks
     * This property returns a [XmlNamedNodeMap](xmlnamednodemap.md) for the nodes that can return attributes. These are the Element, Entity, and Notation nodes. This property is NULL for all other node types. For the valid node types, the [XmlNamedNodeMap](xmlnamednodemap.md) is always returned; when there are no attributes on the element, the list length is set to zero.
     * 
     * The following table describes the attributes for the node types.
     * 
     * <table>
     *    <tr><th>NodeType</th><th>Attributes</th></tr>
     *    <tr><td>Element</td><td>IXmlNamedNodeMap</td></tr>
     *    <tr><td>Attribute</td><td>NULL</td></tr>
     *    <tr><td>Text</td><td>NULL</td></tr>
     *    <tr><td>CDATASection</td><td>NULL</td></tr>
     *    <tr><td>EntityReference</td><td>NULL</td></tr>
     *    <tr><td>Entity</td><td>NULL</td></tr>
     *    <tr><td>ProcessingInstruction</td><td>NULL</td></tr>
     *    <tr><td>Comment</td><td>NULL</td></tr>
     *    <tr><td>Document</td><td>NULL</td></tr>
     *    <tr><td>DocumentType</td><td>NULL</td></tr>
     *    <tr><td>DocumentFragment</td><td>NULL</td></tr>
     *    <tr><td>Notation</td><td>NULL</td></tr>
     * </table>
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmltext.attributes
     * @type {XmlNamedNodeMap} 
     */
    Attributes {
        get => this.get_Attributes()
    }

    /**
     * Returns the root of the document that contains the node.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmltext.ownerdocument
     * @type {XmlDocument} 
     */
    OwnerDocument {
        get => this.get_OwnerDocument()
    }

    /**
     * Returns the Uniform Resource Identifier (URI) for the namespace.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmltext.namespaceuri
     * @type {IInspectable} 
     */
    NamespaceUri {
        get => this.get_NamespaceUri()
    }

    /**
     * Gets the local name, which is the local part of a qualified name. This is called the local part in Namespaces in XML.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmltext.localname
     * @type {IInspectable} 
     */
    LocalName {
        get => this.get_LocalName()
    }

    /**
     * Gets or sets the namespace prefix.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmltext.prefix
     * @type {IInspectable} 
     */
    Prefix {
        get => this.get_Prefix()
        set => this.put_Prefix(value)
    }

    /**
     * Gets the text from inside the XML.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmltext.innertext
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
     * Splits this text node into two text nodes at the specified offset and inserts the new text node into the tree as a sibling that immediately follows this node.
     * @param {Integer} offset The number of characters at which to split this text node into two nodes, starting from zero.
     * @returns {IXmlText} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmltext.splittext
     */
    SplitText(offset) {
        if (!this.HasProp("__IXmlText")) {
            if ((queryResult := this.QueryInterface(IXmlText.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlText := IXmlText(outPtr)
        }

        return this.__IXmlText.SplitText(offset)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Data() {
        if (!this.HasProp("__IXmlCharacterData")) {
            if ((queryResult := this.QueryInterface(IXmlCharacterData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlCharacterData := IXmlCharacterData(outPtr)
        }

        return this.__IXmlCharacterData.get_Data()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Data(value) {
        if (!this.HasProp("__IXmlCharacterData")) {
            if ((queryResult := this.QueryInterface(IXmlCharacterData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlCharacterData := IXmlCharacterData(outPtr)
        }

        return this.__IXmlCharacterData.put_Data(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Length() {
        if (!this.HasProp("__IXmlCharacterData")) {
            if ((queryResult := this.QueryInterface(IXmlCharacterData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlCharacterData := IXmlCharacterData(outPtr)
        }

        return this.__IXmlCharacterData.get_Length()
    }

    /**
     * Retrieves a substring of the full string from the specified range.
     * @param {Integer} offset The offset, in characters, from the beginning of the string. An offset of zero indicates copying from the start of the data.
     * @param {Integer} count The number of characters to retrieve from the specified offset.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmltext.substringdata
     */
    SubstringData(offset, count) {
        if (!this.HasProp("__IXmlCharacterData")) {
            if ((queryResult := this.QueryInterface(IXmlCharacterData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlCharacterData := IXmlCharacterData(outPtr)
        }

        return this.__IXmlCharacterData.SubstringData(offset, count)
    }

    /**
     * Appends the supplied string to the existing string data.
     * @param {HSTRING} data The data to be appended to the existing string.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmltext.appenddata
     */
    AppendData(data) {
        if (!this.HasProp("__IXmlCharacterData")) {
            if ((queryResult := this.QueryInterface(IXmlCharacterData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlCharacterData := IXmlCharacterData(outPtr)
        }

        return this.__IXmlCharacterData.AppendData(data)
    }

    /**
     * Inserts a string at the specified offset.
     * @param {Integer} offset The offset, in characters, at which to insert the supplied string data.
     * @param {HSTRING} data The data to be inserted into the existing string.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmltext.insertdata
     */
    InsertData(offset, data) {
        if (!this.HasProp("__IXmlCharacterData")) {
            if ((queryResult := this.QueryInterface(IXmlCharacterData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlCharacterData := IXmlCharacterData(outPtr)
        }

        return this.__IXmlCharacterData.InsertData(offset, data)
    }

    /**
     * Deletes specified data.
     * @param {Integer} offset The offset, in characters, at which to start deleting the string data.
     * @param {Integer} count The number of characters to delete.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmltext.deletedata
     */
    DeleteData(offset, count) {
        if (!this.HasProp("__IXmlCharacterData")) {
            if ((queryResult := this.QueryInterface(IXmlCharacterData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlCharacterData := IXmlCharacterData(outPtr)
        }

        return this.__IXmlCharacterData.DeleteData(offset, count)
    }

    /**
     * Replaces the specified number of characters with the supplied string.
     * @param {Integer} offset The offset, in characters, at which to start replacing string data.
     * @param {Integer} count The number of characters to replace.
     * @param {HSTRING} data The new data that replaces the old string data.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmltext.replacedata
     */
    ReplaceData(offset, count, data) {
        if (!this.HasProp("__IXmlCharacterData")) {
            if ((queryResult := this.QueryInterface(IXmlCharacterData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlCharacterData := IXmlCharacterData(outPtr)
        }

        return this.__IXmlCharacterData.ReplaceData(offset, count, data)
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
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmltext.haschildnodes
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
     * Inserts a child node to the left of the specified node, or at the end of the list.
     * @param {IXmlNode} newChild The address of the new node to be inserted. The node passed here must be a valid child of the current XML DOM document node. For example, if the current node is an attribute, you cannot pass another attribute in the *newChild* parameter, because an attribute cannot have an attribute as a child. If *newChild* is a DOCUMENT_FRAGMENT node type, all its children are inserted in order before *referenceChild*.
     * 
     * If *newChild* is already in the tree, it is first removed before it is reinserted before the *referenceChild* node. Read-only nodes, such as NODE_DOCUMENT_TYPE and NODE_ENTITY nodes, cannot be passed in the *newChild* parameter.
     * @param {IXmlNode} referenceChild The reference node. The node specified is where the *newChild* node is to be inserted to the left as the preceding sibling in the child list. The node passed here must be a either a child node of the current node or null. If the value is null, the *newChild* node is inserted at the end of the child list. If the *referenceChild* node is not a child of the current node, an error is returned.
     * @returns {IXmlNode} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmltext.insertbefore
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
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmltext.replacechild
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
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmltext.removechild
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
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmltext.appendchild
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
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmltext.clonenode
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
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmltext.normalize
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
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmltext.getxml
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
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmltext.selectsinglenode
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
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmltext.selectnodes
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
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmltext.selectsinglenodens
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
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmltext.selectnodesns
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
