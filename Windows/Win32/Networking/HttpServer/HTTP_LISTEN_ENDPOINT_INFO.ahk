#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Controls whether IP-based URLs should listen on the specific IP address or on a wildcard.
 * @see https://docs.microsoft.com/windows/win32/api//http/ns-http-http_listen_endpoint_info
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_LISTEN_ENDPOINT_INFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_property_flags">HTTP_PROPERTY_FLAGS</a> structure that specifies if the property is present.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A Boolean value that specifies whether sharing is enabled.
     * @type {Integer}
     */
    EnableSharing {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }
}
