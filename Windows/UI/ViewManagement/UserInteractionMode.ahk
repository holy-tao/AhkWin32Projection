#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the UI view, optimized for input device type.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.userinteractionmode
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class UserInteractionMode extends Win32Enum{

    /**
     * The device UI is optimized for mouse input.
     * @type {Integer (Int32)}
     */
    static Mouse => 0

    /**
     * The device UI is optimized for touch input.
     * @type {Integer (Int32)}
     */
    static Touch => 1
}
