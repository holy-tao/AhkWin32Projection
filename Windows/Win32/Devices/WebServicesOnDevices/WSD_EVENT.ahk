#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WSD_HANDLER_CONTEXT.ahk

/**
 * Provides an internal representation of a SOAP message.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_event
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class WSD_EVENT extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * The result code of the event.
     * @type {Integer}
     */
    Hr {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The event type.
     * @type {Integer}
     */
    EventType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Pointer to the protocol string when dispatch by tags is required.
     * @type {Pointer<Ptr>}
     */
    DispatchTag {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_handler_context">WSD_HANDLER_CONTEXT</a> structure that specifies the handler context.
     * @type {WSD_HANDLER_CONTEXT}
     */
    HandlerContext{
        get {
            if(!this.HasProp("__HandlerContext"))
                this.__HandlerContext := WSD_HANDLER_CONTEXT(this.ptr + 16)
            return this.__HandlerContext
        }
    }

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_soap_message">WSD_SOAP_MESSAGE</a> structure that describes the event.
     * @type {Pointer<WSD_SOAP_MESSAGE>}
     */
    Soap {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_operation">WSD_OPERATION</a> structure that specifies the operation performed.
     * @type {Pointer<WSD_OPERATION>}
     */
    Operation {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Message transmission parameters.
     * @type {Pointer<IWSDMessageParameters>}
     */
    MessageParameters {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
