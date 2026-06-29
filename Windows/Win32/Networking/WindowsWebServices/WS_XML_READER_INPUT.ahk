#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_XML_READER_INPUT_TYPE.ahk" { WS_XML_READER_INPUT_TYPE }

/**
 * Specifies where the reader should obtain the bytes that comprise the xml document.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_reader_input
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_XML_READER_INPUT {
    #StructPack 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_xml_reader_input_type">WS_XML_READER_INPUT_TYPE</a> enumeration that
     *           indicates the type of input to which this structure refers.
     */
    inputType : WS_XML_READER_INPUT_TYPE

}
