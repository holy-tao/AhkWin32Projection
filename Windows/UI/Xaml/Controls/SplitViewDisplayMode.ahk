#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify how the pane is shown in a [SplitView](splitview.md).
 * @remarks
 * These enumeration values are used with the [SplitView.DisplayMode](splitview_displaymode.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.splitviewdisplaymode
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class SplitViewDisplayMode extends Win32Enum{

    /**
     * The pane covers the content when it's open and does not take up space in the control layout. The pane closes when the user taps outside of it.
     * @type {Integer (Int32)}
     */
    static Overlay => 0

    /**
     * The pane is shown side-by-side with the content and takes up space in the control layout. The pane does not close when the user taps outside of it.
     * @type {Integer (Int32)}
     */
    static Inline => 1

    /**
     * The amount of the pane defined by the [CompactPaneLength](splitview_compactpanelength.md) property is shown side-by-side with the content and takes up space in the control layout. The remaining part of the pane covers the content when it's open and does not take up space in the control layout. The pane closes when the user taps outside of it.
     * @type {Integer (Int32)}
     */
    static CompactOverlay => 2

    /**
     * The amount of the pane defined by the [CompactPaneLength](splitview_compactpanelength.md) property is shown side-by-side with the content and takes up space in the control layout. The remaining part of the pane pushes the content to the side when it's open and takes up space in the control layout. The pane does not close when the user taps outside of it.
     * @type {Integer (Int32)}
     */
    static CompactInline => 3
}
