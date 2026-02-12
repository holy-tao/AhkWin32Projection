#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the style of focus visual used for pivot header items.
 * @remarks
 * This enumeration provides values for the [Pivot.HeaderFocusVisualPlacement](pivot_headerfocusvisualplacement.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.pivotheaderfocusvisualplacement
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class PivotHeaderFocusVisualPlacement extends Win32Enum{

    /**
     * A single focus visual (rectangle) is drawn around all visible item headers.
     * @type {Integer (Int32)}
     */
    static ItemHeaders => 0

    /**
     * The focus visual (underline) is drawn under the selected item header.
     * @type {Integer (Int32)}
     */
    static SelectedItemHeader => 1
}
