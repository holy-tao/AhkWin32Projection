#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_XML_WRITER_ENCODING_TYPE.ahk" { WS_XML_WRITER_ENCODING_TYPE }
#Import ".\WS_XML_WRITER_ENCODING.ahk" { WS_XML_WRITER_ENCODING }

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
 */
export default struct WS_XML_WRITER_RAW_ENCODING {
    #StructPack 4

    /**
     * The base type for all types that derive from <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_writer_encoding">WS_XML_WRITER_ENCODING</a>.
     */
    encoding : WS_XML_WRITER_ENCODING

}
