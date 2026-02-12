#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates where an element should be displayed on the horizontal axis relative to the allocated layout slot of the parent element.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.horizontalalignment
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class HorizontalAlignment extends Win32Enum{

    /**
     * An element aligned to the left of the layout slot for the parent element.
     * @type {Integer (Int32)}
     */
    static Left => 0

    /**
     * An element aligned to the center of the layout slot for the parent element.
     * @type {Integer (Int32)}
     */
    static Center => 1

    /**
     * An element aligned to the right of the layout slot for the parent element.
     * @type {Integer (Int32)}
     */
    static Right => 2

    /**
     * An element stretched to fill the entire layout slot of the parent element.
     * @type {Integer (Int32)}
     */
    static Stretch => 3
}
