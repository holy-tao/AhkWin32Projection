#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class SYNCMGRITEMSTATE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static SYNCMGRITEMSTATE_UNCHECKED => 0

    /**
     * @type {Integer (Int32)}
     */
    static SYNCMGRITEMSTATE_CHECKED => 1
}
