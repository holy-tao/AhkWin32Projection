#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_XML_TEXT_TYPE.ahk" { WS_XML_TEXT_TYPE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\WS_XML_TEXT.ahk" { WS_XML_TEXT }

/**
 * A Boolean value that represents the text &quot;true&quot; or &quot;false&quot;.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_bool_text
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_XML_BOOL_TEXT {
    #StructPack 4

    /**
     * The base type for all types that derive from <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_text">WS_XML_TEXT</a>.
     */
    text : WS_XML_TEXT

    /**
     * The Boolean value.  0 represents the text "false", while 1 represents the text "true".
     */
    value : BOOL

}
