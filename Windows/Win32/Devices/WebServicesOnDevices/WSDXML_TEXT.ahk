#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WSDXML_ELEMENT.ahk" { WSDXML_ELEMENT }
#Import ".\WSDXML_NODE.ahk" { WSDXML_NODE }

/**
 * Describes the text in an XML node.
 * @remarks
 * <b>WSDXML_TEXT</b> is used to represent the contents of an element. Since no type information exists for elements in DOM, the <b>Text</b> member is the exact representation of the element contents from the XML document.
 * @see https://learn.microsoft.com/windows/win32/api/wsdxmldom/ns-wsdxmldom-wsdxml_text
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSDXML_TEXT {
    #StructPack 8

    /**
     * The current node in a linked list of <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_node">WSDXML_NODE</a> structures.
     */
    Node : WSDXML_NODE

    /**
     * The text contained in the XML node. The maximum length of this string is WSD_MAX_TEXT_LENGTH (8192). The text must consist of UTF-16 encoded characters. The text cannot contain raw XML, as special characters are rendered using the equivalent entity reference. For example,  <c>&lt;</code> is rendered as <code>&amp;lt;</c>.
     */
    Text : PWSTR

}
