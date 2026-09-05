#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class PM_ENUM_EXTENSION_FILTER extends Win32Enum {

    /**
     * Native name: PM_ENUM_EXTENSION_FILTER_BY_CONSUMER
     * @type {Integer (Int32)}
     */
    static BY_CONSUMER => 17

    /**
     * Native name: PM_ENUM_EXTENSION_FILTER_APPCONNECT
     * @type {Integer (Int32)}
     */
    static APPCONNECT => 17

    /**
     * Native name: PM_ENUM_EXTENSION_FILTER_PROTOCOL_ALL
     * @type {Integer (Int32)}
     */
    static PROTOCOL_ALL => 18

    /**
     * Native name: PM_ENUM_EXTENSION_FILTER_FTASSOC_FILETYPE_ALL
     * @type {Integer (Int32)}
     */
    static FTASSOC_FILETYPE_ALL => 19

    /**
     * Native name: PM_ENUM_EXTENSION_FILTER_FTASSOC_CONTENTTYPE_ALL
     * @type {Integer (Int32)}
     */
    static FTASSOC_CONTENTTYPE_ALL => 20

    /**
     * Native name: PM_ENUM_EXTENSION_FILTER_FTASSOC_APPLICATION_ALL
     * @type {Integer (Int32)}
     */
    static FTASSOC_APPLICATION_ALL => 21

    /**
     * Native name: PM_ENUM_EXTENSION_FILTER_SHARETARGET_ALL
     * @type {Integer (Int32)}
     */
    static SHARETARGET_ALL => 22

    /**
     * Native name: PM_ENUM_EXTENSION_FILTER_FILEOPENPICKER_ALL
     * @type {Integer (Int32)}
     */
    static FILEOPENPICKER_ALL => 23

    /**
     * Native name: PM_ENUM_EXTENSION_FILTER_FILESAVEPICKER_ALL
     * @type {Integer (Int32)}
     */
    static FILESAVEPICKER_ALL => 24

    /**
     * Native name: PM_ENUM_EXTENSION_FILTER_CACHEDFILEUPDATER_ALL
     * @type {Integer (Int32)}
     */
    static CACHEDFILEUPDATER_ALL => 25

    /**
     * Native name: PM_ENUM_EXTENSION_FILTER_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 26
}
