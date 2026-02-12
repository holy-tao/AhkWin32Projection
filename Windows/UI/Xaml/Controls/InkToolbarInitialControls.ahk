#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the built-in buttons ([InitialControls](inktoolbar_initialcontrols.md)) added to an [InkToolbar](inktoolbar.md) at initialization.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarinitialcontrols
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class InkToolbarInitialControls extends Win32Enum{

    /**
     * All built-in buttons are added.
     * @type {Integer (Int32)}
     */
    static All => 0

    /**
     * No built-in buttons are added.
     * @type {Integer (Int32)}
     */
    static None => 1

    /**
     * All built-in pen buttons are added:
     * 
     * + [InkToolbarBallpointPenButton](inktoolbarballpointpenbutton.md)
     * + [InkToolbarPencilButton](inktoolbarpencilbutton.md)
     * + [InkToolbarHighlighterButton](inktoolbarhighlighterbutton.md)
     * @type {Integer (Int32)}
     */
    static PensOnly => 2

    /**
     * All built-in, non-pen buttons are added:
     * 
     * + [InkToolbarEraserButton](inktoolbareraserbutton.md)
     * + [InkToolbarRulerButton](inktoolbarrulerbutton.md)
     * @type {Integer (Int32)}
     */
    static AllExceptPens => 3
}
