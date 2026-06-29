#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_STRING.ahk" { WS_STRING }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WS_XML_READER_ENCODING.ahk" { WS_XML_READER_ENCODING }
#Import ".\WS_XML_READER_ENCODING_TYPE.ahk" { WS_XML_READER_ENCODING_TYPE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Used to indicate that the reader should interpret the bytes it reads as in MTOM format.
 * @remarks
 * When used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_reader_buffer_input">WS_XML_READER_BUFFER_INPUT</a> the MIME parts may appear in any order.
 *       
 * 
 * When used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_reader_stream_input">WS_XML_READER_STREAM_INPUT</a> the root MIME part must be first, and
 *         subsequent MIME parts must appear in the order that they are referenced from xop:Include elements.
 *       
 * 
 * See http://www.w3.org/TR/2005/REC-xop10-20050125/ for the MTOM specification.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_reader_mtom_encoding
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_XML_READER_MTOM_ENCODING {
    #StructPack 8

    /**
     * The base type for all types that derive from <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_reader_encoding">WS_XML_READER_ENCODING</a>.
     */
    encoding : WS_XML_READER_ENCODING

    /**
     * The encoding of the xml document carried by MTOM.
     */
    textEncoding : WS_XML_READER_ENCODING.Ptr

    /**
     * Specifies whether or not the reader should read the MIME header.
     */
    readMimeHeader : BOOL

    /**
     * The type used by the mime part that contains the xml.  This corresponds to the "start-info" parameter in the of the MIME Content-Type.
     *           If readMimeHeader is specified as <b>TRUE</b>, then this must be empty as the startInfo will be read from the mime header.
     */
    startInfo : WS_STRING

    /**
     * The character sequence that should be used to delimit the mime parts.  This corresponds to the "boundary" parameter of the MIME Content-Type.
     *           If readMimeHeader is specified as <b>TRUE</b>, then this must be empty as the boundary will be read from the mime header.
     */
    boundary : WS_STRING

    /**
     * The mime part that contains the xml.  This corresponds to the "start" parameter of the MIME Content-Type.
     *           If readMimeHeader is specified as <b>TRUE</b>, then this must be empty as the startUri will be read from the mime header.
     */
    startUri : WS_STRING

}
