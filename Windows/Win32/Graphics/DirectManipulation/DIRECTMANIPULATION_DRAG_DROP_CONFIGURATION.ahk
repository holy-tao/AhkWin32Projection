#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines behaviors for the drag-drop interaction.
 * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/ne-directmanipulation-directmanipulation_drag_drop_configuration
 * @namespace Windows.Win32.Graphics.DirectManipulation
 * @version v4.0.30319
 */
class DIRECTMANIPULATION_DRAG_DROP_CONFIGURATION{

    /**
     * Specifies that vertical movement is applicable to the chosen gesture.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_DRAG_DROP_CONFIGURATION_VERTICAL => 1

    /**
     * Specifies that horizontal movement is applicable to the chosen gesture.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_DRAG_DROP_CONFIGURATION_HORIZONTAL => 2

    /**
     * Specifies that the gesture is to be cross-slide only.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_DRAG_DROP_CONFIGURATION_SELECT_ONLY => 16

    /**
     * Specifies that the gesture is a drag initiated by cross-slide.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_DRAG_DROP_CONFIGURATION_SELECT_DRAG => 32

    /**
     * Specifies that the gesture a drag initiated by press-and-hold.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_DRAG_DROP_CONFIGURATION_HOLD_DRAG => 64
}
