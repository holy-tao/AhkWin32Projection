#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * This enumeration is intended for infrastructure use only. (FEATURE_ENABLED_STATE)
 * @see https://learn.microsoft.com/windows/win32/api/featurestagingapi/ne-featurestagingapi-feature_enabled_state
 * @namespace Windows.Win32.System.WindowsProgramming
 */
class FEATURE_ENABLED_STATE extends Win32Enum {

    /**
     * TBD
     * Native name: FEATURE_ENABLED_STATE_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * TBD
     * Native name: FEATURE_ENABLED_STATE_DISABLED
     * @type {Integer (Int32)}
     */
    static DISABLED => 1

    /**
     * TBD
     * Native name: FEATURE_ENABLED_STATE_ENABLED
     * @type {Integer (Int32)}
     */
    static ENABLED => 2
}
