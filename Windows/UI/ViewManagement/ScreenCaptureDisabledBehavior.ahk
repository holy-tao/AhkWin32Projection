#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * 
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.screencapturedisabledbehavior
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class ScreenCaptureDisabledBehavior extends Win32Enum{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static DrawAsBlack => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ExcludeFromCapture => 1
}
