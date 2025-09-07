#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_XML_WRITER_ENCODING.ahk

/**
 * Used to indicate that the writer should emit bytes from decoded base64 characters.
 * @remarks
 * This encoding can be useful when it is desirable to write an arbitrary, perhaps, non-xml document
  *         while still using the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-writer">WS_XML_WRITER</a> abstraction.  In this encoding, only characters
  *         representing base64 encoded bytes may be written, and only at the root of the document.  No
  *         elements or comments may be written.  The writer will emit the bytes represented by the base64 encoded 
  *         characters.  In order to accommodate non-whitespace text at the root of the document, the writer 
  *         will operate as if the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_xml_writer_property_id">WS_XML_WRITER_PROPERTY_ALLOW_FRAGMENT</a> property has been specified.
  *       
  * 
  * The base64 characters of the document are only converted to bytes when necessary.  So, for example, 
  *         using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritebytes">WsWriteBytes</a>, which normally performs a base64 encoding of the bytes it is passed,
  *         actually avoids all base64 conversions and is the most efficient way to write documents in this
  *         encoding. Using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritechars">WsWriteChars</a>, for example, will cause the base64 characters to physically get
  *         decoded to their corresponding bytes.  In general writing the document using anything other than 
  *         <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadbytes">WsReadBytes</a>, <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wspullbytes">WsPullBytes</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wspushbytes">WsPushBytes</a> will incur the 
  *         base64 conversion.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_writer_raw_encoding
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_XML_WRITER_RAW_ENCODING extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

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
}
