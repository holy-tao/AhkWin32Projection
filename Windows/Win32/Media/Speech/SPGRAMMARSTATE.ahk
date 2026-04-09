#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class SPGRAMMARSTATE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static SPGS_DISABLED => 0

    /**
     * @type {Integer (Int32)}
     */
    static SPGS_ENABLED => 1

    /**
     * @type {Integer (Int32)}
     */
    static SPGS_EXCLUSIVE => 3
}
