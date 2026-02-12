#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values that indicate the type of operation that launched the print support settings UI.
 * @remarks
 * For more information, see [Print support app design guide](/windows-hardware/drivers/devapps/print-support-app-design-guide).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.settingslaunchkind
 * @namespace Windows.Graphics.Printing.PrintSupport
 * @version WindowsRuntime 1.4
 */
class SettingsLaunchKind extends Win32Enum{

    /**
     * Print job settings.
     * @type {Integer (Int32)}
     */
    static JobPrintTicket => 0

    /**
     * Default printer settings.
     * @type {Integer (Int32)}
     */
    static UserDefaultPrintTicket => 1
}
