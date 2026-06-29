#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HTTP_PROPERTY_FLAGS.ahk" { HTTP_PROPERTY_FLAGS }
#Import ".\HTTP_ENABLED_STATE.ahk" { HTTP_ENABLED_STATE }

/**
 * Used to enable or disable a Server Session or URL Group.
 * @remarks
 * When the <b>HttpServerStateProperty</b> is set on a server session or a URL group, the <b>HTTP_STATE_INFO</b> structure must be used. Server Sessions, and URL Groups represent a configuration for a part of the namespace where inheritance is involved.  When traversing the namespace for a request, the HTTP Server API may encounter multiple applicable URL Groups. The property configuration structures must carry information identifying if it is present in a specific URL group.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_state_info
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_STATE_INFO {
    #StructPack 4

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_property_flags">HTTP_PROPERTY_FLAGS</a> structure specifying whether the property is present.
     */
    Flags : HTTP_PROPERTY_FLAGS

    /**
     * A member of the <a href="https://docs.microsoft.com/windows/desktop/api/http/ne-http-http_enabled_state">HTTP_ENABLED_STATE</a> enumeration specifying the whether the configuration object is enabled or disabled.
     * 
     * This can be used to disable a URL Group or Server Session.
     */
    State : HTTP_ENABLED_STATE

}
