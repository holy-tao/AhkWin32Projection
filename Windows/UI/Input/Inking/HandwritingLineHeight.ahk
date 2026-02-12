#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the handwriting space available when using ink for text input in a text control (when [HandwritingView](../windows.ui.xaml.controls/handwritingview.md) is enabled).
 * @remarks
 * This value can be set by the user through the *Pen & Windows Ink settings* screen.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.handwritinglineheight
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class HandwritingLineHeight extends Win32Enum{

    /**
     * Approximately 0.5" of handwriting space per line.
     * @type {Integer (Int32)}
     */
    static Small => 0

    /**
     * Approximately 1" of handwriting space per line.
     * @type {Integer (Int32)}
     */
    static Medium => 1

    /**
     * Approximately 1.5" of handwriting space per line.
     * @type {Integer (Int32)}
     */
    static Large => 2
}
