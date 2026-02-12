#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the types of [InkToolbar](inktoolbar.md) stencils.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarstencilkind
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class InkToolbarStencilKind extends Win32Enum{

    /**
     * A straight rule for drawing straight lines.
     * @type {Integer (Int32)}
     */
    static Ruler => 0

    /**
     * A protractor for drawing arcs and curves
     * @type {Integer (Int32)}
     */
    static Protractor => 1
}
