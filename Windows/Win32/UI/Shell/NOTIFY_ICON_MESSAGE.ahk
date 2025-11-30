#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class NOTIFY_ICON_MESSAGE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static NIM_ADD => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NIM_MODIFY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NIM_DELETE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NIM_SETFOCUS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static NIM_SETVERSION => 4
}
