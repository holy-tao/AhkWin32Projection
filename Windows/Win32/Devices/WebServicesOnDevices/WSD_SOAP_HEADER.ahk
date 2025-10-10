#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WSD_HEADER_RELATESTO.ahk

/**
 * Provides SOAP header data for the WSD_SOAP_MESSAGE structure.
 * @see https://docs.microsoft.com/windows/win32/api//wsdtypes/ns-wsdtypes-wsd_soap_header
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class WSD_SOAP_HEADER extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * The URI to which the SOAP message is addressed.
     * @type {Pointer<Char>}
     */
    To {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The action encoded by the SOAP message.
     * @type {Pointer<Char>}
     */
    Action {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * An identifier that distinguishes the message from others from the same sender.
     * @type {Pointer<Char>}
     */
    MessageID {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * In response messages, specifies the message ID of the matching request message.
     * @type {WSD_HEADER_RELATESTO}
     */
    RelatesTo{
        get {
            if(!this.HasProp("__RelatesTo"))
                this.__RelatesTo := WSD_HEADER_RELATESTO(this.ptr + 24)
            return this.__RelatesTo
        }
    }

    /**
     * In request messages, a reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_endpoint_reference">WSD_ENDPOINT_REFERENCE</a> structure that specifies to the endpoint to which responses should be sent.
     * @type {Pointer<WSD_ENDPOINT_REFERENCE>}
     */
    ReplyTo {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_endpoint_reference">WSD_ENDPOINT_REFERENCE</a> structure that specifies the endpoint from which the SOAP message was sent.
     * @type {Pointer<WSD_ENDPOINT_REFERENCE>}
     */
    From {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_endpoint_reference">WSD_ENDPOINT_REFERENCE</a> structure that specifies to the endpoint to which fault messages should be sent.
     * @type {Pointer<WSD_ENDPOINT_REFERENCE>}
     */
    FaultTo {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * In discovery messages, a reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_app_sequence">WSD_APP_SEQUENCE</a> structure that helps the recipient determine the order in which messages were issued by the sender.
     * @type {Pointer<WSD_APP_SEQUENCE>}
     */
    AppSequence {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structure that specifies additional headers not encoded by the other members.
     * @type {Pointer<WSDXML_ELEMENT>}
     */
    AnyHeaders {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }
}
