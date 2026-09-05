#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * This enumeration is intended for infrastructure use only. (FEATURE_CHANGE_TIME)
 * @see https://learn.microsoft.com/windows/win32/api/featurestagingapi/ne-featurestagingapi-feature_change_time
 * @namespace Windows.Win32.System.WindowsProgramming
 */
class FEATURE_CHANGE_TIME extends Win32Enum {

    /**
     * TBD
     * Native name: FEATURE_CHANGE_TIME_READ
     * @type {Integer (Int32)}
     */
    static READ => 0

    /**
     * TBD
     * Native name: FEATURE_CHANGE_TIME_MODULE_RELOAD
     * @type {Integer (Int32)}
     */
    static MODULE_RELOAD => 1

    /**
     * TBD
     * Native name: FEATURE_CHANGE_TIME_SESSION
     * @type {Integer (Int32)}
     */
    static SESSION => 2

    /**
     * TBD
     * Native name: FEATURE_CHANGE_TIME_REBOOT
     * @type {Integer (Int32)}
     */
    static REBOOT => 3
}
