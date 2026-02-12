#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\IXmlNode.ahk
#Include .\XmlNodeList.ahk
#Include .\XmlNamedNodeMap.ahk
#Include .\XmlDocument.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Contains information for the entire Document Object Model. This interface represents a single node in the document tree. While all objects that implement this interface expose methods for dealing with children, not all objects that implement this interface may have children.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.ixmlnode
 * @namespace Windows.Data.Xml.Dom
 * @version WindowsRuntime 1.4
 */
class IXmlNode extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXmlNode
     * @type {Guid}
     */
    static IID => Guid("{1c741d59-2122-47d5-a856-83f3d4214875}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_NodeValue", "put_NodeValue", "get_NodeType", "get_NodeName", "get_ParentNode", "get_ChildNodes", "get_FirstChild", "get_LastChild", "get_PreviousSibling", "get_NextSibling", "get_Attributes", "HasChildNodes", "get_OwnerDocument", "InsertBefore", "ReplaceChild", "RemoveChild", "AppendChild", "CloneNode", "get_NamespaceUri", "get_LocalName", "get_Prefix", "Normalize", "put_Prefix"]

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
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.ixmlnode.nodevalue
     * @type {IInspectable} 
     */
    NodeValue {
        get => this.get_NodeValue()
        set => this.put_NodeValue(value)
    }

    /**
     * Gets the XML Document Object Model (DOM) node type, which determines valid values and whether the node can have child nodes.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.ixmlnode.nodetype
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
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.ixmlnode.nodename
     * @type {HSTRING} 
     */
    NodeName {
        get => this.get_NodeName()
    }

    /**
     * Gets the parent node of the node instance.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.ixmlnode.parentnode
     * @type {IXmlNode} 
     */
    ParentNode {
        get => this.get_ParentNode()
    }

    /**
     * Gets a list of children in the current node.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.ixmlnode.childnodes
     * @type {XmlNodeList} 
     */
    ChildNodes {
        get => this.get_ChildNodes()
    }

    /**
     * Gets the first child node.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.ixmlnode.firstchild
     * @type {IXmlNode} 
     */
    FirstChild {
        get => this.get_FirstChild()
    }

    /**
     * Gets the last child node.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.ixmlnode.lastchild
     * @type {IXmlNode} 
     */
    LastChild {
        get => this.get_LastChild()
    }

    /**
     * Gets the previous sibling of the node in the parent's child list.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.ixmlnode.previoussibling
     * @type {IXmlNode} 
     */
    PreviousSibling {
        get => this.get_PreviousSibling()
    }

    /**
     * Gets the next sibling of the node in the parent's child list.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.ixmlnode.nextsibling
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
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.ixmlnode.attributes
     * @type {XmlNamedNodeMap} 
     */
    Attributes {
        get => this.get_Attributes()
    }

    /**
     * Returns the root of the document that contains the node.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.ixmlnode.ownerdocument
     * @type {XmlDocument} 
     */
    OwnerDocument {
        get => this.get_OwnerDocument()
    }

    /**
     * Returns the Uniform Resource Identifier (URI) for the namespace.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.ixmlnode.namespaceuri
     * @type {IInspectable} 
     */
    NamespaceUri {
        get => this.get_NamespaceUri()
    }

    /**
     * Gets the local name, which is the local part of a qualified name. This is called the local part in Namespaces in XML.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.ixmlnode.localname
     * @type {IInspectable} 
     */
    LocalName {
        get => this.get_LocalName()
    }

    /**
     * Gets or sets the namespace prefix.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.ixmlnode.prefix
     * @type {IInspectable} 
     */
    Prefix {
        get => this.get_Prefix()
        set => this.put_Prefix(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_NodeValue() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_NodeValue(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NodeType() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NodeName() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IXmlNode} 
     */
    get_ParentNode() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXmlNode(value)
    }

    /**
     * 
     * @returns {XmlNodeList} 
     */
    get_ChildNodes() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XmlNodeList(value)
    }

    /**
     * 
     * @returns {IXmlNode} 
     */
    get_FirstChild() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXmlNode(value)
    }

    /**
     * 
     * @returns {IXmlNode} 
     */
    get_LastChild() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXmlNode(value)
    }

    /**
     * 
     * @returns {IXmlNode} 
     */
    get_PreviousSibling() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXmlNode(value)
    }

    /**
     * 
     * @returns {IXmlNode} 
     */
    get_NextSibling() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXmlNode(value)
    }

    /**
     * 
     * @returns {XmlNamedNodeMap} 
     */
    get_Attributes() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XmlNamedNodeMap(value)
    }

    /**
     * Determines whether a node has children.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.ixmlnode.haschildnodes
     */
    HasChildNodes() {
        result := ComCall(17, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {XmlDocument} 
     */
    get_OwnerDocument() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XmlDocument(value)
    }

    /**
     * Inserts a child node to the left of the specified node, or at the end of the list.
     * @param {IXmlNode} newChild The address of the new node to be inserted. The node passed here must be a valid child of the current XML DOM document node. For example, if the current node is an attribute, you cannot pass another attribute in the *newChild* parameter, because an attribute cannot have an attribute as a child. If *newChild* is a DOCUMENT_FRAGMENT node type, all its children are inserted in order before *referenceChild*.
     * 
     * If *newChild* is already in the tree, it is first removed before it is reinserted before the *referenceChild* node. Read-only nodes, such as NODE_DOCUMENT_TYPE and NODE_ENTITY nodes, cannot be passed in the *newChild* parameter.
     * @param {IXmlNode} referenceChild The reference node. The node specified is where the *newChild* node is to be inserted to the left as the preceding sibling in the child list. The node passed here must be a either a child node of the current node or null. If the value is null, the *newChild* node is inserted at the end of the child list. If the *referenceChild* node is not a child of the current node, an error is returned.
     * @returns {IXmlNode} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.ixmlnode.insertbefore
     */
    InsertBefore(newChild, referenceChild) {
        result := ComCall(19, this, "ptr", newChild, "ptr", referenceChild, "ptr*", &insertedChild := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXmlNode(insertedChild)
    }

    /**
     * Replaces the specified old child node with the supplied new child node.
     * @param {IXmlNode} newChild The new child that is to replace the old child. If null, the *referenceChild* parameter is removed without a replacement.
     * @param {IXmlNode} referenceChild The old child that is to be replaced by the new child.
     * @returns {IXmlNode} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.ixmlnode.replacechild
     */
    ReplaceChild(newChild, referenceChild) {
        result := ComCall(20, this, "ptr", newChild, "ptr", referenceChild, "ptr*", &previousChild := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXmlNode(previousChild)
    }

    /**
     * Removes the specified child node from the list of children and returns it.
     * @param {IXmlNode} childNode The child node to be removed from the list of children of this node.
     * @returns {IXmlNode} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.ixmlnode.removechild
     */
    RemoveChild(childNode) {
        result := ComCall(21, this, "ptr", childNode, "ptr*", &removedChild := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXmlNode(removedChild)
    }

    /**
     * Appends a new child node as the last child of the node.
     * @param {IXmlNode} newChild The new child node to be appended to the end of the list of children of this node.
     * @returns {IXmlNode} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.ixmlnode.appendchild
     */
    AppendChild(newChild) {
        result := ComCall(22, this, "ptr", newChild, "ptr*", &appendedChild := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXmlNode(appendedChild)
    }

    /**
     * Clones a new node.
     * @param {Boolean} deep A flag that indicates whether to recursively clone all nodes that are descendants of this node. If true, this method creates a clone of the complete tree below this node. If false, this method clones this node and its attributes only.
     * @returns {IXmlNode} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.ixmlnode.clonenode
     */
    CloneNode(deep) {
        result := ComCall(23, this, "int", deep, "ptr*", &newNode := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXmlNode(newNode)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_NamespaceUri() {
        result := ComCall(24, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_LocalName() {
        result := ComCall(25, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Prefix() {
        result := ComCall(26, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * Normalizes all descendant elements by combining two or more adjacent text nodes into one unified text node.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.ixmlnode.normalize
     */
    Normalize() {
        result := ComCall(27, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Prefix(value) {
        result := ComCall(28, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
