#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class PM_ENUM_EXTENSION_FILTER extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PM_ENUM_EXTENSION_FILTER_BY_CONSUMER => 17

    /**
     * @type {Integer (Int32)}
     */
    static PM_ENUM_EXTENSION_FILTER_APPCONNECT => 17

    /**
     * @type {Integer (Int32)}
     */
    static PM_ENUM_EXTENSION_FILTER_PROTOCOL_ALL => 18

    /**
     * @type {Integer (Int32)}
     */
    static PM_ENUM_EXTENSION_FILTER_FTASSOC_FILETYPE_ALL => 19

    /**
     * @type {Integer (Int32)}
     */
    static PM_ENUM_EXTENSION_FILTER_FTASSOC_CONTENTTYPE_ALL => 20

    /**
     * @type {Integer (Int32)}
     */
    static PM_ENUM_EXTENSION_FILTER_FTASSOC_APPLICATION_ALL => 21

    /**
     * @type {Integer (Int32)}
     */
    static PM_ENUM_EXTENSION_FILTER_SHARETARGET_ALL => 22

    /**
     * @type {Integer (Int32)}
     */
    static PM_ENUM_EXTENSION_FILTER_FILEOPENPICKER_ALL => 23

    /**
     * @type {Integer (Int32)}
     */
    static PM_ENUM_EXTENSION_FILTER_FILESAVEPICKER_ALL => 24

    /**
     * @type {Integer (Int32)}
     */
    static PM_ENUM_EXTENSION_FILTER_CACHEDFILEUPDATER_ALL => 25

    /**
     * @type {Integer (Int32)}
     */
    static PM_ENUM_EXTENSION_FILTER_MAX => 26
}
