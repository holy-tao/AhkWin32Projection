#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * This enumeration is intended for infrastructure use only.
 * @see https://docs.microsoft.com/windows/win32/api//featurestagingapi/ne-featurestagingapi-feature_enabled_state
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class FEATURE_ENABLED_STATE extends Win32Enum{

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static FEATURE_ENABLED_STATE_DEFAULT => 0

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static FEATURE_ENABLED_STATE_DISABLED => 1

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static FEATURE_ENABLED_STATE_ENABLED => 2
}
