#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify whether the pane is to the left or right of the content in a [SplitView](splitview.md).
 * @remarks
 * These enumeration values are used with the [SplitView.PanePlacement](splitview_paneplacement.md) property. For more info, see [PanePlacement](splitview_paneplacement.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.splitviewpaneplacement
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class SplitViewPanePlacement extends Win32Enum{

    /**
     * The pane is shown to the left of the [SplitView](splitview.md) content .
     * @type {Integer (Int32)}
     */
    static Left => 0

    /**
     * The pane is shown to the right of the [SplitView](splitview.md) content .
     * @type {Integer (Int32)}
     */
    static Right => 1
}
