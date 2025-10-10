#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies a service contract on an endpoint.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_service_contract
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_SERVICE_CONTRACT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The typed contract metadata. See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_contract_description">WS_CONTRACT_DESCRIPTION</a>. Optional, if <b>defaultMessageHandlerCallback</b> is given.
     * @type {Pointer<WS_CONTRACT_DESCRIPTION>}
     */
    contractDescription {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Callback for processing unhandled messages. Optional if contractDescription is given.
     * @type {Pointer<WS_SERVICE_MESSAGE_RECEIVE_CALLBACK>}
     */
    defaultMessageHandlerCallback {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The function table. Mandatory, if <b>contractDescription</b> is given.
     * @type {Pointer<Void>}
     */
    methodTable {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
