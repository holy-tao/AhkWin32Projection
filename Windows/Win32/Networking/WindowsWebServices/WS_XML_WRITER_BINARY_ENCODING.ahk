#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_XML_WRITER_ENCODING_TYPE.ahk" { WS_XML_WRITER_ENCODING_TYPE }
#Import ".\WS_XML_DICTIONARY.ahk" { WS_XML_DICTIONARY }
#Import ".\WS_XML_WRITER_ENCODING.ahk" { WS_XML_WRITER_ENCODING }

/**
 * Used to indicate that the writer should emit bytes as binary xml.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_writer_binary_encoding
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_XML_WRITER_BINARY_ENCODING {
    #StructPack 8

    /**
     * The base type for all types that derive from <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_writer_encoding">WS_XML_WRITER_ENCODING</a>.
     */
    encoding : WS_XML_WRITER_ENCODING

    /**
     * Indicates the dictionary that the writer should use for static strings.  <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_string">WS_XML_STRING</a>s that are written that
     *           reference this dictionary, will be written in the binary xml document using an id rather than the string itself.
     *           When reading this document, the application must provide a dictionary with the same strings.
     */
    staticDictionary : WS_XML_DICTIONARY.Ptr

    /**
     * Specifies an optional callback that the writer will invoke when a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_string">WS_XML_STRING</a> that is not found in the staticDictionary is written for the first time.
     *           The callback provides the mapping to an id which the writer will then use.  It is the responsibility of the callback to coordinate with the
     *           writer to propagate these strings to the reader. The string is not added to the dictionary if this callback is not specified.
     */
    dynamicStringCallback : IntPtr

    /**
     * User-defined state that will be passed to dynamicStringCallback.
     */
    dynamicStringCallbackState : IntPtr

}
