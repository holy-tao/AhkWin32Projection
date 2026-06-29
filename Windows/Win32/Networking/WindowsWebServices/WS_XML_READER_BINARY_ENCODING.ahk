#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_XML_READER_ENCODING.ahk" { WS_XML_READER_ENCODING }
#Import ".\WS_XML_READER_ENCODING_TYPE.ahk" { WS_XML_READER_ENCODING_TYPE }
#Import ".\WS_XML_DICTIONARY.ahk" { WS_XML_DICTIONARY }

/**
 * Used to indicate that the reader should interpret the bytes it reads as binary xml.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_reader_binary_encoding
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_XML_READER_BINARY_ENCODING {
    #StructPack 8

    /**
     * The base type for all types that derive from <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_reader_encoding">WS_XML_READER_ENCODING</a>.
     */
    encoding : WS_XML_READER_ENCODING

    /**
     * Indicates the dictionary that the reader should use for static strings.  The binary representation of the xml
     *           document references these strings by id (as opposed to embedding the actual string), and therefore they must contain 
     *           the same set of strings used when the document was written.
     */
    staticDictionary : WS_XML_DICTIONARY.Ptr

    /**
     * Indicates the dictionary that the reader should use for dynamic strings. These are strings that were not in the 
     *           staticDictionary when the document was written but that were found by the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_dynamic_string_callback">WS_DYNAMIC_STRING_CALLBACK</a>.
     *           The binary representation of the xml document references these strings by id (as opposed to embedding the actual string), 
     *           and therefore they must contain the same set of strings used when the document was written.
     *           The application that uses the reader and writer must coordinate communicating the values referenced by these strings.
     */
    dynamicDictionary : WS_XML_DICTIONARY.Ptr

}
