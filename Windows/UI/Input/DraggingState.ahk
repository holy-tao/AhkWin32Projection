#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the possible states of the [Dragging](gesturerecognizer_dragging.md) event.
 * @remarks
 * [Drag](gesturesettings.md) must be set in the [GestureSettings](gesturerecognizer_gesturesettings.md) property to support [Dragging](gesturerecognizer_dragging.md) with mouse and pen/stylus input.
 * 
 * 
 * 
 * > [!NOTE]
 * > There is no correlation between **Dragging** in [CrossSlidingState](crossslidingstate.md) (touch) and DraggingState (mouse or pen/stylus).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.draggingstate
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class DraggingState extends Win32Enum{

    /**
     * A dragging interaction has been detected.
     * @type {Integer (Int32)}
     */
    static Started => 0

    /**
     * The dragging interaction is in progress.
     * @type {Integer (Int32)}
     */
    static Continuing => 1

    /**
     * The mouse or pen/stylus contact is lifted and inertia has concluded.
     * @type {Integer (Int32)}
     */
    static Completed => 2
}
