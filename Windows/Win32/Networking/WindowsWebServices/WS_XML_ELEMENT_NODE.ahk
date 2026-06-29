#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_XML_STRING.ahk" { WS_XML_STRING }
#Import ".\WS_XML_NODE_TYPE.ahk" { WS_XML_NODE_TYPE }
#Import ".\WS_XML_ATTRIBUTE.ahk" { WS_XML_ATTRIBUTE }
#Import ".\WS_XML_NODE.ahk" { WS_XML_NODE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Represents a start element in xml (e.g.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_element_node
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_XML_ELEMENT_NODE {
    #StructPack 8

    /**
     * The base type for all types that derive from <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_node">WS_XML_NODE</a>.
     */
    node : WS_XML_NODE

    /**
     * The prefix of the element.  In the example, it refers to "a".  Empty prefixes are represented by a zero length <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_string">WS_XML_STRING</a>.
     */
    prefix : WS_XML_STRING.Ptr

    /**
     * The localName of the element.  In the example, it refers to "purchaseOrder".
     */
    localName : WS_XML_STRING.Ptr

    /**
     * The resolved namespace of the prefix.  In the example, it refers to "http://tempuri.org".
     */
    ns : WS_XML_STRING.Ptr

    /**
     * The number of attributes on the element.  In the example, it would be 2.
     */
    attributeCount : UInt32

    /**
     * The array of attributes for the element.
     */
    attributes : IntPtr

    /**
     * Whether the element is an empty element or not.  In the example, it would be <b>FALSE</b>.
     */
    isEmpty : BOOL

}
