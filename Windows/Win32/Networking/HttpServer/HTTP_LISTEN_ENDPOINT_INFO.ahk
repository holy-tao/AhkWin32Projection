#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HTTP_PROPERTY_FLAGS.ahk" { HTTP_PROPERTY_FLAGS }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * Controls whether IP-based URLs should listen on the specific IP address or on a wildcard.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_listen_endpoint_info
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_LISTEN_ENDPOINT_INFO {
    #StructPack 4

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_property_flags">HTTP_PROPERTY_FLAGS</a> structure that specifies if the property is present.
     */
    Flags : HTTP_PROPERTY_FLAGS

    /**
     * A Boolean value that specifies whether sharing is enabled.
     */
    EnableSharing : BOOLEAN

}
