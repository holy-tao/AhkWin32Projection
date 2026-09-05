#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Information about enabling and disabling types of metadata exchange.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_metadata_exchange_type
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
class WS_METADATA_EXCHANGE_TYPE extends Win32Enum {

    /**
     * Disables WS-MetadataExchange/HTTP GET servicing on the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_service_endpoint">endpoint</a>.  
     *                     This is the default value of  <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_service_endpoint_property_id">WS_SERVICE_ENDPOINT_PROPERTY_METADATA_EXCHANGE_TYPE</a> property.
     * Native name: WS_METADATA_EXCHANGE_TYPE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Enables servicing of WS-MetadataExchange 1.1 request servicing on the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_service_endpoint">endpoint</a>.
     * Native name: WS_METADATA_EXCHANGE_TYPE_MEX
     * @type {Integer (Int32)}
     */
    static MEX => 1

    /**
     * Enables servicing of HTTP GET request servicing on the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_service_endpoint">endpoint</a> for metadata 
     *                     retrieval.
     * Native name: WS_METADATA_EXCHANGE_TYPE_HTTP_GET
     * @type {Integer (Int32)}
     */
    static HTTP_GET => 2
}
