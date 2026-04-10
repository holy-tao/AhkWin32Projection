#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 */
class CAPTIONSTATES extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static CS_ACTIVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static CS_INACTIVE => 2

    /**
     * @type {Integer (Int32)}
     */
    static CS_DISABLED => 3
}
