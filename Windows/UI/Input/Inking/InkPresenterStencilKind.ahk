#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of stencil that can be displayed on an  [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkpresenterstencilkind
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class InkPresenterStencilKind extends Win32Enum{

    /**
     * A custom stencil.
     * @type {Integer (Int32)}
     */
    static Other => 0

    /**
     * A stencil in the form of a straight rule for drawing straight lines.
     * 
     * The ruler is metric with major tick marks every 10th position, and sub-major tick marks every 5th position.
     * @type {Integer (Int32)}
     */
    static Ruler => 1

    /**
     * A stencil in the form of a protractor for drawing arcs and curves.
     * @type {Integer (Int32)}
     */
    static Protractor => 2
}
