#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the callback which is called when a channel is successfully accepted.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_service_property_accept_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_SERVICE_PROPERTY_ACCEPT_CALLBACK {
    #StructPack 8

    /**
     * The accept channel callback function reference.
     */
    callback : IntPtr

}
