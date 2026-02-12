#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the button types exposed in the toggle button group of an [InkToolbar](inktoolbar.md).
 * @remarks
 * The [InkToolbar](inktoolbar.md) consists of two distinct groups of button types:
 * 
 * + A [RadioButton](radiobutton.md) group containing the built-in drawing ([InkToolbarBallpointPenButton](inktoolbarballpointpenbutton.md), [InkToolbarPencilButton](inktoolbarpencilbutton.md)), erasing ([InkToolbarEraserButton](inktoolbareraserbutton.md)), and highlighting ([InkToolbarHighlighterButton](inktoolbarhighlighterbutton.md)) buttons. This group is where [InkToolbarCustomPenButton](inktoolbarcustompenbutton.md) and [InkToolbarCustomToolButton](inktoolbarcustomtoolbutton.md) objects are added.
 * 
 *     > Feature selection is mutually exclusive.
 * 
 * + A second group of "toggle" buttons containing the built-in stencil ([InkToolbarStencilButton](inktoolbarstencilbutton.md)) button (or the [InkToolbarRulerButton](inktoolbarrulerbutton.md) button). Custom toggles ([InkToolbarCustomToggleButton](inktoolbarcustomtogglebutton.md)) are added here.
 * 
 *     > Features are not mutually exclusive and can be used concurrently with other active tools.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbartoggle
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class InkToolbarToggle extends Win32Enum{

    /**
     * A toggle button for a stencil tool.
     * @type {Integer (Int32)}
     */
    static Ruler => 0

    /**
     * A toggle button for a custom tool.
     * @type {Integer (Int32)}
     */
    static Custom => 1
}
