#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the flow order for text in a window.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corewindowflowdirection
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class CoreWindowFlowDirection extends Win32Enum{

    /**
     * Text is flowed from left to right.
     * @type {Integer (Int32)}
     */
    static LeftToRight => 0

    /**
     * Text is flowed from right to left. (For example, this can be used with Arabic script or other RTL languages.)
     * @type {Integer (Int32)}
     */
    static RightToLeft => 1
}
