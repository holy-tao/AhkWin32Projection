#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_STRING.ahk" { WS_STRING }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WS_XML_WRITER_ENCODING_TYPE.ahk" { WS_XML_WRITER_ENCODING_TYPE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\WS_XML_WRITER_ENCODING.ahk" { WS_XML_WRITER_ENCODING }

/**
 * Used to indicate that the reader should emit bytes in MTOM format. The MTOM format will represent bytes written to it as binary mime parts rather than embedded base64 encoded text.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_writer_mtom_encoding
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_XML_WRITER_MTOM_ENCODING {
    #StructPack 8

    /**
     * The base type for all types that derive from <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_writer_encoding">WS_XML_WRITER_ENCODING</a>.
     */
    encoding : WS_XML_WRITER_ENCODING

    /**
     * Specifies the encoding of the xml document carried by MTOM.
     */
    textEncoding : WS_XML_WRITER_ENCODING.Ptr

    /**
     * Specifies whether or not the writer should emit a MIME header.
     */
    writeMimeHeader : BOOL

    /**
     * Specifies the character sequence that should be used to delimit the mime parts.  This corresponds to the "boundary" parameter of the MIME Content-Type.
     */
    boundary : WS_STRING

    /**
     * Specifies the type used by the mime part that contains the xml.  This corresponds to the "start-info" parameter in the of the MIME Content-Type.
     */
    startInfo : WS_STRING

    /**
     * Specifies the mime part that contains the xml.  This corresponds to the "start" parameter of the MIME Content-Type.
     */
    startUri : WS_STRING

    /**
     * Specifies the threshold at which the writer will not write base64 encoded text and instead write a binary mime part for binary data.
     */
    maxInlineByteCount : UInt32

}
