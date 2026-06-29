#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_METADATA_ENDPOINT.ahk" { WS_METADATA_ENDPOINT }

/**
 * Information about all endpoints that were read from metadata documents.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_metadata_endpoints
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_METADATA_ENDPOINTS {
    #StructPack 8

    /**
     * An array of endpoints.
     */
    endpoints : WS_METADATA_ENDPOINT.Ptr

    /**
     * The number of elements in the endpoints array.
     */
    endpointCount : UInt32

}
