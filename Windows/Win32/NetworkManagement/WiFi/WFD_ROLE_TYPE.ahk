#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class WFD_ROLE_TYPE extends Win32Enum {

    /**
     * Native name: WFD_ROLE_TYPE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: WFD_ROLE_TYPE_DEVICE
     * @type {Integer (Int32)}
     */
    static DEVICE => 1

    /**
     * Native name: WFD_ROLE_TYPE_GROUP_OWNER
     * @type {Integer (Int32)}
     */
    static GROUP_OWNER => 2

    /**
     * Native name: WFD_ROLE_TYPE_CLIENT
     * @type {Integer (Int32)}
     */
    static CLIENT => 4

    /**
     * Native name: WFD_ROLE_TYPE_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 5
}
