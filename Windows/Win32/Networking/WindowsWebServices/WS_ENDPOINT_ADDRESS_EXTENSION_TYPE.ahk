#Requires AutoHotkey v2.0.0 64-bit

/**
 * This identifies a type of extension within the extensions field of the WS_ENDPOINT_ADDRESS.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ne-webservices-ws_endpoint_address_extension_type
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_ENDPOINT_ADDRESS_EXTENSION_TYPE{

    /**
     * The address that metadata can be downloaded from the endpoint.
     *                 
     * 
     * The type of the extension value is <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_endpoint_address">WS_ENDPOINT_ADDRESS</a>.
     * @type {Integer (Int32)}
     */
    static WS_ENDPOINT_ADDRESS_EXTENSION_METADATA_ADDRESS => 1
}
