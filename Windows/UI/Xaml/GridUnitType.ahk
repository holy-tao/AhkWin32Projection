#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the kind of value that a [GridLength](gridlength.md) object is holding.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.gridunittype
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class GridUnitType extends Win32Enum{

    /**
     * The size is determined by the size properties of the content object.
     * @type {Integer (Int32)}
     */
    static Auto => 0

    /**
     * The value is expressed in pixels.
     * @type {Integer (Int32)}
     */
    static Pixel => 1

    /**
     * The value is expressed as a weighted proportion of available space.
     * @type {Integer (Int32)}
     */
    static Star => 2
}
