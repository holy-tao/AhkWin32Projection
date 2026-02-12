#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of [InkDrawingAttributes](inkdrawingattributes.md) associated with the [InkStroke](inkstroke.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkdrawingattributeskind
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class InkDrawingAttributesKind extends Win32Enum{

    /**
     * Supports attributes associated with a pen or highlighter.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Supports attributes associated with a pencil.
     * 
     * By default, a pencil draws a soft-edged, textured, and semi-transparent stroke (useful for layered shading effects) with a Circle PenTip. The stroke color (darkness) is dependent on the pen pressure detected.
     * @type {Integer (Int32)}
     */
    static Pencil => 1
}
