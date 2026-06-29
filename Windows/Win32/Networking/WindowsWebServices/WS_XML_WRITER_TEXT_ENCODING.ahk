#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_XML_WRITER_ENCODING_TYPE.ahk" { WS_XML_WRITER_ENCODING_TYPE }
#Import ".\WS_CHARSET.ahk" { WS_CHARSET }
#Import ".\WS_XML_WRITER_ENCODING.ahk" { WS_XML_WRITER_ENCODING }

/**
 * Indicates that the reader should emit bytes as textual xml.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_writer_text_encoding
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_XML_WRITER_TEXT_ENCODING {
    #StructPack 4

    /**
     * The base type for all types that derive from <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_writer_encoding">WS_XML_WRITER_ENCODING</a>.
     */
    encoding : WS_XML_WRITER_ENCODING

    /**
     * Indicates the text encoding of the bytes.  This may not be <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_charset">WS_CHARSET_AUTO</a>.
     */
    charSet : WS_CHARSET

}
