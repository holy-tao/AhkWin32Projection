#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HTTP_PROPERTY_FLAGS.ahk" { HTTP_PROPERTY_FLAGS }

/**
 * Used to set or query the limit on the maximum number of outstanding connections for a URL Group.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_connection_limit_info
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_CONNECTION_LIMIT_INFO {
    #StructPack 4

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_property_flags">HTTP_PROPERTY_FLAGS</a> structure specifying whether the property is present.
     */
    Flags : HTTP_PROPERTY_FLAGS

    /**
     * The number of connections allowed. Setting this value to HTTP_LIMIT_INFINITE allows an unlimited number of connections.
     */
    MaxConnections : UInt32

}
