#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how the [InkPresenter](inkpresenter.md) object handles input (standard and modified) from the associated [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control when system is in high contrast mode.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkhighcontrastadjustment
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class InkHighContrastAdjustment extends Win32Enum{

    /**
     * For standard strokes, use selected color if contrast is sufficient against the background. Otherwise, use system color.
     * 
     * For highlighter strokes ([InkDrawingAttributes.DrawAsHighlighter](inkdrawingattributes_drawashighlighter.md)), use selected color if contrast is sufficient against the background. Otherwise, use system color.
     * @type {Integer (Int32)}
     */
    static UseSystemColorsWhenNecessary => 0

    /**
     * For standard strokes, use system color.
     * 
     * For highlighter strokes ([InkDrawingAttributes.DrawAsHighlighter](inkdrawingattributes_drawashighlighter.md)), use system highlighter color.
     * @type {Integer (Int32)}
     */
    static UseSystemColors => 1

    /**
     * For standard strokes, use the selected color.
     * 
     * For highlighter strokes ([InkDrawingAttributes.DrawAsHighlighter](inkdrawingattributes_drawashighlighter.md)), use the selected color.
     * @type {Integer (Int32)}
     */
    static UseOriginalColors => 2
}
