#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WMT_PROXY_SETTINGS enumeration type defines network proxy settings for use with a reader object.
 * @remarks
 * The WMT_PROXY_SETTING_BROWSER setting applies only to the HTTP protocol.
 * 
 * This enumeration is used directly in <b>GetProxySettings</b> and <b>SetProxySettings</b>, and referenced in several other methods of the <b>IWMReaderNetworkConfig</b> interface.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ne-wmsdkidl-wmt_proxy_settings
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
class WMT_PROXY_SETTINGS extends Win32Enum {

    /**
     * No proxy settings will be used.
     * Native name: WMT_PROXY_SETTING_NONE
     * @type {Integer (Int32)}
     */
    static SETTING_NONE => 0

    /**
     * Proxy settings will be explicitly set.
     * Native name: WMT_PROXY_SETTING_MANUAL
     * @type {Integer (Int32)}
     */
    static SETTING_MANUAL => 1

    /**
     * Proxy settings will be automatically negotiated.
     * Native name: WMT_PROXY_SETTING_AUTO
     * @type {Integer (Int32)}
     */
    static SETTING_AUTO => 2

    /**
     * The browser will negotiate the proxy settings. This applies only when using HTTP.
     * Native name: WMT_PROXY_SETTING_BROWSER
     * @type {Integer (Int32)}
     */
    static SETTING_BROWSER => 3

    /**
     * Native name: WMT_PROXY_SETTING_MAX
     * @type {Integer (Int32)}
     */
    static SETTING_MAX => 4
}
