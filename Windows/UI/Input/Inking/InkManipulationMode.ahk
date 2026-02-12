#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the modes of ink input.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkmanipulationmode
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class InkManipulationMode extends Win32Enum{

    /**
     * All points are passed to the [InkStrokeBuilder](inkstrokebuilder.md) and an [InkStroke](inkstroke.md) is created. The stroke is appended to the stroke collection of the [InkManager](inkmanager.md) or [InkStrokeContainer](inkstrokecontainer.md).
     * @type {Integer (Int32)}
     */
    static Inking => 0

    /**
     * All strokes are hit tested against all strokes in the stroke collection. If there is an intersection, [InkManager](inkmanager.md) deletes the stroke automatically and returns an invalidated rectangle for [processPointerUpdate](inkmanager_processpointerupdate_416065930.md) calls.
     * @type {Integer (Int32)}
     */
    static Erasing => 1

    /**
     * All points are used to create a polyline. When you call [processPointerUp](inkmanager_processpointerup_1637073524.md), the polyline is hit tested against entire stroke collection and all strokes within the polyline are marked as selected.
     * @type {Integer (Int32)}
     */
    static Selecting => 2
}
