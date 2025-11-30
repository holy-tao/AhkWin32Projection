#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Proxy setting indicates HTTP proxy setting for the channel with binding WS_HTTP_CHANNEL_BINDING. This is specified as part of WS_CHANNEL_PROPERTY_HTTP_PROXY_SETTING_MODE channel property.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ne-webservices-ws_http_proxy_setting_mode
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_HTTP_PROXY_SETTING_MODE extends Win32Enum{

    /**
     * The channel will automatically detect the proxy setting based on the IE configuration for the
     *                     user at the point the channel is opened. This is the default setting for the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_binding">WS_HTTP_CHANNEL_BINDING</a>.
     * @type {Integer (Int32)}
     */
    static WS_HTTP_PROXY_SETTING_MODE_AUTO => 1

    /**
     * No proxy will be used to service the request on the channel.
     * @type {Integer (Int32)}
     */
    static WS_HTTP_PROXY_SETTING_MODE_NONE => 2

    /**
     * If an application chooses to explicitly control the HTTP proxy it can use this setting.
     *                     The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_property_id">WS_CHANNEL_PROPERTY_CUSTOM_HTTP_PROXY</a> property specifies the custom proxy to be used
     *                     with the channel and must be set on the channel if this setting is used.
     * @type {Integer (Int32)}
     */
    static WS_HTTP_PROXY_SETTING_MODE_CUSTOM => 3
}
