#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the context for handling incoming messages.
 * @see https://docs.microsoft.com/windows/win32/api//wsdtypes/ns-wsdtypes-wsd_handler_context
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class WSD_HANDLER_CONTEXT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/nc-wsdtypes-pwsd_soap_message_handler">PSWD_SOAP_MESSAGE_HANDLER</a> function that specifies the incoming message handler.
     * @type {Pointer<PWSD_SOAP_MESSAGE_HANDLER>}
     */
    Handler {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The value supplied by the <i>pVoidContext</i> parameter of the IWSDSession::AddPort, IWSDSession::RegisterForIncomingRequests, or IWSDSession::RegisterForIncomingResponse methods.
     * @type {Pointer<Void>}
     */
    PVoid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The value supplied by the <i>unknownContext</i> parameter of the IWSDSession::AddPort, IWSDSession::RegisterForIncomingRequests, or IWSDSession::RegisterForIncomingResponse methods.
     * @type {IUnknown}
     */
    Unknown {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
