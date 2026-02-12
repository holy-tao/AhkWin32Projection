#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify input-specific transition animations that are part of the default template for [ScrollBar](scrollbar.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.scrollingindicatormode
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class ScrollingIndicatorMode extends Win32Enum{

    /**
     * Do not use input-specific transitions.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Use input-specific transitions that are appropriate for touch input.
     * @type {Integer (Int32)}
     */
    static TouchIndicator => 1

    /**
     * Use input-specific transitions that are appropriate for mouse input.
     * @type {Integer (Int32)}
     */
    static MouseIndicator => 2
}
