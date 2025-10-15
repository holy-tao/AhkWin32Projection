#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HTTP_PROPERTY_FLAGS.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

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
     * @type {HTTP_PROPERTY_FLAGS}
     */
    Flags{
        get {
            if(!this.HasProp("__Flags"))
                this.__Flags := HTTP_PROPERTY_FLAGS(this.ptr + 0)
            return this.__Flags
        }
    }

    /**
     * A Boolean value that specifies whether sharing is enabled.
     * @type {BOOLEAN}
     */
    EnableSharing{
        get {
            if(!this.HasProp("__EnableSharing"))
                this.__EnableSharing := BOOLEAN(this.ptr + 4)
            return this.__EnableSharing
        }
    }
}
