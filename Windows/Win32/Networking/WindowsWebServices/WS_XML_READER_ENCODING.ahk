#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_XML_READER_ENCODING_TYPE.ahk" { WS_XML_READER_ENCODING_TYPE }

/**
 * This structure is the base type for all the different kinds of reader encodings.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_reader_encoding
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_XML_READER_ENCODING {
    #StructPack 4

    /**
     * Indicates the type of encoding this structure refers to.
     */
    encodingType : WS_XML_READER_ENCODING_TYPE

}
