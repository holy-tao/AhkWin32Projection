#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_CHANNEL_PROPERTY.ahk" { WS_CHANNEL_PROPERTY }
#Import ".\WS_CHANNEL_PROPERTY_ID.ahk" { WS_CHANNEL_PROPERTY_ID }

/**
 * Specifies constraints for a particular channel property.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_channel_property_constraint
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_CHANNEL_PROPERTY_CONSTRAINT {
    #StructPack 8


    struct _out {
        channelProperty : WS_CHANNEL_PROPERTY

    }

    /**
     * The ID of the channel property.  The following channel 
     *                     properties constraints may be specified:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_property_id">WS_CHANNEL_PROPERTY_ENCODING</a>
     * If this property constraint is not specified when using 
     *                         <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_binding">WS_HTTP_CHANNEL_BINDING</a> the default constraint value
     *                         of <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_encoding">WS_ENCODING_XML_UTF8</a> will be used.
     *                     
     * 
     * If this property constraint is not specified not specified when using 
     *                         <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_binding">WS_TCP_CHANNEL_BINDING</a> the default constraint value of 
     *                         <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_encoding">WS_ENCODING_XML_BINARY_SESSION_1</a> will be used.
     *                     
     * 
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_property_id">WS_CHANNEL_PROPERTY_ADDRESSING_VERSION</a>
     * If this property constraint is not specified, the default constraint
     *                         value of <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_addressing_version">WS_ADDRESSING_VERSION_1_0</a> will be used.
     *                     
     * 
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_property_id">WS_CHANNEL_PROPERTY_ENVELOPE_VERSION</a>
     * If this property constraint is not specified, the default constraint of 
     *                         value of <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_envelope_version">WS_ENVELOPE_VERSION_SOAP_1_2</a> will be used.
     *                     
     * 
     * </li>
     * </ul>
     */
    id : WS_CHANNEL_PROPERTY_ID

    /**
     * An array of acceptable values.  The type of
     *                     the values in the array correspond to the type of the values
     *                     of the channel property.  See the documentation for
     *                     a particular channel property to determine the type of the
     *                     property.
     */
    allowedValues : IntPtr

    /**
     * The total size of the <b>allowedValues</b> array, in bytes.  This
     *                     size must be a multiple of the size of the type of the value
     *                     of the property.
     */
    allowedValuesSize : UInt32

    /**
     * When <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsmatchpolicyalternative">WsMatchPolicyAlternative</a> returns NOERROR, the
     *                     entire contents of this structure will be filled out.
     */
    out : WS_CHANNEL_PROPERTY_CONSTRAINT._out

}
