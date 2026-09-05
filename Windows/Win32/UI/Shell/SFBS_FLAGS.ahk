#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class SFBS_FLAGS extends Win32Enum {

    /**
     * Native name: SFBS_FLAGS_ROUND_TO_NEAREST_DISPLAYED_DIGIT
     * @type {Integer (Int32)}
     */
    static ROUND_TO_NEAREST_DISPLAYED_DIGIT => 1

    /**
     * Native name: SFBS_FLAGS_TRUNCATE_UNDISPLAYED_DECIMAL_DIGITS
     * @type {Integer (Int32)}
     */
    static TRUNCATE_UNDISPLAYED_DECIMAL_DIGITS => 2
}
