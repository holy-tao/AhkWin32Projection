#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_XML_WRITER_ENCODING.ahk
#Include .\WS_STRING.ahk

/**
 * Used to indicate that the reader should emit bytes in MTOM format. The MTOM format will represent bytes written to it as binary mime parts rather than embedded base64 encoded text.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_writer_mtom_encoding
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_XML_WRITER_MTOM_ENCODING extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * The base type for all types that derive from <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_writer_encoding">WS_XML_WRITER_ENCODING</a>.
     * @type {WS_XML_WRITER_ENCODING}
     */
    encoding{
        get {
            if(!this.HasProp("__encoding"))
                this.__encoding := WS_XML_WRITER_ENCODING(this.ptr + 0)
            return this.__encoding
        }
    }

    /**
     * Specifies the encoding of the xml document carried by MTOM.
     * @type {Pointer<WS_XML_WRITER_ENCODING>}
     */
    textEncoding {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Specifies whether or not the writer should emit a MIME header.
     * @type {Integer}
     */
    writeMimeHeader {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Specifies the character sequence that should be used to delimit the mime parts.  This corresponds to the "boundary" parameter of the MIME Content-Type.
     * @type {WS_STRING}
     */
    boundary{
        get {
            if(!this.HasProp("__boundary"))
                this.__boundary := WS_STRING(this.ptr + 24)
            return this.__boundary
        }
    }

    /**
     * Specifies the type used by the mime part that contains the xml.  This corresponds to the "start-info" parameter in the of the MIME Content-Type.
     * @type {WS_STRING}
     */
    startInfo{
        get {
            if(!this.HasProp("__startInfo"))
                this.__startInfo := WS_STRING(this.ptr + 40)
            return this.__startInfo
        }
    }

    /**
     * Specifies the mime part that contains the xml.  This corresponds to the "start" parameter of the MIME Content-Type.
     * @type {WS_STRING}
     */
    startUri{
        get {
            if(!this.HasProp("__startUri"))
                this.__startUri := WS_STRING(this.ptr + 56)
            return this.__startUri
        }
    }

    /**
     * Specifies the threshold at which the writer will not write base64 encoded text and instead write a binary mime part for binary data.
     * @type {Integer}
     */
    maxInlineByteCount {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }
}
