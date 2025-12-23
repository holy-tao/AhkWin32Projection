#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WFD_ROLE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WFD_ROLE_TYPE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static WFD_ROLE_TYPE_DEVICE => 1

    /**
     * @type {Integer (Int32)}
     */
    static WFD_ROLE_TYPE_GROUP_OWNER => 2

    /**
     * @type {Integer (Int32)}
     */
    static WFD_ROLE_TYPE_CLIENT => 4

    /**
     * @type {Integer (Int32)}
     */
    static WFD_ROLE_TYPE_MAX => 5
}
