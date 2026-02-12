#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the types of [menu buttons](inktoolbarmenubutton.md) that can be added to an [InkToolbar](inktoolbar.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarmenukind
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class InkToolbarMenuKind extends Win32Enum{

    /**
     * Stencil menu button.
     * @type {Integer (Int32)}
     */
    static Stencil => 0
}
