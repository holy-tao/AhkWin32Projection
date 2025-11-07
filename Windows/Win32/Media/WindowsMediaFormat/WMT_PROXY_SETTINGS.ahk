#Requires AutoHotkey v2.0.0 64-bit

/**
 * The WMT_PROXY_SETTINGS enumeration type defines network proxy settings for use with a reader object.
 * @remarks
 * 
 * The WMT_PROXY_SETTING_BROWSER setting applies only to the HTTP protocol.
 * 
 * This enumeration is used directly in <b>GetProxySettings</b> and <b>SetProxySettings</b>, and referenced in several other methods of the <b>IWMReaderNetworkConfig</b> interface.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/ne-wmsdkidl-wmt_proxy_settings
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WMT_PROXY_SETTINGS{

    /**
     * No proxy settings will be used.
     * @type {Integer (Int32)}
     */
    static WMT_PROXY_SETTING_NONE => 0

    /**
     * Proxy settings will be explicitly set.
     * @type {Integer (Int32)}
     */
    static WMT_PROXY_SETTING_MANUAL => 1

    /**
     * Proxy settings will be automatically negotiated.
     * @type {Integer (Int32)}
     */
    static WMT_PROXY_SETTING_AUTO => 2

    /**
     * The browser will negotiate the proxy settings. This applies only when using HTTP.
     * @type {Integer (Int32)}
     */
    static WMT_PROXY_SETTING_BROWSER => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WMT_PROXY_SETTING_MAX => 4
}
