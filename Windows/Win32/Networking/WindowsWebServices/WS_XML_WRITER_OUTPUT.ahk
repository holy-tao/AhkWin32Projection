#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_XML_WRITER_OUTPUT_TYPE.ahk" { WS_XML_WRITER_OUTPUT_TYPE }

/**
 * Specifies where the writer should emit the bytes that comprise the xml document.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_writer_output
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_XML_WRITER_OUTPUT {
    #StructPack 4

    /**
     * Indicates the type of output this structure refers to.
     */
    outputType : WS_XML_WRITER_OUTPUT_TYPE

}
