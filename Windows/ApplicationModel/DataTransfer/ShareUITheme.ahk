#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The theme for the Share UI.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.shareuitheme
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class ShareUITheme extends Win32Enum{

    /**
     * Default theme.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Light theme.
     * @type {Integer (Int32)}
     */
    static Light => 1

    /**
     * Dark theme.
     * @type {Integer (Int32)}
     */
    static Dark => 2
}
