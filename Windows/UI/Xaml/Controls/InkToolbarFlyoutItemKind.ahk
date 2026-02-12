#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the types of buttons that can be used on an [InkToolbar](inktoolbar.md) flyout.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarflyoutitemkind
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class InkToolbarFlyoutItemKind extends Win32Enum{

    /**
     * A basic button.
     * @type {Integer (Int32)}
     */
    static Simple => 0

    /**
     * A basic radio button.
     * @type {Integer (Int32)}
     */
    static Radio => 1

    /**
     * A check box.
     * @type {Integer (Int32)}
     */
    static Check => 2

    /**
     * A radio button that can be toggled on or off.
     * @type {Integer (Int32)}
     */
    static RadioCheck => 3
}
