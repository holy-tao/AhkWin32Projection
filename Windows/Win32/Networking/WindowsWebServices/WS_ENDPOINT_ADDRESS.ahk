#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_STRING.ahk

/**
 * Represents the network address of an endpoint.
 * @remarks
 * Only the URL field is required (other fields may be <b>NULL</b>).
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_endpoint_address
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_ENDPOINT_ADDRESS extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

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
     * @type {WS_STRING}
     */
    url{
        get {
            if(!this.HasProp("__url"))
                this.__url := WS_STRING(0, this)
            return this.__url
        }
    }

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
     * @type {Pointer<WS_XML_BUFFER>}
     */
    headers {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

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
     * @type {Pointer<WS_XML_BUFFER>}
     */
    extensions {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The security identity of the endpoint represented by this endpoint address.
     *                 
     * 
     * This field corresponds to the Identity element, which is an extension
     *                     of the base WS-Addressing specifications.
     * @type {Pointer<WS_ENDPOINT_IDENTITY>}
     */
    identity {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
