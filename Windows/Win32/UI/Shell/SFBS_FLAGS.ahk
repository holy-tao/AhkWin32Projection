#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SFBS_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SFBS_FLAGS_ROUND_TO_NEAREST_DISPLAYED_DIGIT => 1

    /**
     * @type {Integer (Int32)}
     */
    static SFBS_FLAGS_TRUNCATE_UNDISPLAYED_DECIMAL_DIGITS => 2
}
