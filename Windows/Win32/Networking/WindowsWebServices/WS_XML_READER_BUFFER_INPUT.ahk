#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_XML_READER_INPUT_TYPE.ahk" { WS_XML_READER_INPUT_TYPE }
#Import ".\WS_XML_READER_INPUT.ahk" { WS_XML_READER_INPUT }

/**
 * Specifies that the source of the xml input is a buffer.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_reader_buffer_input
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_XML_READER_BUFFER_INPUT {
    #StructPack 8

    /**
     * The base type for all types that derive from <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_reader_input">WS_XML_READER_INPUT</a>.
     */
    input : WS_XML_READER_INPUT

    /**
     * A pointer to the bytes of data that comprise the encoded form of the xml.  The reader will not modify any of these bytes.
     */
    encodedData : IntPtr

    /**
     * The length of the encodedData.
     */
    encodedDataSize : UInt32

}
