#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The type of WS_XML_NODE structure.
 * @remarks
 * 
 * The BNF for node types within a document is:
 *       
 * 
 * <pre class="syntax" xml:space="preserve"><code>
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
 * EndInput := WS_XML_NODE_TYPE_EOF</code></pre>
 * 
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ne-webservices-ws_xml_node_type
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_XML_NODE_TYPE extends Win32Enum{

    /**
     * A start element. (e.g. &lt;a:purchaseOrder xmlns:a="http://tempuri.org" id="5"&gt;)
     * @type {Integer (Int32)}
     */
    static WS_XML_NODE_TYPE_ELEMENT => 1

    /**
     * Element, attribute, or CDATA content.
     * @type {Integer (Int32)}
     */
    static WS_XML_NODE_TYPE_TEXT => 2

    /**
     * An end element. (e.g. &lt;/purchaseOrder&gt;)
     * @type {Integer (Int32)}
     */
    static WS_XML_NODE_TYPE_END_ELEMENT => 3

    /**
     * A comment. (For example, &lt;!--The message follows--&gt;)
     * @type {Integer (Int32)}
     */
    static WS_XML_NODE_TYPE_COMMENT => 4

    /**
     * The start of a CDATA section (i.e. &lt;![CDATA[)
     * @type {Integer (Int32)}
     */
    static WS_XML_NODE_TYPE_CDATA => 6

    /**
     * The end of a CDATA section (i.e. ]]&gt;)
     * @type {Integer (Int32)}
     */
    static WS_XML_NODE_TYPE_END_CDATA => 7

    /**
     * The final node of an xml stream.
     * @type {Integer (Int32)}
     */
    static WS_XML_NODE_TYPE_EOF => 8

    /**
     * The first node of an xml stream.
     * @type {Integer (Int32)}
     */
    static WS_XML_NODE_TYPE_BOF => 9
}
