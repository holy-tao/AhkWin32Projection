#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class CASCADE_WINDOWS_HOW extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static MDITILE_SKIPDISABLED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MDITILE_ZORDER => 4
}
