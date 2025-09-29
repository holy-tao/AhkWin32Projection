#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_CHANNEL_PROPERTY.ahk

/**
 * Specifies constraints for a particular channel property.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_channel_property_constraint
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_CHANNEL_PROPERTY_CONSTRAINT extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    class _out extends Win32Struct {
        static sizeof => 48
        static packingSize => 8

        /**
         * @type {WS_CHANNEL_PROPERTY}
         */
        channelProperty{
            get {
                if(!this.HasProp("__channelProperty"))
                    this.__channelProperty := WS_CHANNEL_PROPERTY(this.ptr + 0)
                return this.__channelProperty
            }
        }
    
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
     * @type {Integer}
     */
    id {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * An array of acceptable values.  The type of
     *                     the values in the array correspond to the type of the values
     *                     of the channel property.  See the documentation for
     *                     a particular channel property to determine the type of the
     *                     property.
     * @type {Pointer<Void>}
     */
    allowedValues {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The total size of the <b>allowedValues</b> array, in bytes.  This
     *                     size must be a multiple of the size of the type of the value
     *                     of the property.
     * @type {Integer}
     */
    allowedValuesSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * When <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsmatchpolicyalternative">WsMatchPolicyAlternative</a> returns NOERROR, the
     *                     entire contents of this structure will be filled out.
     * @type {_out}
     */
    out{
        get {
            if(!this.HasProp("__out"))
                this.__out := %this.__Class%._out(this.ptr + 24)
            return this.__out
        }
    }
}
