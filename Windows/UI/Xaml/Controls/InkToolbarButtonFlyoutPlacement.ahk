#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the location of the ink stroke configuration flyout relative to the [InkToolbar](inktoolbar.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarbuttonflyoutplacement
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class InkToolbarButtonFlyoutPlacement extends Win32Enum{

    /**
     * The system determines which edge of the ink toolbar to align the flyout.
     * @type {Integer (Int32)}
     */
    static Auto => 0

    /**
     * Flyout is aligned to the top edge of the ink toolbar.
     * @type {Integer (Int32)}
     */
    static Top => 1

    /**
     * Flyout is aligned to the bottom edge of the ink toolbar.
     * @type {Integer (Int32)}
     */
    static Bottom => 2

    /**
     * Flyout is aligned to the left edge of the ink toolbar.
     * @type {Integer (Int32)}
     */
    static Left => 3

    /**
     * Flyout is aligned to the right edge of the ink toolbar.
     * @type {Integer (Int32)}
     */
    static Right => 4
}
