#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The UI_INFO_TYPE enumeration identifies repairs that perform user interface tasks.
 * @see https://learn.microsoft.com/windows/win32/api/ndattrib/ne-ndattrib-ui_info_type
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 * @version v4.0.30319
 */
class UI_INFO_TYPE extends Win32Enum{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static UIT_INVALID => 0

    /**
     * No additional repair interfaces are present.
     * @type {Integer (Int32)}
     */
    static UIT_NONE => 1

    /**
     * Execute shell command.
     * @type {Integer (Int32)}
     */
    static UIT_SHELL_COMMAND => 2

    /**
     * Launch help pane.
     * @type {Integer (Int32)}
     */
    static UIT_HELP_PANE => 3

    /**
     * Direct UI.
     * @type {Integer (Int32)}
     */
    static UIT_DUI => 4
}
