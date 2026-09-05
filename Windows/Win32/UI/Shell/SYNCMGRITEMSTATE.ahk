#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class SYNCMGRITEMSTATE extends Win32Enum {

    /**
     * Native name: SYNCMGRITEMSTATE_UNCHECKED
     * @type {Integer (Int32)}
     */
    static UNCHECKED => 0

    /**
     * Native name: SYNCMGRITEMSTATE_CHECKED
     * @type {Integer (Int32)}
     */
    static CHECKED => 1
}
