#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class NOTIFY_ICON_STATE extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static NIS_HIDDEN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NIS_SHAREDICON => 2
}
