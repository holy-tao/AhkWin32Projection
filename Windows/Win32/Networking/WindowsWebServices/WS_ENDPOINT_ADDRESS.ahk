#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_STRING.ahk" { WS_STRING }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WS_ENDPOINT_IDENTITY.ahk" { WS_ENDPOINT_IDENTITY }
#Import ".\WS_XML_BUFFER.ahk" { WS_XML_BUFFER }

/**
 * Represents the network address of an endpoint.
 * @remarks
 * Only the URL field is required (other fields may be <b>NULL</b>).
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_endpoint_address
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_ENDPOINT_ADDRESS {
    #StructPack 8

    /**
     * The URL portion of the address.  
     *                 
     * 
     * The URL is always in escaped form.  
     * 
     * If this string is zero-length, then
     *                     the URL is assumed to be the anonymous address.  The anonymous
     *                     address string is automatically mapped to/from the zero-length string
     *                     when the endpoint address is serialized or deserialized
     *                     using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type">WS_ENDPOINT_ADDRESS_TYPE</a>.
     *                 
     * 
     * The value of this field corresponds to the Address element of the 
     *                     WS-Addressing specifications.
     */
    url : WS_STRING

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-buffer">WS_XML_BUFFER</a> handle to a set of header elements
     *                     that represent the reference parameters for the endpoint address.
     *                 
     * 
     * The headers are required to properly interact with the endpoint.
     *                     They are used to further qualify the address (URL).
     *                 
     * 
     * The headers should be treated as opaque values to the user of
     *                     the endpoint address.
     *                 
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsaddressmessage">WsAddressMessage</a> for information on how to 
     *                     add the headers to a message being sent.
     *                 
     * 
     * This field may be <b>NULL</b> if there are no headers.
     *                 
     * 
     * This value of this field corresponds to the content of the 
     *                     ReferenceParameters element of the WS-Addressing specifications.
     */
    headers : WS_XML_BUFFER.Ptr

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-buffer">WS_XML_BUFFER</a> handle to a set of extension elements.
     *                     Extension elements are used to include additional information within an
     *                     endpoint address.  This field may be <b>NULL</b> if there are no extension elements.
     *                 
     * 
     * This value of this field corresponds to the other elements
     *                     defined by WS-Addressing and any extension elements.  The elements must 
     *                     appear in the correct order according to the specification, followed
     *                     by extension elements.  This field should not contain elements for Address 
     *                     or ReferenceParameters, or Identity, since these values are represented directly by 
     *                     other fields of this structure.
     *                 
     * 
     * If the ReferenceProperties element is present (as defined by
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_addressing_version">WS_ADDRESSING_VERSION_0_9</a>), it must be the first element 
     *                     within the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-buffer">WS_XML_BUFFER</a>.
     */
    extensions : WS_XML_BUFFER.Ptr

    /**
     * The security identity of the endpoint represented by this endpoint address.
     *                 
     * 
     * This field corresponds to the Identity element, which is an extension
     *                     of the base WS-Addressing specifications.
     */
    identity : WS_ENDPOINT_IDENTITY.Ptr

}
