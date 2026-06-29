#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Information about enabling and disabling types of metadata exchange.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_metadata_exchange_type
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_METADATA_EXCHANGE_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Disables WS-MetadataExchange/HTTP GET servicing on the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_service_endpoint">endpoint</a>.  
     *                     This is the default value of  <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_service_endpoint_property_id">WS_SERVICE_ENDPOINT_PROPERTY_METADATA_EXCHANGE_TYPE</a> property.
     * @type {Integer (Int32)}
     */
    static WS_METADATA_EXCHANGE_TYPE_NONE => 0

    /**
     * Enables servicing of WS-MetadataExchange 1.1 request servicing on the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_service_endpoint">endpoint</a>.
     * @type {Integer (Int32)}
     */
    static WS_METADATA_EXCHANGE_TYPE_MEX => 1

    /**
     * Enables servicing of HTTP GET request servicing on the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_service_endpoint">endpoint</a> for metadata 
     *                     retrieval.
     * @type {Integer (Int32)}
     */
    static WS_METADATA_EXCHANGE_TYPE_HTTP_GET => 2
}
