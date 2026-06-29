#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * This identifies a type of extension within the extensions field of the WS_ENDPOINT_ADDRESS.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_endpoint_address_extension_type
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_ENDPOINT_ADDRESS_EXTENSION_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The address that metadata can be downloaded from the endpoint.
     *                 
     * 
     * The type of the extension value is <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_endpoint_address">WS_ENDPOINT_ADDRESS</a>.
     * @type {Integer (Int32)}
     */
    static WS_ENDPOINT_ADDRESS_EXTENSION_METADATA_ADDRESS => 1
}
