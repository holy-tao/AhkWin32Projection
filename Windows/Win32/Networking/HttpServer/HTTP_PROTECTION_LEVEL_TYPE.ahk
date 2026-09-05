#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.HttpServer
 */
class HTTP_PROTECTION_LEVEL_TYPE extends Win32Enum {

    /**
     * Native name: HttpProtectionLevelUnrestricted
     * @type {Integer (Int32)}
     */
    static Unrestricted => 0

    /**
     * Native name: HttpProtectionLevelEdgeRestricted
     * @type {Integer (Int32)}
     */
    static EdgeRestricted => 1

    /**
     * Native name: HttpProtectionLevelRestricted
     * @type {Integer (Int32)}
     */
    static Restricted => 2
}
