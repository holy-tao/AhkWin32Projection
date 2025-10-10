#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the callback which is called when a channel is about to be closed. See, WS_SERVICE_CLOSE_CHANNEL_CALLBACK for details.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_service_property_close_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_SERVICE_PROPERTY_CLOSE_CALLBACK extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The close channel callback function reference.
     * @type {Pointer<WS_SERVICE_CLOSE_CHANNEL_CALLBACK>}
     */
    callback {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
