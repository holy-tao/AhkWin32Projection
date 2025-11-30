#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class SCRIPT_ERROR_DEBUG_EXCEPTION_THROWN_KIND extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ETK_FIRST_CHANCE => 0

    /**
     * @type {Integer (Int32)}
     */
    static ETK_USER_UNHANDLED => 1

    /**
     * @type {Integer (Int32)}
     */
    static ETK_UNHANDLED => 2
}
