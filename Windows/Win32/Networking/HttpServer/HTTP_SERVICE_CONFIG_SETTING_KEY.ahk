#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.HttpServer
 */
class HTTP_SERVICE_CONFIG_SETTING_KEY extends Win32Enum {

    /**
     * Native name: HttpNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: HttpTlsThrottle
     * @type {Integer (Int32)}
     */
    static TlsThrottle => 1
}
