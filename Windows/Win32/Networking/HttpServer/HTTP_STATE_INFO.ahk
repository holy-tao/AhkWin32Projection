#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used to enable or disable a Server Session or URL Group.
 * @remarks
 * When the <b>HttpServerStateProperty</b> is set on a server session or a URL group, the <b>HTTP_STATE_INFO</b> structure must be used. Server Sessions, and URL Groups represent a configuration for a part of the namespace where inheritance is involved.  When traversing the namespace for a request, the HTTP Server API may encounter multiple applicable URL Groups. The property configuration structures must carry information identifying if it is present in a specific URL group.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_state_info
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_STATE_INFO extends Win32Struct
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
     * A member of the <a href="https://docs.microsoft.com/windows/desktop/api/http/ne-http-http_enabled_state">HTTP_ENABLED_STATE</a> enumeration specifying the whether the configuration object is enabled or disabled.
     * 
     * This can be used to disable a URL Group or Server Session.
     * @type {Integer}
     */
    State {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
