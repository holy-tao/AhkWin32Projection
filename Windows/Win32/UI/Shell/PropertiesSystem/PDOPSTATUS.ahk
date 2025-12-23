#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Provides operation status flags.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-pdopstatus
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class PDOPSTATUS extends Win32Enum{

    /**
     * Operation is running, no user intervention.
     * @type {Integer (Int32)}
     */
    static PDOPS_RUNNING => 1

    /**
     * Operation has been paused by the user.
     * @type {Integer (Int32)}
     */
    static PDOPS_PAUSED => 2

    /**
     * Operation has been canceled by the user - now go undo.
     * @type {Integer (Int32)}
     */
    static PDOPS_CANCELLED => 3

    /**
     * Operation has been stopped by the user - terminate completely.
     * @type {Integer (Int32)}
     */
    static PDOPS_STOPPED => 4

    /**
     * Operation has gone as far as it can go without throwing error dialogs.
     * @type {Integer (Int32)}
     */
    static PDOPS_ERRORS => 5
}
