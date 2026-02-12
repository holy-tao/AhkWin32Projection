#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes how a child element is vertically positioned or stretched within a parent's layout slot.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.verticalalignment
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class VerticalAlignment extends Win32Enum{

    /**
     * The element is aligned to the top of the parent's layout slot.
     * @type {Integer (Int32)}
     */
    static Top => 0

    /**
     * The element is aligned to the center of the parent's layout slot.
     * @type {Integer (Int32)}
     */
    static Center => 1

    /**
     * The element is aligned to the bottom of the parent's layout slot.
     * @type {Integer (Int32)}
     */
    static Bottom => 2

    /**
     * The element is stretched to fill the entire layout slot of the parent element.
     * @type {Integer (Int32)}
     */
    static Stretch => 3
}
