#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_XML_READER_ENCODING.ahk" { WS_XML_READER_ENCODING }
#Import ".\WS_XML_READER_ENCODING_TYPE.ahk" { WS_XML_READER_ENCODING_TYPE }
#Import ".\WS_CHARSET.ahk" { WS_CHARSET }

/**
 * Used to indicate that the reader should interpret the bytes it reads as textual xml.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_reader_text_encoding
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_XML_READER_TEXT_ENCODING {
    #StructPack 4

    /**
     * The base type for all types that derive from <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_reader_encoding">WS_XML_READER_ENCODING</a>.
     */
    encoding : WS_XML_READER_ENCODING

    /**
     * Indicates the text encoding of the bytes.  If <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_charset">WS_CHARSET_AUTO</a> is specified then the reader will
     *           determine the encoding of the document based on the first few bytes of the document.  If an xml declaration
     *           is present in the document, the reader will ensure that the encoding attribute coincides with this value.
     */
    charSet : WS_CHARSET

}
