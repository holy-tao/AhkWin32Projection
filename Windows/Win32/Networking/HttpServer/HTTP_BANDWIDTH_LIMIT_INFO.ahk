#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HTTP_PROPERTY_FLAGS.ahk

/**
 * The HTTP_BANDWIDTH_LIMIT_INFO structure is used to set or query the bandwidth throttling limit. This structure must be used when setting or querying the HttpServerBandwidthProperty on a URL Group or server session.
 * @see https://docs.microsoft.com/windows/win32/api//http/ns-http-http_bandwidth_limit_info
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_BANDWIDTH_LIMIT_INFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_property_flags">HTTP_PROPERTY_FLAGS</a> structure specifying whether the property is present.
     * @type {HTTP_PROPERTY_FLAGS}
     */
    Flags{
        get {
            if(!this.HasProp("__Flags"))
                this.__Flags := HTTP_PROPERTY_FLAGS(0, this)
            return this.__Flags
        }
    }

    /**
     * The maximum allowed bandwidth rate in bytesper second. Setting the value to HTTP_LIMIT_INFINITE  allows unlimited bandwidth rate. The value cannot be smaller than HTTP_MIN_ALLOWED_BANDWIDTH_THROTTLING_RATE.
     * @type {Integer}
     */
    MaxBandwidth {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
