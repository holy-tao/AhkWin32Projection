#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used to set or query the limit on the maximum number of outstanding connections for a URL Group.
 * @see https://docs.microsoft.com/windows/win32/api//http/ns-http-http_connection_limit_info
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_CONNECTION_LIMIT_INFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_property_flags">HTTP_PROPERTY_FLAGS</a> structure specifying whether the property is present.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of connections allowed. Setting this value to HTTP_LIMIT_INFINITE allows an unlimited number of connections.
     * @type {Integer}
     */
    MaxConnections {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
