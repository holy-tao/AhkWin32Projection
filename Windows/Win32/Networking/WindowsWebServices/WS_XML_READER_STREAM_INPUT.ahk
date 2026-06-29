#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_XML_READER_INPUT_TYPE.ahk" { WS_XML_READER_INPUT_TYPE }
#Import ".\WS_XML_READER_INPUT.ahk" { WS_XML_READER_INPUT }

/**
 * Specifies that the source of the xml should be obtained from a callback.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_reader_stream_input
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_XML_READER_STREAM_INPUT {
    #StructPack 8

    /**
     * The base type for all types that derive from <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_reader_input">WS_XML_READER_INPUT</a>.
     */
    input : WS_XML_READER_INPUT

    /**
     * A callback that is invoked when <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfillreader">WsFillReader</a> is called.
     */
    readCallback : IntPtr

    /**
     * A user-defined value that will be passed back to readCallback.
     */
    readCallbackState : IntPtr

}
