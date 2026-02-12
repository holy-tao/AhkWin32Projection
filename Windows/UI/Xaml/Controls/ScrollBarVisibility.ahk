#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the visibility of a scrollbar within a [ScrollViewer](scrollviewer.md) control.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollbarvisibility
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ScrollBarVisibility extends Win32Enum{

    /**
     * A [ScrollBar](../windows.ui.xaml.controls.primitives/scrollbar.md) does not appear even when the viewport cannot display all of the content. Scrolling is disabled.
     * 
     * The dimension of the content is set to the corresponding dimension of the [ScrollViewer](scrollviewer.md) parent. For a horizontal [ScrollBar](../windows.ui.xaml.controls.primitives/scrollbar.md), the width of the content is set to the [ViewportWidth](scrollviewer_viewportwidth.md) of the [ScrollViewer](scrollviewer.md). For a vertical [ScrollBar](../windows.ui.xaml.controls.primitives/scrollbar.md), the height of the content is set to the [ViewportHeight](scrollviewer_viewportheight.md) of the [ScrollViewer](scrollviewer.md).
     * @type {Integer (Int32)}
     */
    static Disabled => 0

    /**
     * A [ScrollBar](../windows.ui.xaml.controls.primitives/scrollbar.md) appears only when the viewport cannot display all of the content.
     * 
     * The dimension of the content is set to the corresponding dimension of the [ScrollViewer](scrollviewer.md) parent. For a horizontal [ScrollBar](../windows.ui.xaml.controls.primitives/scrollbar.md), the width of the content is set to the [ViewportWidth](scrollviewer_viewportwidth.md) of the [ScrollViewer](scrollviewer.md). For a vertical [ScrollBar](../windows.ui.xaml.controls.primitives/scrollbar.md), the height of the content is set to the [ViewportHeight](scrollviewer_viewportheight.md) of the [ScrollViewer](scrollviewer.md).
     * @type {Integer (Int32)}
     */
    static Auto => 1

    /**
     * A [ScrollBar](../windows.ui.xaml.controls.primitives/scrollbar.md) does not appear even when the viewport cannot display all of the content. Scrolling is still enabled, and can occur through touch, keyboard, or mouse wheel interaction.
     * 
     * The dimension of the content is not affected by the dimension of the [ScrollViewer](scrollviewer.md).
     * @type {Integer (Int32)}
     */
    static Hidden => 2

    /**
     * A [ScrollBar](../windows.ui.xaml.controls.primitives/scrollbar.md) always appears.
     * 
     * The dimension of the content is set to the corresponding dimension of the [ScrollViewer](scrollviewer.md) parent. For a horizontal [ScrollBar](../windows.ui.xaml.controls.primitives/scrollbar.md), the width of the content is set to the [ViewportWidth](scrollviewer_viewportwidth.md) of the [ScrollViewer](scrollviewer.md). For a vertical [ScrollBar](../windows.ui.xaml.controls.primitives/scrollbar.md), the height of the content is set to the [ViewportHeight](scrollviewer_viewportheight.md) of the [ScrollViewer](scrollviewer.md).
     * @type {Integer (Int32)}
     */
    static Visible => 3
}
