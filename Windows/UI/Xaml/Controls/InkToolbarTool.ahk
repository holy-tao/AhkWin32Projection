#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the type of built-in or custom tool associated with the [InkToolbarToolButton](inktoolbartoolbutton.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbartool
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class InkToolbarTool extends Win32Enum{

    /**
     * A pen tool that renders a solid, opaque stroke, with the stroke size dependent on the pen pressure detected (default size is 2x2 pixels).
     * @type {Integer (Int32)}
     */
    static BallpointPen => 0

    /**
     * A pen tool that renders a soft-edged, semi-transparent stroke that can be layered for shading effects. The stroke opacity is dependent on the pen pressure detected.
     * @type {Integer (Int32)}
     */
    static Pencil => 1

    /**
     * A pen tool that renders a semi-transparent highlighter overlay stroke.
     * @type {Integer (Int32)}
     */
    static Highlighter => 2

    /**
     * A pen tool that deletes any ink strokes that intersect with the erase stroke.
     * @type {Integer (Int32)}
     */
    static Eraser => 3

    /**
     * A custom pen tool.
     * @type {Integer (Int32)}
     */
    static CustomPen => 4

    /**
     * A custom non-pen tool.
     * @type {Integer (Int32)}
     */
    static CustomTool => 5
}
