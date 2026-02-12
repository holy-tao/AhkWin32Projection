#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the direction that content is scaled.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.stretchdirection
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class StretchDirection extends Win32Enum{

    /**
     * The content scales upward only when it is smaller than the parent. If the content is larger, no scaling downward is performed.
     * @type {Integer (Int32)}
     */
    static UpOnly => 0

    /**
     * The content scales downward only when it is larger than the parent. If the content is smaller, no scaling upward is performed.
     * @type {Integer (Int32)}
     */
    static DownOnly => 1

    /**
     * The content stretches to fit the parent according to the [Stretch](viewbox_stretch.md) property.
     * @type {Integer (Int32)}
     */
    static Both => 2
}
