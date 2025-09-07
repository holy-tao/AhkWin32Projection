#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_XML_READER_ENCODING.ahk

/**
 * Used to indicate that the reader should surface the bytes of the document as base64 encoded characters.
 * @remarks
 * This encoding can be useful when it is desirable to read an arbitrary, perhaps, non-xml document
  *         while still using the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-reader">WS_XML_READER</a> abstraction.  In this encoding, the bytes comprising
  *         the document are presented as base64 encoded characters at the root of a xml document.  In order to
  *         accommodate non-whitespace text at the root of the document, the reader will operate as if the
  *         <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_xml_reader_property_id">WS_XML_READER_PROPERTY_ALLOW_FRAGMENT</a> property has been specified.
  *       
  * 
  * The bytes of the document are only converted to base64 when necessary.  So, for example, using 
  *         <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadbytes">WsReadBytes</a>, which normally performs a base64 decoding of the characters it reads, 
  *         actually avoids all base64 conversions and is the most efficient way to read documents in this
  *         encoding. Using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadchars">WsReadChars</a>, for example, will cause the bytes to physically get 
  *         converted to their corresponding base64 characters.  In general reading the document using
  *         anything other than <b>WsReadBytes</b> will incur the base64 conversion.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_reader_raw_encoding
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_XML_READER_RAW_ENCODING extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

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
}
