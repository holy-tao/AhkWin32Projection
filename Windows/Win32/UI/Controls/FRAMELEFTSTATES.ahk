#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 */
class FRAMELEFTSTATES extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static FRL_ACTIVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static FRL_INACTIVE => 2
}
