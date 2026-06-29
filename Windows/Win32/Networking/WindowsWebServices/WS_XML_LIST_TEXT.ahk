#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_XML_TEXT_TYPE.ahk" { WS_XML_TEXT_TYPE }
#Import ".\WS_XML_TEXT.ahk" { WS_XML_TEXT }

/**
 * Represents a list of text values separated by a single whitespace character.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_list_text
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_XML_LIST_TEXT {
    #StructPack 8

    /**
     * The base type for all types that derive from <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_text">WS_XML_TEXT</a>.
     */
    text : WS_XML_TEXT

    /**
     * The number of items in the list.
     */
    itemCount : UInt32

    /**
     * The list of items.
     */
    items : IntPtr

}
