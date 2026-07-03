#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the callback which is called when a channel is about to be closed. See, WS_SERVICE_CLOSE_CHANNEL_CALLBACK for details.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_service_property_close_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_SERVICE_PROPERTY_CLOSE_CALLBACK {
    #StructPack 8

    /**
     * The close channel callback function reference.
     */
    callback : IntPtr

}
