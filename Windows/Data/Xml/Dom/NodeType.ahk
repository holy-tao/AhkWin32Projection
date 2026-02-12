#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The type of an [IXmlNode](ixmlnode.md), as returned by the [NodeType](ixmlnode_nodetype.md) property.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.nodetype
 * @namespace Windows.Data.Xml.Dom
 * @version WindowsRuntime 1.4
 */
class NodeType extends Win32Enum{

    /**
     * Default value. Never used by the API.
     * @type {Integer (Int32)}
     */
    static Invalid => 0

    /**
     * The node is an [XmlElement](xmlelement.md) type.
     * @type {Integer (Int32)}
     */
    static ElementNode => 1

    /**
     * The node is an [XmlAttribute](xmlattribute.md) type.
     * @type {Integer (Int32)}
     */
    static AttributeNode => 2

    /**
     * The node is an [XmlText](xmltext.md) type.
     * @type {Integer (Int32)}
     */
    static TextNode => 3

    /**
     * The node is an [XmlCDataSection](xmlcdatasection.md) type.
     * @type {Integer (Int32)}
     */
    static DataSectionNode => 4

    /**
     * The node is an [XmlEntityReference](xmlentityreference.md) object.
     * @type {Integer (Int32)}
     */
    static EntityReferenceNode => 5

    /**
     * The node is an [DtdEntity](dtdentity.md) type.
     * @type {Integer (Int32)}
     */
    static EntityNode => 6

    /**
     * The node is an [XmlProcessingInstruction](xmlprocessinginstruction.md) type.
     * @type {Integer (Int32)}
     */
    static ProcessingInstructionNode => 7

    /**
     * The node is an [XmlComment](xmlcomment.md) type.
     * @type {Integer (Int32)}
     */
    static CommentNode => 8

    /**
     * The node is an [XmlDocument](xmldocument.md) type.
     * @type {Integer (Int32)}
     */
    static DocumentNode => 9

    /**
     * The node is an [XmlDocumentType](xmldocumenttype.md) type.
     * @type {Integer (Int32)}
     */
    static DocumentTypeNode => 10

    /**
     * The node is an [XmlDocumentFragment](xmldocumentfragment.md) type.
     * @type {Integer (Int32)}
     */
    static DocumentFragmentNode => 11

    /**
     * The node is a [DtdNotation](dtdnotation.md) type.
     * @type {Integer (Int32)}
     */
    static NotationNode => 12
}
