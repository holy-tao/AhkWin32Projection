#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HTTP_PROPERTY_FLAGS.ahk" { HTTP_PROPERTY_FLAGS }

/**
 * The HTTP_BANDWIDTH_LIMIT_INFO structure is used to set or query the bandwidth throttling limit. This structure must be used when setting or querying the HttpServerBandwidthProperty on a URL Group or server session.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_bandwidth_limit_info
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_BANDWIDTH_LIMIT_INFO {
    #StructPack 4

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_property_flags">HTTP_PROPERTY_FLAGS</a> structure specifying whether the property is present.
     */
    Flags : HTTP_PROPERTY_FLAGS

    /**
     * The maximum allowed bandwidth rate in bytesper second. Setting the value to HTTP_LIMIT_INFINITE  allows unlimited bandwidth rate. The value cannot be smaller than HTTP_MIN_ALLOWED_BANDWIDTH_THROTTLING_RATE.
     */
    MaxBandwidth : UInt32

}
