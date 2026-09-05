#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The type of WS_XML_NODE structure.
 * @remarks
 * The BNF for node types within a document is:
 *       
 * 
 * 
 * ``` syntax
 * 
 * Xml := StartInput Whitespace Element Whitespace EndInput
 * Whitespace := (Text | Comment)* // Text is whitespace only
 * Element := StartElement ElementContent EndElement
 * ElementContent := (Element | Text | Comment | CData)*
 * StartElement := WS_XML_NODE_TYPE_ELEMENT
 * EndElement := WS_XML_NODE_TYPE_END_ELEMENT
 * Text := WS_XML_NODE_TYPE_TEXT
 * Comment := WS_XML_NODE_TYPE_COMMENT
 * CData := WS_XML_NODE_TYPE_CDATA Text* WS_XML_NODE_TYPE_END_CDATA
 * StartInput := WS_XML_NODE_TYPE_BOF
 * EndInput := WS_XML_NODE_TYPE_EOF
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_node_type
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
class WS_XML_NODE_TYPE extends Win32Enum {

    /**
     * A start element. (e.g. &lt;a:purchaseOrder xmlns:a="http://tempuri.org" id="5"&gt;)
     * Native name: WS_XML_NODE_TYPE_ELEMENT
     * @type {Integer (Int32)}
     */
    static ELEMENT => 1

    /**
     * Element, attribute, or CDATA content.
     * Native name: WS_XML_NODE_TYPE_TEXT
     * @type {Integer (Int32)}
     */
    static TEXT => 2

    /**
     * An end element. (e.g. &lt;/purchaseOrder&gt;)
     * Native name: WS_XML_NODE_TYPE_END_ELEMENT
     * @type {Integer (Int32)}
     */
    static END_ELEMENT => 3

    /**
     * A comment. (For example, &lt;!--The message follows--&gt;)
     * Native name: WS_XML_NODE_TYPE_COMMENT
     * @type {Integer (Int32)}
     */
    static COMMENT => 4

    /**
     * The start of a CDATA section (i.e. &lt;![CDATA[)
     * Native name: WS_XML_NODE_TYPE_CDATA
     * @type {Integer (Int32)}
     */
    static CDATA => 6

    /**
     * The end of a CDATA section (i.e. ]]&gt;)
     * Native name: WS_XML_NODE_TYPE_END_CDATA
     * @type {Integer (Int32)}
     */
    static END_CDATA => 7

    /**
     * The final node of an xml stream.
     * Native name: WS_XML_NODE_TYPE_EOF
     * @type {Integer (Int32)}
     */
    static EOF => 8

    /**
     * The first node of an xml stream.
     * Native name: WS_XML_NODE_TYPE_BOF
     * @type {Integer (Int32)}
     */
    static BOF => 9
}
