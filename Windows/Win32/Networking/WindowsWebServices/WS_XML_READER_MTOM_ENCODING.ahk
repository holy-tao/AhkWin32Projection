#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_XML_READER_ENCODING.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\WS_STRING.ahk

/**
 * Used to indicate that the reader should interpret the bytes it reads as in MTOM format.
 * @remarks
 * 
  * When used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_reader_buffer_input">WS_XML_READER_BUFFER_INPUT</a> the MIME parts may appear in any order.
  *       
  * 
  * When used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_reader_stream_input">WS_XML_READER_STREAM_INPUT</a> the root MIME part must be first, and
  *         subsequent MIME parts must appear in the order that they are referenced from xop:Include elements.
  *       
  * 
  * See http://www.w3.org/TR/2005/REC-xop10-20050125/ for the MTOM specification.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_xml_reader_mtom_encoding
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_XML_READER_MTOM_ENCODING extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * The base type for all types that derive from <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_reader_encoding">WS_XML_READER_ENCODING</a>.
     * @type {WS_XML_READER_ENCODING}
     */
    encoding{
        get {
            if(!this.HasProp("__encoding"))
                this.__encoding := WS_XML_READER_ENCODING(this.ptr + 0)
            return this.__encoding
        }
    }

    /**
     * The encoding of the xml document carried by MTOM.
     * @type {Pointer<WS_XML_READER_ENCODING>}
     */
    textEncoding {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Specifies whether or not the reader should read the MIME header.
     * @type {BOOL}
     */
    readMimeHeader{
        get {
            if(!this.HasProp("__readMimeHeader"))
                this.__readMimeHeader := BOOL(this.ptr + 16)
            return this.__readMimeHeader
        }
    }

    /**
     * The type used by the mime part that contains the xml.  This corresponds to the "start-info" parameter in the of the MIME Content-Type.
     *           If readMimeHeader is specified as <b>TRUE</b>, then this must be empty as the startInfo will be read from the mime header.
     * @type {WS_STRING}
     */
    startInfo{
        get {
            if(!this.HasProp("__startInfo"))
                this.__startInfo := WS_STRING(this.ptr + 24)
            return this.__startInfo
        }
    }

    /**
     * The character sequence that should be used to delimit the mime parts.  This corresponds to the "boundary" parameter of the MIME Content-Type.
     *           If readMimeHeader is specified as <b>TRUE</b>, then this must be empty as the boundary will be read from the mime header.
     * @type {WS_STRING}
     */
    boundary{
        get {
            if(!this.HasProp("__boundary"))
                this.__boundary := WS_STRING(this.ptr + 40)
            return this.__boundary
        }
    }

    /**
     * The mime part that contains the xml.  This corresponds to the "start" parameter of the MIME Content-Type.
     *           If readMimeHeader is specified as <b>TRUE</b>, then this must be empty as the startUri will be read from the mime header.
     * @type {WS_STRING}
     */
    startUri{
        get {
            if(!this.HasProp("__startUri"))
                this.__startUri := WS_STRING(this.ptr + 56)
            return this.__startUri
        }
    }
}
